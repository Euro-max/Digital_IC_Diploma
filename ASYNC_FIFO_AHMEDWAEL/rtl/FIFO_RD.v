module FIFO_RD #(
    parameter ADDR = 8
)(
    input  wire                  rclk,
    input  wire                  rrst_n,
    input  wire                  rinc,
    input  wire [$clog2(ADDR):0] rq2_wptr_bin, // Synced write ptr, converted to binary at top level
    output reg  [$clog2(ADDR):0] rptr_bin,     // Binary read ptr, top level will convert to Gray
    output wire [$clog2(ADDR)-1:0] raddr,      // Binary read address for memory
    output reg                   rempty
);

    localparam N = $clog2(ADDR);

    wire [N:0] rbin_next;
    wire       rempty_next;

    // The memory address drops the extra MSB
    assign raddr = rptr_bin[N-1:0];

    // Binary counter logic (only increments if not empty)
    assign rbin_next = rptr_bin + (rinc & ~rempty);

    // "Normal" Binary Empty Condition: Exact match between pointers
    assign rempty_next = (rbin_next == rq2_wptr_bin);

    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) begin
            rptr_bin <= 0;
            rempty   <= 1'b1; // CRITICAL: FIFO boots up empty!
        end else begin
            rptr_bin <= rbin_next;
            rempty   <= rempty_next;
        end
    end

endmodule