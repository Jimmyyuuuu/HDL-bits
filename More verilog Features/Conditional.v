module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
    //先兩個兩個比較 (ex: c<d ? c:d) c有無比d小? 有的話為true=1 =c ，否的話為false = 0 =d
    assign min = a<b?(a<c?(a<d?a:d):(c<d?c:d)):(b<c?(b<d?b:d):(c<d?c:d));
    
    

    // assign intermediate_result1 = compare? true: false;

endmodule