module datapath(EQ,LT,GT,data_in,LDA,LDB,SEL1,SEL2,SEL_IN,CLK);
    input[15:0]data_in;
    wire [15:0]a_out,b_out;
    wire[15:0]X,Y;
    wire[15:0]Bus,Z;
    input CLK,LDA,LDB,SEL1,SEL2,SEL_IN;
    output EQ,LT,GT;
    

    pipo1 A(a_out,Bus,LDA,CLK);
    pipo1 B(b_out,Bus,LDB,CLK);
    mux MUX1(X,a_out,b_out,SEL1);
    mux MUX2(Y,a_out,b_out,SEL2);
    mux MUX3(Bus,Z,data_in,SEL_IN);
   comp C(EQ,LT,GT,a_out,b_out);   // instead of comp C(EQ,LT,GT,X,Y);
    sub S(Z,X,Y);
endmodule
