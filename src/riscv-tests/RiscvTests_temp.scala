package {package}

import chisel3._
import org.scalatest._
import chiseltest._
import chiseltest.simulator.VerilatorBackendAnnotation // 需导入超时相关注解
import chiseltest.simulator.Timeout

class RiscvTest extends FlatSpec with ChiselScalatestTester {
  behavior of "mycpu" 
  it should "work well through hex" in {
    // 设置超时为 20000 周期（可根据需要调整）
    test(new Top)
      .withAnnotations(Seq(
        VerilatorBackendAnnotation, // 需要指定仿真后端
        Timeout(20000)             // 设置超时周期数
      )) { dut =>
        while (!dut.io.exit.peek().litToBoolean) {
          dut.clock.step(1)
        }
        dut.io.globalpointer.expect(1.U)
      }
  }
}