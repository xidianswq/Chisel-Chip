package cpu_pipeline

import chisel3._
import chisel3.util._
import public.Consts._
import public.Instructions._

/*
type: IO Port
name: MEM_IO(内存接口)
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
        val if_in = Flipped(new PC_IO())
        val id_in = Flipped(new ID_IO())
        val ex_in = Flipped(new ALU_IO())
        val out = new MEM_IO()
        val datamem = Flipped(new DataMem_IO())
    })

    //register file
    val reg_csr = RegInit(VecInit(Seq.fill(CSR_Num)(0.U(WORD_LEN.W))))

    //input wire connection
    val mem_wen = io.id_in.mem_wen
    val rs2_data = io.id_in.rs2_data
    val csr_addr_default = io.id_in.csr_addr_default
    val csr_cmd = io.id_in.csr_cmd
    val op1_data = io.id_in.op1_data
    val alu_out = io.ex_in.alu_out

    io.datamem.addr  := alu_out
    io.datamem.wen   := mem_wen.asBool()
    io.datamem.wdata := rs2_data

    //CSR operation
    val csr_addr = MuxCase(csr_addr_default, Seq(
        (csr_cmd === CSR_E) -> 0x342.U(CSR_ADDR_LEN.W)
    ))
    val csr_rdata = reg_csr(csr_addr)
    val csr_wdata = MuxCase(0.U(WORD_LEN.W), Seq(
        (csr_cmd === CSR_W) -> op1_data,
        (csr_cmd === CSR_S) -> (csr_rdata | op1_data),
        (csr_cmd === CSR_C) -> (csr_rdata & ~op1_data),
        (csr_cmd === CSR_E) -> 11.U(WORD_LEN.W)
    ))
    when(csr_cmd =/= CSR_NULL){
        reg_csr(csr_addr) := csr_wdata
    }

    //output wire connection
    io.out.datamem_rdata := io.datamem.rdata
    io.out.csr_rdata := csr_rdata
}