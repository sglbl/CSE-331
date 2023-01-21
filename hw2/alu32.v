module alu32 (input [31:0] a, input [31:0] b, input [2:0] ALUop, input reset, input clk, output [63:0] result);
	// Wires
	wire [31:0] add_wire;
	wire [31:0] subs_wire;
	wire [63:0] mult_wire;
	wire [31:0] xor_wire;
	wire [31:0] and_wire;
	wire [31:0]	slt_wire;
	wire [31:0] nor_wire;
	wire [31:0]	or_wire;
	

	adder gatea (a,b, 1'b0, add_wire);

	xor_32bits gateb (a, b, xor_wire);

	substractor_32bits gatec (a, b, subs_wire);

	mult32 gated(a, b, reset, clk, mult_wire);

	slt_32bits gatee (a, b, slt_wire);

	nor_32bits gatef (a,b, nor_wire);

	and_32bits gateg (a,b, and_wire);

	or_32bits gateh (a,b, or_wire);

	mux8x1_64bits gatei({32'd0,add_wire}, {32'd0,subs_wire}, mult_wire, {32'd0,xor_wire}, 
							{32'd0,and_wire}, {32'd0,or_wire}, {32'd0,slt_wire}, {32'd0,nor_wire}, ALUop, result);


endmodule
