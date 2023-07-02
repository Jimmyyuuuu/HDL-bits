//根據lower_adder的cout值 來決定要哪一個upper_adder ( cout=1 or 0 兩種結果)
module top_module(input [31:0] a, input [31:0] b,output [31:0] sum);
    wire [15:0] w1,w2,w3;
    add16 lower_adder(.a(a[15:0]),.b(b[15:0]),.cin(0),.sum(sum[15:0]),.cout(w3));
    add16 upper1_adder(.a(a[31:16]),.b(b[31:16]),.cin(0),.sum(w1));
    add16 upper2_adder(.a(a[31:16]),.b(b[31:16]),.cin(1),.sum(w2));
    always@(*)
        case(w3)
            1'b0: sum[31:16]=w1;
            1'b1: sum[31:16]=w2;
        endcase
    assign sum=sum[31:0];
endmodule
  