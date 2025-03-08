package cpu_riscv_tests

import chisel3._
import org.scalatest._
import chiseltest._

class RiscvTest extends FlatSpec with ChiselScalatestTester {
  behavior of "cpu_riscv_tests" 
  it should "work" in {
    test(new Top) 
    { dut =>
      dut.clock.setTimeout(2000)
      while (!dut.io.exit.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.globalpointer.expect(1.U)
    }
  }
}
