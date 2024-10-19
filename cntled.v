module cntled
(   input clk, rst,
    output [7 : 0] leds
);

parameter CLOCK_CYCLE = 50000000;

reg [25 : 0] cnt50_next, cnt50_reg;

reg [7 : 0] cnt_next, cnt_reg;

always
    @(posedge clk or posedge rst)
    begin
        if(rst)
            begin
                cnt50_reg <= 0;
        
                cnt_reg <= 0;
            end
        else
            begin
                cnt50_reg <= cnt50_next;
                
                cnt_reg <= cnt_next;
            end
    end

always 
    @(*)
    begin
        cnt50_next = cnt50_reg; 
        cnt_next = cnt_reg;
        
        if(cnt50_reg == CLOCK_CYCLE - 1)
            begin
                cnt50_next = 0;
                
                cnt_next = cnt_reg + 1;
            end
        else
            begin   
                cnt50_next = cnt50_reg + 1;
            end
    end

assign leds = cnt_reg;

endmodule
