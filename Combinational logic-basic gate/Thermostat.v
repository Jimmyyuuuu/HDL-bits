//fan 是 當heater 開啟 或是 aircon開啟 或是 客人手動(Fan_on) 開啟 ，fan = 1
module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    assign fan = aircon | heater | fan_on;

    assign heater = mode&too_cold;
    assign aircon = ~mode & too_hot;

endmodule