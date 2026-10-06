module mux_4to1_tb;
    reg[3:0]IN;
    reg[1:0]SEL;
    wire OUT;
    mux_4to1 dut(.in(IN),.sel(SEL),.out(OUT));
    initial begin
        $dumpfile("mux_4to1.vcd");
        $dumpvars(0,mux_4to1_tb);
        $monitor("Time=%0t IN=%b SEL=%b OUT=%b",$time,IN,SEL,OUT);
        #5 IN=4'b1001;SEL=2'b00;
        #5 IN=4'b1001;SEL=2'b01;
        #5 IN=4'b1001;SEL=2'b10;
        #5 IN=4'b1001;SEL=2'b11;
        #5 $finish;
    end
    endmodule
