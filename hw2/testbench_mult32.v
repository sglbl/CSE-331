module testbench_mult32();
	reg reset, clk;
	reg [31:0] A, B;
	wire [63:0] result;
	wire [2:0] R;
	mult32 g0 (A, B, reset, clk, result);

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
		A = 32'd67;
		B = 32'd883;
		reset = 0;
		#1000;

		$stop();
	end

endmodule
