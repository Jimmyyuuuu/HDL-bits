module top_module (
    input in1,
    input in2,
    input in3,
    output out);
    wire w0;
    assign w0 = ~(in1^in2); 
    assign out = w0^in3;
    //也可以直接寫 assign out = (in1~^in2)^in3;

    
endmodule