module xor_gen#(
    parameter N=16)
    (
    input [N-1:0] a,
    input [N-1:0] b,
    output [N-1:0] y
);
genvar p;
generate for (p=0; p<N; p=p+1)
    begin: xorlp
        xor XG (y[p], a[p], b[p]);
    end
endgenerate
endmodule