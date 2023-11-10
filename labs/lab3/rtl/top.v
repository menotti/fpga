module top #(parameter VGA_BITS = 8) (
  input CLOCK_50, // 50MHz
  input [3:0] SW,
  output [VGA_BITS-1:0] VGA_R, VGA_G, VGA_B,
  output VGA_HS, VGA_VS,
  output reg VGA_CLK, 
  output VGA_BLANK_N, VGA_SYNC_N);

  always@(posedge CLOCK_50)
    VGA_CLK = ~VGA_CLK; // 25MHz
	
  wire [7:0] vdata;
  wire [8:0] vaddr;
  wire [23:0] color, gray, image, fill, zero, rand;
  
  assign zero = 24'b0;
  
  random lfsr(VGA_CLK, rand);
  assign fill = SW[1] ? rand : zero;

  wire vga_DA; 	 
  vga video(VGA_CLK, vaddr, VGA_HS, VGA_VS, vga_DA);
  rom mario(VGA_CLK, vaddr, vdata);
  
  assign color = {vdata[5:4], fill[17:12], vdata[3:2], fill[11:6], vdata[1:0], fill[5:0]};
  
  gray c2g(color, gray);

  assign image = SW[0] ? color : gray;
  
  assign VGA_R = vga_DA ? image[23:16] : {VGA_BITS{1'b0}};
  assign VGA_G = vga_DA ? image[15: 8] : {VGA_BITS{1'b0}};
  assign VGA_B = vga_DA ? image[ 7: 0] : {VGA_BITS{1'b0}};
  
  assign VGA_BLANK_N = 1'b1;
  assign VGA_SYNC_N  = 1'b0;
endmodule
