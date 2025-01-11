module display_handler
    #(parameter SIZE = 4)
(
    input clk,
    input rst,

    input [SIZE - 1 : 0] units_second,
    
    input [SIZE - 1 : 0] tens_second,

    input [SIZE - 1 : 0] units_minute,

    input [SIZE - 1 : 0] tens_minute,

    input save,

    output [SIZE - 1 : 0] units_second_saved,

    output [SIZE - 1 : 0] tens_second_saved,

    output [SIZE - 1 : 0] units_minute_saved,

    output [SIZE - 1 : 0] tens_minute_saved,

    output we,

    output [7 : 0] addr,

    output a_units_seconds,

    output b_units_seconds,

    output c_units_seconds,

    output d_units_seconds,

    output a_tens_seconds,

    output b_tens_seconds,

    output c_tens_seconds,

    output d_tens_seconds,
    
    output a_units_minutes,

    output b_units_minutes,

    output c_units_minutes,

    output d_units_minutes,

    output a_tens_minutes,

    output b_tens_minutes,

    output c_tens_minutes,

    output d_tens_minutes
);

reg [7 : 0] addr_next, addr_reg;

always 
    @(posedge clk or negedge rst)begin
    if(!rst)begin
        addr_reg <= 0;
    end
    else begin
        addr_reg <= addr_next;
    end
end

always 
    @(*)begin
        addr_next = addr_reg;

        if(save == 1) begin
            addr_next = addr_reg + 1;
        end
end

assign {a_units_seconds, b_units_seconds, c_units_seconds,
    d_units_seconds} = units_second;

assign {a_tens_seconds, b_tens_seconds, c_tens_seconds, 
    d_tens_seconds} = tens_second;

assign {a_units_minutes, b_units_minutes, c_units_minutes, 
    d_units_minutes} = units_minute;

assign {a_tens_minutes, b_tens_minutes, c_tens_minutes,
    d_tens_minutes} = tens_minute;


assign units_second_saved = units_second;

assign tens_second_saved = tens_second;

assign units_minute_saved = units_minute;

assign tens_minute_saved = tens_minute;

assign we = save;

assign addr = addr_reg;

endmodule

