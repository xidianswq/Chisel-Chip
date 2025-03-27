package cpu_pipeline_riscv_tests

import chisel3._
import chisel3.util._
import cpu_pipeline_riscv_tests.Consts._

/*
type: IO Port
name: Stall_IO(流水线阻塞逻辑接口)
stall_flag: Stall flag,output
*/
class Stall_IO extends Bundle{
    val stall_flag = Output(Bool())
}

/*
type: Hardware
name: Stall logic(流水线阻塞逻辑)
*/
class Stall extends Module{
    val io = IO(new Bundle{
        val in = new Bundle{
            val if_in       = Flipped(new PC_IO())
            val id_reg_in   = Flipped(new ID_IO())
        }
        val out = new Stall_IO()
    })

    // input wire connection
    val inst_default    = io.in.if_in.inst
    val ex_rd_wen       = io.in.id_reg_in.rd_wen
    val ex_rd_addr      = io.in.id_reg_in.rd_addr

    // data_hazard stall logic
    val rs1_addr_default    = inst_default(19, 15)
    val rs2_addr_default    = inst_default(24, 20)
    val rs1_data_hazard     = (ex_rd_wen === REN_EN) && (rs1_addr_default =/= 0.U) && (rs1_addr_default === ex_rd_addr)
    val rs2_data_hazard     = (ex_rd_wen === REN_EN) && (rs2_addr_default =/= 0.U) && (rs2_addr_default === ex_rd_addr)
    val stall_flag = (rs1_data_hazard || rs2_data_hazard)

    // output wire connection
    io.out.stall_flag := stall_flag
}