module top (
    input CLOCK_50, // 50MHz
    output [9:0] LEDR, // How many LEDs do we have?
    output [6:0] HEX5,
    output [6:0] HEX4,
    output [6:0] HEX3,
    output [6:0] HEX2,
    output [6:0] HEX1,
    output [6:0] HEX0); 
    
    integer count = 0; // FPGAs rocks! 

    always@(posedge CLOCK_50)
        count <= count + 1;

    // What's The Frequency, Kenneth?
    assign LEDR = {10{count[25]}}; 
    //assign LEDR = count[31:22]; 

    // wire [6:0] segs;
    // dec7seg d0(count[28:25], segs);
    // assign {HEX5,HEX4,HEX3,HEX2,HEX1,HEX0} = ~{6{segs}};
endmodule