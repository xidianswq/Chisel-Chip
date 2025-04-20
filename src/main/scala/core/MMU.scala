package score

import chisel3._
import chisel3.util._
import public.PConsts._
import soc.DConsts._
import peripheral._

class MMU_IO extends Bundle {
    val apb_bus = new APB_BUS()
}

/*
type: Hardware
name: Memory Management Unit(内存管理单元)
note: MMU is used to access SRAM and APB peripherals
*/
class MMU extends Module {
    val io = IO(new Bundle {
        val mem_io  = new DataMem_IO()
        val datamem = Flipped(new DataMem_IO())
        val out     = new MMU_IO()
    })

    // input wire connection & variable declaration
    val addr  = io.mem_io.addr
    val wen   = io.mem_io.wen
    val wdata = io.mem_io.wdata
    val rdata = Wire(UInt(WORD_LEN.W))
    val datamem_addr    = addr
    val datamem_wen     = Wire(Bool())
    val datamem_wdata   = wdata
    val datamem_rdata   = io.datamem.rdata
    val APB_addr    = addr
    val APB_wen     = Wire(Bool())
    val APB_wdata   = wdata
    val APB_valid   = io.out.apb_bus.valid
    val APB_rdata   = io.out.apb_bus.rdata

    // MMU logic
    when(addr >= SRAM_BASE && addr < (SRAM_BASE + SRAM_SIZE)) {
        // SRAM access
        datamem_wen := wen
        APB_wen     := false.B
        rdata       := datamem_rdata
    } .elsewhen(addr >= APB1PERIPH_BASE && addr < (APB1PERIPH_BASE + PERIPH_SIZE)) {
        // APB1 peripheral access
        datamem_wen := false.B
        APB_wen     := wen
        when(APB_valid) {
            rdata   := APB_rdata
        } .otherwise {
            rdata   := 0.U
        }
    } .otherwise {
        // Invalid address, do nothing or raise an error
        datamem_wen := false.B
        APB_wen     := false.B
        rdata       := 0.U // default value for invalid access
    }

    // output wire connection
    io.datamem.addr     := datamem_addr
    io.datamem.wen      := datamem_wen
    io.datamem.wdata    := datamem_wdata

    io.out.apb_bus.addr := APB_addr
    io.out.apb_bus.wen  := APB_wen
    io.out.apb_bus.wdata := APB_wdata

    io.mem_io.rdata     := rdata
}

