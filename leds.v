module leds
(
    input [7 : 0] count,
    output [7 : 0] led
);

assign led = count;

endmodule
