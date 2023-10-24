module vga (
  input clk,
  output reg vga_HS, vga_VS, vga_DA);

  reg [9:0] CounterX, CounterY;
  wire CounterXmaxed = (CounterX == 800);
  wire CounterYmaxed = (CounterY == 525);
  
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
		  
    vga_HS <= ~(CounterX > (640 + 16) && (CounterX < (640 + 16 + 96)));
    vga_VS <= ~(CounterY > (480 + 10) && (CounterY < (480 + 10 +  2)));
    vga_DA <= (CounterX < 640) && (CounterY < 480);
  end
endmodule
