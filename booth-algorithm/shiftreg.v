module shiftreg(data_out,data_in,ld,clr,clk,sft,sin);
    input sin;
    input ld,clr,clk;
    input[15:0]data_in;
    input sft;
    output reg [15:0] data_out;

    always@(posedge clk)begin
        if(clr)
            data_out<=16'b0;
        else if(ld)
            data_out<=data_in;
       else if(sft)
            data_out<={sin,data_out[15:1]};
    end
endmodule