module tb_Top();

reg  clk_in              ;
reg  reset              ;
wire io_globalpointer   ;
wire io_exit            ;

initial
    begin        
        clk_in = 1'b1;
        reset <=  1'b1;
        #20
        reset <=  1'b0;
    end

always #10 clk_in = ~clk_in    ;

Top Top_inst
(
    .clk_in             (clk_in          ),           
    .reset              (reset           ),           
    .io_globalpointer   (io_globalpointer),
    .io_exit            (io_exit         )
);

endmodule