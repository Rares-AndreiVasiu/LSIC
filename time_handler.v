module time_handler
    #(parameter SIZE = 4, parameter TIME_U = 9, parameter TIME_T = 5)
(
    input clk, rst,

    input pulse,

    input restart,

    output [SIZE - 1 : 0] seconds_units,

    output [SIZE - 1 : 0] seconds_tens,

    output [SIZE - 1 : 0] minutes_units,

    output [SIZE - 1 : 0] minutes_tens
);

reg [SIZE - 1 : 0] seconds_units_next, seconds_units_reg;

reg [SIZE - 1 : 0] seconds_tens_next, seconds_tens_reg;

reg [SIZE - 1 : 0] minutes_units_next, minutes_units_reg;

reg [SIZE - 1 : 0] minutes_tens_next, minutes_tens_reg;


always
    @(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        seconds_tens_reg <= 0;

        seconds_units_reg <= 0;

        minutes_tens_reg <= 0;

        minutes_units_reg <= 0;
    end
    else
    begin
        seconds_units_reg <= seconds_units_next;

        seconds_tens_reg <= seconds_tens_next;

        minutes_units_reg <= minutes_units_next;

        minutes_tens_reg <= minutes_tens_next;
    end
end


always
    @(*) begin
        seconds_units_next = seconds_units_reg;

        seconds_tens_next = seconds_tens_reg;

        minutes_tens_next = minutes_tens_reg;

        minutes_units_next = minutes_units_reg;

        if(restart) begin
            seconds_units_next = 0;

            seconds_tens_next = 0;

            minutes_units_next = 0;

            minutes_tens_next = 0;
        end
        else begin
            if(pulse)
            begin
                if(seconds_units_reg < TIME_U) begin
                    seconds_units_next = seconds_units_reg + 1;
                end
                else begin
                    seconds_units_next = 0;

                    if(seconds_tens_reg < TIME_T) begin
                        seconds_tens_next = seconds_tens_reg + 1;
                    end
                    else begin
                        seconds_tens_next = 0;

                        if(minutes_units_reg < TIME_U) begin
                            minutes_units_next = minutes_units_reg + 1;
                        end
                        else begin
                            minutes_units_next = 0;

                            if(minutes_tens_reg < TIME_T) begin
                                minutes_tens_next = minutes_tens_reg + 1;
                            end
                            else begin
                                minutes_tens_next = 0;

                                minutes_units_next = 0;

                                seconds_tens_next = 0;

                                seconds_units_next = 0;
                            end
                        end
                    end
                end
            end
        end
end

assign seconds_units = seconds_units_reg;

assign seconds_tens = seconds_tens_reg;

assign minutes_units = minutes_units_reg;

assign minutes_tens = minutes_tens_reg;

endmodule
