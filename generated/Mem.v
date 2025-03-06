module Mem(
  input         clock,
  input         reset,
  input  [31:0] io_instmem_addr,
  output [31:0] io_instmem_inst,
  input  [31:0] io_datamem_addr,
  output [31:0] io_datamem_rdata,
  input         io_datamem_wen,
  input  [31:0] io_datamem_wdata
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:16383]; // @[Mem.scala 43:18]
  wire [7:0] mem_io_instmem_inst_hi_hi_data; // @[Mem.scala 43:18]
  wire [13:0] mem_io_instmem_inst_hi_hi_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_instmem_inst_hi_lo_data; // @[Mem.scala 43:18]
  wire [13:0] mem_io_instmem_inst_hi_lo_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_instmem_inst_lo_hi_data; // @[Mem.scala 43:18]
  wire [13:0] mem_io_instmem_inst_lo_hi_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_instmem_inst_lo_lo_data; // @[Mem.scala 43:18]
  wire [13:0] mem_io_instmem_inst_lo_lo_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_datamem_rdata_hi_hi_data; // @[Mem.scala 43:18]
  wire [13:0] mem_io_datamem_rdata_hi_hi_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_datamem_rdata_hi_lo_data; // @[Mem.scala 43:18]
  wire [13:0] mem_io_datamem_rdata_hi_lo_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_datamem_rdata_lo_hi_data; // @[Mem.scala 43:18]
  wire [13:0] mem_io_datamem_rdata_lo_hi_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_datamem_rdata_lo_lo_data; // @[Mem.scala 43:18]
  wire [13:0] mem_io_datamem_rdata_lo_lo_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_MPORT_data; // @[Mem.scala 43:18]
  wire [13:0] mem_MPORT_addr; // @[Mem.scala 43:18]
  wire  mem_MPORT_mask; // @[Mem.scala 43:18]
  wire  mem_MPORT_en; // @[Mem.scala 43:18]
  wire [7:0] mem_MPORT_1_data; // @[Mem.scala 43:18]
  wire [13:0] mem_MPORT_1_addr; // @[Mem.scala 43:18]
  wire  mem_MPORT_1_mask; // @[Mem.scala 43:18]
  wire  mem_MPORT_1_en; // @[Mem.scala 43:18]
  wire [7:0] mem_MPORT_2_data; // @[Mem.scala 43:18]
  wire [13:0] mem_MPORT_2_addr; // @[Mem.scala 43:18]
  wire  mem_MPORT_2_mask; // @[Mem.scala 43:18]
  wire  mem_MPORT_2_en; // @[Mem.scala 43:18]
  wire [7:0] mem_MPORT_3_data; // @[Mem.scala 43:18]
  wire [13:0] mem_MPORT_3_addr; // @[Mem.scala 43:18]
  wire  mem_MPORT_3_mask; // @[Mem.scala 43:18]
  wire  mem_MPORT_3_en; // @[Mem.scala 43:18]
  wire [31:0] _io_instmem_inst_T_1 = io_instmem_addr + 32'h3; // @[Mem.scala 49:29]
  wire [31:0] _io_instmem_inst_T_4 = io_instmem_addr + 32'h2; // @[Mem.scala 50:29]
  wire [31:0] _io_instmem_inst_T_7 = io_instmem_addr + 32'h1; // @[Mem.scala 51:29]
  wire [15:0] io_instmem_inst_lo = {mem_io_instmem_inst_lo_hi_data,mem_io_instmem_inst_lo_lo_data}; // @[Cat.scala 30:58]
  wire [15:0] io_instmem_inst_hi = {mem_io_instmem_inst_hi_hi_data,mem_io_instmem_inst_hi_lo_data}; // @[Cat.scala 30:58]
  wire [31:0] _io_datamem_rdata_T_1 = io_datamem_addr + 32'h3; // @[Mem.scala 56:29]
  wire [31:0] _io_datamem_rdata_T_4 = io_datamem_addr + 32'h2; // @[Mem.scala 57:29]
  wire [31:0] _io_datamem_rdata_T_7 = io_datamem_addr + 32'h1; // @[Mem.scala 58:29]
  wire [15:0] io_datamem_rdata_lo = {mem_io_datamem_rdata_lo_hi_data,mem_io_datamem_rdata_lo_lo_data}; // @[Cat.scala 30:58]
  wire [15:0] io_datamem_rdata_hi = {mem_io_datamem_rdata_hi_hi_data,mem_io_datamem_rdata_hi_lo_data}; // @[Cat.scala 30:58]
  assign mem_io_instmem_inst_hi_hi_addr = _io_instmem_inst_T_1[13:0];
  assign mem_io_instmem_inst_hi_hi_data = mem[mem_io_instmem_inst_hi_hi_addr]; // @[Mem.scala 43:18]
  assign mem_io_instmem_inst_hi_lo_addr = _io_instmem_inst_T_4[13:0];
  assign mem_io_instmem_inst_hi_lo_data = mem[mem_io_instmem_inst_hi_lo_addr]; // @[Mem.scala 43:18]
  assign mem_io_instmem_inst_lo_hi_addr = _io_instmem_inst_T_7[13:0];
  assign mem_io_instmem_inst_lo_hi_data = mem[mem_io_instmem_inst_lo_hi_addr]; // @[Mem.scala 43:18]
  assign mem_io_instmem_inst_lo_lo_addr = io_instmem_addr[13:0];
  assign mem_io_instmem_inst_lo_lo_data = mem[mem_io_instmem_inst_lo_lo_addr]; // @[Mem.scala 43:18]
  assign mem_io_datamem_rdata_hi_hi_addr = _io_datamem_rdata_T_1[13:0];
  assign mem_io_datamem_rdata_hi_hi_data = mem[mem_io_datamem_rdata_hi_hi_addr]; // @[Mem.scala 43:18]
  assign mem_io_datamem_rdata_hi_lo_addr = _io_datamem_rdata_T_4[13:0];
  assign mem_io_datamem_rdata_hi_lo_data = mem[mem_io_datamem_rdata_hi_lo_addr]; // @[Mem.scala 43:18]
  assign mem_io_datamem_rdata_lo_hi_addr = _io_datamem_rdata_T_7[13:0];
  assign mem_io_datamem_rdata_lo_hi_data = mem[mem_io_datamem_rdata_lo_hi_addr]; // @[Mem.scala 43:18]
  assign mem_io_datamem_rdata_lo_lo_addr = io_datamem_addr[13:0];
  assign mem_io_datamem_rdata_lo_lo_data = mem[mem_io_datamem_rdata_lo_lo_addr]; // @[Mem.scala 43:18]
  assign mem_MPORT_data = io_datamem_wdata[7:0];
  assign mem_MPORT_addr = io_datamem_addr[13:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_datamem_wen;
  assign mem_MPORT_1_data = io_datamem_wdata[15:8];
  assign mem_MPORT_1_addr = _io_datamem_rdata_T_7[13:0];
  assign mem_MPORT_1_mask = 1'h1;
  assign mem_MPORT_1_en = io_datamem_wen;
  assign mem_MPORT_2_data = io_datamem_wdata[23:16];
  assign mem_MPORT_2_addr = _io_datamem_rdata_T_4[13:0];
  assign mem_MPORT_2_mask = 1'h1;
  assign mem_MPORT_2_en = io_datamem_wen;
  assign mem_MPORT_3_data = io_datamem_wdata[31:24];
  assign mem_MPORT_3_addr = _io_datamem_rdata_T_1[13:0];
  assign mem_MPORT_3_mask = 1'h1;
  assign mem_MPORT_3_en = io_datamem_wen;
  assign io_instmem_inst = {io_instmem_inst_hi,io_instmem_inst_lo}; // @[Cat.scala 30:58]
  assign io_datamem_rdata = {io_datamem_rdata_hi,io_datamem_rdata_lo}; // @[Cat.scala 30:58]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[Mem.scala 43:18]
    end
    if(mem_MPORT_1_en & mem_MPORT_1_mask) begin
      mem[mem_MPORT_1_addr] <= mem_MPORT_1_data; // @[Mem.scala 43:18]
    end
    if(mem_MPORT_2_en & mem_MPORT_2_mask) begin
      mem[mem_MPORT_2_addr] <= mem_MPORT_2_data; // @[Mem.scala 43:18]
    end
    if(mem_MPORT_3_en & mem_MPORT_3_mask) begin
      mem[mem_MPORT_3_addr] <= mem_MPORT_3_data; // @[Mem.scala 43:18]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16384; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
