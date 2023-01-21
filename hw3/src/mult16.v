module mult16 (input [15:0] a, input [15:0] b, input reset, input clk, output [15:0] result);
	// Wires
	wire add_or_shift;
	wire load_higher;
	wire mult_or_shift;
	wire load_lower; 
	wire reset_or_increment;
	wire load_loop_checker;
	wire reg_least_bit;
	wire ctr32;
	wire [31:0] shift_wire;

	control mycontroller (reg_least_bit, ctr32, reset, clk, add_or_shift, load_higher, mult_or_shift,
								load_lower, reset_or_increment, load_loop_checker);
	datapath mydatapath (add_or_shift, load_higher, mult_or_shift, load_lower, reset_or_increment, load_loop_checker,
								a, b, clk, shift_wire, result, reg_least_bit, ctr32);

endmodule
