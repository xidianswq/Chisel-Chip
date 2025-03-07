module Core(
  input         clock,
  input         reset,
  output [31:0] io_instmem_addr,
  input  [31:0] io_instmem_inst,
  output [31:0] io_datamem_addr,
  input  [31:0] io_datamem_rdata,
  output        io_datamem_wen,
  output [31:0] io_datamem_wdata,
  output [31:0] io_globalpointer,
  output        io_exit
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] reg_x [0:31]; // @[Core.scala 17:20]
  wire [31:0] reg_x_rs1_data_MPORT_data; // @[Core.scala 17:20]
  wire [4:0] reg_x_rs1_data_MPORT_addr; // @[Core.scala 17:20]
  wire [31:0] reg_x_rs2_data_MPORT_data; // @[Core.scala 17:20]
  wire [4:0] reg_x_rs2_data_MPORT_addr; // @[Core.scala 17:20]
  wire [31:0] reg_x_io_globalpointer_MPORT_data; // @[Core.scala 17:20]
  wire [4:0] reg_x_io_globalpointer_MPORT_addr; // @[Core.scala 17:20]
  wire [31:0] reg_x_MPORT_2_data; // @[Core.scala 17:20]
  wire [4:0] reg_x_MPORT_2_addr; // @[Core.scala 17:20]
  wire [31:0] reg_x_MPORT_1_data; // @[Core.scala 17:20]
  wire [4:0] reg_x_MPORT_1_addr; // @[Core.scala 17:20]
  wire  reg_x_MPORT_1_mask; // @[Core.scala 17:20]
  wire  reg_x_MPORT_1_en; // @[Core.scala 17:20]
  reg [31:0] reg_csr [0:1023]; // @[Core.scala 19:22]
  wire [31:0] reg_csr_reg_pc_next_MPORT_data; // @[Core.scala 19:22]
  wire [9:0] reg_csr_reg_pc_next_MPORT_addr; // @[Core.scala 19:22]
  wire [31:0] reg_csr_csr_rdata_data; // @[Core.scala 19:22]
  wire [9:0] reg_csr_csr_rdata_addr; // @[Core.scala 19:22]
  wire [31:0] reg_csr_MPORT_data; // @[Core.scala 19:22]
  wire [9:0] reg_csr_MPORT_addr; // @[Core.scala 19:22]
  wire  reg_csr_MPORT_mask; // @[Core.scala 19:22]
  wire  reg_csr_MPORT_en; // @[Core.scala 19:22]
  reg [31:0] reg_pc; // @[Core.scala 18:25]
  wire [31:0] reg_pc_next_default = reg_pc + 32'h4; // @[Core.scala 33:38]
  wire  _reg_pc_next_T_1 = 32'h73 == io_instmem_inst; // @[Core.scala 37:15]
  wire [31:0] _inst_type_T = io_instmem_inst & 32'h707f; // @[Lookup.scala 31:38]
  wire  _inst_type_T_1 = 32'h2003 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_3 = 32'h2023 == _inst_type_T; // @[Lookup.scala 31:38]
  wire [31:0] _inst_type_T_4 = io_instmem_inst & 32'hfe00707f; // @[Lookup.scala 31:38]
  wire  _inst_type_T_5 = 32'h33 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_7 = 32'h13 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_9 = 32'h40000033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_11 = 32'h7033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_13 = 32'h6033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_15 = 32'h4033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_17 = 32'h7013 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_19 = 32'h6013 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_21 = 32'h4013 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_23 = 32'h1033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_25 = 32'h5033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_27 = 32'h40005033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_29 = 32'h1013 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_31 = 32'h5013 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_33 = 32'h40005013 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_35 = 32'h2033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_37 = 32'h3033 == _inst_type_T_4; // @[Lookup.scala 31:38]
  wire  _inst_type_T_39 = 32'h2013 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_41 = 32'h3013 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_43 = 32'h63 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_45 = 32'h1063 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_47 = 32'h5063 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_49 = 32'h7063 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_51 = 32'h4063 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_53 = 32'h6063 == _inst_type_T; // @[Lookup.scala 31:38]
  wire [31:0] _inst_type_T_54 = io_instmem_inst & 32'h7f; // @[Lookup.scala 31:38]
  wire  _inst_type_T_55 = 32'h6f == _inst_type_T_54; // @[Lookup.scala 31:38]
  wire  _inst_type_T_57 = 32'h67 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_59 = 32'h37 == _inst_type_T_54; // @[Lookup.scala 31:38]
  wire  _inst_type_T_61 = 32'h17 == _inst_type_T_54; // @[Lookup.scala 31:38]
  wire  _inst_type_T_63 = 32'h1073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_65 = 32'h5073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_67 = 32'h2073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_69 = 32'h6073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_71 = 32'h3073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire  _inst_type_T_73 = 32'h7073 == _inst_type_T; // @[Lookup.scala 31:38]
  wire [2:0] _inst_type_T_262 = _inst_type_T_73 ? 3'h3 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_263 = _inst_type_T_71 ? 3'h3 : _inst_type_T_262; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_264 = _inst_type_T_69 ? 3'h3 : _inst_type_T_263; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_265 = _inst_type_T_67 ? 3'h3 : _inst_type_T_264; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_266 = _inst_type_T_65 ? 3'h3 : _inst_type_T_265; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_267 = _inst_type_T_63 ? 3'h3 : _inst_type_T_266; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_268 = _inst_type_T_61 ? 3'h0 : _inst_type_T_267; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_269 = _inst_type_T_59 ? 3'h0 : _inst_type_T_268; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_270 = _inst_type_T_57 ? 3'h2 : _inst_type_T_269; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_271 = _inst_type_T_55 ? 3'h2 : _inst_type_T_270; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_272 = _inst_type_T_53 ? 3'h0 : _inst_type_T_271; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_273 = _inst_type_T_51 ? 3'h0 : _inst_type_T_272; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_274 = _inst_type_T_49 ? 3'h0 : _inst_type_T_273; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_275 = _inst_type_T_47 ? 3'h0 : _inst_type_T_274; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_276 = _inst_type_T_45 ? 3'h0 : _inst_type_T_275; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_277 = _inst_type_T_43 ? 3'h0 : _inst_type_T_276; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_278 = _inst_type_T_41 ? 3'h0 : _inst_type_T_277; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_279 = _inst_type_T_39 ? 3'h0 : _inst_type_T_278; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_280 = _inst_type_T_37 ? 3'h0 : _inst_type_T_279; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_281 = _inst_type_T_35 ? 3'h0 : _inst_type_T_280; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_282 = _inst_type_T_33 ? 3'h0 : _inst_type_T_281; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_283 = _inst_type_T_31 ? 3'h0 : _inst_type_T_282; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_284 = _inst_type_T_29 ? 3'h0 : _inst_type_T_283; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_285 = _inst_type_T_27 ? 3'h0 : _inst_type_T_284; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_286 = _inst_type_T_25 ? 3'h0 : _inst_type_T_285; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_287 = _inst_type_T_23 ? 3'h0 : _inst_type_T_286; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_288 = _inst_type_T_21 ? 3'h0 : _inst_type_T_287; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_289 = _inst_type_T_19 ? 3'h0 : _inst_type_T_288; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_290 = _inst_type_T_17 ? 3'h0 : _inst_type_T_289; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_291 = _inst_type_T_15 ? 3'h0 : _inst_type_T_290; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_292 = _inst_type_T_13 ? 3'h0 : _inst_type_T_291; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_293 = _inst_type_T_11 ? 3'h0 : _inst_type_T_292; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_294 = _inst_type_T_9 ? 3'h0 : _inst_type_T_293; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_295 = _inst_type_T_7 ? 3'h0 : _inst_type_T_294; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_296 = _inst_type_T_5 ? 3'h0 : _inst_type_T_295; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_297 = _inst_type_T_3 ? 3'h0 : _inst_type_T_296; // @[Lookup.scala 33:37]
  wire [2:0] inst_type_5 = _inst_type_T_1 ? 3'h1 : _inst_type_T_297; // @[Lookup.scala 33:37]
  wire  jump_flag = inst_type_5 == 3'h2; // @[Core.scala 153:26]
  wire [4:0] _inst_type_T_77 = _inst_type_T_73 ? 5'h12 : 5'h0; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_78 = _inst_type_T_71 ? 5'h12 : _inst_type_T_77; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_79 = _inst_type_T_69 ? 5'h12 : _inst_type_T_78; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_80 = _inst_type_T_67 ? 5'h12 : _inst_type_T_79; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_81 = _inst_type_T_65 ? 5'h12 : _inst_type_T_80; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_82 = _inst_type_T_63 ? 5'h12 : _inst_type_T_81; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_83 = _inst_type_T_61 ? 5'h1 : _inst_type_T_82; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_84 = _inst_type_T_59 ? 5'h1 : _inst_type_T_83; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_85 = _inst_type_T_57 ? 5'h11 : _inst_type_T_84; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_86 = _inst_type_T_55 ? 5'h1 : _inst_type_T_85; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_87 = _inst_type_T_53 ? 5'hf : _inst_type_T_86; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_88 = _inst_type_T_51 ? 5'hd : _inst_type_T_87; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_89 = _inst_type_T_49 ? 5'h10 : _inst_type_T_88; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_90 = _inst_type_T_47 ? 5'he : _inst_type_T_89; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_91 = _inst_type_T_45 ? 5'hc : _inst_type_T_90; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_92 = _inst_type_T_43 ? 5'hb : _inst_type_T_91; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_93 = _inst_type_T_41 ? 5'ha : _inst_type_T_92; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_94 = _inst_type_T_39 ? 5'h9 : _inst_type_T_93; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_95 = _inst_type_T_37 ? 5'ha : _inst_type_T_94; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_96 = _inst_type_T_35 ? 5'h9 : _inst_type_T_95; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_97 = _inst_type_T_33 ? 5'h8 : _inst_type_T_96; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_98 = _inst_type_T_31 ? 5'h7 : _inst_type_T_97; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_99 = _inst_type_T_29 ? 5'h6 : _inst_type_T_98; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_100 = _inst_type_T_27 ? 5'h8 : _inst_type_T_99; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_101 = _inst_type_T_25 ? 5'h7 : _inst_type_T_100; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_102 = _inst_type_T_23 ? 5'h6 : _inst_type_T_101; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_103 = _inst_type_T_21 ? 5'h5 : _inst_type_T_102; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_104 = _inst_type_T_19 ? 5'h4 : _inst_type_T_103; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_105 = _inst_type_T_17 ? 5'h3 : _inst_type_T_104; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_106 = _inst_type_T_15 ? 5'h5 : _inst_type_T_105; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_107 = _inst_type_T_13 ? 5'h4 : _inst_type_T_106; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_108 = _inst_type_T_11 ? 5'h3 : _inst_type_T_107; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_109 = _inst_type_T_9 ? 5'h2 : _inst_type_T_108; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_110 = _inst_type_T_7 ? 5'h1 : _inst_type_T_109; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_111 = _inst_type_T_5 ? 5'h1 : _inst_type_T_110; // @[Lookup.scala 33:37]
  wire [4:0] _inst_type_T_112 = _inst_type_T_3 ? 5'h1 : _inst_type_T_111; // @[Lookup.scala 33:37]
  wire [4:0] exe_fun = _inst_type_T_1 ? 5'h1 : _inst_type_T_112; // @[Lookup.scala 33:37]
  wire  _alu_out_T = exe_fun == 5'h1; // @[Core.scala 127:18]
  wire [1:0] _inst_type_T_113 = _reg_pc_next_T_1 ? 2'h2 : 2'h0; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_114 = _inst_type_T_73 ? 2'h3 : _inst_type_T_113; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_115 = _inst_type_T_71 ? 2'h0 : _inst_type_T_114; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_116 = _inst_type_T_69 ? 2'h3 : _inst_type_T_115; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_117 = _inst_type_T_67 ? 2'h0 : _inst_type_T_116; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_118 = _inst_type_T_65 ? 2'h3 : _inst_type_T_117; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_119 = _inst_type_T_63 ? 2'h0 : _inst_type_T_118; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_120 = _inst_type_T_61 ? 2'h1 : _inst_type_T_119; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_121 = _inst_type_T_59 ? 2'h2 : _inst_type_T_120; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_122 = _inst_type_T_57 ? 2'h0 : _inst_type_T_121; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_123 = _inst_type_T_55 ? 2'h1 : _inst_type_T_122; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_124 = _inst_type_T_53 ? 2'h0 : _inst_type_T_123; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_125 = _inst_type_T_51 ? 2'h0 : _inst_type_T_124; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_126 = _inst_type_T_49 ? 2'h0 : _inst_type_T_125; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_127 = _inst_type_T_47 ? 2'h0 : _inst_type_T_126; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_128 = _inst_type_T_45 ? 2'h0 : _inst_type_T_127; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_129 = _inst_type_T_43 ? 2'h0 : _inst_type_T_128; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_130 = _inst_type_T_41 ? 2'h0 : _inst_type_T_129; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_131 = _inst_type_T_39 ? 2'h0 : _inst_type_T_130; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_132 = _inst_type_T_37 ? 2'h0 : _inst_type_T_131; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_133 = _inst_type_T_35 ? 2'h0 : _inst_type_T_132; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_134 = _inst_type_T_33 ? 2'h0 : _inst_type_T_133; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_135 = _inst_type_T_31 ? 2'h0 : _inst_type_T_134; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_136 = _inst_type_T_29 ? 2'h0 : _inst_type_T_135; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_137 = _inst_type_T_27 ? 2'h0 : _inst_type_T_136; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_138 = _inst_type_T_25 ? 2'h0 : _inst_type_T_137; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_139 = _inst_type_T_23 ? 2'h0 : _inst_type_T_138; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_140 = _inst_type_T_21 ? 2'h0 : _inst_type_T_139; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_141 = _inst_type_T_19 ? 2'h0 : _inst_type_T_140; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_142 = _inst_type_T_17 ? 2'h0 : _inst_type_T_141; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_143 = _inst_type_T_15 ? 2'h0 : _inst_type_T_142; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_144 = _inst_type_T_13 ? 2'h0 : _inst_type_T_143; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_145 = _inst_type_T_11 ? 2'h0 : _inst_type_T_144; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_146 = _inst_type_T_9 ? 2'h0 : _inst_type_T_145; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_147 = _inst_type_T_7 ? 2'h0 : _inst_type_T_146; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_148 = _inst_type_T_5 ? 2'h0 : _inst_type_T_147; // @[Lookup.scala 33:37]
  wire [1:0] _inst_type_T_149 = _inst_type_T_3 ? 2'h0 : _inst_type_T_148; // @[Lookup.scala 33:37]
  wire [1:0] inst_type_1 = _inst_type_T_1 ? 2'h0 : _inst_type_T_149; // @[Lookup.scala 33:37]
  wire  _op1_data_T = inst_type_1 == 2'h0; // @[Core.scala 110:18]
  wire [4:0] rs1_addr = io_instmem_inst[19:15]; // @[Core.scala 44:24]
  wire [31:0] _GEN_10 = {{27'd0}, rs1_addr}; // @[Core.scala 48:34]
  wire [31:0] rs1_data = _GEN_10 != 32'h0 ? reg_x_rs1_data_MPORT_data : 32'h0; // @[Core.scala 48:23]
  wire  _op1_data_T_1 = inst_type_1 == 2'h1; // @[Core.scala 111:18]
  wire  _op1_data_T_2 = inst_type_1 == 2'h3; // @[Core.scala 112:18]
  wire [31:0] imm_z_uext = {27'h0,rs1_addr}; // @[Cat.scala 30:58]
  wire [31:0] _op1_data_T_3 = _op1_data_T_2 ? imm_z_uext : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _op1_data_T_4 = _op1_data_T_1 ? reg_pc : _op1_data_T_3; // @[Mux.scala 98:16]
  wire [31:0] op1_data = _op1_data_T ? rs1_data : _op1_data_T_4; // @[Mux.scala 98:16]
  wire [2:0] _inst_type_T_150 = _reg_pc_next_T_1 ? 3'h0 : 3'h1; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_151 = _inst_type_T_73 ? 3'h0 : _inst_type_T_150; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_152 = _inst_type_T_71 ? 3'h0 : _inst_type_T_151; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_153 = _inst_type_T_69 ? 3'h0 : _inst_type_T_152; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_154 = _inst_type_T_67 ? 3'h0 : _inst_type_T_153; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_155 = _inst_type_T_65 ? 3'h0 : _inst_type_T_154; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_156 = _inst_type_T_63 ? 3'h0 : _inst_type_T_155; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_157 = _inst_type_T_61 ? 3'h5 : _inst_type_T_156; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_158 = _inst_type_T_59 ? 3'h5 : _inst_type_T_157; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_159 = _inst_type_T_57 ? 3'h2 : _inst_type_T_158; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_160 = _inst_type_T_55 ? 3'h4 : _inst_type_T_159; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_161 = _inst_type_T_53 ? 3'h1 : _inst_type_T_160; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_162 = _inst_type_T_51 ? 3'h1 : _inst_type_T_161; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_163 = _inst_type_T_49 ? 3'h1 : _inst_type_T_162; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_164 = _inst_type_T_47 ? 3'h1 : _inst_type_T_163; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_165 = _inst_type_T_45 ? 3'h1 : _inst_type_T_164; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_166 = _inst_type_T_43 ? 3'h1 : _inst_type_T_165; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_167 = _inst_type_T_41 ? 3'h2 : _inst_type_T_166; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_168 = _inst_type_T_39 ? 3'h2 : _inst_type_T_167; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_169 = _inst_type_T_37 ? 3'h1 : _inst_type_T_168; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_170 = _inst_type_T_35 ? 3'h1 : _inst_type_T_169; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_171 = _inst_type_T_33 ? 3'h2 : _inst_type_T_170; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_172 = _inst_type_T_31 ? 3'h2 : _inst_type_T_171; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_173 = _inst_type_T_29 ? 3'h2 : _inst_type_T_172; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_174 = _inst_type_T_27 ? 3'h1 : _inst_type_T_173; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_175 = _inst_type_T_25 ? 3'h1 : _inst_type_T_174; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_176 = _inst_type_T_23 ? 3'h1 : _inst_type_T_175; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_177 = _inst_type_T_21 ? 3'h2 : _inst_type_T_176; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_178 = _inst_type_T_19 ? 3'h2 : _inst_type_T_177; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_179 = _inst_type_T_17 ? 3'h2 : _inst_type_T_178; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_180 = _inst_type_T_15 ? 3'h1 : _inst_type_T_179; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_181 = _inst_type_T_13 ? 3'h1 : _inst_type_T_180; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_182 = _inst_type_T_11 ? 3'h1 : _inst_type_T_181; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_183 = _inst_type_T_9 ? 3'h1 : _inst_type_T_182; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_184 = _inst_type_T_7 ? 3'h2 : _inst_type_T_183; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_185 = _inst_type_T_5 ? 3'h1 : _inst_type_T_184; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_186 = _inst_type_T_3 ? 3'h3 : _inst_type_T_185; // @[Lookup.scala 33:37]
  wire [2:0] inst_type_2 = _inst_type_T_1 ? 3'h2 : _inst_type_T_186; // @[Lookup.scala 33:37]
  wire  _op2_data_T = inst_type_2 == 3'h1; // @[Core.scala 116:18]
  wire [4:0] rs2_addr = io_instmem_inst[24:20]; // @[Core.scala 45:24]
  wire [31:0] _GEN_11 = {{27'd0}, rs2_addr}; // @[Core.scala 49:34]
  wire [31:0] rs2_data = _GEN_11 != 32'h0 ? reg_x_rs2_data_MPORT_data : 32'h0; // @[Core.scala 49:23]
  wire  _op2_data_T_1 = inst_type_2 == 3'h2; // @[Core.scala 117:18]
  wire [11:0] imm_i = io_instmem_inst[31:20]; // @[Core.scala 51:24]
  wire [19:0] imm_i_sext_hi = imm_i[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_i_sext = {imm_i_sext_hi,imm_i}; // @[Cat.scala 30:58]
  wire  _op2_data_T_2 = inst_type_2 == 3'h3; // @[Core.scala 118:18]
  wire [6:0] imm_s_hi = io_instmem_inst[31:25]; // @[Core.scala 53:28]
  wire [4:0] imm_s_lo = io_instmem_inst[11:7]; // @[Core.scala 53:42]
  wire [11:0] imm_s = {imm_s_hi,imm_s_lo}; // @[Cat.scala 30:58]
  wire [19:0] imm_s_sext_hi = imm_s[11] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_s_sext = {imm_s_sext_hi,imm_s_hi,imm_s_lo}; // @[Cat.scala 30:58]
  wire  _op2_data_T_3 = inst_type_2 == 3'h4; // @[Core.scala 119:18]
  wire  imm_j_hi_hi = io_instmem_inst[31]; // @[Core.scala 57:25]
  wire [7:0] imm_j_hi_lo = io_instmem_inst[19:12]; // @[Core.scala 57:35]
  wire  imm_j_lo_hi = io_instmem_inst[20]; // @[Core.scala 57:49]
  wire [9:0] imm_j_lo_lo = io_instmem_inst[30:21]; // @[Core.scala 57:59]
  wire [19:0] imm_j = {imm_j_hi_hi,imm_j_hi_lo,imm_j_lo_hi,imm_j_lo_lo}; // @[Cat.scala 30:58]
  wire [10:0] imm_j_sext_hi_hi = imm_j[19] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_j_sext = {imm_j_sext_hi_hi,imm_j_hi_hi,imm_j_hi_lo,imm_j_lo_hi,imm_j_lo_lo,1'h0}; // @[Cat.scala 30:58]
  wire  _op2_data_T_4 = inst_type_2 == 3'h5; // @[Core.scala 120:18]
  wire [19:0] imm_u = io_instmem_inst[31:12]; // @[Core.scala 59:21]
  wire [31:0] imm_u_shifted = {imm_u,12'h0}; // @[Cat.scala 30:58]
  wire [31:0] _op2_data_T_5 = _op2_data_T_4 ? imm_u_shifted : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_6 = _op2_data_T_3 ? imm_j_sext : _op2_data_T_5; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_7 = _op2_data_T_2 ? imm_s_sext : _op2_data_T_6; // @[Mux.scala 98:16]
  wire [31:0] _op2_data_T_8 = _op2_data_T_1 ? imm_i_sext : _op2_data_T_7; // @[Mux.scala 98:16]
  wire [31:0] op2_data = _op2_data_T ? rs2_data : _op2_data_T_8; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_2 = op1_data + op2_data; // @[Core.scala 127:46]
  wire  _alu_out_T_3 = exe_fun == 5'h2; // @[Core.scala 128:18]
  wire [31:0] _alu_out_T_5 = op1_data - op2_data; // @[Core.scala 128:46]
  wire  _alu_out_T_6 = exe_fun == 5'h3; // @[Core.scala 129:18]
  wire [31:0] _alu_out_T_7 = op1_data & op2_data; // @[Core.scala 129:46]
  wire  _alu_out_T_8 = exe_fun == 5'h4; // @[Core.scala 130:18]
  wire [31:0] _alu_out_T_9 = op1_data | op2_data; // @[Core.scala 130:46]
  wire  _alu_out_T_10 = exe_fun == 5'h5; // @[Core.scala 131:18]
  wire [31:0] _alu_out_T_11 = op1_data ^ op2_data; // @[Core.scala 131:46]
  wire  _alu_out_T_12 = exe_fun == 5'h6; // @[Core.scala 132:18]
  wire [62:0] _GEN_12 = {{31'd0}, op1_data}; // @[Core.scala 132:46]
  wire [62:0] _alu_out_T_14 = _GEN_12 << op2_data[4:0]; // @[Core.scala 132:46]
  wire  _alu_out_T_16 = exe_fun == 5'h7; // @[Core.scala 133:18]
  wire [31:0] _alu_out_T_18 = op1_data >> op2_data[4:0]; // @[Core.scala 133:46]
  wire  _alu_out_T_19 = exe_fun == 5'h8; // @[Core.scala 134:18]
  wire [31:0] _alu_out_T_20 = _op1_data_T ? rs1_data : _op1_data_T_4; // @[Core.scala 134:52]
  wire [31:0] _alu_out_T_23 = $signed(_alu_out_T_20) >>> op2_data[4:0]; // @[Core.scala 134:80]
  wire  _alu_out_T_24 = exe_fun == 5'h9; // @[Core.scala 135:18]
  wire [31:0] _alu_out_T_26 = _op2_data_T ? rs2_data : _op2_data_T_8; // @[Core.scala 135:72]
  wire  _alu_out_T_27 = $signed(_alu_out_T_20) < $signed(_alu_out_T_26); // @[Core.scala 135:55]
  wire  _alu_out_T_28 = exe_fun == 5'ha; // @[Core.scala 136:18]
  wire  _alu_out_T_29 = op1_data < op2_data; // @[Core.scala 136:46]
  wire  _alu_out_T_30 = exe_fun == 5'h11; // @[Core.scala 137:18]
  wire [31:0] _alu_out_T_34 = _alu_out_T_2 & 32'hfffffffe; // @[Core.scala 137:59]
  wire  _alu_out_T_35 = exe_fun == 5'h12; // @[Core.scala 138:18]
  wire [31:0] _alu_out_T_36 = _alu_out_T_35 ? op1_data : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_37 = _alu_out_T_30 ? _alu_out_T_34 : _alu_out_T_36; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_38 = _alu_out_T_28 ? {{31'd0}, _alu_out_T_29} : _alu_out_T_37; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_39 = _alu_out_T_24 ? {{31'd0}, _alu_out_T_27} : _alu_out_T_38; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_40 = _alu_out_T_19 ? _alu_out_T_23 : _alu_out_T_39; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_41 = _alu_out_T_16 ? _alu_out_T_18 : _alu_out_T_40; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_42 = _alu_out_T_12 ? _alu_out_T_14[31:0] : _alu_out_T_41; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_43 = _alu_out_T_10 ? _alu_out_T_11 : _alu_out_T_42; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_44 = _alu_out_T_8 ? _alu_out_T_9 : _alu_out_T_43; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_45 = _alu_out_T_6 ? _alu_out_T_7 : _alu_out_T_44; // @[Mux.scala 98:16]
  wire [31:0] _alu_out_T_46 = _alu_out_T_3 ? _alu_out_T_5 : _alu_out_T_45; // @[Mux.scala 98:16]
  wire [31:0] alu_out = _alu_out_T ? _alu_out_T_2 : _alu_out_T_46; // @[Mux.scala 98:16]
  wire  _br_flag_T = exe_fun == 5'hb; // @[Core.scala 144:18]
  wire  _br_flag_T_1 = op1_data == op2_data; // @[Core.scala 144:45]
  wire  _br_flag_T_2 = exe_fun == 5'hc; // @[Core.scala 145:18]
  wire  _br_flag_T_4 = ~_br_flag_T_1; // @[Core.scala 145:34]
  wire  _br_flag_T_5 = exe_fun == 5'hd; // @[Core.scala 146:18]
  wire  _br_flag_T_9 = exe_fun == 5'he; // @[Core.scala 147:18]
  wire  _br_flag_T_13 = ~_alu_out_T_27; // @[Core.scala 147:34]
  wire  _br_flag_T_14 = exe_fun == 5'hf; // @[Core.scala 148:18]
  wire  _br_flag_T_16 = exe_fun == 5'h10; // @[Core.scala 149:18]
  wire  _br_flag_T_18 = ~_alu_out_T_29; // @[Core.scala 149:34]
  wire  _br_flag_T_20 = _br_flag_T_14 ? _alu_out_T_29 : _br_flag_T_16 & _br_flag_T_18; // @[Mux.scala 98:16]
  wire  _br_flag_T_21 = _br_flag_T_9 ? _br_flag_T_13 : _br_flag_T_20; // @[Mux.scala 98:16]
  wire  _br_flag_T_22 = _br_flag_T_5 ? _alu_out_T_27 : _br_flag_T_21; // @[Mux.scala 98:16]
  wire  _br_flag_T_23 = _br_flag_T_2 ? _br_flag_T_4 : _br_flag_T_22; // @[Mux.scala 98:16]
  wire  br_flag = _br_flag_T ? _br_flag_T_1 : _br_flag_T_23; // @[Mux.scala 98:16]
  wire  imm_b_hi_lo = io_instmem_inst[7]; // @[Core.scala 55:35]
  wire [5:0] imm_b_lo_hi = io_instmem_inst[30:25]; // @[Core.scala 55:44]
  wire [3:0] imm_b_lo_lo = io_instmem_inst[11:8]; // @[Core.scala 55:58]
  wire [11:0] imm_b = {imm_j_hi_hi,imm_b_hi_lo,imm_b_lo_hi,imm_b_lo_lo}; // @[Cat.scala 30:58]
  wire [18:0] imm_b_sext_hi_hi = imm_b[11] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire [31:0] imm_b_sext = {imm_b_sext_hi_hi,imm_j_hi_hi,imm_b_hi_lo,imm_b_lo_hi,imm_b_lo_lo,1'h0}; // @[Cat.scala 30:58]
  wire [31:0] br_target = reg_pc + imm_b_sext; // @[Core.scala 142:25]
  wire  _inst_type_T_235 = _inst_type_T_53 ? 1'h0 : _inst_type_T_55 | (_inst_type_T_57 | (_inst_type_T_59 | (
    _inst_type_T_61 | (_inst_type_T_63 | (_inst_type_T_65 | (_inst_type_T_67 | (_inst_type_T_69 | (_inst_type_T_71 |
    _inst_type_T_73)))))))); // @[Lookup.scala 33:37]
  wire  _inst_type_T_236 = _inst_type_T_51 ? 1'h0 : _inst_type_T_235; // @[Lookup.scala 33:37]
  wire  _inst_type_T_237 = _inst_type_T_49 ? 1'h0 : _inst_type_T_236; // @[Lookup.scala 33:37]
  wire  _inst_type_T_238 = _inst_type_T_47 ? 1'h0 : _inst_type_T_237; // @[Lookup.scala 33:37]
  wire  _inst_type_T_239 = _inst_type_T_45 ? 1'h0 : _inst_type_T_238; // @[Lookup.scala 33:37]
  wire  _inst_type_T_240 = _inst_type_T_43 ? 1'h0 : _inst_type_T_239; // @[Lookup.scala 33:37]
  wire  _inst_type_T_260 = _inst_type_T_3 ? 1'h0 : _inst_type_T_5 | (_inst_type_T_7 | (_inst_type_T_9 | (_inst_type_T_11
     | (_inst_type_T_13 | (_inst_type_T_15 | (_inst_type_T_17 | (_inst_type_T_19 | (_inst_type_T_21 | (_inst_type_T_23
     | (_inst_type_T_25 | (_inst_type_T_27 | (_inst_type_T_29 | (_inst_type_T_31 | (_inst_type_T_33 | (_inst_type_T_35
     | (_inst_type_T_37 | (_inst_type_T_39 | (_inst_type_T_41 | _inst_type_T_240)))))))))))))))))); // @[Lookup.scala 33:37]
  wire  inst_type_4 = _inst_type_T_1 | _inst_type_T_260; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_298 = _reg_pc_next_T_1 ? 3'h4 : 3'h0; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_299 = _inst_type_T_73 ? 3'h3 : _inst_type_T_298; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_300 = _inst_type_T_71 ? 3'h3 : _inst_type_T_299; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_301 = _inst_type_T_69 ? 3'h2 : _inst_type_T_300; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_302 = _inst_type_T_67 ? 3'h2 : _inst_type_T_301; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_303 = _inst_type_T_65 ? 3'h1 : _inst_type_T_302; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_304 = _inst_type_T_63 ? 3'h1 : _inst_type_T_303; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_305 = _inst_type_T_61 ? 3'h0 : _inst_type_T_304; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_306 = _inst_type_T_59 ? 3'h0 : _inst_type_T_305; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_307 = _inst_type_T_57 ? 3'h0 : _inst_type_T_306; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_308 = _inst_type_T_55 ? 3'h0 : _inst_type_T_307; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_309 = _inst_type_T_53 ? 3'h0 : _inst_type_T_308; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_310 = _inst_type_T_51 ? 3'h0 : _inst_type_T_309; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_311 = _inst_type_T_49 ? 3'h0 : _inst_type_T_310; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_312 = _inst_type_T_47 ? 3'h0 : _inst_type_T_311; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_313 = _inst_type_T_45 ? 3'h0 : _inst_type_T_312; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_314 = _inst_type_T_43 ? 3'h0 : _inst_type_T_313; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_315 = _inst_type_T_41 ? 3'h0 : _inst_type_T_314; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_316 = _inst_type_T_39 ? 3'h0 : _inst_type_T_315; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_317 = _inst_type_T_37 ? 3'h0 : _inst_type_T_316; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_318 = _inst_type_T_35 ? 3'h0 : _inst_type_T_317; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_319 = _inst_type_T_33 ? 3'h0 : _inst_type_T_318; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_320 = _inst_type_T_31 ? 3'h0 : _inst_type_T_319; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_321 = _inst_type_T_29 ? 3'h0 : _inst_type_T_320; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_322 = _inst_type_T_27 ? 3'h0 : _inst_type_T_321; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_323 = _inst_type_T_25 ? 3'h0 : _inst_type_T_322; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_324 = _inst_type_T_23 ? 3'h0 : _inst_type_T_323; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_325 = _inst_type_T_21 ? 3'h0 : _inst_type_T_324; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_326 = _inst_type_T_19 ? 3'h0 : _inst_type_T_325; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_327 = _inst_type_T_17 ? 3'h0 : _inst_type_T_326; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_328 = _inst_type_T_15 ? 3'h0 : _inst_type_T_327; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_329 = _inst_type_T_13 ? 3'h0 : _inst_type_T_328; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_330 = _inst_type_T_11 ? 3'h0 : _inst_type_T_329; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_331 = _inst_type_T_9 ? 3'h0 : _inst_type_T_330; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_332 = _inst_type_T_7 ? 3'h0 : _inst_type_T_331; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_333 = _inst_type_T_5 ? 3'h0 : _inst_type_T_332; // @[Lookup.scala 33:37]
  wire [2:0] _inst_type_T_334 = _inst_type_T_3 ? 3'h0 : _inst_type_T_333; // @[Lookup.scala 33:37]
  wire [2:0] csr_cmd = _inst_type_T_1 ? 3'h0 : _inst_type_T_334; // @[Lookup.scala 33:37]
  wire  _csr_addr_T = csr_cmd == 3'h4; // @[Core.scala 162:18]
  wire [11:0] csr_addr = _csr_addr_T ? 12'h342 : imm_i; // @[Mux.scala 98:16]
  wire  _csr_wdata_T = csr_cmd == 3'h1; // @[Core.scala 166:18]
  wire  _csr_wdata_T_1 = csr_cmd == 3'h2; // @[Core.scala 167:18]
  wire [31:0] _csr_wdata_T_2 = reg_csr_csr_rdata_data | op1_data; // @[Core.scala 167:43]
  wire  _csr_wdata_T_3 = csr_cmd == 3'h3; // @[Core.scala 168:18]
  wire [31:0] _csr_wdata_T_4 = ~op1_data; // @[Core.scala 168:45]
  wire [31:0] _csr_wdata_T_5 = reg_csr_csr_rdata_data & _csr_wdata_T_4; // @[Core.scala 168:43]
  wire [31:0] _csr_wdata_T_7 = _csr_addr_T ? 32'hb : 32'h0; // @[Mux.scala 98:16]
  wire [31:0] _csr_wdata_T_8 = _csr_wdata_T_3 ? _csr_wdata_T_5 : _csr_wdata_T_7; // @[Mux.scala 98:16]
  wire [31:0] _csr_wdata_T_9 = _csr_wdata_T_1 ? _csr_wdata_T_2 : _csr_wdata_T_8; // @[Mux.scala 98:16]
  wire [31:0] csr_wdata = _csr_wdata_T ? op1_data : _csr_wdata_T_9; // @[Mux.scala 98:16]
  wire  _rd_data_T = inst_type_5 == 3'h1; // @[Core.scala 178:17]
  wire  _rd_data_T_2 = inst_type_5 == 3'h3; // @[Core.scala 180:17]
  wire [31:0] _rd_data_T_3 = _rd_data_T_2 ? reg_csr_csr_rdata_data : alu_out; // @[Mux.scala 98:16]
  wire [31:0] _rd_data_T_4 = jump_flag ? reg_pc_next_default : _rd_data_T_3; // @[Mux.scala 98:16]
  wire [31:0] rd_data = _rd_data_T ? io_datamem_rdata : _rd_data_T_4; // @[Mux.scala 98:16]
  wire  _io_exit_T_1 = 32'hc0001073 == io_instmem_inst; // @[Core.scala 190:15]
  wire  _io_exit_T_2 = io_instmem_inst == 32'h0; // @[Core.scala 191:15]
  wire  _io_exit_T_3 = reg_pc == 32'h44; // @[Core.scala 192:17]
  wire  _T_4 = ~reset; // @[Core.scala 196:11]
  assign reg_x_rs1_data_MPORT_addr = io_instmem_inst[19:15];
  assign reg_x_rs1_data_MPORT_data = reg_x[reg_x_rs1_data_MPORT_addr]; // @[Core.scala 17:20]
  assign reg_x_rs2_data_MPORT_addr = io_instmem_inst[24:20];
  assign reg_x_rs2_data_MPORT_data = reg_x[reg_x_rs2_data_MPORT_addr]; // @[Core.scala 17:20]
  assign reg_x_io_globalpointer_MPORT_addr = 5'h3;
  assign reg_x_io_globalpointer_MPORT_data = reg_x[reg_x_io_globalpointer_MPORT_addr]; // @[Core.scala 17:20]
  assign reg_x_MPORT_2_addr = 5'h3;
  assign reg_x_MPORT_2_data = reg_x[reg_x_MPORT_2_addr]; // @[Core.scala 17:20]
  assign reg_x_MPORT_1_data = _rd_data_T ? io_datamem_rdata : _rd_data_T_4;
  assign reg_x_MPORT_1_addr = io_instmem_inst[11:7];
  assign reg_x_MPORT_1_mask = 1'h1;
  assign reg_x_MPORT_1_en = _inst_type_T_1 | _inst_type_T_260;
  assign reg_csr_reg_pc_next_MPORT_addr = 10'h305;
  assign reg_csr_reg_pc_next_MPORT_data = reg_csr[reg_csr_reg_pc_next_MPORT_addr]; // @[Core.scala 19:22]
  assign reg_csr_csr_rdata_addr = csr_addr[9:0];
  assign reg_csr_csr_rdata_data = reg_csr[reg_csr_csr_rdata_addr]; // @[Core.scala 19:22]
  assign reg_csr_MPORT_data = _csr_wdata_T ? op1_data : _csr_wdata_T_9;
  assign reg_csr_MPORT_addr = csr_addr[9:0];
  assign reg_csr_MPORT_mask = 1'h1;
  assign reg_csr_MPORT_en = csr_cmd != 3'h0;
  assign io_instmem_addr = reg_pc; // @[Core.scala 24:21]
  assign io_datamem_addr = _alu_out_T ? _alu_out_T_2 : _alu_out_T_46; // @[Mux.scala 98:16]
  assign io_datamem_wen = _inst_type_T_1 ? 1'h0 : _inst_type_T_3; // @[Lookup.scala 33:37]
  assign io_datamem_wdata = _GEN_11 != 32'h0 ? reg_x_rs2_data_MPORT_data : 32'h0; // @[Core.scala 49:23]
  assign io_globalpointer = reg_x_io_globalpointer_MPORT_data; // @[Core.scala 188:22]
  assign io_exit = _io_exit_T_1 | (_io_exit_T_2 | _io_exit_T_3); // @[Mux.scala 98:16]
  always @(posedge clock) begin
    if(reg_x_MPORT_1_en & reg_x_MPORT_1_mask) begin
      reg_x[reg_x_MPORT_1_addr] <= reg_x_MPORT_1_data; // @[Core.scala 17:20]
    end
    if(reg_csr_MPORT_en & reg_csr_MPORT_mask) begin
      reg_csr[reg_csr_MPORT_addr] <= reg_csr_MPORT_data; // @[Core.scala 19:22]
    end
    if (reset) begin // @[Core.scala 18:25]
      reg_pc <= 32'h0; // @[Core.scala 18:25]
    end else if (br_flag) begin // @[Mux.scala 98:16]
      reg_pc <= br_target;
    end else if (jump_flag) begin // @[Mux.scala 98:16]
      if (_alu_out_T) begin // @[Mux.scala 98:16]
        reg_pc <= _alu_out_T_2;
      end else begin
        reg_pc <= _alu_out_T_46;
      end
    end else if (_reg_pc_next_T_1) begin // @[Mux.scala 98:16]
      reg_pc <= reg_csr_reg_pc_next_MPORT_data;
    end else begin
      reg_pc <= reg_pc_next_default;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"-----------------------START----------------------\n"); // @[Core.scala 196:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"-------------IF------------\n"); // @[Core.scala 197:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"reg_pc: 0x%x\n",reg_pc); // @[Core.scala 198:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"inst: 0x%x\n",io_instmem_inst); // @[Core.scala 199:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"-------------ID------------\n"); // @[Core.scala 200:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"rs1_addr: %d\n",rs1_addr); // @[Core.scala 201:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"rs2_addr: %d\n",rs2_addr); // @[Core.scala 202:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"op1_data: 0x%x\n",op1_data); // @[Core.scala 203:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"op2_data: 0x%x\n",op2_data); // @[Core.scala 204:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"-------------EX------------\n"); // @[Core.scala 205:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"alu_out: 0x%x\n",alu_out); // @[Core.scala 206:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"branch_flg: %d\n",br_flag); // @[Core.scala 207:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"branch_target: 0x%x\n",br_target); // @[Core.scala 208:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"jump_flg: %d\n",jump_flag); // @[Core.scala 209:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"-------------MEM-----------\n"); // @[Core.scala 210:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"datamem.wen: %d\n",io_datamem_wen); // @[Core.scala 211:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"datamem.wdata: 0x%x\n",io_datamem_wdata); // @[Core.scala 212:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"csr_wdata: 0x%x\n",csr_wdata); // @[Core.scala 213:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"-------------WB------------\n"); // @[Core.scala 214:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"rd_wen: %d\n",inst_type_4); // @[Core.scala 215:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"rd_addr: %d\n",imm_s_lo); // @[Core.scala 216:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"rd_data: 0x%x\n",rd_data); // @[Core.scala 217:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"------------------------END-----------------------\n"); // @[Core.scala 218:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"exit: %d\n",io_exit); // @[Core.scala 219:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"globalpointer: %d\n",reg_x_MPORT_2_data); // @[Core.scala 220:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4) begin
          $fwrite(32'h80000002,"\n"); // @[Core.scala 221:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
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
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    reg_x[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    reg_csr[initvar] = _RAND_1[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  reg_pc = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mem(
  input         clock,
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
  reg [7:0] mem [0:1023]; // @[Mem.scala 43:18]
  wire [7:0] mem_io_instmem_inst_hi_hi_data; // @[Mem.scala 43:18]
  wire [9:0] mem_io_instmem_inst_hi_hi_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_instmem_inst_hi_lo_data; // @[Mem.scala 43:18]
  wire [9:0] mem_io_instmem_inst_hi_lo_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_instmem_inst_lo_hi_data; // @[Mem.scala 43:18]
  wire [9:0] mem_io_instmem_inst_lo_hi_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_instmem_inst_lo_lo_data; // @[Mem.scala 43:18]
  wire [9:0] mem_io_instmem_inst_lo_lo_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_datamem_rdata_hi_hi_data; // @[Mem.scala 43:18]
  wire [9:0] mem_io_datamem_rdata_hi_hi_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_datamem_rdata_hi_lo_data; // @[Mem.scala 43:18]
  wire [9:0] mem_io_datamem_rdata_hi_lo_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_datamem_rdata_lo_hi_data; // @[Mem.scala 43:18]
  wire [9:0] mem_io_datamem_rdata_lo_hi_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_io_datamem_rdata_lo_lo_data; // @[Mem.scala 43:18]
  wire [9:0] mem_io_datamem_rdata_lo_lo_addr; // @[Mem.scala 43:18]
  wire [7:0] mem_MPORT_data; // @[Mem.scala 43:18]
  wire [9:0] mem_MPORT_addr; // @[Mem.scala 43:18]
  wire  mem_MPORT_mask; // @[Mem.scala 43:18]
  wire  mem_MPORT_en; // @[Mem.scala 43:18]
  wire [7:0] mem_MPORT_1_data; // @[Mem.scala 43:18]
  wire [9:0] mem_MPORT_1_addr; // @[Mem.scala 43:18]
  wire  mem_MPORT_1_mask; // @[Mem.scala 43:18]
  wire  mem_MPORT_1_en; // @[Mem.scala 43:18]
  wire [7:0] mem_MPORT_2_data; // @[Mem.scala 43:18]
  wire [9:0] mem_MPORT_2_addr; // @[Mem.scala 43:18]
  wire  mem_MPORT_2_mask; // @[Mem.scala 43:18]
  wire  mem_MPORT_2_en; // @[Mem.scala 43:18]
  wire [7:0] mem_MPORT_3_data; // @[Mem.scala 43:18]
  wire [9:0] mem_MPORT_3_addr; // @[Mem.scala 43:18]
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
  assign mem_io_instmem_inst_hi_hi_addr = _io_instmem_inst_T_1[9:0];
  assign mem_io_instmem_inst_hi_hi_data = mem[mem_io_instmem_inst_hi_hi_addr]; // @[Mem.scala 43:18]
  assign mem_io_instmem_inst_hi_lo_addr = _io_instmem_inst_T_4[9:0];
  assign mem_io_instmem_inst_hi_lo_data = mem[mem_io_instmem_inst_hi_lo_addr]; // @[Mem.scala 43:18]
  assign mem_io_instmem_inst_lo_hi_addr = _io_instmem_inst_T_7[9:0];
  assign mem_io_instmem_inst_lo_hi_data = mem[mem_io_instmem_inst_lo_hi_addr]; // @[Mem.scala 43:18]
  assign mem_io_instmem_inst_lo_lo_addr = io_instmem_addr[9:0];
  assign mem_io_instmem_inst_lo_lo_data = mem[mem_io_instmem_inst_lo_lo_addr]; // @[Mem.scala 43:18]
  assign mem_io_datamem_rdata_hi_hi_addr = _io_datamem_rdata_T_1[9:0];
  assign mem_io_datamem_rdata_hi_hi_data = mem[mem_io_datamem_rdata_hi_hi_addr]; // @[Mem.scala 43:18]
  assign mem_io_datamem_rdata_hi_lo_addr = _io_datamem_rdata_T_4[9:0];
  assign mem_io_datamem_rdata_hi_lo_data = mem[mem_io_datamem_rdata_hi_lo_addr]; // @[Mem.scala 43:18]
  assign mem_io_datamem_rdata_lo_hi_addr = _io_datamem_rdata_T_7[9:0];
  assign mem_io_datamem_rdata_lo_hi_data = mem[mem_io_datamem_rdata_lo_hi_addr]; // @[Mem.scala 43:18]
  assign mem_io_datamem_rdata_lo_lo_addr = io_datamem_addr[9:0];
  assign mem_io_datamem_rdata_lo_lo_data = mem[mem_io_datamem_rdata_lo_lo_addr]; // @[Mem.scala 43:18]
  assign mem_MPORT_data = io_datamem_wdata[7:0];
  assign mem_MPORT_addr = io_datamem_addr[9:0];
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_datamem_wen;
  assign mem_MPORT_1_data = io_datamem_wdata[15:8];
  assign mem_MPORT_1_addr = _io_datamem_rdata_T_7[9:0];
  assign mem_MPORT_1_mask = 1'h1;
  assign mem_MPORT_1_en = io_datamem_wen;
  assign mem_MPORT_2_data = io_datamem_wdata[23:16];
  assign mem_MPORT_2_addr = _io_datamem_rdata_T_4[9:0];
  assign mem_MPORT_2_mask = 1'h1;
  assign mem_MPORT_2_en = io_datamem_wen;
  assign mem_MPORT_3_data = io_datamem_wdata[31:24];
  assign mem_MPORT_3_addr = _io_datamem_rdata_T_1[9:0];
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
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Top(
  input         clock,
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
