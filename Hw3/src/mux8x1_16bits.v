module mux8x1_16bits (input [15:0] a, input [15:0] b, input [15:0] c, 
							 input [15:0] d, input [15:0] e, input [15:0] f, 
							 input [15:0] g, input [15:0] h, input [2:0] control /* 3 control digit*/, output [15:0] result);
	wire [15:0] w1;
	wire [15:0] w2;

	mux4x1_16bits g0 (a, b, c, d, control[1:0], w1);
	mux4x1_16bits g1 (e, f, g, h, control[1:0], w2);

	mux2x1_16bits g2 (w1, w2, control[2], result);						 
							 
endmodule

	