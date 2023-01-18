module testbench_mips16bits();
	reg [15:0] rtype_instructions_from_file = 16'd8, itype_instructions_from_file = 16'd16;
	reg clock;

	mips16bits m(clock);

	initial begin
		$readmemb("instruction_memory.txt", m.ins_mem.mem);
		$readmemb("data_memory.txt", m.my_data_mem.mem);
		$readmemb("register_contents.txt", m.my_register.regs);
	end
	
	initial begin 
		clock = 1'b0;
		forever #2 clock = ~clock;
	end
	
	always @(posedge clock) begin
		$display("Clock is %1b, Program counter(PC): %d, Aluctr: %3b, AluOp: %3b, AluSrc: %3b, Branch signal: %1b", 
			clock, m.next_program_counter_var, m.aluctr, m.aluop, m.alusrc, m.branch_sig);	
		// $display("Mips ins mem %32b", m.ins_mem.mem[0]);
		
		if (m.next_program_counter_var < rtype_instructions_from_file) begin   // R TYPES
			$display("Instruction => Opcode: %6b, Rs: %4b (Dec: %1d), Rt: %4b (Dec: %1d), Rd: %4b (Dec: %1d), Fnct: %6b ", 
				m.instruction[31:26], m.instruction[25:22], m.instruction[25:22], m.instruction[21:18], m.instruction[21:18],
				m.instruction[17:14], m.instruction[17:14], m.instruction[9:4]);
		end
		else if (m.next_program_counter_var < itype_instructions_from_file) begin   // I TYPES
			$display("Instruction => Opcode: %6b, Rs: %4b (Dec: %1d), Rt: %4b (Dec: %1d), Immediate: %16b", 
			m.instruction[31:26], m.instruction[25:22], m.instruction[25:22], m.instruction[21:18], m.instruction[21:18], m.instruction[17:2]);
		end
		else begin
			$finish;
		end
		
		if     (m.next_program_counter_var > 15) $display("LI Operation");
		else if(m.next_program_counter_var > 14) $display("ORI Operation");
		else if(m.next_program_counter_var > 13) $display("ANDI Operation");
		else if(m.next_program_counter_var > 12) $display("SLTI Operation");
		else if(m.next_program_counter_var > 11) $display("BNE Operation");
		else if(m.next_program_counter_var > 10) $display("BEQ Operation");
		else if(m.next_program_counter_var >  9) $display("SW Operation");
		else if(m.next_program_counter_var >  8) $display("LW Operation");
		else if(m.next_program_counter_var >  7) $display("ADDI Operation");
		else if(m.next_program_counter_var >  6) $display("SRL Operation");
		else if(m.next_program_counter_var >  5) $display("SLL Operation");
		else if(m.next_program_counter_var >  4) $display("OR Operation");
		else if(m.next_program_counter_var >  3) $display("AND Operation");
		else if(m.next_program_counter_var >  2) $display("SLT Operation");
		else if(m.next_program_counter_var >  1) $display("SUB Operation");
		else if(m.next_program_counter_var >  0) $display("ADD Operation");
		$display("A :     %16b\nB :     %16b",
					 m.data_to_read1, m.alu_value2);
		$display("Result: %16b", m.result);
		
		
		// $finish;
	end
	
	
	
	
	
	
	
endmodule
