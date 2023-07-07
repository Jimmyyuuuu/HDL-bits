//法1
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum
);
    wire [3:0] cout;
    integer i;
    
    always @ (*) begin
        for (i=0; i<4; i=i+1) begin
            if (i == 0) begin
                sum[0] = x[0] ^ y[0] ^ 1'b0;
                cout[0] = x[0] & y[0] | y[0] & 1'b0 | x[0] & 1'b0;
            end
            else begin
                sum[i] = x[i] ^ y[i] ^ cout[i-1];
                cout[i] = x[i] & y[i] | y[i] & cout[i-1] | x[i] & cout[i-1];
            end
        end
    end
    
    assign sum[4] = cout[3];
    
endmodule
//法2 generate

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [3:0] cout;
    genvar i;
    generate
        for(i=0;i<4;i=i+1) begin:adder
            if(i==0)
            	FA u1 (.a(x[0]),.b(y[0]),.sum(sum[0]),.cout(cout[0]));
            else
                FA u1 (.a(x[i]),.b(y[i]),.cin(cout[i-1]),.sum(sum[i]),.cout(cout[i])); 
        end
        assign sum[4] = cout[3];
    endgenerate
endmodule
module FA ( input a, input b, input cin,   output sum, output cout );
	assign sum = a^b^cin;
    assign cout = a&b|a&cin|b&cin;
endmodule