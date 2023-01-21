module testbench_next_program();
	reg branch_sig;
	reg [9:0] branch_address;
	reg clock; 
	// A reg is only used for procedural assignments 
	// to a signal in an always or initial block. 
	// For continuous assignments,
	// such as connecting to a module output, using wire instead.
	wire [9:0] next_program_counter_var;
	
	// testing 
	next_program_counter next_program_count(branch_sig, branch_address, clock, next_program_counter_var);
	
	// clock changes every in 3 ms
	initial begin
		clock = 1'd0;
		forever #3 clock = !clock;
	end
	
	initial begin
		branch_address = 32'b00011110; // 30 in decimal
		branch_sig = 1'd0;
		#12;
		
		// making branching true
		branch_sig = 1'd1;
		#6;
		
		// making branching false
		branch_sig = 1'd0;
		#6;
	end
		
	always @(posedge clock) begin
		if(next_program_count.next_program_counter_var > 160)
			$finish;
		if(next_program_count.branch_sig)
			$monitor("Branch signal is 1 so it will jump");
		$monitor("Clock is %1b / Branch is %1b / Next program counter is %10b \nBranch address is %10b\n",
			clock, branch_sig, next_program_counter_var, branch_address);	
	end
	
	

	
endmodule
