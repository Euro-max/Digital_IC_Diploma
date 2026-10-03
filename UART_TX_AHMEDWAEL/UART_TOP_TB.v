`timescale 1ns/1ps
`include "uart_tx_defines.v"
module UART_TOP_TB;
	reg clk, rst;
	reg Data_Valid;
	reg [`DATA_WIDTH-1:0] P_DATA;
	wire TX_out_tb, Busy_tb;
	
	parameter CLK_PERIOD = 5; // 200MHz clock

	UART_TOP_TX DUT (
		.P_DATA(P_DATA),
		.Data_Valid(Data_Valid),
		.clk(clk),
		.rst(rst),
		.TX_out(TX_out_tb),
		.Busy(Busy_tb)
	);

	// 1. FIX: Force floating point math to get a perfect 2.5ns toggle (5ns period), Part of the reason
	//why the checks failed
	initial begin
		clk = 1'b0;
		forever begin
			#(CLK_PERIOD / 2.0) clk = ~clk; 
		end
	end
	
	// VCD Dumping
	initial begin
		$dumpfile("UART_TOP.vcd");
		$dumpvars;
	end
	
	task check_outputs;
		input exp_TX_out;
		input exp_Busy;
		input [400:1] test_name; 
		begin
			if (TX_out_tb === exp_TX_out && Busy_tb === exp_Busy) begin
				$display("[PASS] %0s | TX_out: %b | Busy: %b time %0t", 
				         test_name, TX_out_tb, Busy_tb, $time);
			end else begin
				$display("[FAIL] %0s | EXPECTED TX_out: %b, Busy: %b | GOT TX_out: %b, Busy: %b at time %0t", 
				         test_name, exp_TX_out, exp_Busy, TX_out_tb, Busy_tb, $time);
			end
		end
	endtask

	// Test Vectors
	initial begin
		// SAFE INITIALIZATION
		P_DATA = 'h00;
		Data_Valid = 1'b0;

		// Asynchronous Active-Low Reset Phase
		rst = 1'b0; 
		#(CLK_PERIOD * 2);
		rst = 1'b1; 
		#(CLK_PERIOD * 2);  
		
		// =========================================================
		// MAIN TEST SEQUENCE - FRAME 1 (8'hB2)
		// =========================================================
		
		P_DATA = 'hB2;
		Data_Valid = 1'b1; 

		// Capture the exact moment the start bit transitions from High to low
		@(negedge TX_out_tb);
		
		// Move to the exact middle of the start bit period to sample safely
		#(CLK_PERIOD / 2.0);
		
		// Safe to drop valid now. It is risky to deassert Data_Valid at the exact hightolow edge of the start_bit
		Data_Valid = 1'b0;

		// Check Start Bit
		check_outputs(1'b0, 1'b1, "Start Bit");

		// Data Bits (8'hB2 = 8'b1011_0010) - Jump exactly 1 clock period per bit
		#(CLK_PERIOD); check_outputs(1'b0, 1'b1, "Data Bit 0"); // LSB
		#(CLK_PERIOD); check_outputs(1'b1, 1'b1, "Data Bit 1");
		#(CLK_PERIOD); check_outputs(1'b0, 1'b1, "Data Bit 2");
		#(CLK_PERIOD); check_outputs(1'b0, 1'b1, "Data Bit 3");
		#(CLK_PERIOD); check_outputs(1'b1, 1'b1, "Data Bit 4");
		#(CLK_PERIOD); check_outputs(1'b1, 1'b1, "Data Bit 5");
		#(CLK_PERIOD); check_outputs(1'b0, 1'b1, "Data Bit 6");
		#(CLK_PERIOD); check_outputs(1'b1, 1'b1, "Data Bit 7"); // MSB

		// Parity Bit (Even parity for 8'hB2 is 0)
		#(CLK_PERIOD); check_outputs(1'b0, 1'b1, "Parity Bit");

		// Stop Bit 
		#(CLK_PERIOD); check_outputs(1'b1, 1'b1, "Stop Bit");
		
		// Idle State - Watch for Busy to drop
		@(negedge Busy_tb);
		check_outputs(1'b1, 1'b0, "Idle State");

		#(CLK_PERIOD * 4); // Gap between frames

		// =========================================================
		// TESTCASE 2: Back-to-Back Frame with Idle Gap (8'h5A)
		// =========================================================
		
		P_DATA = 'h5A;
		Data_Valid = 1'b1;
		
		@(negedge TX_out_tb);
		#(CLK_PERIOD / 2.0);
		
		Data_Valid = 1'b0; 
		
		check_outputs(1'b0, 1'b1, "Frame 2: Start Bit");
		
		#(CLK_PERIOD); check_outputs(1'b0, 1'b1, "Frame 2: Data Bit 0"); // LSB
		#(CLK_PERIOD); check_outputs(1'b1, 1'b1, "Frame 2: Data Bit 1");
		#(CLK_PERIOD); check_outputs(1'b0, 1'b1, "Frame 2: Data Bit 2");
		#(CLK_PERIOD); check_outputs(1'b1, 1'b1, "Frame 2: Data Bit 3");
		#(CLK_PERIOD); check_outputs(1'b1, 1'b1, "Frame 2: Data Bit 4");
		#(CLK_PERIOD); check_outputs(1'b0, 1'b1, "Frame 2: Data Bit 5");
		#(CLK_PERIOD); check_outputs(1'b1, 1'b1, "Frame 2: Data Bit 6");
		#(CLK_PERIOD); check_outputs(1'b0, 1'b1, "Frame 2: Data Bit 7"); // MSB
		
		// Frame 2 Parity Bit (Even parity for 8'h5A is 0)
		#(CLK_PERIOD); check_outputs(1'b0, 1'b1, "Frame 2: Parity Bit");

		// Frame 2 Stop Bit
		#(CLK_PERIOD); check_outputs(1'b1, 1'b1, "Frame 2: Stop Bit");
		
		@(negedge Busy_tb);
		check_outputs(1'b1, 1'b0, "Frame 2: Idle State");
		
		#(CLK_PERIOD * 4);

		$display("==================================================");
		$display("   ALL TESTS COMPLETED.");
		$display("==================================================");
		$finish;
	end
endmodule