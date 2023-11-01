module rom(
  input clock,
  input [8:0] vaddr,
  output reg [7:0] vdata);

  reg [7:0] RAM[511:0];
  
  initial
    $readmemb("mario8.bin", RAM);
	 
  always @(posedge clock)
    vdata <= RAM[vaddr];
endmodule