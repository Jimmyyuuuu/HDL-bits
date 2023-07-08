module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    assign {cout,sum}= a+b+cin;
    //Verilog addition automatically produces the carry-out bit
    //可是不能這樣打 assign sum ={a+b} 或是 assign sum=(a+b)，這樣會自動丟棄carry-out

endmodule
