// behavioral adder
//module adder (input a, input b, input c_in, output sum, output c_out);
	// full adder using behavioral model
  // sum = a ^ b ^ c_in;
//	c_out = (a & b) + (a ^ b) & c_in;
	
// endmodule


//module half_adder(input a, input b, output c_out, output sum);
	// behavioral
	//assign c_out = a & b;
	//assign sum = a ^ b;
//endmodule

// 16 bit adder
module adder(input[15:0] a, input[15:0] b, input c_in, output[15:0] sum);
	// temp outputs
	wire c_in1, c_in2, c_in3, c_in4;
	wire c_in5, c_in6, c_in7, c_in8;
	wire c_in9, c_in10, c_in11, c_in12;
	wire c_in13, c_in14, c_in15, c_in16;
	
	// 16 bit full adders of 1 bit. Write eachs result to sum[i] i from 0 to 31
	adder_1_bit fa0_1(a[0], b[0], c_in, sum[0], c_in1);
	adder_1_bit fa1_2(a[1], b[1], c_in1, sum[1], c_in2);
	adder_1_bit fa2_3(a[2], b[2], c_in2, sum[2], c_in3);
	adder_1_bit fa3_4(a[3], b[3], c_in3, sum[3], c_in4);
	adder_1_bit fa4_5(a[4], b[4], c_in4, sum[4], c_in5);
	adder_1_bit fa5_6(a[5], b[5], c_in5, sum[5], c_in6);
	adder_1_bit fa6_7(a[6], b[6], c_in6, sum[6], c_in7);
	adder_1_bit fa7_8(a[7], b[7], c_in7, sum[7], c_in8);
	adder_1_bit fa8_9(a[8], b[8], c_in8, sum[8], c_in9);
	adder_1_bit fa9_10(a[9], b[9], c_in9, sum[9], c_in10);
	adder_1_bit fa10_11(a[10], b[10], c_in10, sum[10], c_in11);
	adder_1_bit fa11_12(a[11], b[11], c_in11, sum[11], c_in12);
	adder_1_bit fa12_13(a[12], b[12], c_in12, sum[12], c_in13);
	adder_1_bit fa13_14(a[13], b[13], c_in13, sum[13], c_in14);
	adder_1_bit fa14_15(a[14], b[14], c_in14, sum[14], c_in15);
	adder_1_bit fa15_16(a[15], b[15], c_in15, sum[15], c_in16);
endmodule

