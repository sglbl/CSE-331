module testbench_control();
	reg reg_least_bit, ctr32, reset, clk;
	wire load_lower, reset_or_increment, add_or_shift, mult_or_shift, load_loop_checker, load_higher;

	control g0 (reg_least_bit, ctr32, reset, clk, add_or_shift, load_higher, mult_or_shift, load_lower, reset_or_increment, load_loop_checker);

	initial begin
		clk = 0;
	end

	initial begin 
		forever begin
		#2; 
		clk = ~clk;
		end 
	end

	initial begin
		reg_least_bit = 1;
		reset = 0;
		ctr32 = 0;
		#25;

		reg_least_bit = 0;
		#25;

		reg_least_bit = 1;
		#25;

		ctr32 = 1;
		#25;

		reset = 1;
		#25;

		$stop();
	end

endmodule
