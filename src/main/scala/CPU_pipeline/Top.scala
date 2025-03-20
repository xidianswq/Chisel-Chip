package cpu_pipeline

import chisel3._
import chisel3.util._
import public.Consts._
import public.Instructions._


class Top extends Module{
    val io = IO(new Bundle{
        val exit = Output(Bool())
    })

    //core module
    val memory = Module(new Memory)
    val pc = Module(new PC)
    val id = Module(new ID)
    val alu = Module(new ALU)
    val br = Module(new BR)
    val mem = Module(new MEM)
    val wb = Module(new WB)

    //pipeline register
    val if_io_reg = Module(new PC_IO_REG)
    val if_io_reg_n = Module(new PC_IO_REG)
    val if_io_reg_nn = Module(new PC_IO_REG)
    val id_io_reg = Module(new ID_IO_REG)
    val id_io_reg_n = Module(new ID_IO_REG)
    val ex_io_reg = Module(new ALU_IO_REG)
    val mem_io_reg = Module(new WB_IO_REG)


    //connect modules and pipeline registers
    pc.io.in.ex_in     <> alu.io.out
    pc.io.in.br_in     <> br.io.out
    pc.io.instmem   <> memory.io.instmem

    id.io.in.if_in     <> if_io_reg.io.out
        if_io_reg.io.in     <> pc.io.out
    id.io.in.wb_in     <> wb.io.out //no pipeline register
    
    alu.io.in.id_in    <> id_io_reg.io.out
        id_io_reg.io.in     <> id.io.out
    
    br.io.in.if_in     <> if_io_reg_n.io.out
        if_io_reg_n.io.in   <> if_io_reg.io.out
        if_io_reg.io.in     <> pc.io.out
    br.io.in.id_in     <> id_io_reg.io.out
        id_io_reg.io.in     <> id.io.out
    
    mem.io.in.if_in    <> if_io_reg_nn.io.out
        if_io_reg_nn.io.in  <> if_io_reg_n.io.out
        if_io_reg_n.io.in   <> if_io_reg.io.out
        if_io_reg.io.in     <> pc.io.out
    mem.io.in.id_in    <> id_io_reg_n.io.out
        id_io_reg_n.io.in   <> id_io_reg.io.out
        id_io_reg.io.in     <> id.io.out
    mem.io.in.ex_in    <> ex_io_reg.io.out
        ex_io_reg.io.in     <> alu.io.out
    mem.io.datamem  <> memory.io.datamem
    
    wb.io.in.mem_in    <> mem_io_reg.io.out
        mem_io_reg.io.in    <> mem.io.out

    val inst = pc.io.out.inst
    val reg_pc = pc.io.out.reg_pc
    io.exit := MuxCase(false.asBool, Seq(
        (inst === UNIMP) -> true.asBool,
        (inst === EXIT_INST) -> true.asBool,
        (reg_pc === EXIT_PC) -> true.asBool
    ))
    printf("------------------------END-----------------------\n")
    printf(p"exit: ${io.exit}\n")
    printf("\n")
    
}

object TopOption extends App {
    (new chisel3.stage.ChiselStage).emitVerilog(new Top(), Array("--target-dir", "generated"))
}
