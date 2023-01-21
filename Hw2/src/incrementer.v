module incrementer(input reset_or_increment, input load_reg8, output ctr32);
	// wires and registers
	wire [31:0] slt_wire;
	reg [7:0] reg8_wire;
	wire [7:0] mux_wire;
	wire [7:0] add_wire;

	initial begin
	reg8_wire = 8'b0;
	end

	always @ (posedge load_reg8)
	begin
	if (reset_or_increment)
		reg8_wire <= 0;
	if (!reset_or_increment)
		reg8_wire <= mux_wire;
	end

	mux2x1_8bits gate1 (add_wire, 8'b00000000, reset_or_increment, mux_wire);

	adder_8bits gate2 (reg8_wire, 8'b00000001, 1'b0, add_wire);

	slt_32bits gate3 ({24'd0, reg8_wire}, 32'd32, slt_wire);

	not (ctr32, slt_wire[0]);

endmodule

module mux2x1_8bits (input [7:0] a, input [7:0] b, input control, output [7:0] result);
	// and gates to use
	wire [7:0] and1, and2;

	// generation variable to prevent repetition
	genvar i;
	// for loop for and1
	generate 
		for (i=0; i<8; i = i+1) begin: myinc
			and (and1[i], a[i], ~control);
			and (and2[i], b[i], control);
			or (result[i], and1[i], and2[i]);
		end
	endgenerate

endmodule


module adder_8bits(input [7:0] a, input [7:0] b, input c_in, output [7:0] result);
	wire [7:0] wires;
	
	adder_1_bit add0(a[0], b[0], c_in, result[0], wires[0]);
	// generation variable to prevent repetition
	genvar i;
	// for loop for and1
	generate 
		for (i=1; i<8; i = i+1) begin: myadder8
			adder_1_bit add(a[i], b[i], wires[i-1], result[i], wires[i]);
		end
	endgenerate

endmodule
