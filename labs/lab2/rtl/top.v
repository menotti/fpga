module top (
    input CLOCK_50, // 50MHz
    output [6:0] HEX5,
    output [6:0] HEX4,
    output [6:0] HEX3,
    output [6:0] HEX2,
    output [6:0] HEX1,
    output [6:0] HEX0); 
    
    integer count = 0; // FPGAs rocks! 

    always@(posedge CLOCK_50)
        count <= count + 1;

	 wire clk1hz;
	 assign clk1hz = count[25];
	 
	 wire [31:0] fibo;
    fibonacci seq(clk1hz, fibo);
	 
    dec7seg d5(fibo[23:20], HEX5);
    dec7seg d4(fibo[19:16], HEX4);
    dec7seg d3(fibo[15:12], HEX3);
    dec7seg d2(fibo[11: 8], HEX2);
    dec7seg d1(fibo[ 7: 4], HEX1);
    dec7seg d0(fibo[ 3: 0], HEX0);
endmodule
