module gol (
  input clk, rst, ena,
  output reg pixel);

  parameter rowsize = 640-2-1;
  parameter fifosize = 640*480-640-2-1;

  random lfsr(clk, random_data);

  reg newgen, r1c1, r1c2, r2c1, r2c2, r3c1, r3c2;
  reg [fifosize:0] fifo;
  reg [rowsize:0] row1;
  reg [rowsize:0] row2;

  wire [30:0] random_data;
  wire head_row1, head_row2, head_fifo;
  wire [3:0] neighbor_count = (r1c1 + r1c2 + head_row1) +
                              (r2c1 +        head_row2) +
                              (r3c1 + r3c2 + head_fifo);

  assign head_row1 = row1[rowsize];
  assign head_row2 = rst ? random_data[0] : row2[rowsize];
  assign head_fifo = fifo[fifosize];

  always @(posedge clk)
	  if (ena)
	  begin
		 row1 <= {row1[ rowsize-1:0], r2c1};
		 row2 <= {row2[ rowsize-1:0], r3c1};
		 fifo <= {fifo[fifosize-1:0], newgen};
		 r1c1 <= r1c2; r1c2 <= head_row1;
		 r2c1 <= r2c2; r2c2 <= head_row2;
		 r3c1 <= r3c2; r3c2 <= head_fifo;
		 pixel <= newgen; newgen <= (neighbor_count | r2c2) == 4'd3;
	  end
endmodule
