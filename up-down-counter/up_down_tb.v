module up_down_tb;
reg Clk, Clr, Mode, Ld;
reg [7:0] D;
wire [7:0] Count;
up_down uut (.clk(Clk), .clr(Clr), .mode(Mode), .ld(Ld), .d(D), .count(Count));
initial begin
    $dumpfile("up_down.vcd");
    $dumpvars(0, up_down_tb);
    $monitor("Time=%0t, Clk=%b, Clr=%b, Mode=%b, Ld=%b, D=%b, Count=%b", $time, Clk, Clr, Mode, Ld, D, Count);
    Clk=0;
    forever #10 Clk=~Clk;
end
initial 
begin
    #10 Clr=1; Ld=0; Mode=0; D=8'b00000000;
    #10 Clr=0; Ld=1; Mode=0; D=8'b00001010;
    #10 Clr=0; Ld=0; Mode=1; D=8'b00000000;
    #50 Clr=0; Ld=0; Mode=0; D=8'b00000000;
    #50 $finish;
end
endmodule 
