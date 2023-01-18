
module mux2x1_1bit(input a, input b, input control, output result);
	// intermediate wires
	wire and1, and2;
	
	and (and1, a, ~control);
	and (and2, b, control);
	or (result, and1, and2);
endmodule
