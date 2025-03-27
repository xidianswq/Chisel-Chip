package cpu_pipeline_riscv_tests

import chisel3._
import chisel3.util._
import cpu_pipeline_riscv_tests.Consts._

/*
type: IO Port
name: EX_IO(执行阶段接口)
alu_io: ALU interface,output
csr_io: CSR interface,output
*/
class EX_IO extends Bundle{
    val alu_io = new ALU_IO()
    val csr_io = new CSR_IO()
}

/*
type: Hardware
name: EX Pipeline Register(执行阶段流水线寄存器)
*/
class EX_IO_REG extends Module{
    val io = IO(new Bundle{
        val in  = Flipped(new EX_IO())
        val out = new EX_IO()
    })

    val ex_io_reg = RegInit(0.U.asTypeOf(new EX_IO()))

    ex_io_reg := io.in
    io.out := ex_io_reg
}