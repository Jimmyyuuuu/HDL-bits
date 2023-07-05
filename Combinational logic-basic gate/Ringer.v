module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
); //反過來想，當motor 模式-> (Vibrate mode=1),ring=1, ringer 模式-> ring=1,(Vibrate mode=0) 
   //"The (output should be ___ ) when (inputs are ___ )".
    assign {ringer,motor}= {ring&(~vibrate_mode),ring&vibrate_mode};
    
    
   
    

endmodule
