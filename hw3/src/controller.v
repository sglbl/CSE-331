module controller(input [5:0] opcode, output [2:0] ALUOp, 
					output RegDst, output Branch, output MemRead, output MemToReg,
					output MemWrite, output ALUSrc, output RegWrite);

// instructions as wires
wire rtype;
wire addi;
wire lw;
wire sw;
wire beq;
wire bne;
wire slti;
wire andi;
wire ori;
wire li;
wire [5:0] not_of_opcode;


	// for loop for not operation of opcode
	genvar i; // generation variable to prevent repetition
	generate 
		for (i=0; i<=5; i = i+1) begin: mynotgeneration
			not (not_of_opcode[i], opcode[i]);
		end
	endgenerate

	and a1(rtype, not_of_opcode[5], not_of_opcode[4], not_of_opcode[3], 
				not_of_opcode[2], not_of_opcode[1], not_of_opcode[0]);
	
	and a2(addi, not_of_opcode[5], not_of_opcode[4], not_of_opcode[3], 
				not_of_opcode[2], not_of_opcode[1], opcode[0]);
	
	and a3(lw, not_of_opcode[5], not_of_opcode[4], not_of_opcode[3], 
				not_of_opcode[2], opcode[1], not_of_opcode[0]);

	and a4(sw, not_of_opcode[5], not_of_opcode[4], not_of_opcode[3], 
				not_of_opcode[2], opcode[1], opcode[0]);
				
	and a5(beq, not_of_opcode[5], not_of_opcode[4], not_of_opcode[3], 
				opcode[2], not_of_opcode[1], not_of_opcode[0]);
	
	and a6(bne, not_of_opcode[5], not_of_opcode[4], not_of_opcode[3], 
				opcode[2], not_of_opcode[1], opcode[0]);

	and a7(slti, not_of_opcode[5], not_of_opcode[4], not_of_opcode[3], 
				opcode[2], opcode[1], not_of_opcode[0]);
	
	and a8(andi, not_of_opcode[5], not_of_opcode[4], not_of_opcode[3], 
				opcode[2], opcode[1], opcode[0]);
	
	and a9(ori, not_of_opcode[5], not_of_opcode[4], opcode[3], 
				not_of_opcode[2], not_of_opcode[1], not_of_opcode[0]);

	and a10(li, not_of_opcode[5], not_of_opcode[4], opcode[3], 
				not_of_opcode[2], not_of_opcode[1], opcode[0]);
	
	or o1(ALUOp[0], addi, beq, bne, andi, li);
	or o2(ALUOp[1], lw, sw, beq, bne, ori, li); // most right side
	or o3(ALUOp[2], slti, andi, ori, li); // most left side
	or o4(RegDst, rtype, 1'b0);
	or o5(Branch, beq, bne);
	or o6(MemRead, lw, 1'b0);
	or o7(MemToReg, lw, 1'b0);
	or o8(MemWrite, 1'b0);
	or o9(ALUSrc, addi, andi, ori, slti, lw, sw, li);
	or o10(RegWrite, rtype, addi, andi, ori, slti, lw, li);
	
	
endmodule
