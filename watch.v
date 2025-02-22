module watch
(
    input clk, rst,
   
    output [9 : 0] leds,
    
    output [7 : 0] seg_minutes_units,

    output [7 : 0] seg_minutes_tens,

    output [7 : 0] seg_seconds_units,

    output [7 : 0] seg_seconds_tens
);

localparam SIZE = 4;

localparam DISP = 8;

localparam LED_NUMBER = 10;

localparam TIME_T = 9;

localparam TIME_U = 5;

localparam MAX_ADDR = 10;

localparam MAX_LOCATIONS = 1024;

localparam DATA_SIZE = 32;

localparam MAX_INPUT = 90;

localparam MAX_TIME = 8;

wire pulse, pulse_fsm;

wire [DATA_SIZE - 1 : 0] data_out;

wire [LOAD_SIZE - 1 : 0] time_data;

wire [SIZE - 1 : 0] minutes_tens;

wire [SIZE -1 : 0] minutes_units;

wire [SIZE -1 : 0] seconds_tens;

wire [SIZE -1 : 0] seconds_units;

wire [DISP - 1 : 0] display_units_second;

wire [DISP - 1 : 0] display_tens_second;

wire [DISP - 1 : 0] display_units_minutes;

wire [DISP - 1 : 0] display_tens_minutes;

wire a_us, b_us, c_us, d_us;

wire a_ts, b_ts, c_ts, d_ts;

wire a_um, b_um, c_um, d_um;

wire a_tm, b_tm, c_tm, d_tm;

wire wr_en;

wire valid_read;

wire restart;

wire increment;

wire ready;

pulse
inst_pulse(
    .clk(clk),

    .rst(rst),
    
    .pulse_1s(pulse)
);

mem_prep
inst_mem_prep(
    .pulse(pulse),

    .rst(rst),
    
    .ready(ready)
);

led_manager #(.LED_NUMBER(LED_NUMBER))
inst_led_manager(
    .clk(clk),

    .rst(rst),

    .ready(ready),

    .leds(leds)
);

mem_reader #(.MAX_ADDR(MAX_ADDR),
             .MAX_INPUT(MAX_INPUT),
             .MAX_LOCATIONS(MAX_LOCATIONS),
             .DATA_SIZE(DATA_SIZE))
inst_mem_reader(
    .pulse(pulse),
    .rst(rst),
    .ready(ready),
    .data_out(data_out),
    .valid_read(valid_read)
);

fsm #(.DATA_SIZE(DATA_SIZE))
inst_fsm(
    .pulse(pulse),

    .valid_read(valid_read),

    .rst(rst),

    .data_in(data_out),

    .wr_en(wr_en),

    .increment(increment),

    .restart(restart)
);

wire [LOAD_SIZE - 1 : 0] addr_time;

time_handler #(.SIZE(SIZE),
               .TIME_T(TIME_T),
               .TIME_U(TIME_U))
inst_time_handler(
    .clk(clk),
 
    .rst(rst),

    .pulse(pulse),
 
    .restart(restart),

    .trigger(wr_en),

    .increment(increment),
 
    .seconds_units(seconds_units),
 
    .seconds_tens(seconds_tens),
 
    .minutes_units(minutes_units),
 
    .minutes_tens(minutes_tens),

    .addr_in(addr_time),

    .data_in(time_data)

);

localparam LOAD_SIZE = 16;

sram_load #(.LOAD_SIZE(LOAD_SIZE),
            .MAX_LOCATIONS(MAX_LOCATIONS))
inst_sram_load(
    .pulse(pulse),

    .addr_in(addr_in)
);
 
display_handler #(.SIZE(SIZE))
inst_display_handler(
    .clk(clk),
         
    .rst(rst),
 
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
#(.DISP(DISP)) inst_display_units_seconds(
    .a(a_us),

    .b(b_us),

    .c(c_us),

    .d(d_us),

    .display7bit(display_units_second)
);

display7seg
#(.DISP(DISP))inst_display_tens_seconds(
    .a(a_ts),

    .b(b_ts),

    .c(c_ts),

    .d(d_ts),

    .display7bit(display_tens_second)
);


display7seg
#(.DISP(DISP))inst_display_units_minutes(
    .a(a_um),

    .b(b_um),

    .c(c_um),

    .d(d_um),

    .display7bit(display_units_minutes)
);

display7seg
#(.DISP(DISP))inst_display_tens_minutes(
    .a(a_tm),

    .b(b_tm),

    .c(c_tm),

    .d(d_tm),

    .display7bit(display_tens_minutes)
);


assign seg_seconds_units = display_units_second;

assign seg_seconds_tens = display_tens_second;

assign seg_minutes_units = {1'b0, display_units_minutes[6 : 0]};

assign seg_minutes_tens = display_tens_minutes;

endmodule
