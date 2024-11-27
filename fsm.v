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

localparam IDLE   = 2'b00;
localparam ACTIVE = 2'b01;

always 
    @(posedge clk or negedge rst)
    begin
        if (!rst) 
        begin
            pulse_reg <= 0;

            state_reg <= IDLE;
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
        IDLE:
        begin
            if (start == 1 && pause == 0) 
            begin
                state_next = ACTIVE;
            end
            pulse_next = 0;
        end

        ACTIVE: begin
            if(!start || pause) begin
                state_next = IDLE;

                pulse_next = 0;
            end
            else begin
                state_next = ACTIVE;
                pulse_next = pulse;
            end
        end
    endcase
end

assign pulse_1HZ = pulse_reg;

endmodule

