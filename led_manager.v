module led_manager #(parameter LED_NUMBER = 10)
(
    input clk,

    input ready,

    input rst,

    output [LED_NUMBER - 1 : 0] leds
);

reg [LED_NUMBER - 1 : 0] lights;

always
    @(posedge clk or negedge rst) begin
    if(!rst) begin
        lights = {LED_NUMBER{1'b0}};
    end
    else begin
        if(ready == 1 && clk == 1) begin
            lights = {LED_NUMBER{1'b1}};
        end
        else begin
            lights= {LED_NUMBER{1'b0}};
        end
    end
end

assign leds = lights;

endmodule
