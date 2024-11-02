module pulse(
    input clk, rst,
    output reg pulse_1s
);

parameter CLOCK_CYCLE = 50000000;

reg [25 : 0] cnt50_next, cnt50_reg;

always
    @(posedge clk or negedge rst)
    begin
        if(!rst)
            begin
                cnt50_reg <= 0;
            end
        else
            begin   
                cnt50_reg <= cnt50_next; 
            end
    end

always
    @(*)
    begin
        cnt50_next = cnt50_reg;
        
        pulse_1s = 0;

        if(cnt50_reg == CLOCK_CYCLE - 1)
            begin
                cnt50_next = 0;
       
                pulse_1s = 1;
            end
        else
            begin
                cnt50_next = cnt50_reg + 1;
                
                pulse_1s = 0;
            end
    end

endmodule
