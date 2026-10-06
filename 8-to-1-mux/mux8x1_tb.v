module mux8x1_tb;
reg [7:0] IN;
reg [2:0] SEL;
wire OUT;
mux8x1 uut(
    .in(IN),
    .sel(SEL),
    .out(OUT)
);
initial begin
    $dumpfile("mux8x1.vcd");
    $dumpvars(0, mux8x1_tb);
    $monitor("Time=%0t, IN=%h, SEL=%h, OUT=%b", $time, IN, SEL, OUT);
   #5 IN=8'b10101010; SEL=3'b000; 
    #5 IN=8'b10101010; SEL=3'b001;
    #5 IN=8'b10101010; SEL=3'b010;
    #5 $finish;

end
endmodule
