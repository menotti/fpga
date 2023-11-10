module tb_top;
    logic CLOCK_50 = 1'b0;
    logic [17:0] SW = 18'b1;

    top dut(.CLOCK_50(CLOCK_50), .SW(SW));

    always
        #5 CLOCK_50 = ~CLOCK_50;

    // initial
    // begin
    //     $dumpfile("dump.vcd"); 
    //     $dumpvars(0);
    // end
endmodule