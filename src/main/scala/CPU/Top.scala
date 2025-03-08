package cpu

import chisel3._
import chisel3.util._


class Top extends Module{
    val io = IO(new Bundle{
        val exit = Output(Bool())
    })

    val core = Module(new Core)
    val instmem = Module(new Mem)

    core.io.instmem <> instmem.io.instmem
    core.io.datamem <> instmem.io.datamem
    io.exit := core.io.exit
}

object TopOption extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new Top(), Array("--target-dir", "generated"))
}
