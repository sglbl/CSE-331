module controller(input reg_least_bit, input ctr32, input reset, input clk,
				output add_or_shift, output load_higher, output mult_or_shift, output load_lower, output reset_or_increment, output load_loop_checker);

	wire notR2;
	wire notR1;
	wire notR0; 
	reg [2:0] R;
	wire [2:0] N;
	wire not_reg_least_bit;

	wire reset_wire;
	wire [8:0] and_wires;
	
	not notgate2 (notR0, R[0]);
	not notgate1 (notR1, R[1]);
	not notgate0 (notR2, R[2]);

	/*N2 output of table = R2’.R1.R0 + R2.R1’.R0’.ctr32 + R2.R1’.R0.reset’*/
	and andgate1 (and_wires[0], notR2, R[1], R[0]);
	and andgate2 (and_wires[1], R[2], notR1, notR0, ctr32);
	and andgate3 (reset_wire, R[2], notR1, R[0], ~reset);
	or orgate1 (N[2], and_wires[0], and_wires[1], reset_wire);

	/*N1 output of table = R2’.R1’.R0 + R2’.R1.R0’ */
	and andgate4 (and_wires[2], notR2, notR1, R[0]);
	and andgate5 (and_wires[3], notR2, R[1], notR0);
	or orgate2 (N[1], and_wires[2], and_wires[3]);

	/*N0 output of table = R2’.R1’.R0’ + R2’.R1’.R0. reg_least_bit’ + R2’.R1.R0’ + R2.R1’.R0’ + R2.R1’.R0.Reset’*/
	and andgate6 (and_wires[4], notR2, notR1, notR0);
	and andgate7 (and_wires[5], notR2, notR1, R[0], not_reg_least_bit);
	not notgate4 (not_reg_least_bit, reg_least_bit);
	and andgate8 (and_wires[6], notR2, R[1], notR0);
	and andgate9 (and_wires[7], R[2], notR1, notR0);
	or orgate3 (N[0], and_wires[4], and_wires[5], and_wires[6], and_wires[7], reset_wire);

	/*mult_or_shift = R2’.R1’.R0’*/
	not notgate5 (mult_or_shift, ~and_wires[4]);

	/*load_lower = R2’.R1’.R0’ + R2’.R1.R0*/
	or orgate4 (load_lower, and_wires[4], and_wires[0]);

	/*Load_loop_checker = R2’.R1’.R0’ + R2’.R1.R0’*/
	or orgate5 (load_loop_checker, and_wires[4], and_wires[0]);

	/*reset_or_increment = R2’.R1’.R0’*/
	not notgate6 (reset_or_increment, ~and_wires[4]);

	/*add_or_shift = R2’.R1.R0’*/
	not notgate7 (add_or_shift, ~and_wires[3]);

	/*Load_higher = R2’.R1.R0’+ R2'.R1.R0*/
	or orgate6 (load_higher, and_wires[3], and_wires[0]);

	always @*
    $display("2Controller: add_or_sh =%b, mult_or_shift= %b, res_or_inc= %b",add_or_shift, mult_or_shift, reset_or_increment);	 
	
	initial begin
		// start from 3 bit binary 0
		R = 3'b000;
	end


	always @ (posedge clk)
	begin
		R <= N;
	end

endmodule
