module shiftleft_16bits(input [15:0] A, input control, output[15:0] result);

    or oring0(result[0], 1'b0, 1'b0);

	// generation variable to prevent repetition
	genvar i;
	// NOTE: FOR LOOP IN GENERATE IS NOT BEHAVIORAL. IT JUST TO PREVENT REPETITION.	
	// for loop for and1
	generate
		for (i=1; i<=15; i = i+1) begin: myoring
			or oring2(result[i] , A[i-1], 1'b0);
		end
	endgenerate
endmodule 