module xor_16bits(input [15:0] A, input [15:0] B, output [15:0] result);
	
	genvar i;
	// for loop for and2
	generate 
		for (i=0; i<16; i = i+1) begin: mygate
			xor xorgate(result[i], A[i], B[i]);
		end
	endgenerate

endmodule