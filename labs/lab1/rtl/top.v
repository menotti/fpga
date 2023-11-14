module top (
    input CLOCK_50,     // 50MHz
    output [9:0] LEDR); // How many LEDs do we have?
    
    integer count = 0;  // FPGAs rocks! 

    always@(posedge CLOCK_50)
        count <= count + 1;

    // What's The Frequency, Kenneth?
    assign LEDR = {10{count[25]}}; 
    // assign LEDR = count[31:22]; 
endmodule
