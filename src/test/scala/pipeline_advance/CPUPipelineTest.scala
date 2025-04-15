package pipeline_advance

import chisel3._
import pipeline_advance.Consts._
import org.scalatest._
import chiseltest._

class PipelineAdvanceTest extends FlatSpec with ChiselScalatestTester {
  behavior of "pipeline_advance" 
  it should "work" in {
    test(new Top) { dut =>
      while (!dut.io.exit.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.clock.step(PIPELINE_LEN)
    }
  }
}
