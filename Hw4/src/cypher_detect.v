module cypher_detect (input [15:0] cypher, input [3:0] read_input_from, input read_input, /* clock */ input reset, input clk, 
							output collected_signal, output [7:0] result);

	wire wr_result;
	wire wr_cmatch;
	wire sl_cmatch;
	wire sl_input;
	wire stop;
	wire matched;
	wire [7:0] temp_result;
	
	assign result = temp_result;
	
	datapath d0(
					.wr_result(wr_result),
					.wr_cmatch(wr_cmatch),
					.sl_cmatch(sl_cmatch),
					.sl_input(sl_input),
					.cypher(cypher),
					.read_input_from(read_input_from),
					.read_input(read_input),
					.clk(clk),
					.matched(matched),
					.collected_signal(collected_signal),
					.stop(stop),
					.result(temp_result)
					);
					
	control c0(
					.wr_result(wr_result),
					.wr_cmatch(wr_cmatch),
					.sl_cmatch(sl_cmatch),
					.sl_input(sl_input),
					.read_input(read_input),
					.matched(matched),
					.stop(stop),
					.clk(clk),
					.reset(reset)
					);

endmodule
