module instruction_mem(input [15:0] address_to_read, output reg [31:0] instruction_to_give);
	reg [31:0] mem [1023:0]; // memory of 1024 32-bit instructions
	
	always @(*) begin
		instruction_to_give[31:0] = mem[address_to_read];
	end
	// writes in memory to instruction_to_give
	
endmodule
