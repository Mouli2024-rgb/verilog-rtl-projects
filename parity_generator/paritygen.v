module paritygen(
    input x,clk,
    output reg p
);
reg even_odd;
parameter EVEN=1'b0, ODD=1'b1;
always @(posedge clk) 
begin
    case(even_odd)
        EVEN:begin
            p<=x?1:0;
            even_odd<=x?ODD:EVEN; 
    end  
        ODD:begin
            p<=x?0:1;
            even_odd<=x?EVEN:ODD;
        end
        default:begin
            p<=1'b0;
            even_odd<=EVEN;
        end
    endcase
end
endmodule
  