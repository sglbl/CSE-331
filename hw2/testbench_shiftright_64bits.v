module testbench_shiftright_64bits();
	
	reg control_bit;
	wire [63:0] result;
	reg [63:0] num;

	shiftright_64bits g0 (num, control_bit, result);

	initial begin
		num <= 64'b1100_0100_1010_0100_1101_1000_0111_1000_1010_0110_1011_1000_1101_0100_1101_0100_;
		control_bit = 1'b1;
		#25;
	end

endmodule
