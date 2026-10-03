`timescale 1ns/1ps

module RegisterFile_tb;

    parameter DATA_WIDTH = 16;
    parameter DATA_DEPTH = 8;
    parameter ADDR_WIDTH = 3;
    parameter CLK_PERIOD = 10; // 100MHz clock

    reg [DATA_WIDTH-1:0] WrData;
    reg [ADDR_WIDTH-1:0] Address;
    reg  clk;
    reg  rst;
    reg WREn, RDEn;
    wire [DATA_WIDTH-1:0] RdData_tb;
    
    RegisterFile #(
        .DATA_WIDTH(DATA_WIDTH),
        .DATA_DEPTH(DATA_DEPTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) DUT (
        .RdData(RdData_tb),
        .*
    );

    // Clock Generation
    initial begin
        clk = 1'b0;
        forever begin
            #(CLK_PERIOD/2) clk = ~clk;
        end
    end
    
    // VCD Dumping
    initial begin
        $dumpfile("RegisterFile.vcd");
        $dumpvars;
    end

    task check_outputs;
        input [DATA_WIDTH-1:0] exp_RdData;
        input [400:0] test_name; 
        begin
            #(CLK_PERIOD); // Wait for clock edge to process
            
            if (RdData_tb === exp_RdData) begin 
                $display("[PASS] %s |  RdData: 0x%0h at time %0t", 
                         test_name, exp_RdData, $time);
            end else begin
                $display("[FAIL] %s | Address: %0d | EXPECTED RdData: 0x%0h | GOT RdData: 0x%0h at time %0t", 
                         test_name, Address, exp_RdData, RdData_tb, $time);
            end
        end
    endtask

    // Test Vectors
    initial begin
      
        // Initializing Input Signals
        WREn   = 1'b0; 
        RDEn   = 1'b0;
        WrData = 16'b0; 
        Address = 3'b0;
        
        // Asynchronous Active-Low Reset Phase
        rst = 1'b0; 
        #(CLK_PERIOD * 2);
        rst = 1'b1; 
        #(CLK_PERIOD); 
          // Inject the text file directly into the DUT's internal 'mem' array
        $readmemb("mem_init.txt", DUT.mem);

        // ---------------------------------------------------------
        // TESTCASE 1: Pure Read
        // ---------------------------------------------------------
        WREn = 1'b0; RDEn = 1'b1; Address = 3'd3;
        // Address 3 in the text file holds 16'b...1000 (which is Hex 0008)
        check_outputs(16'h0008, "1. Pure Read (From readmemb init)");

        // ---------------------------------------------------------
        // TESTCASE 2: Pure Write
        // ---------------------------------------------------------
        WREn = 1'b1; RDEn = 1'b0; Address = 3'd5; WrData = 16'hAAAA;
        #(CLK_PERIOD); // Wait one clock cycle for the write to execute
        $display("[INFO] 2. Pure Write Completed (Addr 5, Data AAAA)");

        // ---------------------------------------------------------
        // TESTCASE 3: Read After Write (Verify Testcase 2)
        // ---------------------------------------------------------
        WREn = 1'b0; RDEn = 1'b1; Address = 3'd5;
        // The output should now be the AAAA we just wrote
        check_outputs(16'hAAAA, "3. Read After Write (Addr 5)");

        // ---------------------------------------------------------
        #(CLK_PERIOD * 2);
        $display("==================================================");
        $display("   ALL TESTS COMPLETED.");
        $display("==================================================");
        $finish;
    end

endmodule