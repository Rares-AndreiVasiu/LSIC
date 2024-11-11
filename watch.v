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
    
    .counter(count),
);

//time counter instance
time_counter inst_time_counter (
    .seconds_total(counter),   // Input from FSM counter
    
    .minutes_tens(minutes_tens),
    
    .minutes_units(minutes_units),
    
    .seconds_tens(seconds_tens),
    
    .seconds_units(seconds_units)
);

// 7-segment display driver instance
time_to_7seg inst_time_to_7seg (
    .minutes_tens(minutes_tens),

    .minutes_units(minutes_units),
    
    .seconds_tens(seconds_tens),
    
    .seconds_units(seconds_units),
    
    .seg_minutes_tens(seg_minutes_tens),
    
    .seg_minutes_units(seg_minutes_units),
    
    .seg_seconds_tens(seg_seconds_tens),
    
    .seg_seconds_units(seg_seconds_units)
);
endmodule
