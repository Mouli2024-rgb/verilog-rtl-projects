module alu(z,addsub,a,m);
    input [15:0]a,m;
    input addsub;
    output reg [15:0]z;
    always@(*)begin
        if(addsub==0)begin   //addsub==0 means subtraction
            z=a-m;
        end
        else begin
            z=a+m;
        end
    end
endmodule
    