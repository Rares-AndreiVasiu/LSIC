module mem_reader #(parameter MAX_ADDR = 8)
(
    input clk,

    input rst,
    
    input trigger,

    input load,

    output reg[ 7 : 0] opcode
);

reg [7 : 0] address;

wire [7 : 0] sram_data;

sram 
    inst_sram
    (
        .clk(clk),
        .load(load),
        .address(address),
        .data(sram_data)
    );

always
    @(posedge clk) begin
    if(trigger == 1 && address < MAX_ADDR)
        begin
            opcode <= sram_data;

            address <= address + 1;
        end
end

endmodule

