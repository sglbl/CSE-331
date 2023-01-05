// Adder testbench for 1 bit
module testbench_adder_1_bit(); 
	// vars
	reg a; 
	reg b;
	reg c_in; 
	// outputs
	wire sum;
	wire c_out; 

	adder adder_for_testbench (a, b, c_in, sum, c_out);

	initial begin
	a = 1'b0; b = 1'b0; c_in = 1'b0;
	#25;
	a = 1'b0; b = 1'b0; c_in = 1'b1;
	#25;
	a = 1'b0; b = 1'b1; c_in = 1'b0;
	#25;
	a = 1'b0; b = 1'b1; c_in = 1'b1;
	#25;
	a = 1'b1; b = 1'b0; c_in = 1'b0;
	#25;
	a = 1'b1; b = 1'b0; c_in = 1'b1;
	#25;
	a = 1'b1; b = 1'b1; c_in = 1'b0;
	#25;
	a = 1'b1; b = 1'b1; c_in = 1'b1;
	end
 
	initial
	begin
	$monitor("time = %2d, a =%1b, b=%1b, c_in=%1b, sum=%1b, c_out=%1b", $time, a, b, c_in, sum, c_out);
	end
 
endmodule