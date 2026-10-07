module xor_gen_tb;
    reg [15:0] A, B;
    wire [15:0] Y;
    xor_gen #(.N(16)) UUT (.a(A), .b(B), .y(Y));
    initial begin
        $dumpfile("xor_gen.vcd");
        $dumpvars(0, xor_gen_tb);
        $monitor("Time=%0t, A=%h, B=%h, Y=%h", $time, A, B, Y);
        #5 A = 16'haaaa; B = 16'h00ff;
        #5 A = 16'hffff; B = 16'h0000;
        #5 $finish;
    end
endmodule