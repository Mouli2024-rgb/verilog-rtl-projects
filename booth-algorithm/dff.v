module dff(q,clk,clrff,en,d);
    input clk,clrff,en,d;
    output reg q;
    always@(posedge clk)begin
        if(clrff)
            q<=1'b0;
        else if(en)
            q<=d;
    end
endmodule