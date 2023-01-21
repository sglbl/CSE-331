module add_fsm(
	input 			go,
	input 	[5:0]	a,
	input 	[5:0]	b,
	input				reset,
	input				CLK,
	output reg [5:0] result

);


reg [5:0] x;
reg [5:0] y;

localparam 	S0 = 2'd0,
				S1 = 2'd1,
				S2 = 2'd2,
				S3 = 2'd3;
				
reg [1:0] present_state;



always @(posedge CLK)
	begin
	if(reset)
		present_state <= S0;
	else
	begin
		case(present_state)
				
				S0:
					begin
					if(go)
						present_state <= S1;			
					end
					
				
				S1:
					begin
						x <= a + b;
						present_state <= S2;
					end
					
				
				S2:
					begin
						y <= x + 6'd3;
						present_state <= S3;
					end
					
				
				S3:
					begin
					result <= x + y;
					present_state <= S0;
					end
					
				
				
			endcase
		end
	end

endmodule
