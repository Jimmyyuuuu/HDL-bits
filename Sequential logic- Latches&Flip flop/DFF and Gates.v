module top_module (
    input clk,
    input x,
    output z
); 
    reg [2:0] w;
    always@(posedge clk) begin
        w[0]<= w[0]^x;
        w[1]<= (~w[1])&x;
        w[2]<= (~w[2])|x;
    end
    assign z= ~(|w);
    
    

endmodule
