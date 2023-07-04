//法1
module top_module( 
    input  [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    genvar i;
    generate
        for(i=0;i<100;i=i+1)begin:adder //這個name 很重要!!，一定要取名
            if(i==0)
                assign {cout[0],sum[0]} = a[0]+b[0]+cin;
            else
                assign {cout[i],sum[i]} = a[i]+b[i]+cout[i-1];
        end
            
    endgenerate
endmodule
//法2 
module top_module( 
    input  [99:0] a, b,
    input cin,
    output reg [99:0] cout,
    output reg [99:0] sum );
    genvar i;
    generate
        for(i=0;i<100;i=i+1)begin : adder //這個name 很重要!!，一定要取名
            if(i==0) begin
                assign sum[0] = a[0]^b[0]^cin;
                assign cout[0] = (a[0]&b[0])|(a[0]&cin)|(b[0]&cin);
        end
            else begin
                assign sum[i] = a[i]^b[i]^cout[i-1];
                assign cout[i] = (a[i]&b[i])|(a[i]&cout[i-1])|(b[i]&cout[i-1]);
        end
        end
        
    endgenerate
endmodule