package soc

import chisel3._
import public.PConsts._
import org.scalatest._
import chiseltest._

class SoCTest extends FlatSpec with ChiselScalatestTester {
  behavior of "soc" 
  it should "work" in {
    test(new SoC) { dut =>
      while (!dut.io.exit.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.clock.step(PIPELINE_LEN)
    }
  }
}
