module display7bit
(
	input [3 : 0] bcd,
	output reg [7 : 0] seg
);

always
    @(*) begin
        case(bcd)
            4'b0000: seg = 8'b11000000; // 0
            4'b0001: seg = 8'b11111100; // 1
            4'b0010: seg = 8'b11111100; // 2
            4'b0011: seg = 8'b10110000; // 3
            4'b0100: seg = 8'b10001001; // 4
            4'b0101: seg = 8'b10011010; // 5
            4'b0110: seg = 8'b10000011; // 6
            4'b0111: seg = 8'b11111000; // 7
            4'b1000: seg = 8'b10000000; // 8
            4'b1001: seg = 8'b10011000; // 9
            default: seg = 8'b11111111; // Blank
        endcase
    end

endmodule
