package cpu

import chisel3._
import org.scalatest._
import chiseltest._

class CPUTest extends FlatSpec with ChiselScalatestTester {
  behavior of "mycpu" 
  it should "work well through hex" in {
    test(new Top) { dut =>
      while (!dut.io.exit.peek().litToBoolean){
        dut.clock.step(1)
      }
      c.io.globalpointer.expect(1.U)
    }
  }
}