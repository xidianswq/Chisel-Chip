package score

import chisel3._
import chisel3.util._
import public.PConsts._

/*
type: IO Port
name: Stall_IO(流水线阻塞逻辑接口)
stall_flag: Stall flag,output
pred_miss_flag: BP Unit Predict miss flag,output
*/
class Stall_IO extends Bundle{
    val stall_flag      = Output(Bool())
    val pred_miss_flag   = Output(Bool())
}

/*
type: Hardware
name: Stall logic(流水线异常标志位产生逻辑)
*/
class Stall extends Module{
    val io = IO(new Bundle{
        val in = new Bundle{
            val if_io       = Flipped(new PC_IO())
            val id_reg_io   = Flipped(new ID_IO())
        }
        val out = new Stall_IO()
    })

    // input wire connection
    val reg_pc          = io.in.if_io.reg_pc
    val inst_default    = io.in.if_io.inst
    val br_flag         = io.in.if_io.ex_io.br_io.br_flag
    val br_target       = io.in.if_io.ex_io.br_io.br_target
    val jump_flag       = io.in.if_io.ex_io.alu_io.jump_flag
    val jump_target     = io.in.if_io.ex_io.alu_io.alu_out
    val ex_rd_wen       = io.in.id_reg_io.rd_wen
    val ex_rd_addr      = io.in.id_reg_io.rd_addr

    // data_hazard stall logic
    val rs1_addr_default    = inst_default(19, 15)
    val rs2_addr_default    = inst_default(24, 20)
    val rs1_data_hazard     = (ex_rd_wen === REN_EN) && (rs1_addr_default =/= 0.U) && (rs1_addr_default === ex_rd_addr)
    val rs2_data_hazard     = (ex_rd_wen === REN_EN) && (rs2_addr_default =/= 0.U) && (rs2_addr_default === ex_rd_addr)
    val stall_flag          = (rs1_data_hazard || rs2_data_hazard)
    val pred_miss_flag      = (jump_flag && (reg_pc =/= jump_target)) || (br_flag && (reg_pc =/= br_target))

    // output wire connection
    io.out.stall_flag       := stall_flag
    io.out.pred_miss_flag   := pred_miss_flag
}