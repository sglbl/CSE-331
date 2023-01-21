module xor_32bits(input [31:0] A, input [31:0] B, output [31:0] result);
	
	genvar i;
	// for loop for and2
	generate 
		for (i=0; i<32; i = i+1) begin: mygate
			xor xorgate(result[i], A[i], B[i]);
		end
	endgenerate

endmodule