module Top(
  input         clk_in,
  input         reset,
  output [31:0] io_globalpointer,
  output        io_exit
);
  wire  core_clock; // @[Top.scala 13:22]
  wire  core_reset; // @[Top.scala 13:22]
  wire [31:0] core_io_instmem_addr; // @[Top.scala 13:22]
  wire [31:0] core_io_instmem_inst; // @[Top.scala 13:22]
  wire [31:0] core_io_datamem_addr; // @[Top.scala 13:22]
  wire [31:0] core_io_datamem_rdata; // @[Top.scala 13:22]
  wire  core_io_datamem_wen; // @[Top.scala 13:22]
  wire [31:0] core_io_datamem_wdata; // @[Top.scala 13:22]
  wire [31:0] core_io_globalpointer; // @[Top.scala 13:22]
  wire  core_io_exit; // @[Top.scala 13:22]
  wire  instmem_clock; // @[Top.scala 14:25]
  wire [31:0] instmem_io_instmem_addr; // @[Top.scala 14:25]
  wire [31:0] instmem_io_instmem_inst; // @[Top.scala 14:25]
  wire [31:0] instmem_io_datamem_addr; // @[Top.scala 14:25]
  wire [31:0] instmem_io_datamem_rdata; // @[Top.scala 14:25]
  wire  instmem_io_datamem_wen; // @[Top.scala 14:25]
  wire [31:0] instmem_io_datamem_wdata; // @[Top.scala 14:25]
  Core core ( // @[Top.scala 13:22]
    .clock(core_clock),
    .reset(core_reset),
    .io_instmem_addr(core_io_instmem_addr),
    .io_instmem_inst(core_io_instmem_inst),
    .io_datamem_addr(core_io_datamem_addr),
    .io_datamem_rdata(core_io_datamem_rdata),
    .io_datamem_wen(core_io_datamem_wen),
    .io_datamem_wdata(core_io_datamem_wdata),
    .io_globalpointer(core_io_globalpointer),
    .io_exit(core_io_exit)
  );
  Mem instmem ( // @[Top.scala 14:25]
    .clock(instmem_clock),
    .io_instmem_addr(instmem_io_instmem_addr),
    .io_instmem_inst(instmem_io_instmem_inst),
    .io_datamem_addr(instmem_io_datamem_addr),
    .io_datamem_rdata(instmem_io_datamem_rdata),
    .io_datamem_wen(instmem_io_datamem_wen),
    .io_datamem_wdata(instmem_io_datamem_wdata)
  );
clk_pll clk_pll_inst
  (
  // Clock out ports  
  .clk_out(clock),
 // Clock in ports
  .clk_in(clk_in)
  );
  assign io_globalpointer = core_io_globalpointer; // @[Top.scala 18:22]
  assign io_exit = core_io_exit; // @[Top.scala 19:13]
  assign core_clock = clock;
  assign core_reset = reset;
  assign core_io_instmem_inst = instmem_io_instmem_inst; // @[Top.scala 16:21]
  assign core_io_datamem_rdata = instmem_io_datamem_rdata; // @[Top.scala 17:21]
  assign instmem_clock = clock;
  assign instmem_io_instmem_addr = core_io_instmem_addr; // @[Top.scala 16:21]
  assign instmem_io_datamem_addr = core_io_datamem_addr; // @[Top.scala 17:21]
  assign instmem_io_datamem_wen = core_io_datamem_wen; // @[Top.scala 17:21]
  assign instmem_io_datamem_wdata = core_io_datamem_wdata; // @[Top.scala 17:21]
endmodule
