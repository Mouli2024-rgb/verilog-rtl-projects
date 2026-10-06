module datapath(eqz,lda,ldb,ldp,clrp,decb,data_in,CLK);
    input [15:0]data_in;
    input CLK;
    input lda,ldb,ldp,clrp,decb;
    output  eqz;

wire [15:0]x,y,z,bouts;
pipo1 A(x,data_in,lda,CLK);
pipo2 B(y,z,ldp,clrp,CLK);
cntr C(bout,data_in,ldb,decb,CLK);
add ADD(z,x,y);
eqz EQZ(bout,eqz);
endmodule