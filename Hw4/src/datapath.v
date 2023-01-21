module datapath(
	input wr_result,
	input wr_cmatch,
	input sl_cmatch,
	input sl_input,
	input [15:0] cypher,
	input [3:0] read_input_from,
	input read_input,
	input clk,
	output matched,
	output collected_signal,
	output stop, // instead of reset
	output [7:0] result);
	
// regs are variables
reg [7:0] reg_result;
reg [3:0] reg_read_input_from;
reg [15:0] reg_cipher;
reg [3:0] reg_cmatch;
reg reg_matched;
wire [7:0] w_result;
wire [3:0] w_cmatch;
wire [3:0] w_itsum;


// assign w_result 	= reg_result + reg_read_input_from;

assign result	= reg_result;
assign matched = reg_matched;
assign stop 	= reg_cmatch >= 4;
assign collected_signal = stop;

/*MUXes*/
/*
adder için register productin son 32 biti ile topluyor

assign "a ? b : c" aslinda mux gibi

structural mux uretiyormus always yok diye. hoca izin verdi.
*/
assign w_cmatch 	= sl_cmatch ? w_itsum : 3'd0;
assign w_itsum 	= wr_cmatch ? reg_cmatch + 3'd1 : 4'b0;
assign w_result = sl_input ? 8'b00000000 : reg_result;

/*Registers*/
/*
posedge(pozitif edge)'de "=" kullanma. 2si de b olur.
Donanim oldugu icin "<=" kullan

always(*)
demekki blok içindeki biri değiştiği anda hepsini bi daha hesapliyor.
control için alwaysli yapılıyor.

iteration’i datapathte her seferinde 1 arttiriyoruz.
controlde de select_iteration ve write_iteration’ı 1 yapiyoruz 
shift stateinde.

eger always içinde kullanicaksan parametrede output yapma yoksa wire olur,
onun yerine output reg yap.

*/
always @ (posedge clk) begin

	if(wr_cmatch)
		reg_cmatch <= w_cmatch;
	//assign w_cypher_i	= cypher[w_itsum*4+3 : w_itsum*4];
	if(cypher[w_itsum*4+3 -: 4] == reg_read_input_from)
		reg_matched <= 1;
	else
		reg_matched <= 0;
	if(wr_result)
		reg_result <= w_result + read_input_from;
end

always @ (posedge read_input) begin
		reg_read_input_from <= read_input_from;
end

endmodule
