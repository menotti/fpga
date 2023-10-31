module random (
  input clk,
  output reg [30:0] lfsr);

  always @(posedge clk)
    lfsr = {lfsr[29:0], lfsr[16] ^~ lfsr[14] ^~ lfsr[13] ^~ lfsr[11]};
endmodule
