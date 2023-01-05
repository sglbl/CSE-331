module testbench_extend6_to_16bits();
	// output
	wire [15:0] out;

	//input
	reg [5:0] in;
	
	extend6_to_16bits myextend6_to_16bits(in, out);
	
	initial begin
		in = 6'd8;
		#25;
		in = 6'd12;
		#25;
	end
	
	initial begin
		$monitor("Input: %6b, Output: %16b\n", in, out);
	end
	
endmodule
