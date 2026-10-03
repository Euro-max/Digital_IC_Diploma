`timescale 1ns/1ps

module RESET_SYNC_TB;

    parameter CLK_PERIOD = 10; // 100MHz clock
    parameter STAGES     = 2;  // Standard 2-stage synchronizer

    reg  clk;
    reg  async_rst_n;
    wire sync_rst_n;
    
    // Instantiate the DUT
    RESET_SYNC #(
        .STAGES(STAGES)
    ) DUT (
        .clk(clk),
        .async_rst_n(async_rst_n),
        .sync_rst_n(sync_rst_n)
    );

    // Force floating point math to get a perfect toggle
    initial begin
        clk = 1'b0;
        forever begin
            #(CLK_PERIOD / 2.0) clk = ~clk; 
        end
    end
    
    // VCD Dumping
    initial begin
        $dumpfile("RESET_SYNC.vcd");
        $dumpvars;
    end
    
    // Check Task
    task check_outputs;
        input exp_sync_rst_n;
        input [400:1] test_name; 
        begin
            if (sync_rst_n === exp_sync_rst_n) begin
                $display("[PASS] %0s | sync_rst_n: %b time %0t", 
                         test_name, sync_rst_n, $time);
            end else begin
                $display("[FAIL] %0s | EXPECTED: %b | GOT: %b at time %0t", 
                         test_name, exp_sync_rst_n, sync_rst_n, $time);
            end
        end
    endtask

    // Test Vectors
    initial begin
        // =========================================================
        // SAFE INITIALIZATION
        // =========================================================
        async_rst_n = 1'b0;
        #(CLK_PERIOD * 2);
        
        // Bring out of reset to set up the first test
        async_rst_n = 1'b1;
        #(CLK_PERIOD * 3); 
        
        // =========================================================
        // TEST 1: Asynchronous Assertion
        // =========================================================
        $display("\n--- Testing Asynchronous Assertion ---");
        
        // Wait for a falling edge, then wait 1/4 of a cycle so we are 
        // completely misaligned with the active posedge clock
        @(negedge clk);
        #(CLK_PERIOD / 4.0);
        
        async_rst_n = 1'b0; // Assert Reset
        
        // Wait 1ns for delta-delay propagation, then check IMMEDIATELY
        #1; 
        check_outputs(1'b0, "Async Assertion (Immediate drop, no clock edge)");

        // =========================================================
        // TEST 2: Synchronous De-assertion
        // =========================================================
        $display("\n--- Testing Synchronous De-assertion ---");
        
        #(CLK_PERIOD);
        
        // Again, trigger the release entirely asynchronously (between clock edges)
        @(negedge clk);
        #(CLK_PERIOD / 4.0);
        
        async_rst_n = 1'b1; // Release Reset
        
        #1;
        check_outputs(1'b0, "Pre-Clock Check (Output should still be 0)");
        
        // Wait for the FIRST clock edge
        @(posedge clk);
        #1;
        check_outputs(1'b0, "After 1st Clock Edge (Output should still be 0)");

        // Wait for the SECOND clock edge (Since STAGES = 2, it should now assert)
        @(posedge clk);
        #1;
        check_outputs(1'b1, "After 2nd Clock Edge (Output should now be 1)");

        #(CLK_PERIOD * 2);

        $display("\n==================================================");
        $display("   RESET_SYNC TESTS COMPLETED.");
        $display("==================================================");
        $finish;
    end
endmodule