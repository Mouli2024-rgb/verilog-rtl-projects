module eqz(data,EQZ);
    input [15:0]data;
    output EQZ;
    assign EQZ = (data==16'b0)?1'b1:1'b0;
endmodule