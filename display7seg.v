module display7seg(
    input a, 

    input b,

    input c,

    input d,

    output [7 : 0] display7bit
);

reg h0;

reg h1;

reg h2;

reg h3;

reg h4;

reg h5;

reg h6;

reg h7;

always 
    @(*)
begin
    h0 = (~a) + (~b) * (~c);

    h1 = (~b) * (~c) + (~a) * (~b) + (~a) * c * d;

    h2 = (~a) * (~c) * (~d) + (~a) * c * d + (~a) * b + a * (~b) * (~c);

    h3 = (~a) * (~b) * (~d) + (~b) * c + (~a) * c * (~d);

    h4 = (~b) * (~c) * (~d) + (~a) * c * (~d);

    h5 = (~a) * (~c) * (~d) + (~a) * b * (~d) + (~a) * b * (~c) + a * (~b) * (~c);

    h6 = (~b) + (~a) * b * (~d) + (~a) * b * (~c);

    h7 = 1;
end

assign display7bit = {h7, h6, h5, h4, h3, h2, h1, h0};

endmodule
