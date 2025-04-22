package soc

import chisel3._
import public.PConsts._
import org.scalatest._
import chiseltest._

class SoCTest extends FlatSpec with ChiselScalatestTester {
  behavior of "soc" 
  it should "work" in {
    test(new SoC) { dut =>
      var key_in = 257
      while (!dut.io.exit.peek().litToBoolean){
        if(key_in >= 32896)key_in = 257
        else key_in = key_in << 1
        dut.clock.step(1)
        dut.io.out.APB_Peripheral_io.key_io.key.poke(key_in.U)
      }
      dut.clock.step(PIPELINE_LEN)
    }
  }
}
