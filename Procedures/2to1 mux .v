// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always ); 
    // 可以寫成 assign out_assign=(sel_b2&&sel_b1) ? b:a)
    assign out_assign = (sel_b2&&sel_b1) ? b:a;  
    always@(*) begin
        if (sel_b1==0)
            out_always = a;
        else if(sel_b2 == 0)
            out_always = a;
        else 
            out_always = b;
    end
    

endmodule