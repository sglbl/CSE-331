module alu16 (input [15:0] a, input [15:0] b, input [2:0] ALUop, input reset, input clk, output [15:0] result);
	// Wires
	wire [15:0] add_wire;
	wire [15:0] subs_wire;
	wire [15:0] mult_wire; // don't exist
	wire [15:0] sll_wire, srl_wire;
	wire [15:0] and_wire;
	wire [15:0]	slt_wire;
	wire [15:0]	or_wire;
	

	adder gatea (a,b, 1'b0, add_wire);

	sll gateb (a, b, sll_wire);

	substractor_16bits gatec (a, b, subs_wire);

	// mult16 gated(a, b, reset, clk, mult_wire);

	slt_16bits gatee (a, b, slt_wire);

	srl gatef (a, b, srl_wire);

	and_16bits gateg (a,b, and_wire);

	or_16bits gateh (a,b, or_wire);

	mux8x1_16bits gatei(add_wire, subs_wire, slt_wire, and_wire, or_wire, 
							sll_wire, srl_wire, // convert to sll and srl instead xor nor
							mult_wire, ALUop, result);

	

endmodule
