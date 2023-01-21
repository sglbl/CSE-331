module testbench_add();
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
		
		if(m.next_program_counter_var == 0) begin
			$display("Clock is %1b, Program counter(PC): %d, Aluctr: %3b, AluOp: %3b, AluSrc: %3b, Branch signal: %1b", 
				clock, m.next_program_counter_var, m.aluctr, m.aluop, m.alusrc, m.branch_sig);	
				
			$display("ADD Operation");
			$display("Instruction => Opcode: %6b, Rs: %4b (Dec: %1d), Rt: %4b (Dec: %1d), Rd: %4b (Dec: %1d), Fnct: %6b ", 
				m.instruction[31:26], m.instruction[25:22], m.instruction[25:22], m.instruction[21:18], m.instruction[21:18],
				m.instruction[17:14], m.instruction[17:14], m.instruction[9:4]);
				
			$display("A :     %16b\nB :     %16b",
					 m.data_to_read1, m.alu_value2);
			$display("Result: %16b", m.result);
		end
		/* else if (m.next_program_counter_var < itype_instructions_from_file) begin   // I TYPES
			$display("Instruction => Opcode: %6b, Rs: %4b (Dec: %1d), Rt: %4b (Dec: %1d), Immediate: %16b", 
			m.instruction[31:26], m.instruction[25:22], m.instruction[25:22], m.instruction[21:18], m.instruction[21:18], m.instruction[17:2]);
		end */
		else begin
			$writememb("register_end.txt", m.my_register.regs);
			$writememb("datamem_end.txt",  m.my_data_mem.mem);
			$finish;
		end
		
		
		// $finish;
	end
	
	
	
	
	
	
	
endmodule
