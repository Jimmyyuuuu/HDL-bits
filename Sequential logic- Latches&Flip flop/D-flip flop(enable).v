//法1
module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always@(posedge clk) begin
        if(!resetn)
            q<=16'd0;
        else 
            case(byteena)
                2'b00: q<=q;
                2'b01: q[7:0]<=d[7:0];
                2'b10: q[15:8]<=d[15:8];
                2'b11: q<=d;
            endcase
    end
          
endmodule
//法2
module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    always@(posedge clk) begin
        if(!resetn)
            q<=16'd0;
        else 
            begin
                q[7:0]<=byteena[0]?d[7:0]:q[7:0];
                q[15:8]<=byteena[1]?d[15:8]:q[15:8];
    		end
    end
          
    
            

endmodule
