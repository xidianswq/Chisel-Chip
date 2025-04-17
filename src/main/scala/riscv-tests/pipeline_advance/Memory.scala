package pipeline_advance_riscv_tests


import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import cpu_pipeline.Consts._

/*
type: IO Port
name: InstMemPortIO(指令存储器接口)
addr: Memory address,input
inst: Instruction,output
*/
class InstMem_IO extends Bundle {
    val addr = Input(UInt(IMEM_WIDTH.W))
    val inst = Output(UInt(WORD_LEN.W))
}

/*
type: IO Port
name: DataMemPortIO(数据存储器接口)
addr: Memory address,input
rdata: Read Data,output
wen: Write enable,input
wdata: Write Data,input
*/
class DataMem_IO extends Bundle {
    val addr  = Input(UInt(DMEM_WIDTH.W))
    val rdata = Output(UInt(WORD_LEN.W))
    val wen   = Input(Bool())
    val wdata = Input(UInt(WORD_LEN.W))
}

/*
type: Hardware
name: InstMem(指令存储器)
*/
class Memory extends Module {
    val io = IO(new Bundle {
        val instmem = new InstMem_IO()
        val datamem = new DataMem_IO()
    })

    // Instruction Memory Size: 16KB(16384 * 8bits)
    val mem = Mem(IMEM_DEPTH, UInt(8.W))

    loadMemoryFromFile(mem, "src/riscv-tests/hex/rv32mi-p-scall.hex")

    // connect the 4 address to get a 32-bit instruction
    io.instmem.inst := Cat(
        mem(io.instmem.addr + 3.U(WORD_LEN.W)),
        mem(io.instmem.addr + 2.U(WORD_LEN.W)),
        mem(io.instmem.addr + 1.U(WORD_LEN.W)),
        mem(io.instmem.addr)
    )

    io.datamem.rdata := Cat(
        mem(io.datamem.addr + 3.U(WORD_LEN.W)),
        mem(io.datamem.addr + 2.U(WORD_LEN.W)),
        mem(io.datamem.addr + 1.U(WORD_LEN.W)),
        mem(io.datamem.addr)
    )

    when(io.datamem.wen){
        mem(io.datamem.addr) := io.datamem.wdata(7, 0)
        mem(io.datamem.addr + 1.U(WORD_LEN.W)) := io.datamem.wdata(15, 8)
        mem(io.datamem.addr + 2.U(WORD_LEN.W)) := io.datamem.wdata(23, 16)
        mem(io.datamem.addr + 3.U(WORD_LEN.W)) := io.datamem.wdata(31, 24)
    }
}
