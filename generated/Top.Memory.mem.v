module BindsTo_0_Memory(
  input         clock,
  input  [31:0] io_instmem_addr,
  output [31:0] io_instmem_inst,
  input  [31:0] io_datamem_addr,
  output [31:0] io_datamem_rdata,
  input         io_datamem_wen,
  input  [31:0] io_datamem_wdata
);

initial begin
  $readmemh("src/main/resources/CPU/test.hex", Memory.mem);
end
                      endmodule

bind Memory BindsTo_0_Memory BindsTo_0_Memory_Inst(.*);