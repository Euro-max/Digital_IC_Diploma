`timescale 1ns/1ps

module DATA_SYNC_TB;
	parameter STAGES = 3; 
	parameter BUS_WIDTH = 8;
	parameter CLK_PERIOD = 5; // 200MHz destination clock frequency

	reg CLK, RST;
	reg [BUS_WIDTH-1:0] UNSYNC_BUS;
	reg bus_enable;
	
	wire [BUS_WIDTH-1:0] sync_bus;
	wire enable_pulse;

	DATA_SYNC #(
		.STAGES(STAGES),
		.BUS_WIDTH(BUS_WIDTH)
	) DUT (
		.CLK(CLK),
		.RST(RST),
		.UNSYNC_BUS(UNSYNC_BUS),
		.bus_enable(bus_enable),
		.sync_bus(sync_bus),
		.enable_pulse(enable_pulse)
	);

	// 1. FIX: Force floating point math to get a perfect 2.5ns toggle (5ns period)
	initial begin
		CLK = 1'b0;
		forever begin
			#(CLK_PERIOD / 2.0) CLK = ~CLK; 
		end
	end
	
	// VCD Dumping
	initial begin
		$dumpfile("DATA_SYNC.vcd");
		$dumpvars;
	end
	
	task check_outputs;
		input [BUS_WIDTH-1:0] exp_sync_bus;
		input exp_enable_pulse;
		input [400:1] test_name; 
		begin
			if (sync_bus === exp_sync_bus && enable_pulse === exp_enable_pulse) begin
				$display("[PASS] %0s | sync_bus: %h | enable_pulse: %b time %0t", 
				         test_name, sync_bus, enable_pulse, $time);
			end else begin
				$display("[FAIL] %0s | EXPECTED sync_bus: %h, enable_pulse: %b | GOT sync_bus: %h, enable_pulse: %b at time %0t", 
				         test_name, exp_sync_bus, exp_enable_pulse, sync_bus, enable_pulse, $time);
			end
		end
	endtask

	// Test Vectors
	initial begin
		// SAFE INITIALIZATION
		UNSYNC_BUS = 8'h00;
		bus_enable = 1'b0;

		// Asynchronous Active-Low Reset Phase
		RST = 1'b0; 
		#(CLK_PERIOD * 2);
		RST = 1'b1; 
		#(CLK_PERIOD * 2);  
		
		// =========================================================
		// MAIN TEST SEQUENCE - TRANSFER 1 (8'hAA)
		// =========================================================
		
		// Align to negative edge for clean setup time
		@(negedge CLK); 
		UNSYNC_BUS = 8'hAA;
		bus_enable = 1'b1; 

		// Wait for the shift register stages (STAGES) + 1 clock for output flip-flops
		#(CLK_PERIOD * (STAGES + 1));
		
		// Move to the exact middle of the pulse period to sample safely
		#(CLK_PERIOD / 2.0);
		
		// Check that pulse went HIGH and data is latched
		check_outputs(8'hAA, 1'b1, "Transfer 1: Pulse Active & Data Latched");

		// Move forward exactly 1 clock period to verify the pulse behaves as a single-cycle event
		#(CLK_PERIOD); 
		
		// The pulse should drop back to 0, but the data must remain held in the sync_bus register
		check_outputs(8'hAA, 1'b0, "Transfer 1: Pulse Dropped & Data Held");

		// Deassert bus_enable cleanly on the falling edge
		@(negedge CLK);
		bus_enable = 1'b0;

		#(CLK_PERIOD * 4); // Gap between transfers

		// =========================================================
		// TESTCASE 2: Back-to-Back Transfer (8'h55)
		// =========================================================
		
		@(negedge CLK);
		UNSYNC_BUS = 8'h55;
		bus_enable = 1'b1;
		
		#(CLK_PERIOD * (STAGES + 1));
		#(CLK_PERIOD / 2.0);
		
		check_outputs(8'h55, 1'b1, "Transfer 2: Pulse Active & Data Latched");
		
		#(CLK_PERIOD); 
		
		check_outputs(8'h55, 1'b0, "Transfer 2: Pulse Dropped & Data Held");
		
		@(negedge CLK);
		bus_enable = 1'b0;
		
		#(CLK_PERIOD * 4);

		$display("==================================================");
		$display("   ALL TESTS COMPLETED.");
		$display("==================================================");
		$finish;
	end
endmodule