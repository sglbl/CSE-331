// Control unit behavioral 
module control(input reg_least_bit, input ctr32, input reset, input clk,
				output add_or_shift, output load_higher, output mult_or_shift, output load_lower, output reset_or_increment, output load_loop_checker);

	reg [2:0] R;
	wire [2:0] N;
	
	wire not_reg_least_bit, notR2, notR1, notR0, reset_wire;
	assign notR2 = ~R[2];
	assign notR1 = ~R[1];
	assign notR0 = ~R[0];
	assign reset_wire = (R[2] & notR1 & R[0] & ~reset);

	/*N2 output of table = R2’.R1.R0 + R2.R1’.R0’.ctr32 + R2.R1’.R0.reset’*/
	assign N[2] = ((notR2 & R[1] & R[0]) |
						(R[2] & notR1 & notR0 & ctr32) |
						reset_wire);

	/*N1 output of table = R2’.R1’.R0 + R2’.R1.R0’ */
	assign N[1] = ((notR2 & notR1 & R[0]) |
						(notR2 & R[1] & notR0));
						

	/*N0 output of table = R2’.R1’.R0’ + R2’.R1’.R0. reg_least_bit’ + R2’.R1.R0’ + R2.R1’.R0’ + R2.R1’.R0.Reset’*/
	assign N[0] = ((notR2 & notR1 & notR0) |
						(notR2 & notR1 & R[0] & not_reg_least_bit) |
						(notR2 & R[1] & notR0) |
						(R[2] & notR1 & notR0) | reset_wire);

	assign not_reg_least_bit = ~reg_least_bit;
	/*mult_or_shift = R2’.R1’.R0’*/
	assign mult_or_shift = (notR2 & notR1 & notR0);

	/*load_lower = R2’.R1’.R0’ + R2’.R1.R0*/
	assign load_lower = ((notR2 & notR1 & notR0) | (notR2 & R[1] & R[0]));

	/*Load_loop_checker = R2’.R1’.R0’ + R2’.R1.R0’*/
	assign load_loop_checker = ((notR2 & notR1 & notR0) | (notR2 & R[1] & R[0]));

	/*reset_or_increment = R2’.R1’.R0’*/
	assign reset_or_increment = (notR2 & notR1 & notR0);

	/*add_or_shift = R2’.R1.R0’*/
	assign add_or_shift = (notR2 & R[1] & notR0);

	/*Load_higher = R2’.R1.R0’+ R2'.R1.R0*/
	assign load_higher = ((notR2 & R[1] & notR0) | (notR2 & R[1] & R[0]));
	
	// debug purpose only
	//always @*
    //$display("1Control: add_or_sh =%b, mult_or_shift= %b, res_or_inc= %b",add_or_shift, mult_or_shift, reset_or_increment);	 
	

	initial begin
		// start from 3 bit binary 0
		R = 3'b000;
	end


	always @ (posedge clk)
	begin
		R <= N;
	end

endmodule
