module data_mem(input MemWrite, input MemRead, input [15:0] address, input [15:0] data_to_write, input clock, output reg [15:0] readed_data);
	reg [15:0] mem [65535:0]; // 2^16 words (word:16 bit) of data
	
	
	always @(clock) begin //each clock change
		if (MemRead != 0)
			readed_data[15:0] = mem[address];
	end
	
	always @(posedge clock) begin
		if (MemWrite != 0)
			mem[address] = data_to_write[15:0];
	end


endmodule
