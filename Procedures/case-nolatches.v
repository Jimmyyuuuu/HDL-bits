//法1
// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    always@(*)
        begin
            up = 1'b0;  // 在之前设置默认值，就不需要写那么多得情况
            down = 1'b0; 
            left = 1'b0; 
            right = 1'b0;
            case(scancode)
                16'he06b: left = 1;
                16'he072: down = 1;
                16'he074: right = 1;
                16'he075: up = 1;
                default: ;  // default必须写，但是后面的可以省略
            endcase
        end
 
endmodule
//法2
// synthesis verilog_input_version verilog_2001
module top_module (
    input [15:0] scancode,
    output reg left,
    output reg down,
    output reg right,
    output reg up  ); 
    always@(*) begin
        up = 1'b0; down = 1'b0; left = 1'b0; right = 1'b0;
        case(scancode)
            16'he06b : left = 1'b1;
            16'he072 : down = 1'b1;
            16'he074 : right = 1'b1;
            16'he075 : up = 1'b1;
            default : {up,down,left,right} = 1'b0;
            
            
            
            
            
        endcase
    end
        
            
            

endmodule