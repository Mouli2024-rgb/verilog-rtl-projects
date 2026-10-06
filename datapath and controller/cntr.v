module cntr(dout,din,ld,dec,clk);
    input [15:0]din;
    input clk;
    input ld;
    input dec;
     output  reg [15:0]dout;
     always@(posedge clk)
     begin
        if(ld)
            dout<=din;
           else if(dec)
                dout<=dout-1'b1;
        end
    endmodule