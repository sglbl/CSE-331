module nor_32bits (input [31:0] A, input [31:0] B, output [31:0] result);

	// generation variable to prevent repetition
	genvar i;
	// for loop for and1
	generate 
		for (i=0; i<=31; i = i+1) begin: mynorgate
			nor (result[i], A[i], B[i]);
		end
	endgenerate

endmodule