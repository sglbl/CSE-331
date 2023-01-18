module slt_16bits (input [15:0] A, input [15:0] B, output [15:0] result);

wire [15:0] wirevar;

	// generation variable to prevent repetition
	genvar i;
	// for loop for and1
	generate 
		for (i=1; i<16; i = i+1) begin: mynotgate
			not notgate(result[i], 1'b1); // write 0 to first 15 bits of result
		end
	endgenerate

	substractor_16bits gate1(A, B, wirevar); // substract a and b and write to wirevar
	or (result[0], wirevar[15], 1'b0);	// if wirevar == 1; make result[0]

endmodule