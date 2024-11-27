module display7seg
    #(parameter DISP = 8)
(
    input a, 

    input b,

    input c,

    input d,

    output [DISP - 1 : 0] display7bit
);

reg [DISP - 1 : 0] segments;

always
    @(a, b, c, d) begin
        
        case({a, b, c, d})
            4'b0000: segments = 8'b11000000; // 0

            4'b0001: segments = 8'b11111001; // 1

            4'b0010: segments = 8'b10100100; // 2

            4'b0011: segments = 8'b10110000; // 3

            4'b0100: segments = 8'b10011001; // 4

            4'b0101: segments = 8'b10010010; // 5

            4'b0110: segments = 8'b10000010; // 6

            4'b0111: segments = 8'b11111000; // 7

            4'b1000: segments = 8'b10000000; // 8

            4'b1001: segments = 8'b10010000; // 9

            default:
                segments = 8'b11111111;
        endcase
end

assign display7bit = segments;

endmodule
