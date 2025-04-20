package pipeline_advance_riscv_tests

import chisel3._
import chisel3.util._
import pipeline_advance_riscv_tests.Consts._
import pipeline_advance_riscv_tests.Instructions._


class Top extends Module{
    val io = IO(new Bundle{
        val exit = Output(Bool())
        val gp   = Output(UInt(WORD_LEN.W))
        val pred_flag = Output(Bool())
        val miss_flag = Output(Bool())
    })

    // core module
    val memory  = Module(new Memory)
    val pc      = Module(new PC)
    val bp      = Module(new BP)
    val id      = Module(new ID)
    val stall   = Module(new Stall)
    val ex      = Module(new EX)
    val mem     = Module(new MEM)
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
    pc.io.in.stall_in   <> stall.io.out        // no pipeline register to pc
    pc.io.in.ex_in      <> ex.io.out    
    pc.io.instmem       <> memory.io.instmem
    pc.io.in.bp_in      <> bp.io.out

    bp.io.in.pc_in      <> pc.io.out
    bp.io.in.ex_pc_in   <> if_io_reg_n.io.out
        if_io_reg_n.io.in   <> if_io_reg.io.out
    bp.io.in.ex_in      <> ex.io.out
    

    stall.io.in.if_in   <> if_io_reg.io.out     // data hazard stall flag
        if_io_reg.io.in <> pc.io.out
    stall.io.in.id_reg_in   <> id_io_reg.io.out
        id_io_reg.io.in     <> id.io.out

    if_io_reg.io.stall_in   <> stall.io.out

    id.io.in.if_in      <> if_io_reg.io.out
        if_io_reg.io.in     <> pc.io.out
    id.io.in.stall_in   <> stall.io.out     
    id.io.in.wb_in      <> wb.io.out             // no pipeline register
    id.io.in.mem_in     <> mem.io.out            // direct connect
    
    ex.io.in.id_in      <> id_io_reg.io.out
        id_io_reg.io.in <> id.io.out
    ex.io.in.if_in      <> if_io_reg_n.io.out

    mem.io.in.if_in     <> if_io_reg_nn.io.out
        if_io_reg_nn.io.in  <> if_io_reg_n.io.out
    mem.io.in.id_in     <> id_io_reg_n.io.out
        id_io_reg_n.io.in   <> id_io_reg.io.out
    mem.io.in.ex_in     <> ex_io_reg.io.out
        ex_io_reg.io.in <> ex.io.out
    mem.io.datamem      <> memory.io.datamem
    
    wb.io.in.mem_in     <> mem_io_reg.io.out
        mem_io_reg.io.in    <> mem.io.out

    val inst    = pc.io.out.inst
    val reg_pc  = pc.io.out.reg_pc
    io.exit := MuxCase(false.asBool, Seq(
        (inst   === UNIMP)      -> true.asBool,
        (inst   === EXIT_INST)  -> true.asBool,
        //(reg_pc === EXIT_PC)    -> true.asBool
    ))
    io.gp := id.io.gp
    io.pred_flag := stall.io.out.pred_flag
    io.miss_flag := stall.io.out.pred_miss_flag
}

object TopOption extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new Top(), Array("--target-dir", "generated/pipeline_advance_riscv_tests/Top"))
}
