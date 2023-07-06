//法一
module top_module( 
    input a, b, sel,
    output out ); 
    always@(*) begin
        case(sel) 
            2'b00: out =a;
            2'b01: out =b;
        endcase
        end
    
            


endmodule
//法二
module top_module (
	input a,
	input b,
	input sel,
	output out
);

	assign out = (sel & b) | (~sel & a);	// Mux expressed as AND and OR
	
	// Ternary operator is easier to read, especially if vectors are used:
	// assign out = sel ? b : a;
	
endmodule