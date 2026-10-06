module booth_tb;
    reg clk;
    reg [15:0]q_in,m_in;
    wire [15:0]z;
    reg start;
    wire [4:0]count;
    wire qm1, eqz;
    wire[15:0] a,m,q;
    wire lda, ldq, ldm;
    wire clra, clrq, clrff;
    wire sfta, sftq, addsub;
    wire  q0, done;
    wire decr, ldcnt;
   assign q0 = q[0]; 
datapath DP(qm1,eqz,count,a,m,q,z,q_in,m_in,lda,ldq,ldm,clra,clrq,clrff,sfta,sftq,addsub,clk,start,ldcnt,decr);
controlpath CP(lda,clra,sfta,ldq,clrq,sftq,ldm,clrff,addsub,clk,start,eqz,q0,qm1,done,ldcnt,decr);
initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
     initial begin
        q_in = 16'd3;
         m_in = 16'd5;
        start=0;

        #10
        start = 1;
     #10 start=0;

        #500;
        $finish;
    end
initial begin
    $dumpfile("booth_tb.vcd");
    $dumpvars(0,booth_tb);
$monitor("T=%0t Q=%h A=%h M=%h Z=%h Count=%h state=%b q0=%b qm1=%b lda=%b addsub=%b sfta=%b sftq=%b done=%b",
$time,q,a,m,z,count,CP.state,q0,qm1,lda,addsub,sfta,sftq,done);
end
endmodule
