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
    val br_flag = Output(Bool())
    val jump_flag = Output(Bool())
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
name: PC Bubble Register(泡沫寄存器)
note: 用于流水线冒险时的泡沫处理
*/
class PC_BUBBLE_REG extends Module{
    val io = IO(new Bundle{
        val in          = Flipped(new PC_IO())
        val stall_in    = Flipped(new Stall_IO())
        val out         = new PC_IO()
    })

    //register file
    val reg_pc  = RegInit(0.U(WORD_LEN.W))
    val inst    = RegInit(0.U(WORD_LEN.W))

    //input wire connection
    val reg_pc_default  = io.in.reg_pc
    val inst_default    = io.in.inst
    val br_flag         = io.in.br_flag
    val jump_flag       = io.in.jump_flag
    val stall_flag      = io.stall_in.stall_flag

    //data hazard stall logic
    reg_pc :=MuxCase(reg_pc_default, Seq(
        stall_flag -> reg_pc
    ))
    inst := MuxCase(inst_default, Seq(
        (br_flag || jump_flag) -> NOP,
        stall_flag -> inst
    ))

    //output wire connection
    io.out.reg_pc       := reg_pc
    io.out.inst         := inst
    io.out.br_flag      := br_flag
    io.out.jump_flag    := jump_flag
}

/*
type: Hardware
name: Program Counter(程序计数器)
*/  
class PC extends Module{
    val io = IO(new Bundle{
        val in = new Bundle{
            val stall_in    = Flipped(new Stall_IO())
            val ex_in       = Flipped(new ALU_IO())
            val br_in       = Flipped(new BR_IO())
        }
        val out     = new PC_IO()
        val instmem = Flipped(new InstMem_IO())
    })

    //input wire connection
    val inst        = io.instmem.inst
    val stall_flag  = io.in.stall_in.stall_flag
    val br_flag     = io.in.br_in.br_flag
    val br_target   = io.in.br_in.br_target
    val jump_flag   = io.in.ex_in.jump_flag
    val alu_out     = io.in.ex_in.alu_out

    //program counter update
    val reg_pc              = RegInit(START_ADDR)
    val reg_pc_next_default = reg_pc + 4.U(WORD_LEN.W)
    val reg_pc_next         = MuxCase(reg_pc_next_default, Seq(
        jump_flag  -> alu_out,
        br_flag    -> br_target,
        //(inst === ECALL) -> reg_csr(0x305) // go to trap_vector
        stall_flag -> reg_pc    //ID/EX data_hazard stall
    ))
    reg_pc := reg_pc_next

    //output wire connection
    io.instmem.addr     := reg_pc
    io.out.reg_pc       := reg_pc
    io.out.inst         := inst
    io.out.br_flag      := br_flag
    io.out.jump_flag    := jump_flag
    
    //debug info
    printf("-----------------------START----------------------\n")
    printf("-------------IF------------\n")
    printf(p"reg_pc: 0x${Hexadecimal(reg_pc)}\n")
    printf(p"inst: 0x${Hexadecimal(inst)}\n")
}