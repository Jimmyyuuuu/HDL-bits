module top_module (
    input clk,
    input reset,
    input slowena,
    output [3:0] q);
    always @ (posedge clk) begin
        if(reset) //所以我們不能把他們兩個放一起
            q<=4'd0;
        else if (~slowena) //我們需要考慮到 如果counter數到9，然後我們又剛好是~slowena，那q應該維持原本的q還是回歸0呢? 應該是要維持q!
            q<=q; 
        else if(q ==4'd9)
            if (~slowena) begin
                q<=q;
            end
            else begin
                q<=4'd0;
            end  
        else
            q<=q+4'd1;
    end
        
        

endmodule
