module FIFO_WR #(
    parameter ADDR = 8
)(
    input  wire                  wclk,
    input  wire                  wrst_n,
    input  wire                  winc,
    input  wire [$clog2(ADDR):0] rq2_rptr_bin, // Synced read ptr, converted to binary at top level
    output reg  [$clog2(ADDR):0] wptr_bin,     // Binary write ptr, top level will convert to Gray
    output wire [$clog2(ADDR)-1:0] waddr,      // Binary write address for memory
    output reg                   wfull
);

    localparam N = $clog2(ADDR);

    wire [N:0] wbin_next;
    wire       wfull_next;

    // The memory address drops the extra MSB
    assign waddr = wptr_bin[N-1:0];

    // Binary counter logic (only increments if not full)
    assign wbin_next = wptr_bin + (winc & ~wfull);

    // "Normal" Binary Full Condition: MSB is opposite, all other bits match exactly
    assign wfull_next = (wbin_next == {~rq2_rptr_bin[N], rq2_rptr_bin[N-1:0]});

    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            wptr_bin <= 0;
            wfull    <= 0;
        end else begin
            wptr_bin <= wbin_next;
            wfull    <= wfull_next;
        end
    end

endmodule