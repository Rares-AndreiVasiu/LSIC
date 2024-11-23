module fsm (
    input clk,
    input rst,      // Active low reset
    input pulse,
    input start,
    input pause,
    output pulse_1HZ
);

reg pulse_reg, pulse_next;
reg [1:0] state_next, state_reg;

localparam idle = 2'b00;
localparam active = 2'b01;

always 
    @(posedge clk or negedge rst)
    begin
        if (!rst) 
        begin
            pulse_reg <= 0;

            state_reg <= idle;
        end 
        else 
        begin
            pulse_reg <= pulse_next;

            state_reg <= state_next;
        end
    end

always
    @(*) begin

    state_next = state_reg;

    pulse_next = 0;

    case (state_reg)
        idle: 
        begin
            if (start == 1 && pause == 0) 
            begin
                state_next = active;
            end
            pulse_next = 0;
        end

        active: begin
            if(!start || pause) begin
                state_next = idle;

                pulse_next = 0;
            end
            else begin
                state_next = active;
                pulse_next = pulse;
            end
        end
    endcase
end

assign pulse_1HZ = pulse_reg;

endmodule

