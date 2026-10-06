`default_nettype none
module counter#(
    parameter N=7
)(
    input clear,clk,
    output reg [N:0] count
);
always @(posedge clk)
begin
    if (clear)
     count <= 0;
    else count <= count + 1;
end
endmodule
