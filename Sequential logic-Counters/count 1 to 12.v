//法1
module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //

count4 the_counter (clk, c_enable, c_load, c_d, Q );
    
assign c_enable = enable;  //直接将输入的使能信号给到c_enable即可
    
    //组合逻辑，同步复位
    always @(*) begin
        if(reset == 1'b1) begin
            c_load = 1'b1;    //這裡的初值题目似乎沒有明確说，提交後根據时序圖進行修改
            c_d    = 3'd1;
        end
        else begin
            if( Q==4'd12 && enable == 1'b1) begin //計數到了12且enable為high時候，回到初值
                c_load = 1'b1;
                c_d    = 3'd1;
            end
            else begin
                c_load = 1'b0;
                c_d    = 3'd0;//c_d的值其實隨便，根據時序圖他都是don't care
            end
        end
    end
endmodule
//法2
module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
    wire [3:0] cout_q;
    count4 the_counter (clk, c_enable, c_load, c_d, cout_q );
    assign Q = cout_q;
	assign c_enable = enable;  //直接将输入的使能信号给到c_enable即可
    assign c_load = (Q==4'd12 && enable==1'd1)||reset;
	assign c_d = 4'd1;
endmodule