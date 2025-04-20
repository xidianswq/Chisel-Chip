package score

import chisel3._
import public.PConsts._
import org.scalatest._
import chiseltest._

class SCoreTest extends FlatSpec with ChiselScalatestTester {
  behavior of "score" 
  it should "work" in {
    test(new SCore) { dut =>
      while (!dut.io.exit.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.clock.step(PIPELINE_LEN)
    }
  }
}
