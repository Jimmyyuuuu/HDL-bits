module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
  
    wire lower_cout;
    add16 lower_adder(.a(a[15:0]),.b(b[15:0]),.sum(sum[15:0]),.cout(lower_cout));
    add16 upper_adder(.a(a[31:16]),.b(b[31:16]),.cin(lower_cout),.sum(sum[31:16]));
    assign sum = sum[31:0];
endmodule