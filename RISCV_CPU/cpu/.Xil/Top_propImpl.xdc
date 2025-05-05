set_property SRC_FILE_INFO {cfile:c:/Users/SWQ2003/Desktop/RISCV_CPU/RISCV_CPU.gen/sources_1/ip/clk_pll/clk_pll.xdc rfile:../RISCV_CPU.gen/sources_1/ip/clk_pll/clk_pll.xdc id:1 order:EARLY scoped_inst:clk_pll_inst/inst} [current_design]
set_property SRC_FILE_INFO {cfile:C:/Users/SWQ2003/Desktop/RISCV_CPU/RISCV_CPU.srcs/constrs_1/new/pin.xdc rfile:../RISCV_CPU.srcs/constrs_1/new/pin.xdc id:2} [current_design]
current_instance clk_pll_inst/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in]] 0.100
current_instance
set_property src_info {type:XDC file:2 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property PACKAGE_PIN E10        [get_ports clock_in]
set_property src_info {type:XDC file:2 line:3 export:INPUT save:INPUT read:READ} [current_design]
set_property IOSTANDARD LVCMOS18    [get_ports clock_in]
