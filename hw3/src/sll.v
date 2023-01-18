module sll(input [15:0] a, input [15:0] b, output [15:0] result);

    // sll $rd, $rs, shamt
    // R[$rd] ← R[$rs] << shamt
    
    // a= rs
    // b= shamp
    // result= rd

    assign result = a << b[3:0];
    

endmodule