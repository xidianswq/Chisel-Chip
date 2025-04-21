package peripheral

import chisel3._
import chisel3.util._
import public.PConsts._
import soc.DConsts._

/*
type: IO Port
name: KEY IO(KEY input interface)
key: KEY input wire,input
*/
class KEY_IO extends Bundle {
    val key = Input(UInt(KEY_SIZE.W))
}

/*
type: Hardware
name: KEY controlor(按键驱动器)
*/
class KEY extends Module {
    val io = IO(new Bundle {
        val bus    = Flipped(new APB_BUS())
        val key_io = new KEY_IO()
    })
    // key inputdata register
    val key_inputdata_reg = RegInit(0.U(KEY_SIZE.W))

    // key inputdata read logic
    key_inputdata_reg := io.key_io.key
    
    // output wire connection
    io.bus.in.valid  := true.B // always valid
    io.bus.in.rdata  := key_inputdata_reg
}