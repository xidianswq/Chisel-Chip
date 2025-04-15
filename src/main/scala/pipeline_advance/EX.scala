package pipeline_advance

import chisel3._
import chisel3.util._
import pipeline_advance.Consts._

/*
type: IO Port
name: EX_IO(执行阶段接口)
alu_io: ALU interface,output
csr_io: CSR interface,output
*/
class EX_IO extends Bundle{
    val alu_io = new ALU_IO()
    val csr_io = new CSR_IO()
    val br_io  = new BR_IO()
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


class EX extends Module{
    val io = IO(new Bundle{
        val in = new Bundle{
            val if_in = Flipped(new PC_IO())
            val id_in = Flipped(new ID_IO())
        }
        val out = new EX_IO()
    })

    //module
    val alu = Module(new ALU())
    val csr = Module(new CSR())
    val br  = Module(new BR())

    //input wire connection
    val if_in = io.in.if_in
    val id_in = io.in.id_in
    alu.io.in.id_in <> id_in
    csr.io.in.id_in <> id_in
    br.io.in.if_in <> if_in
    br.io.in.id_in <> id_in

    //output wire connection
    io.out.alu_io <> alu.io.out
    io.out.csr_io <> csr.io.out
    io.out.br_io  <> br.io.out
}