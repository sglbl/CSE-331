module testbench_data_mem();
	// inputs as regs
	reg MemWrite;
	reg MemRead;
	reg [15:0] address, data_to_write;
	// output as wire
	wire [15:0] readed_data;
	
	reg clock;

	data_mem datamem(MemWrite, MemRead, address, data_to_write, clock, readed_data);
	
	
	initial begin
		clock = 1'd0;
		forever #4 clock = ~clock;
	end

	initial begin
		data_to_write = 16'd1;
		address = 16'h1111; // 4 bit hex is 16 bits
		
		// making write enable and read disable
		MemWrite = 1'b1;
		MemRead = 1'b0;
		
		#20;
		
		// making write disable and read enable
		MemWrite = 1'b0;
		MemRead = 1'b1;
	
	end
	
	initial begin
		$monitor("Clock is %1b, MemWrite is %1b, MemRead is %1b \nData to write %16b \nData to Read is %16b\nAdress is %16b\n", 
		clock, MemWrite, MemRead, data_to_write, readed_data, address);
	end 
	
	
endmodule
