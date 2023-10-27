module top #(parameter VGA_BITS = 8) (
  input CLOCK_50, // 50MHz
  input [3:0] SW,
  output [VGA_BITS-1:0] VGA_R, VGA_G, VGA_B,
  output VGA_HS_O, VGA_VS_O,
  output reg VGA_CLK, 
  output VGA_BLANK_N, VGA_SYNC_N);

  wire VGA_DA; // In display area
  wire VGA_PIXEL;
  wire [31:0] mem_addr;
  wire [31:0] mem_rdata;
  wire [31:0] mem_wdata;
  wire [ 3:0]  mem_wmask;
  wire mem_rstrb;
  wire [31:0] vdata;
  wire [31:0] vaddr;
  
  always@(posedge CLOCK_50)
    VGA_CLK = ~VGA_CLK; // 25MHz

//   Processor RISCV(
//      .clk(VGA_CLK),
//      .resetn(resetn),		 
//      .mem_addr(mem_addr),
//      .mem_rdata(mem_rdata),
////       .mem_rstrb(mem_rstrb),
//      .mem_wdata(mem_wdata),
//      .mem_wmask(mem_wmask)
//   );
	
	mem RAM(
    .clk(VGA_CLK),
    .addr1(mem_addr),
    .addr2(vaddr),
    .data_in1(mem_wdata),
    .data_out1(mem_rdata),
    .data_out2(vdata),
    .be1(mem_wmask),
    .we1(we1)
	);

	vga VGA(
    .clk(VGA_CLK), 
	 .vdata(vdata),
	 .vaddr(vaddr),
	 .VGA_HS_O(VGA_HS_O), 
	 .VGA_VS_O(VGA_VS_O), 
	 .VGA_R(VGA_R),
	 .VGA_G(VGA_G),
	 .VGA_B(VGA_B)
	);
  
  assign VGA_BLANK_N = 1'b1;
  assign VGA_SYNC_N  = 1'b0;
endmodule