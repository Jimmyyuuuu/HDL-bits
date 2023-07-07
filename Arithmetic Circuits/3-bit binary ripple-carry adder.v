//法一
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    
    add0 add1(.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(cout[0]));
    add0 add2(.a(a[1]),.b(b[1]),.cin(cout[0]),.sum(sum[1]),.cout(cout[1]));
    add0 add3(.a(a[2]),.b(b[2]),.cin(cout[1]),.sum(sum[2]),.cout(cout[2]));

             endmodule
module add0(input a,input b,input cin, output sum, output cout);
    assign sum=a^b^cin;
    assign cout=a&b|b&cin|a&cin;
endmodule
//法2 for loop
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    integer i;
    always @(*) begin
        for (i=0; i<3; i=i+1) begin
            if (i == 0) begin
                sum[i] = a[i] ^ b[i] ^ cin;
                cout[i] = a[i] & b[i] | b[i] & cin | a[i] & cin;
            end
            else begin
                sum[i] = a[i] ^ b[i] ^ cout[i-1];
                cout[i] = a[i] & b[i] | b[i] & cout[i-1] | a[i] & cout[i-1];
            end
        end
    end
endmodule
