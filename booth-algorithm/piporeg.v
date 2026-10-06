module piporeg(data_out,data_in,ldm,clk);
    input ldm,clk;
    input[15:0]data_in;
    output reg [15:0] data_out;
    always@(posedge clk)begin
        if(ldm)
            data_out<=data_in;
    end
endmodule