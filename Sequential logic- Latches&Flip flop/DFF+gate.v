module top_module (
    input clk,
    input in, 
    output out);
    wire d;
    
    always@(posedge clk) begin
        out <= in ^out;
    end
   
endmodule