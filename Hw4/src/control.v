module control(
	output reg wr_result,
	output reg wr_cmatch,
	output reg sl_cmatch,
	output reg sl_input,
	input read_input, // my added signal
	input matched, // my added signal
	input stop,
	input clk,
	input reset);
	
reg [1:0] current_state, next_state;

localparam	IDLE 		= 2'b00,
				DECIDE	= 2'b01,
				ADD 		= 2'b10,
				INC		= 2'b11;
	
//state register
always @ (posedge clk) begin
	if(reset)
		current_state <= IDLE;
	else 
		current_state <= next_state;
end
	
//next state logic
always @ (*) begin
	case (current_state)
		IDLE: begin
			next_state = DECIDE;
		end
			
		DECIDE: begin
			if(stop)
				next_state = DECIDE;
			else
				next_state = ADD;
		end
		
		ADD: begin
			if(matched)
				next_state = INC;
			else
				next_state = DECIDE;
		end
		
		INC: begin
			next_state = DECIDE;
		end
	endcase
end

//Outputs
always @ (*) begin
	wr_result 			= 1'b0;
	wr_cmatch	 		= 1'b0;
	sl_cmatch    		= 1'b0;
	sl_input				= 1'b0;
	// matched			= 1'b0;
	
	case (current_state)
		IDLE: begin
			wr_result 			= 1'b1;
			wr_cmatch	 		= 1'b1;
			sl_cmatch			= 1'b0;
			sl_input 			= 1'b1;
		end
			
		DECIDE: begin
			// no change inside
		end
		
		ADD: begin
			wr_result 		= 1'b1;
			sl_input 		= 1'b0;
		end
		
		INC: begin
			sl_input 		= 1'b0;
			sl_cmatch		= 1'b1;
			wr_cmatch 		= 1'b1;
		end
	endcase
end
	
endmodule
