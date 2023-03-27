module and3(input      a, b, c,
  output reg y);
  reg tmp;
	always @(*)
	begin
		$display("%tmp");
	end
  always @ (a, b, c)
    begin
      tmp <= a & b;
      y   <= tmp & c;
    end
endmodule
