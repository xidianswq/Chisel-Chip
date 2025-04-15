package pipeline_advance

import chisel3._
import chisel3.util._
import pipeline_advance.Consts._
import pipeline_advance.Instructions._

class BP_IO extends Bundle {
    val pred_pc = Output(UInt(REG_LEN.W))
}

class BP extends Module {
    val io = IO(new Bundle {
        val in = new Bundle {
            val pc_in = Flipped(new PC_IO())
            val ex_in = Flipped(new EX_IO())
        }
        val out = new BP_IO()
    })

    // branch prediction logic
    val reg_pc  = io.in.pc_in.reg_pc
    val br_flag = io.in.ex_in.br_io.br_flag
    val pred_pc = Wire(UInt(REG_LEN.W))

    when(br_flag) {
        pred_pc := reg_pc + 4.U
    } .otherwise {
        pred_pc := reg_pc + 8.U // assuming a fixed offset for simplicity
    }

    io.out.pred_pc := pred_pc
}