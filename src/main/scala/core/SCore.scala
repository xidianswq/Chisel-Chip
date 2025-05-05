package score

import chisel3._
import chisel3.util._
import public.PConsts._
import public.Instructions._
import peripheral._


class SCore extends Module{
    val io = IO(new Bundle{
        val bus  = new MMU_IO()
        val exit = Output(Bool())
    })

    // core module
    val memory  = Module(new Memory)
    val pc      = Module(new PC)
    val bp      = Module(new BP)
    val id      = Module(new ID)
    val stall   = Module(new Stall)
    val ex      = Module(new EX)
    val mem     = Module(new MEM)
    val mmu     = Module(new MMU)
    val wb      = Module(new WB)

    // pipeline register
    val if_io_reg       = Module(new PC_BUBBLE_REG)
    val if_io_reg_n     = Module(new PC_IO_REG)
    val if_io_reg_nn    = Module(new PC_IO_REG)
    val id_io_reg       = Module(new ID_IO_REG)
    val id_io_reg_n     = Module(new ID_IO_REG)
    val ex_io_reg       = Module(new EX_IO_REG)
    val mem_io_reg      = Module(new WB_IO_REG)


    // connect modules and pipeline registers
    pc.io.in.stall_io   <> stall.io.out        // no pipeline register to pc
    pc.io.in.ex_io      <> ex.io.out    
    pc.io.instmem       <> memory.io.instmem
    pc.io.in.bp_io      <> bp.io.out

    bp.io.in.pc_io      <> pc.io.out
    bp.io.in.ex_pc_io   <> if_io_reg_n.io.out
        if_io_reg_n.io.in   <> if_io_reg.io.out
    bp.io.in.ex_io      <> ex.io.out
    

    stall.io.in.if_io   <> if_io_reg.io.out     // data hazard stall flag
        if_io_reg.io.in <> pc.io.out
    stall.io.in.id_reg_io   <> id_io_reg.io.out
        id_io_reg.io.in     <> id.io.out

    if_io_reg.io.stall_io   <> stall.io.out

    id.io.in.if_io      <> if_io_reg.io.out
        if_io_reg.io.in     <> pc.io.out
    id.io.in.stall_io   <> stall.io.out     
    id.io.in.wb_io      <> wb.io.out             // no pipeline register
    id.io.in.mem_io     <> mem.io.out            // direct connect
    
    ex.io.in.id_io      <> id_io_reg.io.out
        id_io_reg.io.in <> id.io.out
    ex.io.in.if_io      <> if_io_reg_n.io.out

    mem.io.in.if_io     <> if_io_reg_nn.io.out
        if_io_reg_nn.io.in  <> if_io_reg_n.io.out
    mem.io.in.id_io     <> id_io_reg_n.io.out
        id_io_reg_n.io.in   <> id_io_reg.io.out
    mem.io.in.ex_io     <> ex_io_reg.io.out
        ex_io_reg.io.in <> ex.io.out

    mmu.io.mem_io       <> mem.io.mmu
    mmu.io.datamem      <> memory.io.datamem

    wb.io.in.mem_io     <> mem_io_reg.io.out
        mem_io_reg.io.in    <> mem.io.out

    val inst    = if_io_reg_nn.io.out.inst
    val reg_pc  = if_io_reg_nn.io.out.reg_pc
    io.exit := MuxCase(false.asBool, Seq(
        (inst   === UNIMP)      -> true.asBool,
        //(reg_pc === EXIT_PC)    -> true.asBool,
        //(inst   === EXIT_INST)  -> true.asBool,
    ))
    io.bus <> mmu.io.mmu_io
}

object TopOption extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new SCore(), Array("--target-dir", "generated/score/SCore"))
}
