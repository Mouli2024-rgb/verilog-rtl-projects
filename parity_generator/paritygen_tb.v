module paritygen_tb;
    reg X,CLK;
    wire OUTPUT;

paritygen uut (
        .x(X),
        .clk(CLK),
        .p(OUTPUT)
    );
    initial begin
        $dumpfile("paritygen.vcd");
        $dumpvars(0, paritygen_tb);
        $monitor("Time=%0t,X=%b, CLK=%b, OUTPUT=%b", $time, X, CLK, OUTPUT);
        CLK=1'b0;
    end
        always #5 CLK = ~CLK;
        initial begin
        X=1'b0;
        #2 X=1'b1;
        #10 X=1'b0;
        #10 X=1'b1;
        #10 X=1'b0;
        #10 X=1'b1;
        #10 X=1'b0;
        #10 X=1'b1;
        #10 X=1'b0;
        #10 $finish;
        end
endmodule