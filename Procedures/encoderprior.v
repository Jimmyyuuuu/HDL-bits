//法1(使用heximal)
module top_module (
	input [3:0] in,
	output reg [1:0] pos
);

	always @(*) begin			// Combinational always block
		case (in)
			4'h0: pos = 2'h0;	// I like hexadecimal because it saves typing.
			4'h1: pos = 2'h0;
			4'h2: pos = 2'h1;
			4'h3: pos = 2'h0;
			4'h4: pos = 2'h2;
			4'h5: pos = 2'h0;
			4'h6: pos = 2'h1;
			4'h7: pos = 2'h0;
			4'h8: pos = 2'h3;
			4'h9: pos = 2'h0;
			4'ha: pos = 2'h1;
			4'hb: pos = 2'h0;
			4'hc: pos = 2'h2;
			4'hd: pos = 2'h0;
			4'he: pos = 2'h1;
			4'hf: pos = 2'h0;
			default: pos = 2'b0;	// Default case is not strictly necessary because all 16 combinations are covered.
		endcase
	end
	
	// There is an easier way to code this. See the next problem (always_casez).
	
endmodule
//法2(使用binary)
// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always@(*)begin
        case(in)
            4'b0000: pos = 2'd0;
            4'b0001: pos = 2'd0;
            4'b0010: pos = 2'd1;
            4'b0011: pos = 2'd0;
            4'b0100: pos = 2'd2;
            4'b0101: pos = 2'd0;
            4'b0110: pos = 2'd1;
            4'b0111: pos = 2'd0;
            4'b1000: pos = 2'd3;
            4'b1001: pos = 2'd0;
            4'b1010: pos = 2'd1;
            4'b1011: pos = 2'd0;
            4'b1100: pos = 2'd2;
            4'b1101: pos = 2'd0;
            4'b1110: pos = 2'd1;
            4'b1111: pos = 2'd0;
        endcase
    end
            
           
    

endmodule
