module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
// 兩個add16合併成add32
    wire lower_cout;
    add16 lower_adder(.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(sum[15:0]),.cout(lower_cout));
    add16 upper_adder(.a(a[31:16]),.b(b[31:16]),.cin(lower_cout),.sum(sum[31:16]));
    assign sum = sum[31:0];
endmodule
//add1的公式
module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign sum= a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
endmodule
