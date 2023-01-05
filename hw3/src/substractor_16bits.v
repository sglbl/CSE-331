module substractor_16bits(input [15:0] a, input [15:0] b, output [15:0] result);
	wire [15:0] wirevar;

	xor_16bits gate1(b, 16'b1111111111111111, wirevar);
	adder gate2(a, wirevar /*b*/, 1'b1, result);

endmodule
