module mips16bits(input clock);
	wire [15:0] extended_address_to_16, data_to_write;
	wire [9:0] next_program_counter_var;
	wire [2:0] aluop, aluctr;
	wire [3:0] reg_to_write;
	wire [31:0] instruction;
	wire [15:0] data_to_read1, data_to_read2;
	wire [15:0] alu_value2, result, readed_data;
	// for control unit
	wire regdst;
	wire alusrc;
	wire branch_sig;
	wire regwrite;
	wire memread;
	wire memwrite;
	
	// getting addres of branch
	// extend6_to_16bits my_extend6_to_16bits(instruction[5:0], extended_address_to_16);
	
	next_program_counter my_next_program_counter(branch_sig, instruction[11:2], // give last 10-bits of 16-bits immediate (for branch)
				clock, /*extended_address_to_16*/ next_program_counter_var);
	
	instruction_mem ins_mem(next_program_counter_var, instruction);
	
	wire memtoreg;
	controller my_control(instruction[31:26] /* opcode */ , aluop, 
					regdst, branch_sig, memread, memtoreg, 
					memwrite, alusrc, regwrite);	
	
	// teacher allowed assign as mux in the class
	// finding register to write value
	assign reg_to_write = regdst ? instruction[17:14] /*rd*/ : instruction[21:18] /*rt*/; // rd or rt
					
	register my_register(instruction[25:22]/*rs*/, instruction[21:18]/*rt*/, reg_to_write, data_to_write, regwrite, clock, data_to_read1, data_to_read2);
		
	alucontrol my_alucontrol(aluop, instruction[9:4]/*func*/, aluctr); // aluctr is dependent on func(for rtype) or aluop(for others)
		
	// to check if second input rt or immediate. (1st input is rs)
	assign alu_value2 = alusrc ? instruction[17:2] /* select 10/16 bit immediate (aluSrc = 1)*/ 
										: data_to_read2; /* or select rt */
		
	/* alu16(input [15:0] a, input [15:0] b, input [2:0] ALUop, input reset, input clk, output [31:0] result) */
	alu16 my_alu(data_to_read1, alu_value2, aluctr, 1'b0, clock, result);
		
	/* input MemWrite, input MemRead, input [15:0] address, input [15:0] data_to_write, input clock, output reg [15:0] readed_data);*/
	data_mem my_data_mem(memwrite, memread, result, data_to_read2, clock, readed_data);
		
	assign data_to_write = memtoreg ? readed_data : result;
		

endmodule
