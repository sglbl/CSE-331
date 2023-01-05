module next_program_counter(input branch_sig, input [9:0] branch_address, input clock, output reg [9:0] next_program_counter_var);
	 // pc ->10 bits of pc is enough
	 // branch_address -> each instruction will have 32 bits
	 
	initial begin
		next_program_counter_var = 10'b0000000000;
	end
	 
	always @ (posedge clock) begin
		if(!branch_sig)
			next_program_counter_var = 10'b0000000100 + next_program_counter_var;
		else if(branch_sig)
			next_program_counter_var = branch_address + 10'b0000000100 + next_program_counter_var;
	
	end
	
endmodule
