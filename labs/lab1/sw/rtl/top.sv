module top #(parameter VGA_BITS = 8) (
  input CLOCK_50, // 50MHz
  input [17:0] SW,
  output reg [17:0] LEDR, // How many LEDs do we have?
  output [6:0] HEX5,
  output [6:0] HEX4,
  output [6:0] HEX3,
  output [6:0] HEX2,
  output [6:0] HEX1,
  output [6:0] HEX0);

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
    .mem_rdata(mem_rdata),
    .mem_wdata(mem_wdata),
    .mem_wmask(mem_wmask)
  );
    
  wire mem_wstrb = |mem_wmask;
  wire isIO  = mem_addr[22];
  wire isRAM = !isIO;
  wire [29:0] mem_wordaddr = mem_addr[31:2];
  wire [31:0] RAM_rdata;
  mem RAM(
    .clk(CLOCK_50),
    .addr(mem_addr),
    .data_in(mem_wdata),
    .data_out(RAM_rdata),
    .be({4{isRAM}}&mem_wmask),
    .mem_wstrb(mem_wstrb)
  );

  // Memory-mapped IO in IO page, 1-hot addressing in word address.   
  localparam IO_LEDS_bit      = 0;  // (W) leds
  localparam IO_7SEGS_bit     = 1;  // (W) 7 segments leds
  localparam IO_SWS_bit       = 2;  // (R) switches

  reg [31:0] DISP7SEGS;
  always @(posedge CLOCK_50)
    if (isIO & mem_wstrb)
      if (mem_wordaddr[IO_LEDS_bit])
        LEDR <= mem_wdata;
      else 
        if (mem_wordaddr[IO_7SEGS_bit])
          DISP7SEGS <= mem_wdata;

  dec7seg d0(DISP7SEGS[ 3: 0], HEX0);
  dec7seg d1(DISP7SEGS[ 7: 4], HEX1);
  dec7seg d2(DISP7SEGS[11: 8], HEX2);
  dec7seg d3(DISP7SEGS[15:12], HEX3);
  dec7seg d4(DISP7SEGS[19:16], HEX4);
  dec7seg d5(DISP7SEGS[23:20], HEX5);

  wire [31:0] IO_rdata = mem_wordaddr[IO_SWS_bit] ? {14'b0, SW} : 32'b0;
  assign mem_rdata = isRAM ? RAM_rdata : IO_rdata;
endmodule
