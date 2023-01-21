module testbench_register();
	reg RegWrite;
	reg clock;
	wire [15:0] readed_data1, readed_data2;
	reg [3:0] read_reg_input1, read_reg_input2, reg_to_write; 
	reg [15:0] data_to_write;
	
	register myregister(read_reg_input1, read_reg_input2, reg_to_write, 
			data_to_write, RegWrite, clock, readed_data1, readed_data2);	
	
	initial begin
		clock = 1'b0;
		forever #6 clock = !clock;
	end
	
	
	initial begin
		//reading regs
		read_reg_input2 = 3'd2;
		#3
		read_reg_input1 = 3'd1;
		#3
		
		// writing to second reg
		data_to_write = 16'b1111111100000000;
		reg_to_write = 3'd1;
		RegWrite = 1'd1;
		#12
		
		// resetting again
		RegWrite = 1'd0;
		#12;
		
		// write to first reg
		reg_to_write = 3'd2;
		RegWrite = 1'd1;
		data_to_write = 16'b1111111111111111;
		#12;
		
		// reading again
		RegWrite = 1'd0;
		#12;
		$finish;
	end
	
	initial begin
		$monitor("Clock: %1b , RegWrite: %1b, Read reg input1: %3b, Read reg input2: %3b , Write Register: %3b\nData to write: %16b \nReaded data1: %16b \nReaded data2: %16b\n",
		clock, RegWrite, read_reg_input1, read_reg_input2, reg_to_write, data_to_write, readed_data1, readed_data2);
	
	end
	
	

endmodule
