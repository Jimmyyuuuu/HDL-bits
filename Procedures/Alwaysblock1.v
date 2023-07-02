// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
//使用always block (配上reg)
    always@(*)
        begin
            out_alwaysblock=a&b;
        end
//使用assign 
    assign out_assign= a&b;

endmodule