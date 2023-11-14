module rom(
  input clock,
  input [8:0] vaddr,
  output reg [7:0] vdata);
  
  reg [7:0] ROM [0:511];
  
  initial
    $readmemb("mario8.bin", ROM);
    
  always @(posedge clock)
    vdata <= ROM[vaddr];
endmodule