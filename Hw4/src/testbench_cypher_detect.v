module testbench_cypher_detect();
	// inputs
	reg [15:0] cypher;
	reg [3:0] read_input_from;
	reg read_input = 1'b0; /* similar to clock */
	reg reset; 
	reg clk = 1'b0;
	
	//outputs
	wire collected_signal;
	wire [7:0] result;
	
	cypher_detect detector(cypher, read_input_from, read_input, reset, clk, collected_signal, result);

	always begin 
		#2; 
		read_input = ~read_input;
	end
	
	always begin 
		#2; 
		clk = ~clk;
	end

	initial begin
		reset = 1'b1;
		cypher = 16'b0100001100100001;

		#6	
		reset = 1'b0;
		read_input_from = 4'b0001;
		
		#6
		read_input_from = 4'b0010; //2
		
		#6	
		read_input_from = 4'b0011; //3
		
		#6	
		read_input_from = 4'b0100; //4
		
		#6	
		read_input_from = 4'b0101; //5
		
		#6
		read_input_from = 4'b0110; //6
		
		#6
		read_input_from = 4'b0111; //7
		
		#6
		read_input_from = 4'b1000; //8
		
		#6	
		read_input_from = 4'b0001; // 1
		
		
		#6
		reset = 1'b0;
	end

initial begin
	$monitor("ReadInput: %1b, Cypher: %16b\nRead input from: %4b\nResult: \n%32b\n", read_input, cypher, read_input_from, result);
end

endmodule