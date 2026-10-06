module comp(eq,lt,gt,data1,data2);
    input [15:0]data1,data2;
    output eq,lt,gt;
    assign eq = (data1==data2);
    assign lt = (data1<data2);
    assign gt = (data1>data2);
endmodule