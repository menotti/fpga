module top #(parameter VGA_BITS = 8) (
  input CLOCK_50, // 50MHz
  input [9:0] SW,
  output reg [9:0] LEDR, // How many LEDs do we have?
  output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
  output [VGA_BITS-1:0] VGA_R, VGA_G, VGA_B,
  output VGA_HS, VGA_VS,
  output reg VGA_CLK = 0, 
  output VGA_BLANK_N, VGA_SYNC_N);

  always@(posedge CLOCK_50)
   VGA_CLK = ~VGA_CLK; // 25MHz

  wire resetn;
  power_on_reset RESET(CLOCK_50, resetn);

  wire [31:0] mem_addr;
  wire [31:0] mem_rdata;
  wire [31:0] mem_wdata;
  wire [ 3:0] mem_wmask;
  wire mem_rstrb;
  Processor RISCV(
    .clk(CLOCK_50),
    .resetn(resetn),
    .mem_addr(mem_addr),
    .mem_rdata(mem_rdata), // RAM_rdata or IO_rdata
    .mem_wdata(mem_wdata),
    .mem_wmask(mem_wmask)
  );
    
  wire we1 = |mem_wmask;
  wire isIO  = mem_addr[22]; // MMIO
  wire isRAM = !isIO;
  wire [29:0] mem_wordaddr = mem_addr[31:2];
  wire [31:0] RAM_rdata;
  wire [31:0] vdata;
  wire [31:0] vaddr;
  mem RAM(
    .clk(CLOCK_50),
    .addr1(mem_addr),
    .addr2(vaddr),
    .data_in1(mem_wdata),
    .data_out1(RAM_rdata),
    .data_out2(vdata),
    .be1(mem_wmask),
    .we1(we1 & isRAM)
  );

  // Memory-mapped IO in IO page, 1-hot addressing in word address.   
  localparam IO_LEDS_bit      = 0;  // (W) red leds
  localparam IO_7SEGS_bit     = 1;  // (W) 7 segments leds
  localparam IO_SWS_bit       = 2;  // (R) switch buttons

  reg [31:0] reg7segs;
  always @(posedge CLOCK_50)
    if (isIO & we1)
      if (mem_wordaddr[IO_LEDS_bit])
        LEDR <= mem_wdata;
      else 
        if (mem_wordaddr[IO_7SEGS_bit])
          reg7segs <= mem_wdata;

  dec7seg d0(reg7segs[ 3: 0], HEX0);
  dec7seg d1(reg7segs[ 7: 4], HEX1);
  dec7seg d2(reg7segs[11: 8], HEX2);
  dec7seg d3(reg7segs[15:12], HEX3);
  dec7seg d4(reg7segs[19:16], HEX4);
  dec7seg d5(reg7segs[23:20], HEX5);

  wire [31:0] IO_rdata = mem_wordaddr[IO_SWS_bit] ? {32'b0, SW} : 32'b0;
  assign mem_rdata = isRAM ? RAM_rdata : IO_rdata;

  vga #(VGA_BITS) VGA(
    .clk(VGA_CLK), 
    .vdata(vdata),
    .vaddr(vaddr),
    .VGA_HS_O(VGA_HS), 
    .VGA_VS_O(VGA_VS), 
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B)
  );
  
  assign VGA_BLANK_N = 1'b1;
  assign VGA_SYNC_N  = 1'b0;
endmodule
