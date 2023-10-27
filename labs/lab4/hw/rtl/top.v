//////////////////////////////////////////////////////////////////////////////////
// Company: UFSCar
// Author: Ricardo Menotti
// 
// Create Date: 02.10.2023 07:12
// Project Name: 
// Design Name: Conway's Game of Life 
// Module Name: gol
// Target Devices: EP4CE115F29C7
// Tool Versions: Quartus Prime Lite Edition 21.1.1 Build 850
//////////////////////////////////////////////////////////////////////////////////

module top #(parameter VGA_BITS = 8) (
  input CLOCK_50, // 50MHz
  input [3:0] SW,
  output [VGA_BITS-1:0] VGA_R, VGA_G, VGA_B,
  output VGA_HS_O, VGA_VS_O,
  output reg VGA_CLK, 
  output VGA_BLANK_N, VGA_SYNC_N);

  wire VGA_DA; // In display area
  wire VGA_PIXEL;
  
  always@(posedge CLOCK_50)
    VGA_CLK = ~VGA_CLK; // 25MHz

  vga video(VGA_CLK, VGA_HS_O, VGA_VS_O, VGA_DA);
  gol board(VGA_CLK, SW[0], VGA_DA, VGA_PIXEL);
  
  assign VGA_R = {VGA_BITS{VGA_DA ? SW[3] ^ VGA_PIXEL : 1'b0}};
  assign VGA_G = {VGA_BITS{VGA_DA ? SW[2] ^ VGA_PIXEL : 1'b0}};
  assign VGA_B = {VGA_BITS{VGA_DA ? SW[1] ^ VGA_PIXEL : 1'b0}};
  assign VGA_BLANK_N = 1'b1;
  assign VGA_SYNC_N  = 1'b0;
endmodule
