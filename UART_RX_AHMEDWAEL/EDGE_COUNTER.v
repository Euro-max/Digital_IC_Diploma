module EDGE_COUNTER(
    input wire clk,
    input wire rst,
    input wire enable,
    output reg [7:0] bit_cnt,
    output reg [7:0] edge_cnt
);

    wire bit_sig = (edge_cnt == 7);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            bit_cnt  <= 8'b0;
            edge_cnt <= 8'b0;
        end
        else if (enable) begin
            if (bit_sig) begin
                edge_cnt <= 8'b0;
                bit_cnt  <= bit_cnt + 1'b1;
            end 
            else begin
                edge_cnt <= edge_cnt + 1'b1;
            end
        end
        else begin
            // Reset cleanly when FSM drops 'enable' to 0
            bit_cnt  <= 8'b0;
            edge_cnt <= 8'b0;
        end
    end

endmodule