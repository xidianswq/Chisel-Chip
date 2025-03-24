package cpu_pipeline

import chisel3._
import public.Consts._
import org.scalatest._
import chiseltest._

class CPUPipelineTest extends FlatSpec with ChiselScalatestTester {
  behavior of "cpu_pipeline" 
  it should "work" in {
    test(new Top) { dut =>
      while (!dut.io.exit.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.clock.step(PIPELINE_LEN)
    }
  }
}
