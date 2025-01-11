module mem_prep
(
    input pulse,

    input rst,

    output ready
);

reg [2 : 0] count5_reg, count5_next;

reg out_reg, out_next;

reg flag_reg, flag_next;

always
    @(posedge pulse or negedge rst) begin
        if(!rst) begin
            count5_reg <= 0;

            out_reg <= 0;

            flag_reg <= 0;
        end
        else begin
            count5_reg <= count5_next;

            out_reg <= out_next;

            flag_reg <= flag_next;
        end
end

always 
    @(*) begin
    count5_next = count5_reg;
    
    out_next = out_reg;

    flag_next = flag_reg;

    if(!flag_reg) begin
        if(count5_reg == 5) begin
            out_next = 1;

            flag_next = 1;
        end
        else begin
            count5_next = count5_reg + 1;
        end
    end
end

assign ready = out_reg;

endmodule
