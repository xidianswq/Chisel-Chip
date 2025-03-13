package cpu_pipeline

import chisel3._
import chisel3.util._
import public.Consts._
import public.Instructions._

/*
type: IO Port
name: WB_IO(写回接口)
rd_wen: Register write enable,output
rd_addr: Register write address,output
rd_data: Register write data,output
*/
class WB_IO extends Bundle{
    val rd_wen = Output(UInt(REN_LEN.W))
    val rd_addr = Output(UInt(REGX_ADDR_LEN.W))
    val rd_data = Output(UInt(WORD_LEN.W))
}

/*
type: Hardware
name: WB Pipeline Register(写回阶段流水线寄存器)
*/
class WB_IO_REG extends Module{
    val io = IO(new Bundle{
        val in = Flipped(new WB_IO())
        val out = new WB_IO()
    })

    val wb_io_reg = RegInit(0.U.asTypeOf(new WB_IO()))

    wb_io_reg := io.in
    io.out := wb_io_reg
}

/*
type: Hardware
name: Write back unit(写回单元)
*/
class WB extends Module{
    val io = IO(new Bundle{
        val if_in = Flipped(new PC_IO())
        val id_in = Flipped(new ID_IO())
        val ex_in = Flipped(new ALU_IO())
        val mem_in = Flipped(new MEM_IO())
        val out = new WB_IO()
    })

    //input wire connection
    val reg_pc = io.if_in.reg_pc
    val rd_sel = io.id_in.rd_sel
    val alu_out = io.ex_in.alu_out
    val datamem_rdata = io.mem_in.datamem_rdata
    val csr_rdata = io.mem_in.csr_rdata
    
    //WB logic
    val rd_data = MuxCase(alu_out, Seq(
        (rd_sel === WB_MEM) -> datamem_rdata,
        (rd_sel === WB_PC)  -> (reg_pc + 4.U(WORD_LEN.W)),
        (rd_sel === WB_CSR) -> csr_rdata
    ))
    
    //output wire connection
    io.out.rd_wen := io.id_in.rd_wen
    io.out.rd_addr := io.id_in.rd_addr
    io.out.rd_data := rd_data
}