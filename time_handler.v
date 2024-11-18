module time_handler(
    input clk, rst,

    input pulse,

    output [3 : 0] seconds_units,

    output [3 : 0] seconds_tens,

    output [3 : 0] minutes_units,

    output [3 : 0] minutes_tens
);

reg [3 : 0] seconds_units_next, seconds_units_reg;

reg [3 : 0] seconds_tens_next, seconds_tens_reg;

reg [3 : 0] minutes_units_next, minutes_units_reg;

reg [3 : 0] minutes_tens_next, minutes_tens_reg;


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
    @(*)
begin
    seconds_units_next = 0;

    seconds_tens_next= 0;

    minutes_units_next = 0;

    minutes_tens_next = 0;

    if(pulse)
    begin
        if(seconds_units_reg < 10) begin
            seconds_units_next = seconds_units_next + 1;
        end
        else begin
            seconds_units_next = 0;

            if(seconds_tens_reg < 6) begin
                seconds_tens_next = seconds_tens_reg + 1;
            end
            else begin
                seconds_tens_next = 0;

                if(minutes_units_reg < 10) begin
                    minutes_units_next = minutes_units_reg + 1;
                end
                else begin
                    minutes_units_next = 0;

                    if(minutes_tens_reg < 6) begin
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

assign seconds_units = seconds_units_reg;

assign seconds_tens = seconds_tens_reg;

assign minutes_units = minutes_units_reg;

assign minutes_tens = minutes_tens_reg;

endmodule
