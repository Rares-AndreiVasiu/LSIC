module time_handler #(parameter SIZE = 4,
                      parameter TIME_U = 9,
                      parameter TIME_T = 5,
                      parameter LOAD_SIZE = 16 )
(
    input clk,

    input rst,

    input pulse,
    
    input trigger,

    input increment,

    input restart,

    output [SIZE - 1 : 0] seconds_units,

    output [SIZE - 1 : 0] seconds_tens,

    output [SIZE - 1 : 0] minutes_units,

    output [SIZE - 1 : 0] minutes_tens,

    output [LOAD_SIZE - 1 : 0] addr_in,

    output [LOAD_SIZE - 1 : 0] data_in
);

reg [SIZE - 1 : 0] seconds_units_next, seconds_units_reg;

reg [SIZE - 1 : 0] seconds_tens_next, seconds_tens_reg;

reg [SIZE - 1 : 0] minutes_units_next, minutes_units_reg;

reg [SIZE - 1 : 0] minutes_tens_next, minutes_tens_reg;

reg [LOAD_SIZE - 1 : 0] addr_in_reg, addr_in_next;

reg [LOAD_SIZE - 1 : 0] data_in_sig;

always
    @(posedge clk or negedge rst)
begin
    if(!rst)
    begin
        seconds_tens_reg <= 0;

        seconds_units_reg <= 0;

        minutes_tens_reg <= 0;

        minutes_units_reg <= 0;

        addr_in_reg <= 0;
    end
    else
    begin
        seconds_units_reg <= seconds_units_next;

        seconds_tens_reg <= seconds_tens_next;

        minutes_units_reg <= minutes_units_next;

        minutes_tens_reg <= minutes_tens_next;

        addr_in_reg <= addr_in_next;
    end
end


always
    @(*) begin
        seconds_units_next = seconds_units_reg;

        seconds_tens_next = seconds_tens_reg;

        minutes_tens_next = minutes_tens_reg;

        minutes_units_next = minutes_units_reg;

        addr_in_next = addr_in_reg;        
        
        if(trigger) begin
            addr_in_next = addr_in_reg + 1;
        end

        if(restart) begin
            seconds_units_next = 0;

            seconds_tens_next = 0;

            minutes_units_next = 0;

            minutes_tens_next = 0;
        end
        else begin
            if(increment)
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

assign addr_in = addr_in_reg;

assign data_in = {minutes_tens_reg, minutes_units_reg, seconds_tens_reg, seconds_units_reg};
endmodule
