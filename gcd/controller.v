module controller(lda,ldb,sel1,sel2,sel_in,done,start,lt,gt,eq,clk);
    input start,lt,gt,eq,clk;
    output reg lda,ldb,sel1,sel2,sel_in,done;
    reg[2:0]state;
    parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101;

    always@(posedge clk)begin
        case(state)
            S0:begin
                if(start)begin
                    state<=S1;
                end
            end
            S1:begin
                state<=S2;
            end
            S2:begin
                if(eq)begin
                    state<=S5;
                end
                else if(lt)begin
                    state<=S3;
                end
                else if(gt)begin
                    state<=S4;
                end
            end
            S3:begin
                if(eq)begin
                    state<=S5;
                end
                else if(lt)begin
                    state<=S3;
                end
                else if(gt)begin
                    state<=S4;
                end
            end
            S4:begin
                if(eq)begin
                    state<=S5;
                end
                else if(lt)begin
                    state<=S3;
                end
                else if(gt)begin
                    state<=S4;
                end
            end
            S5:begin
                state<=S0;
            end
            default:begin
                state<=S0;
            end
        endcase
    end

    always@(*)begin
        case(state)
            S0:begin
                lda=1'b1;
                sel_in=1'b0;
                ldb=1'b0;
                done=1'b0;
                sel1=1'b1;   // X = a_out
                sel2=1'b0;   // Y = b_out
            end
            S1:begin
                lda=1'b0;
                sel_in=1'b0;
                ldb=1'b1;
                done=1'b0;
                sel1=1'b1;   // X = a_out
                sel2=1'b0;   // Y = b_out
            end
            S2:begin
                if(eq)begin
                    done=1'b1;
                end
                else if(lt)begin
                    sel_in=1'b1;
                    sel1=1'b0;   // X = b_out (larger)
                    sel2=1'b1;   // Y = a_out (smaller)
                    lda=1'b0;
                    ldb=1'b1;
                end
                else if(gt)begin
                    sel1=1'b1;   // X = a_out (larger)
                    sel2=1'b0;   // Y = b_out (smaller)
                    sel_in=1'b1;
                    lda=1'b1;
                    ldb=1'b0;
                end
            end
            S3:begin
                if(eq)begin
                    done=1'b1;
                end
                else if(lt)begin
                    sel_in=1'b1;
                    sel1=1'b0;
                    sel2=1'b1;
                    lda=1'b0;
                    ldb=1'b1;
                end
                else if(gt)begin
                    sel1=1'b1;
                    sel2=1'b0;
                    sel_in=1'b1;
                    lda=1'b1;
                    ldb=1'b0;
                end
            end
            S4:begin
                if(eq)begin
                    done=1'b1;
                end
                else if(lt)begin
                    sel_in=1'b1;
                    sel1=1'b0;
                    sel2=1'b1;
                    lda=1'b0;
                    ldb=1'b1;
                end
                else if(gt)begin
                    sel1=1'b1;
                    sel2=1'b0;
                    sel_in=1'b1;
                    lda=1'b1;
                    ldb=1'b0;
                end
            end
            S5:begin
                done=1'b1;
                sel1=0;
                sel2=0;
                lda=0;
                ldb=0;
            end
            default:begin
                lda=0;
                ldb=0;
            end
        endcase
    end
endmodule