//法1 (if else)
module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output reg [7:0] q 
);
    wire [7:0] w0,w1,w2;
    my_dff8 d0(clk,d,w0);
    my_dff8 d1(clk,w0,w1);
    my_dff8 d2(clk,w1,w2);
   
    always @(*)
        begin 
            if (sel ==2'b00)
                q=d;
            else if (sel ==2'b01)
                q=w0;
            else if (sel ==2'b10)
                q=w1;
            else 
                q=w2;
        end
                
            
endmodule
//法2 (case)
module top_module (
	input clk,
	input [7:0] d,
	input [1:0] sel,
	output reg [7:0] q
);

	wire [7:0] o1, o2, o3;		// output of each my_dff8
	
	// Instantiate three my_dff8s
	my_dff8 d1 ( clk, d, o1 );
	my_dff8 d2 ( clk, o1, o2 );
	my_dff8 d3 ( clk, o2, o3 );

	// This is one way to make a 4-to-1 multiplexer
	always @(*)		// Combinational always block
		case(sel)
			2'h0: q = d;
			2'h1: q = o1;
			2'h2: q = o2;
			2'h3: q = o3;
		endcase

endmodule