`define BENCH

module mem #(
  parameter     BYTE_WIDTH = 8,
             ADDRESS_WIDTH = 32,
				         DEPTH = 1024,
						   BYTES = 4,
		        DATA_WIDTH_R = BYTE_WIDTH * BYTES
)
(
	input [ADDRESS_WIDTH-1:0] addr1,
	input [ADDRESS_WIDTH-1:0] addr2,
	input [BYTES-1:0] be1,
	input [BYTES-1:0] be2,
	input [DATA_WIDTH_R-1:0] data_in1, 
	input [DATA_WIDTH_R-1:0] data_in2, 
	input we1, we2, clk,
	output [DATA_WIDTH_R-1:0] data_out1,
	output [DATA_WIDTH_R-1:0] data_out2);

	// model the RAM with two dimensional packed array
	reg [BYTES-1:0][BYTE_WIDTH-1:0] ram[0:DEPTH-1];

	reg [DATA_WIDTH_R-1:0] data_reg1;
	reg [DATA_WIDTH_R-1:0] data_reg2;

  initial
    $readmemh("mem.txt", ram);
	// port A
	always@(posedge clk)
	begin
		if(we1) begin
          `ifdef BENCH $display("RAM[%4d]=%h mask=(%h)", addr1, data_in1, be1); `endif
		// edit this code if using other than four bytes per word
			if(be1[0]) ram[addr1][0] <= data_in1[ 7: 0];
			if(be1[1]) ram[addr1][1] <= data_in1[15: 8];
			if(be1[2]) ram[addr1][2] <= data_in1[23:16];
			if(be1[3]) ram[addr1][3] <= data_in1[31:24];
		end
      data_reg1 <= ram[addr1[31:2]];
	end

	assign data_out1 = data_reg1;
   
	// port B
	always@(posedge clk)
	begin
		if(we2) begin
		// edit this code if using other than four bytes per word
			if(be2[0]) ram[addr2][0] <= data_in2[ 7: 0];
			if(be2[1]) ram[addr2][1] <= data_in2[15: 8];
			if(be2[2]) ram[addr2][2] <= data_in2[23:16];
			if(be2[3]) ram[addr2][3] <= data_in2[31:24];
		end
      data_reg2 <= ram[addr2[31:2]];
	end

	assign data_out2 = data_reg2;
endmodule 


/*
module Memory (
   input             clk,
   input      [31:0] mem_addr,  // address to be read
   output reg [31:0] mem_rdata, // data read from memory
   input   	     mem_rstrb, // goes high when processor wants to read
   input      [31:0] mem_wdata, // data to be written
   input      [3:0]  mem_wmask	// masks for writing the 4 bytes (1=write byte)
);

   reg [31:0] MEM [0:1535]; // 1536 4-bytes words = 6 Kb of RAM in total

   initial begin
     $readmemh("firmware.hex", MEM);
   end

   wire [29:0] word_addr = mem_addr[31:2];
   
   always @(posedge clk) begin
      if(mem_rstrb)
         mem_rdata <= MEM[word_addr];
      if(mem_wmask[0]) MEM[word_addr][ 7:0 ] <= mem_wdata[ 7:0 ];
      if(mem_wmask[1]) MEM[word_addr][15:8 ] <= mem_wdata[15:8 ];
      if(mem_wmask[2]) MEM[word_addr][23:16] <= mem_wdata[23:16];
      if(mem_wmask[3]) MEM[word_addr][31:24] <= mem_wdata[31:24];	 

   end
endmodule
*/