package score

import chisel3._
import chisel3.util._
import public.PConsts._

/*
type: IO Port
name: CSR_IO(控制状态寄存器接口)
csr_rdata: CSR read data,output
trap_vector: Trap vector,output
*/
class CSR_IO extends Bundle{
    val csr_rdata   = Output(UInt(REG_LEN.W))
    val trap_vector = Output(UInt(REG_LEN.W))
}

/*
type: Hardware
name: CSR(控制状态寄存器)
*/
class CSR extends Module{
    val io = IO(new Bundle{
        val in = new Bundle{
            val id_io = Flipped(new ID_IO())
        }
        val out = new CSR_IO()
    })

    // register file
    val reg_csr = RegInit(VecInit(Seq.fill(CSR_NUM)(0.U(REG_LEN.W))))

    // input wire connection
    val csr_cmd     = io.in.id_io.csr_cmd
    val csr_addr_default    = io.in.id_io.csr_addr_default
    val op1_data    = io.in.id_io.op1_data

    // CSR operation
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

    // output wire connection
    io.out.csr_rdata    := csr_rdata
    io.out.trap_vector  := reg_csr(0x305.U(CSR_ADDR_LEN.W))

    // debug info
    printf(p"csr_addr  = 0x${Hexadecimal(csr_addr)}\n")
    printf(p"csr_rdata = 0x${Hexadecimal(csr_rdata)}\n")
    printf(p"csr_wdata = 0x${Hexadecimal(csr_wdata)}\n")
}