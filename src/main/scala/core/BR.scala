package score

import chisel3._
import chisel3.util._
import public.PConsts._

/* 
type: IO Port
name: BR_IO(分支跳转结构接口)
br_flag: Branch flag,output
br_target: Branch target,output
*/
class BR_IO extends Bundle{
    val br_flag     = Output(Bool())
    val br_target   = Output(UInt(WORD_LEN.W))
    val pt_flag     = Output(Bool())
}

/*
type: Hardware
name: BR Pipeline Register(分支跳转结构流水线寄存器)
*/
class BR_IO_REG extends Module{
    val io = IO(new Bundle{
        val in  = Flipped(new BR_IO())
        val out = new BR_IO()
    })

    val br_io_reg = RegInit(0.U.asTypeOf(new BR_IO()))

    br_io_reg := io.in
    io.out := br_io_reg
}

/*
type: Hardware
name: Branch(分支跳转结构)
*/  
class BR extends Module{
    val io = IO(new Bundle{
        val in = new Bundle{
            val if_io = Flipped(new PC_IO())
            val id_io = Flipped(new ID_IO())
        }
        val out = new BR_IO()
    })

    // input wire connection
    val reg_pc      = io.in.if_io.reg_pc
    val op1_data    = io.in.id_io.op1_data
    val op2_data    = io.in.id_io.op2_data
    val imm_b_sext  = io.in.id_io.imm_b_sext
    val exe_fun     = io.in.id_io.exe_fun

    // branch logic
    val br_target   = reg_pc + imm_b_sext
    val br_flag     = MuxCase(false.B, Seq(
        (exe_fun === BR_BEQ)  ->  (op1_data === op2_data),
        (exe_fun === BR_BNE)  -> !(op1_data === op2_data),
        (exe_fun === BR_BLT)  ->  (op1_data.asSInt() < op2_data.asSInt()),
        (exe_fun === BR_BGE)  -> !(op1_data.asSInt() < op2_data.asSInt()),
        (exe_fun === BR_BLTU) ->  (op1_data < op2_data),
        (exe_fun === BR_BGEU) -> !(op1_data < op2_data)
    ))

    // pattern table logic
    val pt_flag     = MuxCase(false.B, Seq(
        (exe_fun === BR_BEQ)  -> true.B,
        (exe_fun === BR_BNE)  -> true.B,
        (exe_fun === BR_BLT)  -> true.B,
        (exe_fun === BR_BGE)  -> true.B,
        (exe_fun === BR_BLTU) -> true.B,
        (exe_fun === BR_BGEU) -> true.B
    ))

    // output wire connection
    io.out.br_flag      := br_flag
    io.out.br_target    := br_target
    io.out.pt_flag      := pt_flag

    // debug info
    printf(p"branch_flg: $br_flag\n")
    printf(p"branch_target: 0x${Hexadecimal(br_target)}\n")

}
