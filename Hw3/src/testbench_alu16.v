module testbench_alu16();
reg [15:0] A, B;
reg [2:0] ALUop;
reg clk;
wire [31:0] result;
reg reset;

alu16 g0 (A, B, ALUop, reset, clk, result);

initial begin
clk = 0;
end

initial begin 
	forever begin
	#2; 
	clk = ~clk;
	end 
end

initial begin

A = 16'd1234;
B = 16'd2154;

//A = 32'd67;
//B = 32'd883;

ALUop = 3'b000;
#20;

ALUop = 3'b001;
#20;

reset = 0;
ALUop = 3'b010;
#1000;

ALUop = 3'b011;
#500;

ALUop = 3'b100;
#20;

ALUop = 3'b101;
#20;

ALUop = 3'b110;
#20;

ALUop = 3'b111;
#20;

$stop();
end

initial begin
$monitor("Select: %3b\nA and B: \n%16b\n%16b\nresult: \n%16b\n", ALUop, A, B, result);
end

endmodule