module alu16 (input [15:0] a, input [15:0] b, input [2:0] ALUop, input reset, input clk, output [31:0] result);
	// Wires
	wire [15:0] add_wire;
	wire [15:0] subs_wire;
	wire [31:0] mult_wire;
	wire [15:0] xor_wire;
	wire [15:0] and_wire;
	wire [15:0]	slt_wire;
	wire [15:0] nor_wire;
	wire [15:0]	or_wire;
	

	adder gatea (a,b, 1'b0, add_wire);

	xor_16bits gateb (a, b, xor_wire);

	substractor_16bits gatec (a, b, subs_wire);

	// mult16 gated(a, b, reset, clk, mult_wire);

	slt_16bits gatee (a, b, slt_wire);

	nor_16bits gatef (a,b, nor_wire);

	and_16bits gateg (a,b, and_wire);

	or_16bits gateh (a,b, or_wire);

	mux8x1_32bits gatei({16'd0,add_wire}, {16'd0,subs_wire}, {16'd0,slt_wire}, {16'd0,and_wire}, {16'd0,or_wire}, 
							{16'd0,xor_wire}, {16'd0,nor_wire}, // TODO convert to sll and srl instead these
							mult_wire, ALUop, result);

	

endmodule
