module fsm #(parameter DATA_SIZE = 32)
(
    input pulse,

    input valid_read,

    input rst,

    input [DATA_SIZE - 1 : 0] data_in,

    output  wr_en,

    output increment,

    output restart
);

localparam START = {DATA_SIZE{1'b1}};

localparam STOP = {DATA_SIZE{1'b0}};

localparam PAUSE = {DATA_SIZE{1'b1}} >> 16;

reg we_en_sig;

reg increment_sig;

reg restart_sig;


always 
    @(*) begin

    we_en_sig = 0;

    increment_sig = 0;

    restart_sig = 0;

    if(valid_read) begin
        case(data_in)
            START: begin
                increment_sig = 1;

                we_en_sig = 0;
            end

            PAUSE: begin                
                increment_sig = 0;

                we_en_sig = 1;
            end

            STOP: begin
                increment_sig = 0;

                we_en_sig = 0;

                restart_sig = 1;
            end
            default: begin
                increment_sig = 0;

                we_en_sig = 0;

                restart_sig = 0;
            end
        endcase
    end
end

assign wr_en = we_en_sig;

assign restart = restart_sig;

assign increment = increment_sig;

endmodule
