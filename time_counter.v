module time_counter (
    input [7:0] seconds_total,     

    output reg [3:0] minutes_tens,  
    
    output reg [3:0] minutes_units, 
    
    output reg [3:0] seconds_tens,
    
    output reg [3:0] seconds_units
);

reg [7:0] remaining_seconds;

always @(*) 
begin

    minutes_tens = 0;

    minutes_units = 0;
    
    seconds_tens = 0;
    
    seconds_units = 0;

    remaining_seconds = seconds_total;

    while (remaining_seconds > 0)
    begin
        if (seconds_units == 9) 
        begin
            seconds_units = 0;

            if (seconds_tens == 5) 
            begin
                seconds_tens = 0;

                if (minutes_units == 9) 
                begin
                    minutes_units = 0;

                    if (minutes_tens < 4) 
                    begin
                        minutes_tens = minutes_tens + 1;
                    end
                end 
                else 
                begin
                    minutes_units = minutes_units + 1;
                end

            end 
            else
            begin
                seconds_tens = seconds_tens + 1;
            end
        end 
        else 
        begin
            seconds_units = seconds_units + 1;
        end


        remaining_seconds = remaining_seconds - 1;
    end
end
endmodule

