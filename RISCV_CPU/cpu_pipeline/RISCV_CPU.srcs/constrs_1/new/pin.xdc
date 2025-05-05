#CLK_100M
set_property PACKAGE_PIN E10        [get_ports clk_in]
set_property IOSTANDARD LVCMOS18    [get_ports clk_in]

create_clock -period 5.000 -name clk_in -waveform {0.000 4.200} [get_ports clk_in]