package cpu_pipeline

import chisel3._
import org.scalatest._
import chiseltest._

class CPUTest extends FlatSpec with ChiselScalatestTester {
  behavior of "cpu_pipeline" 
  it should "work" in {
    test(new Top) { dut =>
      while (!dut.io.exit.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.globalpointer.expect(1.U)
    }
  }
}
