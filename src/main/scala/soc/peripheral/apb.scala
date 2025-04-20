package peripheral

import chisel3._
import chisel3.util._
import public.PConsts._
import soc.DConsts._

/*
type: BUS
name: APB_BUS(自定义总线)
*/
class APB_BUS extends Bundle {
    val addr  = Output(UInt(WORD_LEN.W))
    val wen   = Output(Bool())
    val wdata = Output(UInt(WORD_LEN.W))
    val valid = Input(Bool())
    val rdata = Input(UInt(WORD_LEN.W))
}

/*
type: IO Port
name: APB_Peripheral_IO(自定义总线上外设集成接口)
led_io: (see LED_IO in LED.scala)
note: all interfaces are collected on APB bus
*/
class APB_Peripheral_IO extends Bundle {
    val led_io = new LED_IO()
}

/*
type: Hardware
name: APB_Peripheral(自定义总线控制器)
note: deliver data to peripherals on APB bus
*/
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