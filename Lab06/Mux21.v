module Mux21 (out, in, sel);
	input [1:0] in;
	input sel;
	output out;

	wire a0, a1;

	and and0(a0, in[0], ~sel);
	and and1(a1, in[1], sel);
	or or0(out, a0, a1);

endmodule
