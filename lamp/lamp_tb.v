module lamp_tb;
    reg CLK;
    wire [2:0] LIGHT;
    lamp2 uut (
        .clk(CLK),
        .light(LIGHT)
    );
always #5 CLK = ~CLK;
initial begin
    $dumpfile("lamp.vcd");
    $dumpvars(0, lamp_tb);
    $monitor("Time: %0t , Light: %b", $time, LIGHT);
    CLK=1'b0;
    #100 $finish;
end
endmodule