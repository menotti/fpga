module power_on_reset(
  input clk, 
  output resetn);

  reg [11:0] q;
 
  always@(posedge clk)
       q <= {q,1'b1};

  assign resetn = &q;
endmodule