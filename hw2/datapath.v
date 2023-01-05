// datapath hardware performs operations alu, registers, internal buses 
// other site: datapath holds or process' data ; registers, adders, comparators, multiplexers, substractors
module datapath (input add_or_shift, input load_higher, input mult_or_shift, input load_lower, input reset_or_increment, 
						input load_loop_checker, input [31:0] a, input [31:0] b, input clk,
						output [63:0] shift_wire, output reg [63:0] result, output reg_least_bit, output ctr32/* counter until 32 */);

	// wire middle outputs
	wire [31:0] adder_wire;
	wire [31:0] mux_wire1;
	wire [31:0] mux_wire2;
	
						
	// make big changes in below
	initial begin
		result[63:32] = 32'd0;
		result[31:0] = 32'd0;
	end

	// register definition
	always @ (negedge clk)
	begin
		if (load_higher)
			result[63:32] <= mux_wire1;
		if (load_lower)
			result[31:0] <= mux_wire2;
	end

	adder gate1(result[63:32], a, 1'b0, adder_wire);

	mux2x1_32bits gate2(shift_wire[63:32], adder_wire, add_or_shift, mux_wire1);

	mux2x1_32bits gate3(shift_wire[31:0], b, mult_or_shift, mux_wire2);
	
	shiftright_64bits gate4({result[63:32], result[31:0]}, 1'b1, shift_wire);

	incrementer gate5(reset_or_increment, load_loop_checker, ctr32);

	not gate6(reg_least_bit, ~result[0]);

endmodule

// Additional modules


