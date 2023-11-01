module vga #(
  parameter VGA_BITS = 8, WIDTH = 640, HEIGHT = 480, // 640 x 480 @ 25 MHz (negative)
  HFRONT = 16, HSYNC = 96, HBACK = 48, HPULSEN = 1,
  VFRONT = 10, VSYNC =  2, VBACK = 33, VPULSEN = 1
) (
  input clk,
  output [8:0] vaddr,
  output reg vga_HS, vga_VS, vga_DA);

  reg [9:0] CounterX, CounterY;
  wire CounterXmaxed = (CounterX == (WIDTH + HFRONT + HSYNC + HBACK));
  wire CounterYmaxed = (CounterY == (HEIGHT + VFRONT + VSYNC + VBACK));
  
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
		  
    vga_HS <= HPULSEN[0] ^ (CounterX > ( WIDTH + HFRONT) && (CounterX < ( WIDTH + HFRONT + HSYNC)));
    vga_VS <= VPULSEN[0] ^ (CounterY > (HEIGHT + VFRONT) && (CounterY < (HEIGHT + VFRONT + VSYNC)));
    vga_DA <= (CounterX < WIDTH) && (CounterY < HEIGHT);
  end
  
  wire [5:0] row, col;
  assign row = (CounterY>>5); // 32 pixels x
  assign col = (CounterX>>5); // 32 pixels 
  assign vaddr = col + (row<<4) + (row<<2); // addr = col + row x 20
endmodule
