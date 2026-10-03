module DESERIALIZER (
    input wire SAMPLED_BIT,
    input wire DESER_EN,
    input wire clk,
    input wire rst,
    output reg [7:0] P_DATA
);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            P_DATA <= 8'b00000000;
        end
        //SIPO (Serial In Parallel Out) Register
        else if (DESER_EN) begin
            P_DATA <= {SAMPLED_BIT, P_DATA[7:1]};
        end
    end

endmodule