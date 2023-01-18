// Adder testbench for 32 bit
module testbench_adder();
	// vars
	reg [15:0] a; 
	reg c_in; 
	reg [15:0] b;
	
	// outputs
	wire [15:0] sum;
	wire c_out; 

	adder adder_32_bit(a, b, c_in, sum);

	initial begin
	a = 16'd347;
	b = 16'd103;
	c_in = 0;
	#25;

	a = 16'd347;
	b = 16'd103;
	c_in = 1;
	#25;

	a = 32'd48050;
	b = 32'd11111;
	c_in = 0;
	#25;
	end
	
	initial
	begin
	$monitor("time = %2d, a =%16b, b=%16b, c_in=%1b, sum=%16b, c_out=%1b", $time, a, b, c_in, sum, c_out);
	end

endmodule
