module mem_reader #(parameter MAX_ADDR = 10,
                    parameter DATA_SIZE = 32,
                    parameter MAX_LOCATIONS = 1024,
                    parameter MAX_INPUT = 90)
(
    input rst,

    input pulse,
    
    input ready,

    output [DATA_SIZE -1 : 0] data_out,

    output reg valid_read
); 


reg [MAX_ADDR - 1 : 0] addr_in_next, addr_in_reg;

reg re_en;

wire [DATA_SIZE - 1 : 0] data_out_sram;

sram #(.MAX_ADDR(MAX_ADDR),
       .DATA_SIZE(DATA_SIZE),
       .MAX_LOCATIONS(MAX_LOCATIONS))
inst_sram(
    .pulse(pulse),
    .addr_in(addr_in_reg),
    .re_en(re_en),
    .data_out(data_out_sram)
);

always 
    @(posedge pulse or negedge rst) begin
    if(!rst) begin
        addr_in_reg <= 0;
    end
    else begin
        addr_in_reg <= addr_in_next; 
    end
end

always 
    @(*) begin
    addr_in_next = addr_in_reg;

    re_en = 0;

    valid_read = 0;
    
    if(pulse & ready) begin
        re_en = 1;

        if(addr_in_reg < MAX_INPUT) begin
            addr_in_next = addr_in_reg + 1;

            valid_read = 1;
        end
    end
end

assign data_out = data_out_sram;

endmodule

