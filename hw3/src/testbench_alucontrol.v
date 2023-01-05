module testbench_aluocontrol();
	// regs as input
	reg [2:0] aluop, func;
	
	// wires as output
	wire [2:0] aluctr;
	
	alucontrol myalucontrol(aluop, func, aluctr);
	
	initial begin
		func = 3'd0;
		aluop = 3'd0;
		#25;
		
		func = 3'd1;
		#25;
		
		func = 3'd2;
		#25;
		
		func = 3'd3;
		#25;
		
		func = 3'd4;
		#25;
		
		func = 3'd5;
		#25;
		
		func = 3'd0; // func is not important because not r type anymore
		aluop = 3'd1;
		#25;
	
		aluop = 3'd2;
		#25;
		
		aluop = 3'd3;
		#25;
		
		aluop = 3'd4;
		#25;
		
		aluop = 3'd5;
		#25;
		
		aluop = 3'd6;
		#25;
		
		aluop = 3'd7;
		#25;
	
	end 
	
	// monitoring
	initial begin
		$monitor("ALUOp: %3b, Funct: %3b, AluCtr: %3b\n", aluop, func, aluctr);
	end
	


endmodule