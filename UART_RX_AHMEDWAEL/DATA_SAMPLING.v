module DATA_SAMPLING #(parameter PRESCALE=8, parameter OVERSAMPLE=3)(
    input wire RX_IN,
    input wire DAT_SAMP_EN,
    input wire [5:0] EDGE_CNT,
    input wire clk,
    input wire rst,
    output wire SAMPLED_BIT
);

    
    reg [2:0] samples;
    
    
    wire [5:0] mid_point = (PRESCALE / 2);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            samples <= 3'b000;
        end
        else if (DAT_SAMP_EN) begin
            
            if (EDGE_CNT == (mid_point - 1'b1)) begin
                samples[0] <= RX_IN;
            end
            else if (EDGE_CNT == mid_point) begin
                samples[1] <= RX_IN;
            end
            else if (EDGE_CNT == (mid_point + 1'b1)) begin
                samples[2] <= RX_IN;
            end

            
        end
    end

// Perform Majority Voting
        assign SAMPLED_BIT = (samples[0] & samples[1]) | (samples[1] & samples[2]) | (samples[0] & samples[2]);
endmodule