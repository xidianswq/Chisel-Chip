package soc

import chisel3._
import public.PConsts._
import org.scalatest._
import chiseltest._

class SoCTest extends FlatSpec with ChiselScalatestTester {
  behavior of "soc" 
  it should "work" in {
    test(new SoC) { dut =>
      var i = 0
      var key_in = 257
      while (!dut.io.exit.peek().litToBoolean){
        i = i + 1
        if(key_in >= 32896)key_in = 257
        else key_in = key_in + i
        dut.clock.step(1)
        dut.io.out.APB_Peripheral_io.key_io.key.poke(key_in.U)
      }
      dut.clock.step(PIPELINE_LEN)
    }
  }
}
