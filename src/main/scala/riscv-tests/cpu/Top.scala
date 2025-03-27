package cpu_riscv_tests

import chisel3._
import chisel3.util._
import cpu_riscv_tests.Consts._

class Top extends Module{
    val io = IO(new Bundle{
        val exit = Output(Bool())
        val gp   = Output(UInt(REG_LEN.W))
    })

    val core = Module(new Core)
    val memory = Module(new Memory)

    core.io.instmem <> memory.io.instmem
    core.io.datamem <> memory.io.datamem
    io.exit := core.io.exit
    io.gp   := core.io.gp
}

object TopOption extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new Top(), Array("--target-dir", "generated/cpu_riscv_tests/Top"))
}
