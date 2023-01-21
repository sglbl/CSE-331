module mux2x1_32bits(input [31:0] a, input [31:0] b, input control, output [31:0] result);
	// intermediate wires
	wire [31:0] and1, and2;

	// generation variable to prevent repetition
	genvar i;
	// for loop for and1
	generate 
		for (i=0; i<32; i = i+1) begin : myandgate1
			and andgate(and1[i], a[i], ~control);
		end
	endgenerate

	// for loop for and2
	generate 
		for (i=0; i<32; i = i+1) begin : myandgate2
			and andgate(and2[i], b[i], control);
		end
	endgenerate

	// for loop for or'ing and results to get result variable
	generate 
		for (i=0; i<32; i = i+1) begin : mygate
			or orgate(result[i], and1[i], and2[i]);
		end
	endgenerate

	// NOTE: FOR LOOP IN GENERATE IS NOT BEHVARIORAL. IT JUST TO PREVENT REPETITION.
	
	
endmodule
