module lamp(
    input clk,
    output reg [2:0] light
);
parameter S0=0, S1=1, S2=2;
parameter RED=3'b100, YELLOW=3'b010, GREEN=3'b001;
reg [1:0] state;
always @(posedge clk) begin
    case(state)
        S0: begin
            light <= RED;
            state <= S1;
        end
        S1: begin
            light <= YELLOW;
            state <= S2;
        end
        S2: begin
            light <= GREEN;
            state <= S0;
        end
        default: begin
            light <= RED;
            state <= S1;
        end
    endcase
end
endmodule