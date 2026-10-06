module mux_2to1(
    input[1:0]in,
    input sel,
    output out
) ;
    assign out=in[sel];
endmodule
