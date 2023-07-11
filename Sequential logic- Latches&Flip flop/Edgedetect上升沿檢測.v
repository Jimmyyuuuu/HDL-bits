module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
); //當in從0->1時，經過一個clk，pedge會從0->1(跑一個cycle)，pedge晚in一個cycle
    reg [7:0] in_d; //要讓in 過一個d-flip flop
    always@( posedge clk) begin
        in_d<=in;
        pedge<=(~in_d)&in;
        
    end

endmodule