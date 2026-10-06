module mul_test;
reg[15:0]DATA_IN;
reg CLK,START;
wire DONE;

datapath DP(eqz,lda,ldb,ldp,clrp,decb,DATA_IN,CLK);
controller CON(lda,ldb,ldp,clrp,decb,DONE,CLK,eqz,START);
initial begin
CLK=1'b0;
#3 START=1'b1;
#500 $finish;
end
always #5 CLK=~CLK;
initial begin
#17 DATA_IN=17;
#10 DATA_IN=5;
end
initial begin
$monitor("T=%0t DATA=%0d X=%0d Y=%0d Z=%0d BOUT=%0d LDA=%b LDB=%b LDP=%b CLRP=%b DECB=%b STATE=%b DONE=%b EQZ=%b",
$time, DATA_IN, DP.x, DP.y, DP.z, DP.bout,
lda, ldb, ldp, clrp, decb, CON.state, DONE, eqz);
$dumpfile("datapath.vcd");
$dumpvars(0,mul_test);
end
endmodule