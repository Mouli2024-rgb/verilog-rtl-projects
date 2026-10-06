module controlpath(lda,clra,sfta,ldq,clrq,sftq,ldm,clrff,addsub,clk,start,eqz,q0,qm1,done,ldcnt,decr);
    input q0,qm1;
    input clk,start,eqz;
    output reg lda,clra,sfta,ldq,clrq,sftq,ldm,clrff,addsub,done,ldcnt,decr;
    reg [2:0]state;
    parameter S0=3'b000, S1=3'b001, S2=3'b010, CHECK=3'b011,
              ADD=3'b100, SUB=3'b101, SHIFT=3'b110, DONE=3'b111;

    initial state = S0;

    always@(posedge clk)begin
        case(state)
            S0:    if(start) state<=S1;
            S1:    state<=S2;
            S2:    state<=CHECK;
            CHECK: if(eqz)                     state<=DONE;
                   else if({q0,qm1}==2'b01)     state<=ADD;
                   else if({q0,qm1}==2'b10)     state<=SUB;
                   else                         state<=SHIFT;
            ADD:   state<=SHIFT;
            SUB:   state<=SHIFT;
            SHIFT: state<=CHECK;
            DONE:  state<=DONE;
            default: state<=S0;
        endcase
    end

    always@(*)begin
        lda=0; clra=0; sfta=0; ldq=0; clrq=0; sftq=0;
        ldm=0; clrff=0; addsub=0; done=0; ldcnt=0; decr=0;
        case(state)
            S1:    begin clra=1; clrff=1; ldcnt=1; ldm=1; end
            S2:    begin ldq=1; end
            ADD:   begin addsub=1; lda=1; end
            SUB:   begin addsub=0; lda=1; end
            SHIFT: begin sfta=1; sftq=1; decr=1; end
            DONE:  begin done=1; end
            default: ; // S0 and CHECK output nothing
        endcase
    end
endmodule