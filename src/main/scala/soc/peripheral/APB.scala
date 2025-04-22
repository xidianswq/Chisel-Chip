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
    val in = new Bundle {
        val valid = Input(Bool())
        val rdata = Input(UInt(WORD_LEN.W))
    }
    val wen   = Output(Bool())
    val out = new Bundle {
        val addr  = Output(UInt(WORD_LEN.W))
        val wdata = Output(UInt(WORD_LEN.W))
    }
}

/*
type: IO Port
name: APB_Peripheral_IO(自定义总线上外设集成接口)
led_io: (see LED_IO in LED.scala)
note: all interfaces are collected on APB bus
*/
class APB_Peripheral_IO extends Bundle {
    val led_io = new LED_IO()
    val key_io = new KEY_IO()
    val sdt_io = new SDT_IO()
}

/*
type: Hardware
name: APB_Peripheral(自定义总线控制器)
note: deliver data to peripherals on APB bus
*/
class APB_Peripheral extends Module {
    val io = IO(new Bundle {
        val apb_bus         = Flipped(new APB_BUS())
        val peripheral_io   = new APB_Peripheral_IO()
    })

    // peripheral
    val led = Module(new LED())
    val key = Module(new KEY())
    val sdt = Module(new SDT())

    // connect peripheral to APB bus
    led.io.bus.out <> io.apb_bus.out
    key.io.bus.out <> io.apb_bus.out
    sdt.io.bus.out <> io.apb_bus.out

    // input wire connect
    val addr      = io.apb_bus.out.addr
    val wen       = io.apb_bus.wen
    val led_rdata = led.io.bus.in.rdata
    val key_rdata = key.io.bus.in.rdata
    val sdt_rdata = sdt.io.bus.in.rdata
    val led_vaild = led.io.bus.in.valid
    val key_vaild = key.io.bus.in.valid
    val sdt_vaild = sdt.io.bus.in.valid

    // APB_Peripheral control logic
    val led_sel = addr === LED_BASE
    val key_sel = addr === KEY_BASE
    val sdt_sel = ((addr >=  SDT_BASE) && (addr < SDT_END))
    val led_wen = Mux(led_sel, wen, false.B)
    val key_wen = Mux(key_sel, wen, false.B)
    val sdt_wen = Mux(sdt_sel, wen, false.B)
    val rdata = MuxCase(0.U, Seq(
        led_sel -> led_rdata,
        key_sel -> key_rdata,
        sdt_sel -> sdt_rdata,
    ))
    val valid = MuxCase(false.B, Seq(
        led_sel -> led.io.bus.in.valid,
        key_sel -> key.io.bus.in.valid,
        sdt_sel -> sdt.io.bus.in.valid,
    ))

    // output wire connect
    led.io.bus.wen := led_wen
    key.io.bus.wen := key_wen
    sdt.io.bus.wen := sdt_wen
    io.apb_bus.in.valid := valid
    io.apb_bus.in.rdata := rdata

    io.peripheral_io.led_io <> led.io.led_io
    io.peripheral_io.key_io <> key.io.key_io
    io.peripheral_io.sdt_io <> sdt.io.sdt_io
}
