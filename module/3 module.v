module top_module ( input clk, input d, output q );
    wire w0,w1;
    my_dff dff0(clk,d,w0);
    my_dff dff1(clk,w0,w1);
    my_dff dff2(clk,w1,q);
endmodule