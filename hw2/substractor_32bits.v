module substractor_32bits(input [31:0] a, input [31:0] b, output [31:0] result);
	wire [31:0] wirevar;

	xor_32bits gate1(b, 32'b11111111111111111111111111111111, wirevar);
	adder gate2(a, wirevar /*b*/, 1'b1, result);

endmodule
