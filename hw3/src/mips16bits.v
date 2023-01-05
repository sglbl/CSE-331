module mips16bits(input clock);
	wire [15:0] extended_address_to_16, next_program_counter_var, data_to_write;
	wire [2:0] reg_to_write, aluctr, aluop;
	wire [31:0] instruction;
	wire [15:0] data_to_read1, data_to_read2;
	wire [15:0] alu_value2, alu_result, data_to_read;
	// for control unit
	wire regdst;
	wire alusrc;
	wire branch_sig;
	wire regwrite;
	wire memread;
	wire memwrite;
	wire memtoreg;
	
	// getting addres of branch
	extend6_to_16bits my_extend6_to_16bits(instruction[5:0], extended_address_to_16);
	
	next_program_counter my_next_program_counter(branch_sig, /*input [9:0]*/ extended_address_to_16, 
				clock, next_program_counter_var);
	
	instruction_mem ins_mem(next_program_counter_var, instruction);
	
	controller my_control(instruction[31:26], aluop, 
					regdst, branch_sig, memread, memtoreg, 
					memwrite, alusrc, regwrite);	
	
	
	



endmodule
