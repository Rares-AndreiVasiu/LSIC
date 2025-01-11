module neg_detect
(
    input clk,
    input rst,
    input sig,
    output reg neg_sig 
);

reg signal_prev;

always
    @(posedge clk or negedge rst)begin
        if(!rst)begin
            signal_prev <= 0;

            neg_sig <= 0;
        end
        else begin
            neg_sig <= (!sig && signal_prev);

            signal_prev <= sig;
        end
    end
endmodule

