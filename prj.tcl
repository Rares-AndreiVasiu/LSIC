project_new cntled -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G

set_global_assignment -name BDF_FILE cntle.bdf
set_global_assignment -name VERILOG_FILE cntled.v
set_global_assignment -name SDC_FILE cntled.sdc

set_global_assignment -name TOP_LEVEL_ENTITY cntled

set_location_assignment PIN_P11 -to clk;
set_location_assignment PIN_B8 -to rst;

set_location_assignment PIN_A8 -to leds[0]; # LED 0

set_location_assignment PIN_A9 -to leds[1]; # LED 1

set_location_assignment PIN_A10 -to leds[2]; # LED 2

set_location_assignment PIN_B10 -to leds[3]; # LED 4

set_location_assignment PIN_D13 -to leds[4];

set_location_assignment PIN_C13 -to leds[5];

set_location_assignment PIN_E14 -to leds[6];

set_location_assignment PIN_D14 -to leds[7];

load_package flow

execute_flow -compile

project_close
