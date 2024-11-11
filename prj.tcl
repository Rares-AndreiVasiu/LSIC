project_new watch -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G

set_global_assignment -name BDF_FILE watch.bdf

set_global_assignment -name VERILOG_FILE pulse.v
set_global_assignment -name VERILOG_FILE fsm.v
set_global_assignment -name VERILOG_FILE leds.v
set_global_assignment -name VERILOG_FILE watch.v

set_global_assignment -name SDC_FILE watch.sdc

set_global_assignment -name TOP_LEVEL_ENTITY watch

set_location_assignment PIN_P11 -to clk;

set_location_assignment PIN_B8 -to rst; # PUSH BUTTON

set_location_assignment PIN_B14 -to pause;

set_location_assignment PIN_F15 -to start;

# led seconds right config
set_location_assignment PIN_C14 -to seconds_units[0];

set_location_assignment PIN_E15 -to seconds_units[1];

set_location_assignment PIN_C15 -to seconds_units[2];

set_location_assignment PIN_C16 -to seconds_units[3];

set_location_assignment PIN_E16 -to seconds_units[4];

set_location_assignment PIN_D17 -to seconds_units[5];

set_location_assignment PIN_C17 -to seconds_units[6];

set_location_assignment PIN_D15 -to seconds_units[7];

# led seconds left config

set_location_assignment PIN_C18 -to seconds_tens[0];

set_location_assignment PIN_D18 -to seconds_tens[1];

set_location_assignment PIN_E18 -to seconds_tens[2];

set_location_assignment PIN_B16 -to seconds_tens[3];

set_location_assignment PIN_A17 -to seconds_tens[4];

set_location_assignment PIN_A18 -to seconds_tens[5];

set_location_assignment PIN_B17 -to seconds_tens[6];

set_location_assignment PIN_B16 -to seconds_tens[7];

# led minutes right config

set_location_assignment PIN_B20 -to minutes_units[0];

set_location_assignment PIN_A20 -to minutes_units[1];

set_location_assignment PIN_B19 -to minutes_units[2];

set_location_assignment PIN_A21 -to minutes_units[3];

set_location_assignment PIN_B21 -to minutes_units[4];

set_location_assignment PIN_C22 -to minutes_units[5];

set_location_assignment PIN_B22 -to minutes_units[6];

set_location_assignment PIN_A19 -to minutes_units[7];

# led minutes left config

set_location_assignment PIN_F21 -to minutes_tens[0];

set_location_assignment PIN_E22 -to minutes_tens[1];

set_location_assignment PIN_E21 -to minutes_tens[2];

set_location_assignment PIN_C19 -to minutes_tens[3];

set_location_assignment PIN_C20 -to minutes_tens[4];

set_location_assignment PIN_D19 -to minutes_tens[5];

set_location_assignment PIN_E17 -to minutes_tens[6];

set_location_assignment PIN_D22 -to minutes_tens[7];

#led hours right config

#set_location_assignment PIN_F18 -to hours_units[0];

# set_location_assignment PIN_E20 -to hours_units[1];

# set_location_assignment PIN_E19 -to hours_units[2];

# set_location_assignment PIN_J18 -to hours_units[3];

# set_location_assignment PIN_H19 -to hours_units[4];

# set_location_assignment PIN_F19 -to hours_units[5];

# set_location_assignment PIN_F20 -to hours_units[6];

#set_location_assignment PIN_F17 -to hours_units[7];

# led hours left config

# set_location_assignment PIN_J20 -to hours_tens[0];

# set_location_assignment PIN_K20 -to hours_tens[1];
 
# set_location_assignment PIN_L18 -to hours_tens[2];

# set_location_assignment PIN_N18 -to hours_tens[3];

# set_location_assignment PIN_M20 -to hours_tens[4];

# set_location_assignment PIN_N19 -to hours_tens[5];

# set_location_assignment PIN_N20 -to hours_tens[6];

# set_location_assignment PIN_L19 -to hours_tens[7];

load_package flow

execute_flow -compile

project_close
