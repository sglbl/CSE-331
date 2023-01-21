module register(input [3:0] read_reg_input1, input [3:0] read_reg_input2, 
					input [3:0] reg_to_write, input [15:0] data_to_write,
					input RegWrite, input clock, 
					output [15:0] data_to_give1, output [15:0] data_to_give2);

reg [15:0] regs [15:0];					
assign data_to_give1 = regs[read_reg_input1];
assign data_to_give2 = regs[read_reg_input2];

always @(posedge clock) begin
	// if(RegWrite)
		// if(reg_to_write)
		if (RegWrite && reg_to_write != 4'b0000)
			regs[reg_to_write] = data_to_write;
end

endmodule
