import chisel3._
import Chisel3.experimental._
//OK!

class MultiSelect extends Module{
    val io=IO(new Bundle{
        val in=Input(Vec(8,UInt(8.W)))
        val sel=Input(UInt(3.W))
        val out=Output(UInt(8.W))
    })
    io.out:=io.in(io.sel)
}