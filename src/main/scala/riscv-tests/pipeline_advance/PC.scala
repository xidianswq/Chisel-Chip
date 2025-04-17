package pipeline_advance_riscv_tests

import chisel3._
import chisel3.util._
import pipeline_advance_riscv_tests.Consts._
import pipeline_advance_riscv_tests.Instructions._

/*
type: IO Port
name: PC_IO(程序计数器接口)
reg_pc: Program counter,output
inst: Instruction,output
*/
class PC_IO extends Bundle{
    val reg_pc = Output(UInt(REG_LEN.W))
    val inst   = Output(UInt(WORD_LEN.W))
    val ex_io  = new EX_IO()
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
      ex_io无寄存器,直接传递
*/
class PC_BUBBLE_REG extends Module{
    val io = IO(new Bundle{
        val in          = Flipped(new PC_IO())
        val stall_in    = Flipped(new Stall_IO())
        val out         = new PC_IO()
    })

    // register file
    val reg_pc  = RegInit(0.U(REG_LEN.W))
    val inst    = RegInit(0.U(WORD_LEN.W))

    // input wire connection
    val reg_pc_default  = io.in.reg_pc
    val inst_default    = io.in.inst
    val br_flag         = io.in.ex_io.br_io.br_flag
    val jump_flag       = io.in.ex_io.alu_io.jump_flag
    val stall_flag      = io.stall_in.stall_flag
    val pred_miss_flag  = io.stall_in.pred_miss_flag

    // data hazard stall logic
    reg_pc :=MuxCase(reg_pc_default, Seq(
        stall_flag -> reg_pc
    ))
    inst := MuxCase(inst_default, Seq(
        pred_miss_flag  -> NOP,
        stall_flag      -> inst
    ))

    // output wire connection
    io.out.reg_pc       := reg_pc
    io.out.inst         := inst
    io.out.ex_io        <> io.in.ex_io  //直接传递
}

/*
type: Hardware
name: Program Counter(程序计数器)
*/  
class PC extends Module{
    val io = IO(new Bundle{
        val in = new Bundle{
            val bp_in       = Flipped(new BP_IO())
            val stall_in    = Flipped(new Stall_IO())
            val ex_in       = Flipped(new EX_IO())
        }
        val out     = new PC_IO()
        val instmem = Flipped(new InstMem_IO())
    })

    // input wire connection
    val inst            = io.instmem.inst
    val stall_flag      = io.in.stall_in.stall_flag
    val pred_miss_flag  = io.in.stall_in.pred_miss_flag
    val br_flag         = io.in.ex_in.br_io.br_flag
    val br_target       = io.in.ex_in.br_io.br_target
    val jump_flag       = io.in.ex_in.alu_io.jump_flag
    val alu_out         = io.in.ex_in.alu_io.alu_out
    val trap_vector     = io.in.ex_in.csr_io.trap_vector
    val pred_flag       = io.in.bp_in.pred_flag
    val pred_target     = io.in.bp_in.pred_target

    // program counter update
    val reg_pc              = RegInit(START_PC)
    val reg_pc_next_default = reg_pc + 4.U(WORD_LEN.W)
    val reg_pc_next         = MuxCase(reg_pc_next_default, Seq(
        (pred_miss_flag && jump_flag)   -> alu_out,
        (pred_miss_flag && br_flag)     -> br_target,
        (inst === ECALL)                -> trap_vector,     // go to trap_vector
        stall_flag                      -> reg_pc,          // ID/EX data_hazard stall
        pred_flag                       -> pred_target      // branch prediction
    ))
    reg_pc := reg_pc_next

    // output wire connection
    io.instmem.addr     := reg_pc
    io.out.reg_pc       := reg_pc
    io.out.inst         := inst
    io.out.ex_io        <> io.in.ex_in  //直接传递
    
    // debug info
    printf("-----------------------START----------------------\n")
    printf("-------------IF------------\n")
    printf(p"reg_pc: 0x${Hexadecimal(reg_pc)}\n")
    printf(p"inst: 0x${Hexadecimal(inst)}\n")
}