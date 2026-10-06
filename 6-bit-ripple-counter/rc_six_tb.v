module rc_six_tb;
    reg CLOCK,CLEAR;
    wire [5:0] C;
    ripplecounter uut(.CLK(CLOCK),.CLR(CLEAR),.COUNt(C));
    initial begin
        $dumpfile("rc_six.vcd");
        $dumpvars(0,rc_six_tb);
        $monitor("Time=%0t CLOCK=%b CLEAR=%b COUNt=%h",$time,CLOCK,CLEAR,C);
        #5 CLOCK=0; CLEAR=1;
        #5 CLOCK=1; CLEAR=1;
        #5 CLOCK=0; CLEAR=0;
        #5 CLOCK=1; CLEAR=0;
        #5 CLOCK=1; CLEAR=0;
        #5 CLOCK=0; CLEAR=0;
        #100 $finish;
    end
endmodule
