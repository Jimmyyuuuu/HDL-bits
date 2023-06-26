module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not   );
    assign out_or_bitwise = a|b;
    assign out_or_logical = a||b;
    assign out_not [2:0] = ~a;
    assign out_not [5:3] = ~b;

endmodule
// 位元運算子(bitwise operator) 和 邏輯運算子(logical operator) 語法不同 !