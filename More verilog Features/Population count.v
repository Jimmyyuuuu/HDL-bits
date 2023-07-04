module top_module( 
    input [254:0] in,
    output [7:0] out );
    integer i;
    //in，out的位元數不一樣 所以要想辦法! 
    always@(*)
        begin
        out = 8'd0;
        for(i=0;i<255;i=i+1)
            out= in[i]?(out+8'd1): out;//(如果in[i]為1，就等於out要count+1，如果in[i]=0，out就繼續維持不變
       
        end
            

endmodule