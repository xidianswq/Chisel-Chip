package cpu_riscv_tests

import chisel3._
import cpu_riscv_tests.Consts._
import org.scalatest._
import chiseltest._

class RiscvTest extends FlatSpec with ChiselScalatestTester {
  behavior of "cpu_riscv_tests_riscv_tests"
  it should "work" in {
    test(new Top) 
    { dut =>
      dut.clock.setTimeout(2000)
      while (!dut.io.exit.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.clock.step(PIPELINE_LEN)
      dut.io.gp.expect(1.U)
    }
  }
}
