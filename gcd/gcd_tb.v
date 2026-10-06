module gcd_tb;
    reg[15:0]data_input;
    reg clk,start;
    wire done;
    wire EQ,LT,GT;
wire LDA,LDB,SEL1,SEL2,SEL_IN;


    datapath DP(EQ,LT,GT,data_input,LDA,LDB,SEL1,SEL2,SEL_IN,clk);
    controller C(LDA,LDB,SEL1,SEL2,SEL_IN,done,start,LT,GT,EQ,clk);
    initial begin
        clk=1'b0;
        #3 start=1'b1;
        #1000 $finish;
    end
    always #5 clk=~clk;
    initial begin
        data_input=16'd143;
        #20 data_input=16'd78;
    end
    initial begin
        $monitor("time=%0t\tstate=%b\tlda=%b\tldb=%b\tsel1=%b\tsel2=%b\tsel_in=%b\teq=%b\tlt=%b\tgt=%b\ta_out=%0d\tdone=%b",
          $time, C.state, LDA, LDB, SEL1, SEL2, SEL_IN, EQ, LT, GT, DP.a_out, done);
        $dumpfile("gcd.vcd");
        $dumpvars(0,gcd_tb);
    end
endmodule