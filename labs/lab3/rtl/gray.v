module gray(
  input  [23:0] i_rgb,
  output [23:0] o_rgb);
  wire [9:0] rgb;
  assign rgb = (i_rgb[23:16] + (i_rgb[15:8]<<1) + i_rgb[7:0])>>2;
  assign o_rgb = {3{rgb[7:0]}};
endmodule