package peripheral

import chisel3._
import chisel3.util._
import public.PConsts._
import soc.DConsts._

/*
type: IO Port
name: LED IO(LED output interface)
led: LED control wire,output
*/
class LED_IO extends Bundle {
  val led = Output(UInt(WORD_LEN.W))
}

/* 
type: Hardware
name: LED controlor(LED驱动器)
*/
class LED extends Module {
  val io = IO(new Bundle {
    val bus    = Flipped(new APB_BUS())
    val led_io = new LED_IO()
  })

  // LED registers (refer to device.h)
  val led_control_reg = RegInit(0.U(LED_SIZE.W))

  // input wire connection
  val wen   = io.bus.wen
  val wdata = io.bus.out.wdata

  // led contorl logic
  when(wen) {
    led_control_reg := wdata
  }.otherwise{
    led_control_reg := led_control_reg
  }

  // output wire connection
  io.bus.in.valid  := true.B // always valid
  io.bus.in.rdata  := led_control_reg
  io.led_io.led    := led_control_reg

}