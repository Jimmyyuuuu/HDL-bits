//法一
module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always@( posedge clk) 
        Q<=L?R:(E?w:Q);
  

endmodule
//法二
module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always@( posedge clk) begin
        if(L)
            Q<=R;
        else if (E)
            Q<=w;
        else //E,L都是0
            Q<=Q;
    end
           
    
  

endmodule