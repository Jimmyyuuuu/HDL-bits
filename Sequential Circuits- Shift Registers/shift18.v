module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    always @ (posedge clk) begin 
        if(load) begin
            q<= data;
        end
        else if (ena) begin
            //There is no difference between logical and arithmetic left shifts.
            //shidt right 要包含sign bit
            case(amount) 
                2'b00: q <={q[62:0],1'b0};  // shift left by 1 bit.
                2'b01: q <={q[55:0],8'b0};  //shift left by 8 bits.
                2'b10: q <={q[63],q[63:1]}; //shift right by 1 bit.
                2'b11: q <={{8{q[63]}},q[63:8]};  //shift right by 8 bits
                
            endcase
                    end
                    end
                
        
endmodule