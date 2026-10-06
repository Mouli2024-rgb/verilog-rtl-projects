module counter_tb;
reg clr, clock;
wire [7:0] c;
counter #(.N(7)) c1(.clear(clr), .clk(clock), .count(c));
initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0, counter_tb);
    $monitor("Time: %0t, clr=%b, clock=%b, count=%d", $time, clr, clock, c);
    clock=0;
    forever #10 clock=~clock;
end
initial begin
  #10 clr=1;
  #10 clr=0;
  #10 clr=0;
  #10 clr=1;
#10 clr=1;
    #10 $finish;
end
endmodule
    

