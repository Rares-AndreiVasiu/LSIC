module sram_load #(parameter LOAD_SIZE = 16,
                   parameter MAX_LOCATIONS = 1024)
(
    input  pulse,

    input [LOAD_SIZE - 1 : 0] addr_in,

    input [LOAD_SIZE - 1 : 0] data_in,

    input wr_en
);

// mem declaration

reg [LOAD_SIZE - 1 : 0] ram_mem[MAX_LOCATIONS - 1 : 0];

always
    @(posedge pulse)
begin
    if(wr_en)
        begin
            ram_mem[addr_in] <= data_in;
        end

end
endmodule
