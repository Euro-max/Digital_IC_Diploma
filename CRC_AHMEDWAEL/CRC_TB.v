`timescale 1ns/1ps

module CRC_TB;

	reg DATA, ACTIVE;
	reg clk, rst;
	wire CRC_tb, Valid_tb;
	
	parameter CLK_PERIOD = 100; // 10MHz clock

	CRC DUT (
		.DATA(DATA),
		.ACTIVE(ACTIVE),
		.clk(clk),
		.rst(rst),
		.CRC(CRC_tb),
		.Valid(Valid_tb)
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
		$dumpfile("CRC.vcd");
		$dumpvars;
	end
	
	reg [7:0] dat [0:9];
	reg [7:0] res [0:9];

	task check_outputs;
		input exp_CRC;
		input exp_Valid;
		input [400:1] test_name; 
		begin
			#(CLK_PERIOD); // Wait for clock edge to process
			if (CRC_tb === exp_CRC && Valid_tb === exp_Valid) begin
				$display("[PASS] %0s | CRC: %b | Valid: %b time %0t", 
				         test_name, CRC_tb, Valid_tb, $time);
			end else begin
				$display("[FAIL] %0s | EXPECTED CRC: %b, Valid: %b | GOT CRC: %b, Valid: %b at time %0t", 
				         test_name, exp_CRC, exp_Valid, CRC_tb, Valid_tb, $time);
			end
		end
	endtask

    integer i, j; 

	// Test Vectors
	initial begin
		$readmemh("DATA_h.txt", dat);
		$readmemh("Expec_Out_h.txt", res);

		// Initializing Input Signals
		ACTIVE = 0;
		DATA = 0;

		// Asynchronous Active-Low Reset Phase
        rst = 1'b0; 
        #(CLK_PERIOD * 2);
        rst = 1'b1; 
        #(CLK_PERIOD);  
        
		// =========================================================
		// MAIN TEST LOOP
		// =========================================================
        for (i = 0; i < 10; i = i + 1) begin
        	
        	rst = 1'b0; 
			#(CLK_PERIOD * 2);
			rst = 1'b1; 
			#(CLK_PERIOD);
            // 1. Shift Data In (LSB First)
            ACTIVE = 1'b1;
            for (j = 0; j < 8; j = j + 1) begin
                DATA = dat[i][j]; 
                #(CLK_PERIOD);    // Wait 1 clock cycle per bit
            end
            
            // 2. Drop ACTIVE to trigger the CRC transmission phase
            ACTIVE = 1'b0;
            DATA = 1'b0; 
            
            // 3. Verify the 8 shifted CRC bits (LSB First)
            for (j = 0; j < 8; j = j + 1) begin
                // check_outputs automatically waits 1 CLK_PERIOD per call,
                // perfectly syncing with the 8 output cycles of the DUT.
                check_outputs(res[i][j], 1'b1, "CRC Output Bit Check");
            end
            
            // 4. Verify Idle State (Ensure Valid drops low after 8 cycles)
            check_outputs(1'b0, 1'b0, "Idle State Check");
            
            // Add a small delay before starting the next byte transmission
            #(CLK_PERIOD * 2);
            
        end
      
		#(CLK_PERIOD * 2);
		$display("ALL TESTS COMPLETED.");
		$finish;
	end

endmodule