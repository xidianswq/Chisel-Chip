package cpu_pipeline

import chisel3._
import chisel3.util._
import public.Consts._
import public.Instructions._

/*
type: IO Port
name: PC_IO(程序计数器接口)
reg_pc: Program counter,output
inst: Instruction,output
*/
class PC_IO extends Bundle{
    val reg_pc = Output(UInt(WORD_LEN.W))
    val inst = Output(UInt(WORD_LEN.W))
}

/*
type: Hardware
name: PC Pipeline Register(程序计数器流水线寄存器)
*/
class PC_IO_REG extends Module{
    val io = IO(new Bundle{
        val in = Flipped(new PC_IO())
        val out = new PC_IO()
    })

    val pc_io_reg = RegInit(0.U.asTypeOf(new PC_IO()))

    pc_io_reg := io.in
    io.out    := pc_io_reg
}

/*
type: Hardware
name: Program Counter(程序计数器)
*/  
class PC extends Module{
    val io = IO(new Bundle{
        val ex_in = Flipped(new ALU_IO())
        val br_in = Flipped(new BR_IO())
        val out = new PC_IO()
        val instmem = Flipped(new InstMem_IO())
    })

    //input wire connection
    val inst = io.instmem.inst
    val br_flag     = io.br_in.br_flag
    val br_target   = io.br_in.br_target
    val jump_flag   = io.ex_in.jump_flag
    val alu_out     = io.ex_in.alu_out

    //program counter update
    val reg_pc = RegInit(START_ADDR)
    val reg_pc_next_default = reg_pc + 4.U(WORD_LEN.W)
    val reg_pc_next = MuxCase(reg_pc_next_default, Seq(
        br_flag.asBool()    -> br_target,
        jump_flag.asBool()  -> alu_out
        //(inst === ECALL) -> reg_csr(0x305) // go to trap_vector
    ))
    reg_pc := reg_pc_next

    //output wire connection
    io.instmem.addr := reg_pc
    io.out.reg_pc := reg_pc
    io.out.inst := io.instmem.inst
    
}