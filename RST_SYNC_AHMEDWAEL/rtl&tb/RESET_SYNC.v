module RESET_SYNC #(parameter STAGES=5) (
    input  wire clk,
    input  wire async_rst_n,
    output wire sync_rst_n
);

    reg [STAGES-1:0] shift_reg;

    always @(posedge clk or negedge async_rst_n) begin
        if (!async_rst_n) begin
            // Asynchronous Assertion: Immediate drop to 0
            shift_reg <= {STAGES{1'b0}};
        end else begin
            // Synchronous De-assertion: Shift a safe '1' through on the clock edge
            if (STAGES == 1) begin
                shift_reg <= 1'b1;
            end else begin
                shift_reg <= {shift_reg[STAGES-2:0], 1'b1};
            end
        end
    end

    assign sync_rst_n = shift_reg[STAGES-1];

endmodule