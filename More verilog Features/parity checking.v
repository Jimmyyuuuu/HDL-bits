module top_module (
    input [7:0] in,
    output parity); 
    always@(*)
        parity = ^in[7:0];
endmodule
