module alucontrol(input [2:0] aluop, input [2:0] func, output [2:0] aluctr);
	wire aluctr2_and1;
	wire aluctr2_and2;
	
	wire aluctr1_and1;
	wire aluctr1_and2;
	wire aluctr1_and3;
	wire aluctr1_and4;
	
	wire aluctr0_and1;
	wire aluctr0_and2;
	wire aluctr0_and3;

	wire [2:0] not_of_aluop, not_of_func;
	
	// for loop for not operation of opcode
	genvar i; // generation variable to prevent repetition
	generate 
		for (i=0; i<=2; i = i+1) begin: mynotgeneration
			not (not_of_aluop[i], aluop[i]);
			not (not_of_func[i], func[i]);
		end
	endgenerate
	
	
	// for ALUctr[2] 
	and a0(aluctr2_and1, not_of_aluop[2], not_of_aluop[1], not_of_aluop[0], func[2]);
	and a1(aluctr2_and2, aluop[2], aluop[1], not_of_aluop[0]);
	or o0(aluctr[2], aluctr2_and1, aluctr2_and2);
	
	// For ALUctr[1] 
	and a2(aluctr1_and1, not_of_aluop[2], not_of_aluop[1], not_of_aluop[0], func[1]);
	and a3(aluctr1_and2, aluop[2], not_of_aluop[1]);
	or o1(aluctr[1], aluctr1_and1, aluctr1_and2);		
	
	// For ALUctr[0]
	and a6(aluctr0_and1, not_of_aluop[2], not_of_aluop[1], not_of_aluop[0], func[0]);
	and a7(aluctr0_and2, not_of_aluop[2], aluop[1], aluop[0]);
	and a8(aluctr0_and3, aluop[2], not_of_aluop[1], aluop[0]);
	or o2(aluctr[0], aluctr0_and1, aluctr0_and2, aluctr0_and3);	

endmodule
