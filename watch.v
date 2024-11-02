module watch
(
    input clk, rst,
    input start,
    input pause,
    output [7 : 0] led
);

wire pulse;
wire [7 : 0] count;

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

// led instance
leds 
    inst_leds(
        .count(count),
        .led(led)
);

endmodule
