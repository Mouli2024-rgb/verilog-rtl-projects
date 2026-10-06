module mux_4to1(
    input[3:0]in,
    input[1:0]sel,
    output out
);
wire[1:0]t;
mux_2to1 M0(in[1:0],sel[0],t[0]);
mux_2to1 M1(in[3:2],sel[0],t[1]);
mux_2to1 M2(t[1:0],sel[1],out);
endmodule