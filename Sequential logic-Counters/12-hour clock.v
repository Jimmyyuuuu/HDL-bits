1
module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 
    //把ss,mm,hh分成十位數跟各位數
    wire am_to_pm;
    reg pm_temp;
    reg [3:0] ss_one;
    reg [3:0] ss_ten;
    reg [3:0] mm_one;
    reg [3:0] mm_ten;
    reg [3:0] hh_one;
    reg [3:0] hh_ten;
    //有兩個東西會影響 clock會不會跑 (reset 和 enable)
    //ss的個位數
    always@(posedge clk)
        begin
            if(reset)
                begin
                ss_one<=4'd0;
                end
            else if(ena)
                begin
                    if(ss_one==4'd9)
                        ss_one<=4'd0;
                    else
                        ss_one<=ss_one+4'd1;
                end
        end
    //ss的十位數
 	always@(posedge clk)
        begin
            if(reset)
                begin
                ss_ten<=4'd0;
                end
            else if(ena&&(ss_one==4'd9))
                begin
                    if(ss_ten==4'd5)
                        ss_ten<=4'd0;
                    else
                        ss_ten<=ss_ten+4'd1;
                end
        end
    //mm的個位數
 	always@(posedge clk)
        begin
            if(reset)
                begin
                mm_one<=4'd0;
                end
            else if(ena&&(ss_one==4'd9)&&(ss_ten==4'd5))
                begin
                    if(mm_one==4'd9)
                        mm_one<=4'd0;
                    else
                       mm_one<=mm_one+4'd1;
                end
        end
     //mm的十位數
 	always@(posedge clk)
        begin
            if(reset)
                begin
                mm_ten<=4'd0;
                end
            else if(ena && (ss_one==4'd9) && (ss_ten==4'd5) && (mm_one==4'd9))
                begin
                    if(mm_ten==4'd5)
                        mm_ten<=4'd0;
                    else
                       mm_ten<=mm_ten+4'd1;
                end
        end
    //hh的個位數 (reset時 時鐘會變成12:00:00AM)
 	always@(posedge clk)
        begin
            if(reset)
                begin
                hh_one<=4'd2;
                end
            else if(ena && (ss_one==4'd9) && (ss_ten==4'd5) && (mm_one==4'd9) && (mm_ten==4'd5))
                begin
                    if(hh_one==4'd9)
                        hh_one<=4'd0;
                    else if ((hh_one == 4'd2)&&(hh_ten == 4'd1))
                        begin
                            hh_one<= 4'd1;
                        end
                    else begin
                       hh_one<=hh_one+4'd1;
                    end
                end
        end
    //hh的十位數
    always@(posedge clk)
        begin
            if(reset)
                begin
                hh_ten<=4'd1;
                end
            else if(ena && (ss_one==4'd9) && (ss_ten==4'd5) && (mm_one==4'd9) && (mm_ten==4'd5))
                begin
                    if((hh_one == 4'd2)&&(hh_ten == 4'd1))
                        begin
                        hh_ten<=4'd0;
                        end
					else if(hh_one == 4'd9)
                        begin
                            hh_ten <= hh_ten+1'b1;;
                        end

                  
                end
        end
    //再來要來實行，如果reset會回到AM，如果到了11:59:59AM要轉成12:00:00PM
    //通過在複位時將 pm_temp 設置為上午（AM），然後在滿足特定條件時進行取反操作，就能實現AM和PM之間的切換。 在初始時刻的情況下，如果 pm_temp 的值不重要，可以假設其初始值為上午（AM），然後在滿足特定條件時進行AM和PM的轉換。
      always@(posedge clk)
        begin
            if(reset)
                pm_temp <= 1'b0;
            else if(am_to_pm) //當達到11:59:59AM時，要轉成12:00:00PM
                pm_temp <= ~pm_temp;
        end
            
    //再來賦值給 ss mm hh am_to_pm 
    
                
    assign am_to_pm = (hh_ten == 4'd1)&&(hh_one == 4'd1)&&(ena)&&(ss_one == 4'd9)&&(ss_ten == 4'd5)&&(mm_one == 4'd9)&&(mm_ten == 4'd5);            
   	assign ss = {ss_ten,ss_one};
    assign mm = {mm_ten,mm_one};
    assign hh = {hh_ten,hh_one};
    assign pm = pm_temp;  
        
endmodule