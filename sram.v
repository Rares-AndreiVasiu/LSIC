module sram #(parameter MAX_ADDR = 10,
              parameter DATA_SIZE = 32,
              parameter MAX_LOCATIONS = 1024) 
(
    input pulse,

    input [MAX_ADDR - 1 : 0] addr_in,

    output reg [DATA_SIZE - 1 : 0] data_out,

    input re_en
);

localparam START = {DATA_SIZE{1'b1}};

localparam STOP = {DATA_SIZE{1'b0}};

localparam PAUSE = {DATA_SIZE{1'b1}} >> 16;

// mem declaration
reg [DATA_SIZE - 1 : 0] ram_mem[MAX_LOCATIONS - 1 : 0];

initial begin
    ram_mem[0] = START;

    ram_mem[1] = START;

    ram_mem[2] = PAUSE;

    ram_mem[3] = START;

    ram_mem[4] = START;

    ram_mem[5] = STOP;

    ram_mem[6] = START;
    
    ram_mem[7] = START;
   
    ram_mem[8] = START;

    ram_mem[9] = PAUSE;

    ram_mem[10] = START;

    ram_mem[11] = START;

    ram_mem[12] = START;
    
    ram_mem[13] = START;
    
    ram_mem[14] = START;
    
    ram_mem[15] = STOP;
    
    ram_mem[16] = PAUSE;
    
    ram_mem[17] = START;
    
    ram_mem[18] = PAUSE;
    
    ram_mem[19] = START;
    
    ram_mem[20] = START;
    
    ram_mem[21] = START;
    
    ram_mem[22] = START;
    
    ram_mem[23] = START;
    
    ram_mem[24] = START;
    
    ram_mem[25] = START;
    
    ram_mem[26] = START;
    
    ram_mem[27] = START;
    
    ram_mem[28] = START;
    
    ram_mem[29] = START;
    
    ram_mem[30] = START;
    
    ram_mem[31] = START;
    
    ram_mem[32] = START;
    
    ram_mem[33] = START;
    
    ram_mem[34] = START;
    
    ram_mem[35] = PAUSE;
    
    ram_mem[36] = STOP;
    
    ram_mem[37] = START;
    
    ram_mem[38] = START;

    ram_mem[39] = START;
    
    ram_mem[40] = START;
    
    ram_mem[41] = START;
    
    ram_mem[42] = PAUSE;
    
    ram_mem[43] = START;
    
    ram_mem[44] = STOP;
    
    ram_mem[45] = PAUSE;
    
    ram_mem[46] = START;
    
    ram_mem[47] = PAUSE;
    
    ram_mem[48] = PAUSE;
    
    ram_mem[49] = PAUSE;
    
    ram_mem[50] = START;
    
    ram_mem[51] = START;
    
    ram_mem[52] = START;
    
    ram_mem[53] = START;
    
    ram_mem[54] = START;
    
    ram_mem[55] = START;
    
    ram_mem[56] = START;
    
    ram_mem[57] = START;
    
    ram_mem[58] = START;
    
    ram_mem[59] = START;
    
    ram_mem[60] = START;
    
    ram_mem[61] = START;
    
    ram_mem[62] = START;
    
    ram_mem[63] = START;
    
    ram_mem[64] = START;
    
    ram_mem[65] = START;
    
    ram_mem[66] = START;
    
    ram_mem[67] = START;
    
    ram_mem[68] = START;
    
    ram_mem[69] = START;
    
    ram_mem[70] = START;
    
    ram_mem[71] = START;
    
    ram_mem[72] = START;
    
    ram_mem[73] = PAUSE;
    
    ram_mem[74] = START;
    
    ram_mem[75] = STOP;
    
    ram_mem[76] = STOP;
    
    ram_mem[77] = START;
    
    ram_mem[78] = START;
    
    ram_mem[79] = START;
    
    ram_mem[80] = START;
    
    ram_mem[81] = START;
    
    ram_mem[82] = PAUSE;
    
    ram_mem[83] = PAUSE;
    
    ram_mem[84] = START;
    
    ram_mem[85] = START;
    
    ram_mem[86] = START;

    ram_mem[87] = START;
    
    ram_mem[88] = START;
    
    ram_mem[89] = START;
    
    ram_mem[90] = START;
end

always 
    @(posedge pulse) begin
        if(re_en) begin
            data_out <= ram_mem[addr_in];
        end
end

endmodule
