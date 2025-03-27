package cpu

import chisel3._
import cpu.Consts._
import org.scalatest._
import chiseltest._

class CPUTest extends FlatSpec with ChiselScalatestTester {
  behavior of "cpu" 
  it should "work" in {
    test(new Top) { dut =>
      while (!dut.io.exit.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.clock.step(PIPELINE_LEN)
    }
  }
}
