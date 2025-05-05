`timescale  1ns/1ns
module tb_SoC();

reg  clk_in              ;
reg  reset              ;
wire io_exit            ;
wire [31:0] led;
reg  [31:0] key;
wire [31:0]io_out_APB_Peripheral_io_sdt_io_sdta_line;
wire [31:0]io_out_APB_Peripheral_io_sdt_io_sdtb_line;

initial
    begin        
        clk_in = 1'b1;
        reset <=  1'b0;
        key <= 32'h00001001;
        #100
        reset <=  1'b1;
        #1000000
        reset <=  1'b0;
        #1000000
        reset <=  1'b1;
        #1000
        reset <=  1'b0;
       
    end

always #10 clk_in = ~clk_in    ;

Top top_inst
(
    .clk_in              (clk_in           ),           
    .reset              (reset           ),           
    .io_exit            (io_exit         ),
    .led (led),
    .key_in (key),
    .seg_dig(seg_dig),
    .seg_data(seg_data)
);

//  SoC soc_inst
//  (
//    .clock(clk_in),
//    .reset(reset),
//    .io_exit(io_exit),
//    .io_out_APB_Peripheral_io_led_io_led(led),
//    .io_out_APB_Peripheral_io_key_io_key(key),
//    .io_out_APB_Peripheral_io_sdt_io_sdta(io_out_APB_Peripheral_io_sdt_io_sdta_line),
//    .io_out_APB_Peripheral_io_sdt_io_sdtb(io_out_APB_Peripheral_io_sdt_io_sdtb_line)
//  );

endmodule