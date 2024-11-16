module watch
(
    input clk, rst,
    
    input start,
    
    input pause,
    
    output [7 : 0] seg_minutes_units,
    
    output [7 : 0] seg_minutes_tens,

    output [7 : 0] seg_seconds_units,

    output [7 : 0] seg_seconds_tens
);

wire pulse;

wire [7 : 0] count;

wire [3 : 0] minutes_tens;

wire [3 : 0] minutes_units;

wire [3 : 0] seconds_tens;

wire [3 : 0] seconds_units;

// pulse instace
pulse
inst_pulse(
    .clk(clk),

    .rst(rst),
    
    .pulse_1s(pulse)
);

// fsm instance
fsm 
inst_fsm(
    .clk(clk),

    .rst(rst),
    
    .start(start),
    
    .pause(pause),
    
    .pulse(pulse),
    
    .pulse_1HZ(pulse_1s),
);

endmodule
