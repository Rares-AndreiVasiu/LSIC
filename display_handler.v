module display_handler(
    input [3 : 0] units_second,
    
    input [3 : 0] tens_second,

    input [3 : 0] units_minute,

    input [3 : 0] tens_minute,

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

reg a_us, b_us, c_us, d_us;

reg a_ts, b_ts, c_ts, d_ts;

reg a_um, b_um, c_um, d_um;

reg a_tm, b_tm, c_tm, d_tm;

always
    @(*)
begin
    // store the bits for the unit seconds
    {a_us, b_us, c_us, d_us} = units_second;

    // store the bits for the tens seconds
    {a_ts, b_ts, c_ts, d_ts} = tens_second;

    // store the bits for the unit minutes
    {a_um, b_um, c_um, d_um} = units_minute;

    // store the bits for the tens minutes
    {a_tm, b_tm, c_tm, d_tm} = tens_minute;
end

// seconds units
assign a_units_seconds = a_us;

assign b_units_seconds = b_us;

assign c_units_seconds = c_us;

assign d_units_seconds = d_us;

// seconds tens
assign a_tens_seconds = a_ts;

assign b_tens_seconds = b_ts;

assign c_tens_seconds = c_ts;

assign d_tens_seconds = d_ts;

// minutes units
assign a_units_minutes = a_um;

assign b_units_minutes = b_um;

assign c_units_minutes = c_um;

assign d_units_minutes = d_um;

// minutes tens
assign a_tens_minutes = a_tm;

assign b_tens_minutes = b_tm;

assign c_tens_minutes = c_tm;

assign d_tens_minutes = d_tm;

endmodule
