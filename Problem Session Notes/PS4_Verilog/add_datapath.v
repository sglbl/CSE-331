module add_datapath(
	input	[5:0] a,
	input	[5:0] b,
	input CLK,
	input enx,
	input eny,
	input sa,
	input sb,
	input sy,
	output reg [5:0] result
);


reg [5:0] xi;
reg [5:0] yi;
reg [5:0] to_xi;
reg [5:0] to_yi;


reg [5:0] add_res;
reg [5:0] to_addA;
reg [5:0] to_addB;

//Define Datapath Registers
always @(posedge CLK)
	begin
		if(enx)
			xi <= to_xi;
		if(eny)
			yi <= to_yi;
	end


//Combinational Datapath	
always @(*)
	begin
	//********MUXes**********
		//MUX_A
		if(sa)
			to_addA = a;
		else
			to_addA = xi;
		
		//MUX_YI
		if(sb)
			to_addB = b;
		else if(sy)
			to_addB = yi;
		else
			to_addB = 6'd3;
		
		//MUX_SUB
		if(enx)
			to_xi = add_res;		
		else if(eny)
			to_yi = add_res;
		else
			result = add_res;
			
		//*******ARITH COMPONENTS**********
		add_res 	= to_addA + to_addB;	
		

		
	end
	


endmodule