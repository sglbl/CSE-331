module testbench_instruction_mem();
	wire [31:0] instruction_to_give;
	reg [9:0] address_to_read;

	instruction_mem my_instruction_mem(address_to_read, instruction_to_give);
	
	initial begin
		// put some values in instruction memory
		my_instruction_mem.mem[0] = 32'h00003333; // 32 bits instruction
		my_instruction_mem.mem[1] = 32'h1111BBBB; // 32 bits instruction
		my_instruction_mem.mem[2] = 32'h22224444; // 32 bits instruction
	
		address_to_read = 10'b0000000000;
		#200
		$monitor("Address to read: %10b (dec: %d)\nInstruction : %32b (dec: %d)\n", 
			address_to_read, address_to_read, instruction_to_give, instruction_to_give);
		#200	
		address_to_read = 10'b0000000001;
		#200
		$monitor("Address to read: %10b (dec: %d)\nInstruction : %32b (dec: %d)\n", 
			address_to_read, address_to_read, instruction_to_give, instruction_to_give);
		#200
		address_to_read = 10'b0000000010;	
		#200
		$monitor("Address to read: %10b (dec: %d)\nInstruction : %32b (dec: %d)\n", 
			address_to_read, address_to_read, instruction_to_give, instruction_to_give);
	
	end
	


endmodule
