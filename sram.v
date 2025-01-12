module sram #(MAX_ADDR = ) 
(
    input pulse,

    input [MAX_ADDR - 1 : 0] addr_in,

    output reg [MAX_ADDR - 1 : 0] data_out,

    input re_en
);


