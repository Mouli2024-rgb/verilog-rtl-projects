module ripplecounter(
    input CLK,CLR,
    output [5:0] COUNt);

    tff F0(COUNt[0],CLK,CLR);
    tff F1(COUNt[1],COUNt[0],CLR);
    tff F2(COUNt[2],COUNt[1],CLR);
    tff F3(COUNt[3],COUNt[2],CLR);
    tff F4(COUNt[4],COUNt[3],CLR);
    tff F5(COUNt[5],COUNt[4],CLR);
endmodule
