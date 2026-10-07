module rc_tb;
reg CLK,INIT;
wire [3:0]COUNT;
rc UUT(
    .clk(CLK),
    .init(INIT),
    .count(COUNT)
);
initial begin
    $dumpfile("rc.vcd");
    $dumpvars(0,rc_tb);
    $monitor("Time =%0t CLK=%b,INIT=%d,COUNT=%d",$time,CLK,INIT,COUNT);
    CLK=0;
    forever #5 CLK=~CLK;
end
initial begin
     #5 INIT=0;
     #10 INIT=1;
     #10 INIT=0;
     #10 INIT=0;
     #100;
     #10 $finish;
  
end
endmodule 