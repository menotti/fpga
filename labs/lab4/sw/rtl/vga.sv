module vga #(parameter VGA_BITS = 8) (
  input clk,
  input [31:0] vdata,
  output [VGA_BITS-1:0] VGA_R, VGA_G, VGA_B,
  output reg VGA_HS_O, VGA_VS_O,
  output [31:0] vaddr); // 2**9 = 512 > 300 (words) = 1200 (bytes) = 40*30 (res) = 16x16 pixel;

  reg [9:0] CounterX = 0, CounterY = 0;
  reg inDisplayArea, inDisplayAreaPrev;
  reg vga_HS, vga_VS;
  wire [4:0] row;
  wire [5:0] col;
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
 
  assign col = (CounterX>>4);
  assign row = (CounterY>>4);
  assign vaddr = col + (row<<5) + (row<<3);
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
  assign VGA_R = inDisplayArea ? {vbyte[5:4], 6'b000000} : 8'b00000000;
  assign VGA_G = inDisplayArea ? {vbyte[3:2], 6'b000000} : 8'b00000000;
  assign VGA_B = inDisplayArea ? {vbyte[1:0], 6'b000000} : 8'b00000000;  
endmodule