package soc

import chisel3._
import chisel3.util._
import public.PConsts._
import soc.DConsts._
import score._
import peripheral._

class SoC extends Module {
    val io = IO(new Bundle {
        val exit = Output(Bool())
        val out = new Bundle {
            val APB_Peripheral_io = new APB_Peripheral_IO()
        }
    })

    val core        = Module(new SCore)
    val apb_periph  = Module(new APB_Peripheral)

    // Module connections
    core.io.bus.apb_bus         <> apb_periph.io.apb_bus    // connect core to APB bus

    // output wire connect
    io.exit                     := core.io.exit             // connect exit signal to top module
    io.out.APB_Peripheral_io    <> apb_periph.io.apb_out    // connect LED to APB bus
}

object TopOption extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new SoC(), Array("--target-dir", "generated/soc/SoC"))
}