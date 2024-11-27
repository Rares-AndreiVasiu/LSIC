module display_handler
    #(parameter SIZE = 4)
(
    input [SIZE - 1 : 0] units_second,
    
    input [SIZE - 1 : 0] tens_second,

    input [SIZE - 1 : 0] units_minute,

    input [SIZE - 1 : 0] tens_minute,

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

assign {a_units_seconds, b_units_seconds, c_units_seconds,
    d_units_seconds} = units_second;

assign {a_tens_seconds, b_tens_seconds, c_tens_seconds, 
    d_tens_seconds} = tens_second;

assign {a_units_minutes, b_units_minutes, c_units_minutes, 
    d_units_minutes} = units_minute;

assign {a_tens_minutes, b_tens_minutes, c_tens_minutes,
    d_tens_minutes} = tens_minute;

endmodule
