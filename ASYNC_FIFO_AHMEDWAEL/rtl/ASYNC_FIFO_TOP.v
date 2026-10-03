module ASYNC_FIFO_TOP #(
    parameter DATA_WIDTH = 8,
    parameter ADDR       = 8  // Sets depth of FIFO
)(
    // Write Domain
    input  wire                  wclk,
    input  wire                  wrst_n, // External asynchronous reset
    input  wire                  winc,
    input  wire [DATA_WIDTH-1:0] wdata,
    output wire                  wfull,
    
    // Read Domain
    input  wire                  rclk,
    input  wire                  rrst_n, // External asynchronous reset
    input  wire                  rinc,
    output wire [DATA_WIDTH-1:0] rdata,
    output wire                  rempty
);

    // Pointer widths: N+1 bits for Full/Empty logic, N bits for Memory Address
    localparam PTR_WIDTH  = $clog2(ADDR) + 1; 
    localparam ADDR_WIDTH = $clog2(ADDR);     

    // ==========================================
    // Internal Signal Declarations
    // ==========================================
    
    // Synchronized Resets
    wire sync_wrst_n;
    wire sync_rrst_n;

    // Binary Pointers & Addresses
    wire [PTR_WIDTH-1:0]  wptr_bin, rptr_bin;
    wire [ADDR_WIDTH-1:0] waddr, raddr;

    // Gray Code Pointers (Pre-Synchronization)
    wire [PTR_WIDTH-1:0]  wptr_gray, rptr_gray;

    // Gray Code Pointers (Post-Synchronization)
    wire [PTR_WIDTH-1:0]  wq2_rptr_gray, rq2_wptr_gray;

    // Binary Pointers (Post-Synchronization & Post-Conversion)
    wire [PTR_WIDTH-1:0]  wq2_rptr_bin, rq2_wptr_bin;

    // ==========================================
    // 1. Reset Synchronizers
    // ==========================================
    
    RESET_SYNC #(.STAGES(2)) sync_wreset (
        .clk(wclk),
        .async_rst_n(wrst_n),
        .sync_rst_n(sync_wrst_n)
    );

    RESET_SYNC #(.STAGES(2)) sync_rreset (
        .clk(rclk),
        .async_rst_n(rrst_n),
        .sync_rst_n(sync_rrst_n)
    );

    // ==========================================
    // 2. Write Domain Logic
    // ==========================================

    FIFO_WR #(.ADDR(ADDR)) wr_logic (
        .wclk(wclk),
        .wrst_n(sync_wrst_n),
        .winc(winc),
        .rq2_rptr_bin(wq2_rptr_bin), 
        .wptr_bin(wptr_bin),
        .waddr(waddr),
        .wfull(wfull)
    );

    B2G #(.DATA_WIDTH(PTR_WIDTH)) b2g_wptr (
        .BIN_DATA(wptr_bin),
        .GRAY_DATA(wptr_gray)
    );

    // Sync Read Pointer (Gray) INTO Write Domain
    DFFS #(.STAGES(2), .DATA_WIDTH(PTR_WIDTH)) sync_r2w (
        .clk(wclk),
        .rst(sync_wrst_n),
        .DATA_IN(rptr_gray),
        .DATA_OUT(wq2_rptr_gray)
    );

    G2B #(.DATA_WIDTH(PTR_WIDTH)) g2b_rptr (
        .GRAY_DATA(wq2_rptr_gray),
        .BIN_DATA(wq2_rptr_bin)
    );

    // ==========================================
    // 3. Read Domain Logic
    // ==========================================

    FIFO_RD #(.ADDR(ADDR)) rd_logic (
        .rclk(rclk),
        .rrst_n(sync_rrst_n),
        .rinc(rinc),
        .rq2_wptr_bin(rq2_wptr_bin), 
        .rptr_bin(rptr_bin),
        .raddr(raddr),
        .rempty(rempty)
    );

    B2G #(.DATA_WIDTH(PTR_WIDTH)) b2g_rptr (
        .BIN_DATA(rptr_bin),
        .GRAY_DATA(rptr_gray)
    );

    // Sync Write Pointer (Gray) INTO Read Domain
    DFFS #(.STAGES(2), .DATA_WIDTH(PTR_WIDTH)) sync_w2r (
        .clk(rclk),
        .rst(sync_rrst_n),
        .DATA_IN(wptr_gray),
        .DATA_OUT(rq2_wptr_gray)
    );

    G2B #(.DATA_WIDTH(PTR_WIDTH)) g2b_wptr (
        .GRAY_DATA(rq2_wptr_gray),
        .BIN_DATA(rq2_wptr_bin)
    );

    // ==========================================
    // 4. Dual-Port Memory Core
    // ==========================================
    // Note: waddr and raddr are zero-padded to fit the N+1 bit requirement 
    // of the FIFO_MEM port list, preventing out-of-bounds array access.

    FIFO_MEM #(
        .DATA_WIDTH(DATA_WIDTH), 
        .ADDR(ADDR)
    ) memory_core (
        .wclk(wclk),
        .rclk(rclk),
        .W_DATA(wdata),
        .WR_EN(winc),
        .RD_EN(rinc),
        .W_FULL(wfull),
        .R_EMPTY(rempty),
        .iptr({1'b0, waddr}), 
        .optr({1'b0, raddr}), 
        .R_DATA(rdata)
    );

endmodule