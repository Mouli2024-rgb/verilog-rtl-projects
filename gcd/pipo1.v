module pipo1(data_out,bus,ld,clk);
    input clk;
    input ld;
    input [15:0]bus;
    output reg [15:0]data_out;
always@(posedge clk) begin
    if(ld)begin
        data_out<=bus;
    end
end
endmodule