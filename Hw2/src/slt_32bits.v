module slt_32bits (input [31:0] A, input [31:0] B, output [31:0] result);

wire [31:0] wirevar;

	// generation variable to prevent repetition
	genvar i;
	// for loop for and1
	generate 
		for (i=1; i<32; i = i+1) begin: mynotgate
			not notgate(result[i], 1'b1);
		end
	endgenerate

	substractor_32bits gate1(A, B, wirevar);
	or (result[0], wirevar[31], 1'b0);

endmodule