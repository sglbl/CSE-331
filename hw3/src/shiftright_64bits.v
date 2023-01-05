module shiftright_64bits(input [63:0] A, input control, output[63:0] result);

	// generation variable to prevent repetition
	genvar i;
	// NOTE: FOR LOOP IN GENERATE IS NOT BEHVARIORAL. IT JUST TO PREVENT REPETITION.	
	// for loop for and1
	generate 
		for (i=0; i<=62; i = i+1) begin: mymux
			mux2x1_1bit mux(A[i], A[i+1], control, result[i]);
		end
	endgenerate
	
	mux2x1_1bit mux_end(A[63], 1'b0, control, result[63]);
endmodule

module mux2x1_1bit(input a, input b, input control, output result);
	// intermediate wires
	wire and1, and2;
	
	and (and1, a, ~control);
	and (and2, b, control);
	or (result, and1, and2);
endmodule
