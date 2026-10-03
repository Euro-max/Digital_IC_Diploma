`timescale 1ns/1ps

module ASYNC_FIFO_TB;

    // Parameters for 100MHz Write and 40MHz Read
    parameter WCLK_PERIOD = 10; // 100MHz = 10ns
    parameter RCLK_PERIOD = 25; // 40MHz  = 25ns
    parameter DATA_WIDTH  = 8;
    parameter ADDR        = 8;  // Depth of 8

    // Testbench Signals
    reg                   wclk, rclk;
    reg                   wrst_n, rrst_n;
    reg                   winc, rinc;
    reg  [DATA_WIDTH-1:0] wdata;
    
    wire                  wfull, rempty;
    wire [DATA_WIDTH-1:0] rdata;

    // Instantiate the DUT
    ASYNC_FIFO_TOP #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR(ADDR)
    ) DUT (
        .wclk(wclk),
        .wrst_n(wrst_n),
        .winc(winc),
        .wdata(wdata),
        .wfull(wfull),
        .rclk(rclk),
        .rrst_n(rrst_n),
        .rinc(rinc),
        .rdata(rdata),
        .rempty(rempty)
    );

    // 1. Force floating point math to get perfect clock toggles
    initial begin
        wclk = 1'b0;
        forever #(WCLK_PERIOD / 2.0) wclk = ~wclk; 
    end

    initial begin
        rclk = 1'b0;
        forever #(RCLK_PERIOD / 2.0) rclk = ~rclk; 
    end
    
    // VCD Dumping
    initial begin
        $dumpfile("ASYNC_FIFO.vcd");
        $dumpvars;
    end
    
    // Flag Validation Task
    task check_outputs;
        input exp_wfull;
        input exp_rempty;
        input [400:1] test_name; 
        begin
            if (wfull === exp_wfull && rempty === exp_rempty) begin
                $display("[PASS] %0s | wfull: %b | rempty: %b time %0t", 
                         test_name, wfull, rempty, $time);
            end else begin
                $display("[FAIL] %0s | EXPECTED wfull: %b, rempty: %b | GOT wfull: %b, rempty: %b at time %0t", 
                         test_name, exp_wfull, exp_rempty, wfull, rempty, $time);
            end
        end
    endtask

    // Data Validation Task
    task check_data;
        input [DATA_WIDTH-1:0] exp_rdata;
        input [400:1] test_name;
        begin
            if (rdata === exp_rdata) begin
                $display("[PASS] %0s | rdata: %h time %0t", 
                         test_name, rdata, $time);
            end else begin
                $display("[FAIL] %0s | EXPECTED rdata: %h | GOT rdata: %h at time %0t", 
                         test_name, exp_rdata, rdata, $time);
            end
        end
    endtask

    // Test Vectors
    initial begin
        // SAFE INITIALIZATION
        winc   = 1'b0;
        rinc   = 1'b0;
        wdata  = 8'h00;
        wrst_n = 1'b1;
        rrst_n = 1'b1;

        // Asynchronous Active-Low Reset Phase
        #(WCLK_PERIOD * 2);
        wrst_n = 1'b0; 
        rrst_n = 1'b0; 
        #(WCLK_PERIOD * 2);  
        wrst_n = 1'b1; 
        rrst_n = 1'b1;
        
        // Wait for Reset CDC synchronizers to settle 
        #(RCLK_PERIOD * 3);
        check_outputs(1'b0, 1'b1, "Post-Reset Phase (Empty)");
        
        // =========================================================
        // MAIN TEST SEQUENCE - BURST WRITE 9 BYTES (100MHz)
        // =========================================================
        $display("\n--- Starting Burst Write of 9 Bytes (100MHz) ---");
        
        // Stimulus applied exactly on the negative edge to ensure positive-edge setup time
        @(negedge wclk); wdata = 8'hA1; winc = 1'b1;
        @(negedge wclk); wdata = 8'hB2; winc = 1'b1;
        @(negedge wclk); wdata = 8'hC3; winc = 1'b1;
        @(negedge wclk); wdata = 8'hD4; winc = 1'b1;
        @(negedge wclk); wdata = 8'hE5; winc = 1'b1;
        @(negedge wclk); wdata = 8'hF6; winc = 1'b1;
        @(negedge wclk); wdata = 8'h17; winc = 1'b1;
        @(negedge wclk); wdata = 8'h28; winc = 1'b1; // 8th Byte

        // Check full flag immediately after 8th write is registered
        @(negedge wclk); 
        check_outputs(1'b1, 1'b0, "wfull asserted exactly after 8 writes"); 

        // 9th Byte Overflow Attempt - Should be blocked by internal logic
        wdata = 8'h39; winc = 1'b1; 
        
        @(negedge wclk);
        winc = 1'b0; // Stop writing

        // Allow CDC synchronizers time to align pointers across domains
        #(RCLK_PERIOD * 3);
        check_outputs(1'b1, 1'b0, "Flags Stable: FIFO Full, Not Empty");

        // =========================================================
        // TESTCASE 2: BURST READ 9 BYTES (40MHz)
        // =========================================================
        $display("\n--- Starting Burst Read of 9 Bytes (40MHz) ---");
        
        @(negedge rclk); rinc = 1'b1;

        // Data appears on the clock edge after rinc is asserted
        @(negedge rclk); check_data(8'hA1, "Read Byte 1");
        @(negedge rclk); check_data(8'hB2, "Read Byte 2");
        @(negedge rclk); check_data(8'hC3, "Read Byte 3");
        @(negedge rclk); check_data(8'hD4, "Read Byte 4");
        @(negedge rclk); check_data(8'hE5, "Read Byte 5");
        @(negedge rclk); check_data(8'hF6, "Read Byte 6");
        @(negedge rclk); check_data(8'h17, "Read Byte 7");
        @(negedge rclk); check_data(8'h28, "Read Byte 8"); // 8th read empties the FIFO
        
        // Verify rempty asserts after the 8th read
        check_outputs(1'b0, 1'b1, "rempty asserted exactly after 8 reads");
        
        // 9th Read Attempt - Should be blocked, keeping old data
        @(negedge rclk); 
        rinc = 1'b0;

        // Wait for Read Pointer to sync back to the Write domain and drop wfull
        #(WCLK_PERIOD * 4); 
        check_outputs(1'b0, 1'b1, "Flags Stable: FIFO Empty, Not Full");

        $display("\n==================================================");
        $display("   ALL FIFO TESTS COMPLETED.");
        $display("==================================================");
        $finish;
    end
endmodule