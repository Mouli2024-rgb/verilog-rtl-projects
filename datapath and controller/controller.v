module controller(lda,ldb,ldp,clrp,decb,done,clk,eqz,start);
    input start,clk,eqz;
    output reg lda,ldb,ldp,clrp,decb,done;
    reg [2:0]state;
    parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100;
   always@(posedge clk)
   begin
        case(state)
            S0:begin
                if(start)
                    state<=S1;
                else
                    state<=S0;
                end
            S1:begin
                state<=S2;
                end
            S2:begin
                    state<=S3;
                end
            S3:begin
                #2 if(eqz)
                    state<=S4;
                end
            S4:begin
                state<=S4;
                end
                default:state<=S0;
        endcase
    end
always@(state)
begin
    case(state)
        S0:begin
           #1 lda<=1'b0;
            ldb<=1'b0;
            ldp<=1'b0;
            clrp<=1'b0;
            decb<=1'b0;
            end
        S1:begin
           #1 lda<=1'b1;
        
            end
        S2:begin
           #1 lda<=1'b0;
            ldb<=1'b1;
            clrp<=1'b1;
            end
        S3:begin
           #1
            ldb<=1'b0;
            ldp<=1'b0;
            clrp<=1'b0;
            decb<=1'b1;

            end
        S4:begin
               #1 
                ldb<=1'b0;
                ldp<=1'b0;
                clrp<=1'b1;
                decb<=1'b0;
                done<=1'b1; 
                end
                default:begin
                    #1 lda<=1'b0;
                    ldb<=1'b0;      
                   ldp<=1'b0;
                    clrp<=1'b0;
                    decb<=1'b0;
                end
    endcase
end
endmodule