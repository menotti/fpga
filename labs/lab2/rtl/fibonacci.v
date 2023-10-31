module fibonacci(
  input clk,
  output [31:0] fibo);
  
  integer a = 0, b = 1;
  	
  always@(posedge clk)
  begin
    a <= b;
    b <= a + b;
  end
  
  assign fibo = a;
endmodule
