module and_16bits (input [15:0] A, input [15:0] B, output [15:0] result);

	// generation variable to prevent repetition
	genvar i;
	// for loop for and1
	generate 
		for (i=0; i<=15; i = i+1) begin: myandgate
			and (result[i], A[i], B[i]);
		end
	endgenerate

endmodule