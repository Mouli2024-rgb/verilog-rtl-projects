module sequence_detector(
    input x,
    input clk,
    input reset,
    output z
);
reg[1:0]PS,NS;
parameter S0=0,S1=1,S2=2,S3=3;

always@(posedge clk or posedge reset)
if(reset)
    PS<=S0;
else
    PS<=NS;
    always@(PS or x)
    case(PS)
        S0:begin
            z<=x?0:0;
            NS<=x?S0:S1;
        end
        S1:begin
            z<=x?0:0;
            NS<=x?S2:S1;
        end
        S2:begin
            z<=x?0:0;
            NS<=x?S3:S1;
        end
        S3:begin
            z<=x?0:1;
            NS<=x?S0:S1;
        end
    endcase
endmodule
        

