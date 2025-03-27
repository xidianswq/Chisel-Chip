package cpu

import chisel3._
import chisel3.util._


class Top extends Module{
    val io = IO(new Bundle{
        val exit = Output(Bool())
    })

    val core = Module(new Core)
    val memory = Module(new Memory)

    core.io.instmem <> memory.io.instmem
    core.io.datamem <> memory.io.datamem
    io.exit := core.io.exit
}

object TopOption extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new Top(), Array("--target-dir", "generated/cpu/Top"))
}
