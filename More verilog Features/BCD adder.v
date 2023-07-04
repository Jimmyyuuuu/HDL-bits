//法一
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    //要做個wire for 每一個BCD之間的cout連接線
    wire [99:0] cout_mid;
    genvar i;
    generate
        for(i=0;i<100;i=i+1)begin:bcd_fadd //因為要有100個BCD Adder
            if(i==0) begin
                bcd_fadd instan1(a[3:0],b[3:0],cin,cout_mid[0],sum[3:0]);  
            end
            else begin
                bcd_fadd instan1(a[4*i+3:4*i],b[4*i+3:4*i],cout_mid[i-1],cout_mid[i],sum[4*i+3:4*i]); //每一次計算，a,b,sum都會用掉4個位元 
            end
        end
    endgenerate
    assign cout=cout_mid[99];   
endmodule
//法二

module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [99:0] cout_temp;
	genvar i;
    generate
        for(i=0;i<100;i++) begin:bcd_fadd
            if(i == 0)
                bcd_fadd bcd_inst(a[3:0],b[3:0],cin,cout_temp[0],sum[3:0]);
            else
                bcd_fadd bcd_inst(a[4*i+3:4*i],b[4*i+3:4*i],cout_temp[i-1],cout_temp[i],sum[4*i+3:4*i]);
        end
        assign cout = cout_temp[99];
    endgenerate
endmodule
