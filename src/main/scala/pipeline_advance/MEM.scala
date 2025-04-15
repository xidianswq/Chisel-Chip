package pipeline_advance

import chisel3._
import chisel3.util._
import pipeline_advance.Consts._

/*
type: IO Port
name: MEM_IO(内存接口)
note: abandoned
datamem_rdata: Data memory read data,output
csr_rdata: CSR read data,output
*/
class MEM_IO extends Bundle{
    val datamem_rdata = Output(UInt(WORD_LEN.W))
    val csr_rdata = Output(UInt(WORD_LEN.W))
}

/*
type: Hardware
name: MEM Pipeline Register(访存阶段流水线寄存器)
note: abandoned
*/
class MEM_IO_REG extends Module{
    val io = IO(new Bundle{
        val in = Flipped(new MEM_IO())
        val out = new MEM_IO()
    })

    val mem_io_reg = RegInit(0.U.asTypeOf(new MEM_IO()))

    mem_io_reg := io.in
    io.out := mem_io_reg
}

/*
type: Hardware
name: Memory access unit(内存访问单元)
*/
class MEM extends Module{
    val io = IO(new Bundle{
        val in = new Bundle{
            val if_in = Flipped(new PC_IO())
            val id_in = Flipped(new ID_IO())
            val ex_in = Flipped(new EX_IO())
        }
        // val out = new MEM_IO()
        val out = new WB_IO()
        val datamem = Flipped(new DataMem_IO())
    })

    // input wire connection
    val reg_pc      = io.in.if_in.reg_pc
    val rd_addr     = io.in.id_in.rd_addr
    val rs2_data    = io.in.id_in.rs2_data
    val mem_wen     = io.in.id_in.mem_wen
    val rd_sel      = io.in.id_in.rd_sel
    val rd_wen      = io.in.id_in.rd_wen
    val alu_out     = io.in.ex_in.alu_io.alu_out
    val csr_rdata   = io.in.ex_in.csr_io.csr_rdata
    val datamem_rdata   = io.datamem.rdata
    
    // Data memory access
    io.datamem.addr     := alu_out
    io.datamem.wen      := mem_wen.asBool()
    io.datamem.wdata    := rs2_data

    // WB logic
    val rd_data = MuxCase(alu_out, Seq(
        (rd_sel === WB_MEM) -> datamem_rdata,
        (rd_sel === WB_PC)  -> (reg_pc + 4.U(WORD_LEN.W)),
        (rd_sel === WB_CSR) -> csr_rdata
    ))

    // output wire connection
    io.out.rd_wen   := rd_wen
    io.out.rd_addr  := rd_addr
    io.out.rd_data  := rd_data

    // debug info
    printf("-------------MEM-----------\n")
    printf(p"datamem.wen: ${io.datamem.wen}\n")
    printf(p"datamem.wdata: 0x${Hexadecimal(io.datamem.wdata)}\n")
}