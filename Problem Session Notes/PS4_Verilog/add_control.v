module add_control(
	input go,
	input	reset,
	input	CLK,
	output reg enx,
	output reg eny,
	output reg sa,
	output reg sb,
	output reg sy

);




localparam 	S0 = 2'd0,
				S1 = 2'd1,
				S2 = 2'd2,
				S3 = 2'd3;
				
reg	[1:0] present_state;
reg	[1:0] next_state = S0;


//State Register
always @(posedge CLK)
	begin
	if(reset)
		present_state <= S0;
	else
		present_state <= next_state;
	end

//Next State Logic
always @(*)
	begin
		next_state = S0;
		case(present_state)
				
				S0:
					begin
					if(go)
						next_state = S1;			
					end
					
				
				S1:
					begin
						next_state = S2;
					end
					
				
				S2:
					begin
						next_state = S3;
					end
					
				
				S3:
					begin
					next_state = S0;
					end
					
				
				
			endcase
	end

//Outputs
always @(*)
		begin
			sa 		= 1'b0;
			sb 		= 1'b0;
			sy 		= 1'b0;
			enx 		= 1'b0;
			eny 		= 1'b0;
			case(present_state)
							
				S1:
					begin
					sa = 1'b1;
					sb = 1'b1;
					end
								
				
				S2:
					begin
					enx 	= 1'b1;
					sa = 1'b0;
					sb = 1'b0;
					end
					
				
				S3:
					begin	
			
					eny 	= 1'b1;
					enx 	= 1'b0;
					sy 	= 1'b1;
					end
						
			endcase
			
		end				


endmodule
