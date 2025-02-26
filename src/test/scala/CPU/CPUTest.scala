package cpu

import chisel3._
import org.scalatest._
import chiseltest._

class CPUTest extends FlatSpec with ChiselScalatestTester {
  "mycpu" should "work well" in {
    test(new Top) { c =>
      while (!c.io.exit.peek().litToBoolean){
        c.clock.step(1)
      }
    }
  }
}