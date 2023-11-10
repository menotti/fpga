module vga #(parameter VGA_BITS = 4) (
  input clk,
  input [31:0] vdata,
  output [VGA_BITS-1:0] VGA_R, VGA_G, VGA_B,
  output reg VGA_HS_O, VGA_VS_O,
  output [31:0] vaddr); // 2**9 = 512 > 300 (words) = 1200 (bytes) = 40*30 (res) = 16x16 pixel;
                        // 2**11 = 2048 > 1200 (words) = 4800 (bytes) = 80*60 (res) = 8x8 pixel;
                        // 2**13 = 8192 > 4800 (words) = 19200 (bytes) = 160*120 (res) = 4x4 pixel;
                        // 2**15 = 32768 > 19200 (words) = 76800 (bytes) = 320*240 (res) = 2x2 pixel; <==
                        // 2**17 = 131072 > 76800 (words) = 307200 (bytes) = 640*480 (res) = 1x1 pixel;
  reg [9:0] CounterX = 0, CounterY = 0;
  reg inDisplayArea, inDisplayAreaPrev;
  reg vga_HS, vga_VS;
  wire [31:0] row;
  wire [31:0] col;
  wire [7:0] vbyte;

  wire CounterXmaxed = (CounterX == 800); // 16 + 48 + 96 + 640
  wire CounterYmaxed = (CounterY == 525); // 10 +  2 + 33 + 480

  always @(posedge clk)
  begin
    if (CounterXmaxed)
      CounterX <= 10'b0;
    else
      CounterX <= CounterX + 1'b1;
    
    if (CounterXmaxed)
      if(CounterYmaxed)
        CounterY <= 10'b0;
      else
        CounterY <= CounterY + 1'b1;
  end
 
  // assign col = (CounterX>>4);
  // assign row = (CounterY>>4);
  // assign col = (CounterX>>3);
  // assign row = (CounterY>>3);
  // assign col = (CounterX>>2);
  // assign row = (CounterY>>2);
  assign col = (CounterX>>1);
  assign row = (CounterY>>1);
  // assign vaddr = col + (row<<5) + (row<<3); // 40 col = 2^5 + 2^3
  // assign vaddr = col + (row<<6) + (row<<4); // 80 col = 2^6 + 2^4
  // assign vaddr = col + (row<<7) + (row<<5); // 160 col = 2^7 + 2^5
  assign vaddr = col + (row<<8) + (row<<6); // 320 col = 2^8 + 2^6
  // assign vaddr = col + (row<<9) + (row<<7); // 640 col = 2^9 + 2^7
  assign vbyte = col[1] ? (col[0] ? vdata[ 7: 0] : 
                                    vdata[15: 8]): 
                          (col[0] ? vdata[23:16] : 
                                    vdata[31:24]); // byte select (reversed)

  always @(posedge clk)
  begin
    vga_HS <= (CounterX > (640 + 16) && (CounterX < (640 + 16 + 96)));   // active for 96 clocks
    vga_VS <= (CounterY > (480 + 10) && (CounterY < (480 + 10 +  2)));   // active for  2 clocks
    inDisplayAreaPrev <= (CounterX < 640) && (CounterY < 480);  
	  inDisplayArea <= inDisplayAreaPrev;
    VGA_HS_O <= ~vga_HS;
    VGA_VS_O <= ~vga_VS;
  end
  // assign VGA_R = inDisplayArea ? {vbyte[5:4], 6'b000000} : 8'b00000000;
  // assign VGA_G = inDisplayArea ? {vbyte[3:2], 6'b000000} : 8'b00000000;
  // assign VGA_B = inDisplayArea ? {vbyte[1:0], 6'b000000} : 8'b00000000;  
  assign VGA_R = inDisplayArea ? {8{vbyte[0]}} : 8'b00000000;
  assign VGA_G = inDisplayArea ? {8{vbyte[0]}} : 8'b00000000;
  assign VGA_B = inDisplayArea ? {8{vbyte[0]}} : 8'b00000000;  
endmodule
