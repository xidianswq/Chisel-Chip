package peripheral

import chisel3._
import chisel3.util._
import public.PConsts._
import soc.DConsts._
import soc.LED_Consts._

class LED_IO extends Bundle {
  val led = Output(UInt(WORD_LEN.W))
}

class LED extends Module {
  val io = IO(new Bundle {
    val bus = Flipped(new APB_BUS())
    val out = new LED_IO()
  })

  // LED registers (refer to device.h)
  val led_control_reg = RegInit(0.U(LED_WIDTH.W))

  // input wire connection
  val wen   = io.bus.wen
  val addr  = io.bus.addr
  val wdata = io.bus.wdata

  // led contorl logic
  when(wen) {
    led_control_reg := wdata
  }.otherwise{
    led_control_reg := led_control_reg
  }

  // output wire connection
  io.bus.valid  := true.B // always valid
  io.bus.rdata  := led_control_reg
  io.out.led    := led_control_reg

}