module mux8x1_32bits (input [31:0] a, input [31:0] b, input [31:0] c, 
							 input [31:0] d, input [31:0] e, input [31:0] f, 
							 input [31:0] g, input [31:0] h, input [2:0] control /* 3 control digit*/, output [31:0] result);
	wire [31:0] w1;
	wire [31:0] w2;

	mux4x1_32bits g0 (a, b, c, d, control[1:0], w1);
	mux4x1_32bits g1 (e, f, g, h, control[1:0], w2);

	mux2x1_32bits g2 (w1, w2, control[2], result);						 
							 
endmodule

	