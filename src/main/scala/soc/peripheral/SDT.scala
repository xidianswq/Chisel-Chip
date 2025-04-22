package peripheral

import chisel3._
import chisel3.util._
import public.PConsts._
import soc.DConsts._

/*
type: IO Port
name: SDT IO(SDT input interface)
sdt: SDT input wire,input
*/
class SDT_IO extends Bundle {
    val sdta = Output(UInt(SDT_SIZE.W))
    val sdtb = Output(UInt(SDT_SIZE.W))
}

class SDT extends Module {
    val io = IO(new Bundle {
        val bus    = Flipped(new APB_BUS())
        val sdt_io = new SDT_IO()
    })
    // sdt inputdata register
    val sdt_outputdata_reg = RegInit(VecInit(Seq.fill(2)(0.U(SDT_SIZE.W))))

    // input wire connection
    val addr    = io.bus.out.addr
    val wen     = io.bus.wen
    val wdata   = io.bus.out.wdata

    // DigtalTube control logic
    val sel     = ((addr - SDT_BASE) >> 2)
    when(wen) {
        sdt_outputdata_reg(sel) := wdata(SDT_SIZE-1,0)
    }.otherwise{
        sdt_outputdata_reg := sdt_outputdata_reg
    }
    val rdata   = sdt_outputdata_reg(sel)

    // output wire connection
    io.sdt_io.sdta := sdt_outputdata_reg(0)
    io.sdt_io.sdtb := sdt_outputdata_reg(1)

    io.bus.in.valid  := true.B // always valid
    io.bus.in.rdata  := rdata
}
