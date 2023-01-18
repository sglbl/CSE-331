module testbench_shiftleft_16bits();
	
	reg control_bit;
	wire [15:0] result;
	reg [15:0] num;

	shiftleft_16bits g0 (num, control_bit, result);

	initial begin
		num <= 16'b1010_0110_1011_1000;
		control_bit = 1'b1;
		#25;
	end

endmodule
