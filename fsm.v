module fsm (
    input clk,
    input rst,      // Active low reset
    input pulse,
    input start,
    input pause,
    output reg [7:0] counter
);

reg [7:0] counter_next;
reg [1:0] state_next, state_reg;

localparam idle = 2'b00;
localparam count = 2'b01;

always 
    @(posedge clk or negedge rst)
    begin
        if (!rst) 
            begin
                counter <= 0;

                state_reg <= idle;
            end 
        else 
            begin
                counter <= counter_next;

                state_reg <= state_next;
            end
    end

always
    @(*) 
    begin

        counter_next = counter;

        state_next = state_reg;

        case (state_reg)
            idle: 
                begin
                    if (start && !pause) 
                        begin
                            state_next = count;
                        end
                end

            count: 
                begin
                    if (pause) 
                        begin
                            state_next = idle; 
                        end 
                    else 
                        begin
                            if (pulse) 
                                begin
                                    counter_next = counter + 1; 
                                end
                        end
                end
        default: 
            begin
                state_next = idle;
            end
    endcase
end

endmodule

