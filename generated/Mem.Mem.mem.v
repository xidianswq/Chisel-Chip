module BindsTo_0_Mem(
  input         clock,
  input         reset,
  input  [31:0] io_instmem_addr,
  output [31:0] io_instmem_inst,
  input  [31:0] io_datamem_addr,
  output [31:0] io_datamem_rdata,
  input         io_datamem_wen,
  input  [31:0] io_datamem_wdata
);

initial begin
  $readmemh("src/main/resources/test.hex", Mem.mem);
end
                      endmodule

bind Mem BindsTo_0_Mem BindsTo_0_Mem_Inst(.*);