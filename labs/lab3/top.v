module top (
    input CLOCK_50); // 50MHz
    
    integer count = 0; // FPGAs rocks! 

    always@(posedge CLOCK_50)
        count <= count + 1;


endmodule