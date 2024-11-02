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

set_location_assignment PIN_A8 -to led[0]; # LED 0

set_location_assignment PIN_A9 -to led[1]; # LED 1

set_location_assignment PIN_A10 -to led[2]; # LED 3

set_location_assignment PIN_B10 -to led[3]; # LED 4

set_location_assignment PIN_D13 -to led[4]; # LED 5

set_location_assignment PIN_C13 -to led[5]; # LED 6

set_location_assignment PIN_E14 -to led[6]; # LED 7

set_location_assignment PIN_D14 -to led[7]; # LED 8

load_package flow

execute_flow -compile

project_close
