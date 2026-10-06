primitive tff(q,clk,clr);
    input  clk, clr;
    output reg q;
    table 
// clk clr : q : q+;
    ?   1  : ? :0;
    ?   (10):? :-;
  (10)   0  : 1:0;
  (10)   0 : 0:1;
  (0?)   ?  : ?:-; 
    endtable
endprimitive