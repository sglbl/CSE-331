module mux8x1_64bits (input [63:0] a, input [63:0] b, input [63:0] c, 
							 input [63:0] d, input [63:0] e, input [63:0] f, 
							 input [63:0] g, input [63:0] h, input [2:0] control /* 3 control digit*/, output [63:0] result);
	wire [63:0] w1;
	wire [63:0] w2;

	mux4x1_64bits g0 (a, b, c, d, control[1:0], w1);
	mux4x1_64bits g1 (e, f, g, h, control[1:0], w2);

	mux2x1_64bits g2 (w1, w2, control[2], result);						 
							 
endmodule

module mux4x1_64bits (input [63:0] a, input [63:0] b, input [63:0] c, 
							 input [63:0] d, input [1:0] control, output [63:0] result);

	wire [63:0] m1_wire;
	wire [63:0] m2_wire;

	mux2x1_64bits mux1(a, b, control[0], m1_wire);
	mux2x1_64bits mux2(c, d, control[0], m2_wire);
	mux2x1_64bits mux3(m1_wire, m2_wire, control[1], result);

endmodule
							 
module mux2x1_64bits (input [63:0] a, input [63:0] b, input control, output [63:0] result);

	wire [63:0] and1;
	wire [63:0] and2;
	
	genvar i;
	// for loop to prevent repetitions
	generate 
		for (i=0; i<=63; i = i+1) begin: mygate1
			and (and1[i], a[i], ~control);
		end
	endgenerate

	generate 
		for (i=0; i<=63; i = i+1) begin: mygate2
			and (and2[i], b[i], control);
		end
	endgenerate

	generate 
		for (i=0; i<=63; i = i+1) begin: mygate3
			or (result[i], and1[i], and2[i]);
		end
	endgenerate

endmodule
