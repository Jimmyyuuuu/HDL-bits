module top_module( 
    input [7:0] in,
    output [7:0] out
); //assign out[7:0] = in[0:7]; does not work because Verilog does not allow vector bit ordering to be flipped.
    assign out={in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};

endmodule

// 別種方式
// loop 
// always @(*) begin
// for(int i=0; i<8;i++)
// out[i]=in[8-i-1];
// end