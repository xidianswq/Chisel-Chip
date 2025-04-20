package peripheral

import chisel3._
import chisel3.util._
import public.PConsts._
import soc.DConsts._

class APB_BUS extends Bundle {
    val addr  = Output(UInt(WORD_LEN.W))
    val wen   = Output(Bool())
    val wdata = Output(UInt(WORD_LEN.W))
    val valid = Input(Bool())
    val rdata = Input(UInt(WORD_LEN.W))
}

class APB_Peripheral_IO extends Bundle {
    val led_io = new LED_IO()
}

class APB_Peripheral extends Module {
    val io = IO(new Bundle {
        val apb_bus = Flipped(new APB_BUS())
        val apb_out = new APB_Peripheral_IO()
    })

    // peripheral
    val led = Module(new LED())

    // connect peripheral to APB bus
    led.io.bus <> io.apb_bus

    // output wire connect
    io.apb_out.led_io <> led.io.out
}