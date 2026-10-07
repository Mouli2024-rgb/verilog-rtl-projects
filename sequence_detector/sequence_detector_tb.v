module sequence_detector_tb;
    reg X,Clk, Reset;
    wire Z;
    sequence_detector dut(
        .x(X),
        .clk(Clk),
        .reset(Reset),
        .z(Z)
    );
    initial begin
        Clk=0;
        forever #5 Clk=~Clk;
    end
    initial begin
        $dumpfile("sequence_detector_tb.vcd");
        $dumpvars(0,sequence_detector_tb);
        $monitor("Time=%0t X=%b Z=%b", $time, X, Z);
        #10 Reset=1; X=0;
        #10 Reset=0;X=0;
        #10 Reset=0;X=1;
        #10 Reset=0;X=1;
        #10 Reset=0;X=0;
        #10 Reset=0;X=1;
        #10 $finish;
    end
endmodule