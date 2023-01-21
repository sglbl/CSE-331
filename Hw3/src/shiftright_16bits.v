module shiftright_16bits(input [15:0] A, input control, output[15:0] result);

	// generation variable to prevent repetition
	genvar i;
	// NOTE: FOR LOOP IN GENERATE IS NOT BEHVARIORAL. IT JUST TO PREVENT REPETITION.	
	// for loop for and1
	generate 
		for (i=0; i<=14; i = i+1) begin: mymux
			mux2x1_1bit mux(A[i], A[i+1], control, result[i]);
		end
	endgenerate
	
	mux2x1_1bit mux_end(A[15], 1'b0, control, result[15]);
endmodule
