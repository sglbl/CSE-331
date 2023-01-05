module testbench_control();
	// writing controller inputs as reg, controller outputs as wire.
	reg [5:0] Opcode;
	wire [2:0] ALUOp;
	wire RegDst;
	wire Branch;
	wire MemRead;
	wire MemToReg;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	
	controller mycontroller(Opcode, ALUOp, RegDst, Branch,
						MemRead, MemToReg, MemWrite, ALUSrc, RegWrite);
	
	initial begin
		Opcode = 4'b0000;
		#25
		Opcode = 4'b0001;
		#25
		Opcode = 4'b0010;
		#25
		Opcode = 4'b0011;
		#25
		Opcode = 4'b0100;
		#25
		Opcode = 4'b0101;
		#25
		Opcode = 4'b0110;
		#25
		Opcode = 4'b0111;
		#25
		Opcode = 4'b1000;
		#25
		Opcode = 4'b1001;

//		$stop();
	end
	
	initial begin
		$monitor("Opcode: %6b\nRegDst: %1b, Branch: %1b, MemRead: %1b, MemToReg: %1b,  MemWrite: %1b, ALUSrc: %1b, RegWrite: %1b, ALUOp: %3b\n",
				Opcode, RegDst, Branch, MemRead, MemToReg, MemWrite, ALUSrc, RegWrite, ALUOp); 
	end

endmodule
