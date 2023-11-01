module mem #(  
  parameter BYTE_WIDTH = 8,
         ADDRESS_WIDTH = 32,
                 DEPTH = 1024,
                 BYTES = 4,
          DATA_WIDTH_R = BYTE_WIDTH * BYTES)
(
  input [ADDRESS_WIDTH-1:0] addr,
  input [BYTES-1:0] be,
  input [DATA_WIDTH_R-1:0] data_in, 
  input mem_wstrb, clk,
  output [DATA_WIDTH_R-1:0] data_out);

  // model the RAM with two dimensional packed array
  reg [BYTES-1:0][BYTE_WIDTH-1:0] ram[0:DEPTH-1];
  reg [DATA_WIDTH_R-1:0] data_reg;

  initial
    $readmemh("mem.txt", ram);

  always@(posedge clk)
  begin
    if(mem_wstrb) begin
      // edit this code if using other than four bytes per word
      if(be[0]) ram[addr[31:2]][0] <= data_in[ 7: 0];
      if(be[1]) ram[addr[31:2]][1] <= data_in[15: 8];
      if(be[2]) ram[addr[31:2]][2] <= data_in[23:16];
      if(be[3]) ram[addr[31:2]][3] <= data_in[31:24];
    end
    data_reg <= ram[addr[31:2]];
  end

  assign data_out = data_reg;
endmodule
