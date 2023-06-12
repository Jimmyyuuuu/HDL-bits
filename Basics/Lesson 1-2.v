// Build a circuit with no inputs and one output that outputs a constant 0
module top_module(output);
    output zero;
    assign zero=1'b0;
    endmodule
//這是舊版的，但也是可以用 ! 

//新版打法 更簡單
module top_module(output zero);
    assign zero=1'b0;

endmodule