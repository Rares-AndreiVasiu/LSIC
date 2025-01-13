module mem_reader #(parameter MAX_ADDR = 10,
                    parameter DATA_SIZE = 32,
                    parameter MAX_LOCATIONS = 1024)
(
    input rst,

    input pulse,
    
    input ready,

    output [DATA_SIZE -1 : 0] data_out
); 

endmodule

