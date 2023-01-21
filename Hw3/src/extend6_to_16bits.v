module extend6_to_16bits(input [5:0] in, output [9:0] out);

	// generation variable to prevent repetition
	genvar i;
	// for loop for and1
	generate 
		for (i=0; i<=5; i = i+1) begin: myorgate
			or (out[i], 0, in[i]);
		end
	endgenerate

	generate 
		for (i=6; i<=9; i = i+1) begin: myorgate2
			or (out[i], 0, in[5]);
		end
	endgenerate

	
	
endmodule
