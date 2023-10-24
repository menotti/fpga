module blinker (
    input CLOCK_50, // 50MHz
    output [3:0] LEDR); // How many LEDs do we have?
    
    integer count = 0; // FPGAs rocks! 

    always@(posedge CLOCK_50)
        count <= count + 1;

    // What's The Frequency, Kenneth?
    assign LEDR = {4{count[31]}}; 
    // assign LEDR = count[31:28]; 
endmodule