module top #(parameter VGA_BITS = 4) (
  input CLOCK_50, // 50MHz
  input [3:0] SW,
  output [VGA_BITS-1:0] VGA_R, VGA_G, VGA_B,
  output VGA_HS, VGA_VS,
  output reg VGA_CLK,
  output VGA_BLANK_N, VGA_SYNC_N);

  wire VGA_DA; // In display area
  wire VGA_PIXEL;
  
    //http://tinyvga.com/vga-timing
	 
  // 640 x 480 @ 25.175 MHz (negative)
  localparam  WIDTH = 640, HEIGHT = 480;
  localparam HFRONT =  16,  HSYNC =  96, HBACK = 48, HPULSEN = 1;
  localparam VFRONT =  10,  VSYNC =   2, VBACK = 33, VPULSEN = 1;
  
  // 800 x 600 @ 36 MHz (positive)
//  localparam  WIDTH = 800, HEIGHT = 600;
//  localparam HFRONT =  24,  HSYNC =  72, HBACK = 128, HPULSEN = 0;
//  localparam VFRONT =   1,  VSYNC =   2, VBACK =  22, VPULSEN = 0;

  // 1024 x 768 @ 65 MHz (negative)
//  localparam  WIDTH = 1024, HEIGHT = 768;
//  localparam HFRONT =   24,  HSYNC =  136, HBACK = 160, HPULSEN = 1;
//  localparam VFRONT =    3,  VSYNC =    6, VBACK =  29, VPULSEN = 1;

  // 1280 x 1024 @ 108 MHz (positive)
//  localparam  WIDTH = 1280, HEIGHT = 1024;
//  localparam HFRONT =   48,  HSYNC =  112, HBACK = 248, HPULSEN = 0;
//  localparam VFRONT =    1,  VSYNC =    3, VBACK =  38, VPULSEN = 0;

  always@(posedge CLOCK_50)
    VGA_CLK = ~VGA_CLK; // 25MHz

  vga #(WIDTH, HEIGHT, 
        HFRONT, HSYNC, HBACK, HPULSEN, 
		    VFRONT, VSYNC, VBACK, VPULSEN) 
		    video(VGA_CLK, VGA_HS, VGA_VS, VGA_DA);

  gol #(WIDTH, HEIGHT) 
        board(VGA_CLK, SW[0], VGA_DA, VGA_PIXEL);
  
  assign VGA_R = {VGA_BITS{VGA_DA ? SW[3] ^ VGA_PIXEL : 1'b0}};
  assign VGA_G = {VGA_BITS{VGA_DA ? SW[2] ^ VGA_PIXEL : 1'b0}};
  assign VGA_B = {VGA_BITS{VGA_DA ? SW[1] ^ VGA_PIXEL : 1'b0}};
  assign VGA_BLANK_N = 1'b1;
  assign VGA_SYNC_N  = 1'b0;
endmodule
