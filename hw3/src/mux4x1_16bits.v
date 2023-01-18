module mux4x1_16bits (input [15:0] a, input [15:0] b, input [15:0] c, 
							 input [15:0] d, input [1:0] control, output [15:0] result);

	wire [15:0] m1_wire;
	wire [15:0] m2_wire;

	mux2x1_16bits mux1(a, b, control[0], m1_wire);
	mux2x1_16bits mux2(c, d, control[0], m2_wire);
	mux2x1_16bits mux3(m1_wire, m2_wire, control[1], result);

endmodule