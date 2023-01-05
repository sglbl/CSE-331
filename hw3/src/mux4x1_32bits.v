module mux4x1_32bits (input [31:0] a, input [31:0] b, input [31:0] c, 
							 input [31:0] d, input [1:0] control, output [31:0] result);

	wire [31:0] m1_wire;
	wire [31:0] m2_wire;

	mux2x1_32bits mux1(a, b, control[0], m1_wire);
	mux2x1_32bits mux2(c, d, control[0], m2_wire);
	mux2x1_32bits mux3(m1_wire, m2_wire, control[1], result);

endmodule