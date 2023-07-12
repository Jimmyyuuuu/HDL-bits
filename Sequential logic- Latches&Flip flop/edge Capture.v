module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] in_d;
    always @(posedge clk)
        in_d <= in; //將上一狀態的in存到in_d
    
    
    reg		[31:0] 	out_reg;
	assign out_reg = ~in&in_d; //檢測下降沿
  
    
    //这里需要把每位分開表示，不能放在一起操作
    always @(posedge clk) begin 
        if(reset) 
            out <= 0; //reset=1時，output被強制改為0
        else begin
            for(int i=0;i<32;i=i+1) begin
                if(out_reg[i]==1'b1)   //有哪位出现了下降沿，哪位數據就發生改變
                    out[i] <= 1'b1;
                else                   //沒有下降沿的話，輸出保持不變
                    out[i] <= out[i];
            end
        end
    end

endmodule