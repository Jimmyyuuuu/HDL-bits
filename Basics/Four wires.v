//Create a module with 3 inputs and 4 outputs that behaves like wires that makes these connections:
// a -> w
//b -> x
//b -> y
//c -> z
module  top_module(a,b,c,w,x,y,z)
    input a,b,c;
    output w,x,y,z;
	assign w = a;
	assign x = b;
	assign y = b;
	assign z = c;
    // 注意! output 一定要放前面
	// If we're certain about the width of each signal, using 
	// the concatenation operator is equivalent and shorter:
	// assign {w,x,y,z} = {a,b,b,c};
	
endmodule