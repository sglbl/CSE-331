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

// 32 bit adder
module adder(input[31:0] a, input[31:0] b, input c_in, output[31:0] sum);
	// temp outputs
	wire c_in1, c_in2, c_in3, c_in4;
	wire c_in5, c_in6, c_in7, c_in8;
	wire c_in9, c_in10, c_in11, c_in12;
	wire c_in13, c_in14, c_in15, c_in16;
	wire c_in17, c_in18, c_in19, c_in20;
	wire c_in21, c_in22, c_in23, c_in24;
	wire c_in25, c_in26, c_in27, c_in28;
	wire c_in29, c_in30, c_in31, c_in32;
	
	// 32 full adders of 1 bit. Write eachs result to sum[i] i from 0 to 31
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
	adder_1_bit fa16_17(a[16], b[16], c_in16, sum[16], c_in17);
	adder_1_bit fa17_18(a[17], b[17], c_in17, sum[17], c_in18);
	adder_1_bit fa18_19(a[18], b[18], c_in18, sum[18], c_in19);
	adder_1_bit fa19_20(a[19], b[19], c_in19, sum[19], c_in20);
	adder_1_bit fa20_21(a[20], b[20], c_in20, sum[20], c_in21);
	adder_1_bit fa21_22(a[21], b[21], c_in21, sum[21], c_in22);
	adder_1_bit fa22_23(a[22], b[22], c_in22, sum[22], c_in23);
	adder_1_bit fa23_24(a[23], b[23], c_in23, sum[23], c_in24);
	adder_1_bit fa24_25(a[24], b[24], c_in24, sum[24], c_in25);
	adder_1_bit fa25_26(a[25], b[25], c_in25, sum[25], c_in26);
	adder_1_bit fa26_27(a[26], b[26], c_in26, sum[26], c_in27);
	adder_1_bit fa27_28(a[27], b[27], c_in27, sum[27], c_in28);
	adder_1_bit fa28_29(a[28], b[28], c_in28, sum[28], c_in29);
	adder_1_bit fa29_30(a[29], b[29], c_in29, sum[29], c_in30);
	adder_1_bit fa30_31(a[30], b[30], c_in30, sum[30], c_in31);
	adder_1_bit fa31_32(a[31], b[31], c_in31, sum[31], c_in32);
		
endmodule

