module mem_reader #(parameter MAX_ADDR = 3)
(
    input rst,

    input pulse,
    
    input ready,

    output [1 : 0] opcode
); 

reg [MAX_ADDR - 1 : 0] address;

reg [1 : 0] data;

sram #(.MAX_ADDR(MAX_ADDR))
sram_inst(
    .address(    
);

