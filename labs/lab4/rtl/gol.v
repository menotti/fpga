module gol #(parameter WIDTH = 640, HEIGHT = 480) (
  input clk, rst, ena,
  output reg pixel);

  localparam row_size   =                     WIDTH-2-1;
  localparam fifo1_size = ((WIDTH*HEIGHT)>>1)        -1;
  localparam fifo2_size = ((WIDTH*HEIGHT)>>1)-WIDTH-2-1;

  random lfsr(clk, random_data);

  reg newgen, r1c1, r1c2, r2c1, r2c2, r3c1, r3c2;
  reg [fifo1_size:0] fifo1;
  reg [fifo2_size:0] fifo2;
  reg [row_size:0] row1;
  reg [row_size:0] row2;

  wire [30:0] random_data;
  wire head_row1, head_row2, head_fifo1, head_fifo2;
  wire [3:0] neighbor_count = (r1c1 + r1c2 + head_row1) +
                              (r2c1 +        head_row2) +
                              (r3c1 + r3c2 + head_fifo1);

  assign head_row1 = row1[row_size];
  assign head_row2 = rst ? random_data[0] : row2[row_size];
  assign head_fifo1 = fifo1[fifo1_size];
  assign head_fifo2 = fifo2[fifo2_size];

  always @(posedge clk)
	  if (ena)
	  begin
		 row1  <= { row1[  row_size-1:0], r2c1};
		 row2  <= { row2[  row_size-1:0], r3c1};
		 fifo1 <= {fifo1[fifo1_size-1:0], head_fifo2};
		 fifo2 <= {fifo2[fifo2_size-1:0], newgen};
		 r1c1  <= r1c2;     r1c2 <= head_row1;
		 r2c1  <= r2c2;     r2c2 <= head_row2;
		 r3c1  <= r3c2;     r3c2 <= head_fifo1;
		 pixel <= newgen; newgen <= (neighbor_count | r2c2) == 4'd3;
	  end
endmodule
