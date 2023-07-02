//法1 sub使用32次(複製)
module top_module(input [31:0] a,input [31:0] b,input sub, output [31:0] sum);
    wire lower_cout;
    reg [31:0] b_sub;
    assign b_sub=b^{32{sub}};
    add16 lower_adder(.a(a[15:0]),.b(b_sub[15:0]),.cin(sub),.sum(sum[15:0]),.cout(lower_cout));
    add16 upper_adder(.a(a[31:16]),.b(b_sub[31:16]),.cin(lower_cout),.sum(sum[31:16]));
    assign sum = sum[31:0];

endmodule
//法2 使用2-1MUX來模擬

module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout1;
    reg [31:0] b_in;
    always @(*) begin
        if(sub) 
            b_in = ~(b[31:0]);
        else
            b_in = b[31:0];
    end           
    add16 add16_1(a[15:0], b_in[15:0], sub, sum[15:0], cout1);
    add16 add16_2(a[31:16], b_in[31:16], cout1, sum[31:16]);
endmodule
————————————————
版权声明：本文为CSDN博主「sdf_4869」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/qq_41508392/article/details/125188262