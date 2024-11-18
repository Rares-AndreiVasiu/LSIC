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

wire pulse, pulse_fsm;

wire [7 : 0] count;

wire [3 : 0] minutes_tens;

wire [3 : 0] minutes_units;

wire [3 : 0] seconds_tens;

wire [3 : 0] seconds_units;

wire [7 : 0] display_units_second;

wire [7 : 0] display_tens_second;

wire [7 : 0] display_units_minutes;

wire [7 : 0] display_tens_minutes;

wire a_us, b_us, c_us, d_us;

wire a_ts, b_ts, c_ts, d_ts;

wire a_um, b_um, c_um, d_um;

wire a_tm, b_tm, c_tm, d_tm;


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
    
    .pulse_1HZ(pulse_fsm)
);

time_handler 
    inst_time_handler(
        .clk(clk),

        .rst(rst),

        .pulse(pulse_fsm),

        .seconds_units(seconds_units),

        .seconds_tens(seconds_tens),

        .minutes_units(minutes_units),

        .minutes_tens(minutes_tens)
    );

display_handler
    inst_display_handler(
        .units_second(seconds_units),

        .tens_second(seconds_tens),

        .units_minute(minutes_units),

        .tens_minute(minutes_tens),
        
        .a_units_seconds(a_us),

        .b_units_seconds(b_us),

        .c_units_seconds(c_us),

        .d_units_seconds(d_us),

        .a_tens_seconds(a_ts),

        .b_tens_seconds(b_ts),

        .c_tens_seconds(c_ts),

        .d_tens_seconds(d_ts),

        .a_units_minutes(a_um),

        .b_units_minutes(b_um),

        .c_units_minutes(c_um),

        .d_units_minutes(d_um),

        .a_tens_minutes(a_tm),

        .b_tens_minutes(b_tm),

        .c_tens_minutes(c_tm),

        .d_tens_minutes(d_tm)
    );

display7seg
    inst_display_units_seconds(
        .a(a_us),

        .b(b_us),

        .c(c_us),

        .d(d_us),

        .display7bit(display_units_second)
    );

display7seg
    inst_display_tens_seconds(
        .a(a_ts),

        .b(b_ts),

        .c(c_ts),

        .d(d_ts),

        .display7bit(display_tens_second)
    );


display7seg
    inst_display_units_minutes(
        .a(a_um),

        .b(b_um),

        .c(c_um),

        .d(d_um),

        .display7bit(display_units_minutes)
    );

display7seg
    inst_display_tens_minutes(
        .a(a_tm),

        .b(b_tm),

        .c(c_tm),

        .d(d_tm),

        .display7bit(display_tens_minutes)
    );


assign seg_seconds_units = display_units_second;

assign seg_seconds_tens = display_tens_second;

assign seg_minutes_units = display_units_minutes;

assign seg_minutes_tens = display_tens_minutes;

endmodule
