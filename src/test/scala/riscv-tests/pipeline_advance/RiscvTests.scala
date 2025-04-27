package pipeline_advance_riscv_tests

import chisel3._
import pipeline_advance_riscv_tests.Consts._
import org.scalatest._
import chiseltest._

// class RiscvTest extends FlatSpec with ChiselScalatestTester {
//   behavior of "pipeline_advance_riscv_tests_riscv_tests"
//   it should "work" in {
//     test(new Top) 
//     { dut =>
//       dut.clock.setTimeout(2000)
//       while (!dut.io.exit.peek().litToBoolean){
//         dut.clock.step(1)
//       }
//       dut.clock.step(PIPELINE_LEN)
//       dut.io.gp.expect(1.U)
//     }
//   }
// }

class RiscvTest extends FlatSpec with ChiselScalatestTester {
  behavior of "pipeline_advance_riscv_tests_riscv_tests"
  it should "work" in {
    test(new Top) { dut =>
      dut.clock.setTimeout(10000)
      var jump_times = 0
      var bran_times = 0
      var pred_times = 0
      var miss_times = 0
      while (!dut.io.exit.peek().litToBoolean) {
        dut.clock.step(1)
        if (dut.io.jump_flag.peek().litToBoolean) {
          jump_times += 1    
        }
        if (dut.io.br_flag.peek().litToBoolean) {
          bran_times += 1    
        }
        if (dut.io.pred_flag.peek().litToBoolean) {
          pred_times += 1
        }
        if (dut.io.miss_flag.peek().litToBoolean) {
          miss_times += 1
        }
      }
      dut.clock.step(PIPELINE_LEN)
      println(s"jump_times: $jump_times")
      println(s"bran_times: $bran_times")
      println(s"pred_times: $pred_times")
      println(s"miss_times: $miss_times")
      println(s"success rate: ${(pred_times - miss_times) * 100 / pred_times}%")
      //dut.io.gp.expect(1.U)
    }
  }
}
