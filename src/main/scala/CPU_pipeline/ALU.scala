package cpu_pipeline

import chisel3._
import chisel3.util._
import public.Consts._
import public.Instructions._

/*
type: IO Port
nake: ALU_IO(算术逻辑单元接口)
alu_out: ALU output,output
jump_flag: Jump flag,output
*/
class ALU_IO extends Bundle{
    val alu_out = Output(UInt(WORD_LEN.W))
    val jump_flag = Output(Bool())
}

/*
type: Hardware
name: ALU Pipeline Register(算术逻辑单元流水线寄存器)
*/
class ALU_IO_REG extends Module{
    val io = IO(new Bundle{
        val in = Flipped(new ALU_IO())
        val out = new ALU_IO()
    })

    val alu_io_reg = RegInit(0.U.asTypeOf(new ALU_IO()))

    alu_io_reg := io.in
    io.out := alu_io_reg
}

/*
type: Hardware
name: ALU(算术逻辑单元)
*/
class ALU extends Module{
    val io = IO(new Bundle{
        val id_in = Flipped(new ID_IO())
        val out = new ALU_IO()
    })

    //input wire connection
    val op1_data = io.id_in.op1_data
    val op2_data = io.id_in.op2_data
    val exe_fun = io.id_in.exe_fun
    val rd_sel = io.id_in.rd_sel

    //ALU logic
    val alu_out = MuxCase(0.U(WORD_LEN.W), Seq(
        (exe_fun === ALU_ADD)   -> (op1_data + op2_data),
        (exe_fun === ALU_SUB)   -> (op1_data - op2_data),
        (exe_fun === ALU_AND)   -> (op1_data & op2_data),
        (exe_fun === ALU_OR)    -> (op1_data | op2_data),
        (exe_fun === ALU_XOR)   -> (op1_data ^ op2_data),
        (exe_fun === ALU_SLL)   -> (op1_data << op2_data(4, 0))(31, 0),
        (exe_fun === ALU_SRL)   -> (op1_data >> op2_data(4, 0)).asUInt(),
        (exe_fun === ALU_SRA)   -> (op1_data.asSInt() >> op2_data(4, 0)).asUInt(),
        (exe_fun === ALU_SLT)   -> (op1_data.asSInt() < op2_data.asSInt()).asUInt(),
        (exe_fun === ALU_SLTU)  -> (op1_data < op2_data).asUInt(),
        (exe_fun === ALU_JALR)  -> ((op1_data + op2_data) & ~1.U(WORD_LEN.W)),
        (exe_fun === ALU_COPY1) -> op1_data
    ))
    //jump
    val jump_flag = (rd_sel === WB_PC)

    //output wire connection
    io.out.alu_out := alu_out
    io.out.jump_flag := jump_flag

}