module top_module (
    input clk,
    input d,
    output q
);
    reg q_ff1, q_ff2; // 内部寄存器存储输出值

    always @(posedge clk) begin
        q_ff1 <= d; // 上升沿触发，存储值进入 q_ff1
    end
    
    always @(negedge clk) begin
        q_ff2 <= d; // 下降沿触发，存储值进入 q_ff2
    end
    
    assign q = clk ? q_ff1 : q_ff2; // 根据时钟信号选择输出 q_ff1 或 q_ff2

endmodule