package cpu_pipeline

import chisel3._
import chisel3.util._
import public.Consts._
import public.Instructions._

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
            val ex_in = Flipped(new ALU_IO())
        }
        //val out = new MEM_IO()
        val out = new WB_IO()
        val datamem = Flipped(new DataMem_IO())
    })

    //register file
    val reg_csr = RegInit(VecInit(Seq.fill(CSR_Num)(0.U(WORD_LEN.W))))

    //input wire connection
    val reg_pc      = io.in.if_in.reg_pc
    val rd_addr     = io.in.id_in.rd_addr
    val csr_addr_default    = io.in.id_in.csr_addr_default
    val rs2_data    = io.in.id_in.rs2_data
    val op1_data    = io.in.id_in.op1_data
    val csr_cmd     = io.in.id_in.csr_cmd
    val mem_wen     = io.in.id_in.mem_wen
    val rd_sel  = io.in.id_in.rd_sel
    val rd_wen  = io.in.id_in.rd_wen
    
    val alu_out = io.in.ex_in.alu_out

    val datamem_rdata   = io.datamem.rdata
    
    //Data memory access
    io.datamem.addr     := alu_out
    io.datamem.wen      := mem_wen.asBool()
    io.datamem.wdata    := rs2_data

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

    //WB logic
    val rd_data = MuxCase(alu_out, Seq(
        (rd_sel === WB_MEM) -> datamem_rdata,
        (rd_sel === WB_PC)  -> (reg_pc + 4.U(WORD_LEN.W)),
        (rd_sel === WB_CSR) -> csr_rdata
    ))

    //output wire connection
    // io.out.datamem_rdata := datamem_rdata
    // io.out.csr_rdata := csr_rdata
    io.out.rd_wen   := rd_wen
    io.out.rd_addr  := rd_addr
    io.out.rd_data  := rd_data

    //debug info
    printf("-------------MEM-----------\n")
    printf(p"datamem.wen: ${io.datamem.wen}\n")
    printf(p"datamem.wdata: 0x${Hexadecimal(io.datamem.wdata)}\n")
    printf(p"csr_wdata: 0x${Hexadecimal(csr_wdata)}\n")
}