module counter(count,ldcnt,clk,decr);
    input ldcnt,clk,decr;
    output reg [4:0]count;
    
    always@(posedge clk)begin
        if(ldcnt)begin
            count<=5'b10000;
        end
        else if (decr) begin
            count<=count-1;
        end
        
        
    end
endmodule
    
