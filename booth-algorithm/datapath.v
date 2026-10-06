module datapath(qm1,eqz,count,a,m,q,z,q_in,m_in,lda,ldq,ldm,clra,clrq,clrff,sfta,sftq,addsub,clk,start,ldcnt,decr);
    input [15:0] q_in,m_in;
    input lda,ldq,ldm,clra,clrq,clrff,sfta,sftq,addsub,clk,start,ldcnt,decr;
    output qm1,eqz;
    output wire[15:0]z;
    output wire[4:0]count;
    output wire[15:0]a,m;
    output wire[15:0] q;

    assign eqz=~|count;
    shiftreg A(a,z,lda,clra,clk,sfta,a[15]);
    shiftreg Q(q,q_in,ldq,clrq,clk,sftq,a[0]);
    dff D(qm1,clk,clrff,sftq,q[0]);
    piporeg M(m,m_in,ldm,clk);
    alu AL(z,addsub,a,m);
    counter C(count,ldcnt,clk,decr);
endmodule
