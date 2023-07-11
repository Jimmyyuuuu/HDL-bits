module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
); //非同步reset ， 不用等到clk正緣或負緣觸發，自己就可以觸發
    always@(posedge clk or posedge areset)begin
        if(areset)
            q<=8'd0;
        else
            q<=d;
    end

endmodule
