module up_down(
    input clk,clr,mode,ld,
    input[7:0] d,
    output reg[7:0] count
);
always @(posedge clk)
begin
    if(ld)
        count <= d;
    else if(clr)
        count <= 8'b0;
    else if(mode)
        count <= count + 1;
    else
        count <= count - 1;
end
endmodule   
