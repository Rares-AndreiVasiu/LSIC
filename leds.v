module leds
(
    input clk, rst,
    input [7 : 0] count,
    output [7 : 0] led_seconds_right,
    output [7 : 0] led_seconds_left,
    output [7 : 0] led_minutes_right,
    output [7 : 0] led_minutes_left,
    output [7 : 0] led_hours_right,
    output [7 : 0] led_hours_left
);

reg [3 : 0] cnt9sec_next, cnt9sec_reg;

reg [2 : 0] cnt5sec_next, cnt5sec_reg;

reg [3 : 0] cnt9min_next, cnt9min_reg;

reg [2 : 0] cnt5min_next, cnt5min_reg;

reg [3 : 0] cnt9h_next, cnt9h_reg;

reg [1 : 0] cnt2h_next, cnt2h_reg;

always
	@(posedge clk or negedge rst)
	begin
		if(rst)
		begin
			cnt9sec_reg <= cnt9sec_next;

			cnt5sec_reg <= cnt5sec_next;

			cnt9min_reg <= cnt9min_next;

			cnt5min_reg <= cnt5min_next;

			cnt9h_reg <= cnt9h_next;

			cnt2h_reg <= cnt2h_next;
		end
		else
		begin	
			cnt9sec_reg <= 0;

			cnt5sec_reg <= 0;

			cnt9min_reg <= 0;

			cnt5min_reg <= 0;

			cnt9h_reg <= 0;

			cnt2h_reg <= 0;
module time_counter (
    input clk,                 // Clock signal
    input reset,               // Reset signal to reset all counters
    output reg [3:0] hours_tens,    // Tens digit of hours (0-2)
    output reg [3:0] hours_units,   // Units digit of hours (0-9)
    output reg [3:0] minutes_tens,  // Tens digit of minutes (0-5)
    output reg [3:0] minutes_units, // Units digit of minutes (0-9)
    output reg [3:0] seconds_tens,  // Tens digit of seconds (0-5)
    output reg [3:0] seconds_units  // Units digit of seconds (0-9)
);

    // Increment the time every clock cycle
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset all counters
            seconds_units <= 0;
            seconds_tens <= 0;
            minutes_units <= 0;
            minutes_tens <= 0;
            hours_units <= 0;
            hours_tens <= 0;
        end else begin
            // --- Seconds Units ---
            if (seconds_units == 9) begin
                seconds_units <= 0;
                
                // --- Seconds Tens ---
                if (seconds_tens == 5) begin
                    seconds_tens <= 0;
                    
                    // --- Minutes Units ---
                    if (minutes_units == 9) begin
                        minutes_units <= 0;
                        
                        // --- Minutes Tens ---
                        if (minutes_tens == 5) begin
                            minutes_tens <= 0;
                            
                            // --- Hours Units ---
                            if (hours_units == 9) begin
                                hours_units <= 0;
                                
                                // --- Hours Tens ---
                                if (hours_tens == 2) begin
                                    // When hours_tens reaches 2 and hours_units reaches 3, reset all
                                    hours_tens <= 0;
                                end else begin
                                    hours_tens <= hours_tens + 1;
                                end
                            end else begin
                                hours_units <= hours_units + 1;
                            end
                        end else begin
                            minutes_tens <= minutes_tens + 1;
                        end
                    end else begin
                        minutes_units <= minutes_units + 1;
                    end
                end else begin
                    seconds_tens <= seconds_tens + 1;
                end
            end else begin
                seconds_units <= seconds_units + 1;
            end
        end
    end
endmodule

