module testbench_alu32();
reg [31:0] A, B;
reg [2:0] ALUop;
reg clk;
wire [63:0] result;
reg reset;

alu32 g0 (A, B, ALUop, reset, clk, result);

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

A = 32'd12345;
B = 32'd21543;

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
$monitor("ALUop: %3b\nA and B: \n%32b\n%32b\nresult: \n%32b\n", ALUop, A, B, result);
end

endmodule