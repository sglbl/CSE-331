module adder_1_bit(input a, input b, input c_in, output sum, output c_out);
	// full adder using structural model
	wire sum_wire;
	wire cout_wire_1;
	wire cout_wire_2;
	wire cout_wire_3;
	
	and(cout_wire_1, a, b);
	xor(sum_wire, a, b);	
	xor(sum, c_in, sum_wire);
	and(cout_wire_3, a, c_in);	
	and(cout_wire_2, b, c_in);

	or(c_out, cout_wire_1, cout_wire_2, cout_wire_3);
endmodule