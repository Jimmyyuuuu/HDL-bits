//Create a module with one input and one output that behaves like a wire.
//自己打的
module top_module( input in, output out );
    assign out= (in & 1);
     
endmodule

//solution from website
module top_module( input in, output out );
	
	assign out = in;
	// Note that wires are directional, so "assign in = out" is not equivalent.
	
endmodule
