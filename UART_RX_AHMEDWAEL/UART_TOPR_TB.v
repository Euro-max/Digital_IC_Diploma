`timescale 1ns/1ps

module UART_TOPR_TB;

	reg clk, rst;
	reg RX_IN_tb;
	
	wire [7:0] P_DATA_tb;
	wire data_valid_tb;
	wire par_err_tb;
	wire stp_err_tb;
	
	parameter real CLK_PERIOD = 1085.069; 
	parameter real BIT_PERIOD = 8680.556;

	// Instantiate the Top-Level RX Module
	UART_RX_TOP DUT (
		.clk(clk),
		.rst(rst),
		.RX_IN(RX_IN_tb),
		.P_DATA(P_DATA_tb),
		.data_valid(data_valid_tb),
		.par_err(par_err_tb),
		.stp_err(stp_err_tb)
	);

	// 1. FIX: Force floating point math
	initial begin
		clk = 1'b0;
		forever begin
			#(CLK_PERIOD / 2.0) clk = ~clk; 
		end
	end
	
	// VCD Dumping
	initial begin
		$dumpfile("UART_RX_TOP.vcd");
		$dumpvars;
	end
	
	// Task to check outputs dynamically at the end of a frame
	task check_outputs;
		input [7:0] exp_P_DATA;
		input exp_par_err;
		input exp_stp_err;
		input [400:1] test_name; 
		begin
			if (P_DATA_tb === exp_P_DATA && par_err_tb === exp_par_err && stp_err_tb === exp_stp_err) begin
				$display("[PASS] %0s | P_DATA: %h | par_err: %b | stp_err: %b time %0t", 
				         test_name, P_DATA_tb, par_err_tb, stp_err_tb, $time);
			end else begin
				$display("[FAIL] %0s | EXP P_DATA: %h, par_err: %b, stp_err: %b | GOT P_DATA: %h, par_err: %b, stp_err: %b at time %0t", 
				         test_name, exp_P_DATA, exp_par_err, exp_stp_err, P_DATA_tb, par_err_tb, stp_err_tb, $time);
			end
		end
	endtask

	// Test Vectors
	initial begin
		// SAFE INITIALIZATION
		RX_IN_tb = 1'b1; // UART Idle state is High

		// Asynchronous Active-Low Reset Phase
		rst = 1'b0; 
		#(CLK_PERIOD * 2);
		rst = 1'b1; 
		#(CLK_PERIOD * 2);  
		
		// =========================================================
		// MAIN TEST SEQUENCE - FRAME 1 (8'hB2) - Normal Operation
		// =========================================================
		
		// Start Bit (0)
		RX_IN_tb = 1'b0; #(BIT_PERIOD);
		
		// Data Bits (8'hB2 = 8'b1011_0010) - LSB First
		RX_IN_tb = 1'b0; #(BIT_PERIOD); // Bit 0 (LSB)
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 1
		RX_IN_tb = 1'b0; #(BIT_PERIOD); // Bit 2
		RX_IN_tb = 1'b0; #(BIT_PERIOD); // Bit 3
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 4
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 5
		RX_IN_tb = 1'b0; #(BIT_PERIOD); // Bit 6
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 7 (MSB)

		// Parity Bit (Even parity for 8'hB2 is 0)
		RX_IN_tb = 1'b0; #(BIT_PERIOD);

		// Stop Bit (1) 
		RX_IN_tb = 1'b1; #(BIT_PERIOD);
		
		// Wait for FSM to assert data_valid 
		@(posedge data_valid_tb);
		check_outputs(8'hB2, 1'b0, 1'b0, "Frame 1: 8'hB2 Normal Reception");

		#(BIT_PERIOD * 2); // Gap between frames

		// =========================================================
		// TESTCASE 2: Back-to-Back Frame (8'h5A) - Normal Operation
		// =========================================================
		
		// Start Bit (0)
		RX_IN_tb = 1'b0; #(BIT_PERIOD);
		
		// Data Bits (8'h5A = 8'b0101_1010) - LSB First
		RX_IN_tb = 1'b0; #(BIT_PERIOD); // Bit 0 (LSB)
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 1
		RX_IN_tb = 1'b0; #(BIT_PERIOD); // Bit 2
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 3
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 4
		RX_IN_tb = 1'b0; #(BIT_PERIOD); // Bit 5
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 6
		RX_IN_tb = 1'b0; #(BIT_PERIOD); // Bit 7 (MSB)
		
		// Parity Bit (Even parity for 8'h5A is 0)
		RX_IN_tb = 1'b0; #(BIT_PERIOD);

		// Stop Bit (1)
		RX_IN_tb = 1'b1; #(BIT_PERIOD);
		
		@(posedge data_valid_tb);
		check_outputs(8'h5A, 1'b0, 1'b0, "Frame 2: 8'h5A Normal Reception");
		
		#(BIT_PERIOD * 2);

		// =========================================================
		// TESTCASE 3: Error Injection (Parity Error on 8'hFF)
		// =========================================================
		
		// Start Bit (0)
		RX_IN_tb = 1'b0; #(BIT_PERIOD);
		
		// Data Bits (8'hFF = 8'b1111_1111) - LSB First
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 0
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 1
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 2
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 3
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 4
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 5
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 6
		RX_IN_tb = 1'b1; #(BIT_PERIOD); // Bit 7
		
		// Parity Bit (Even parity for 8'hFF is 0. We send 1 to force an error)
		RX_IN_tb = 1'b1; #(BIT_PERIOD);

		// Stop Bit (1)
		RX_IN_tb = 1'b1; #(BIT_PERIOD);
		
		// Wait just a bit to ensure the FSM aborted to IDLE and flagged the error
		// Note: data_valid should NOT assert here because of the parity error.
		#(CLK_PERIOD * 2);
		check_outputs(8'hFF, 1'b1, 1'b0, "Frame 3: Parity Error Injection");

		#(BIT_PERIOD * 2);

		$display("==================================================");
		$display("   ALL TESTS COMPLETED.");
		$display("==================================================");
		$finish;
	end
endmodule