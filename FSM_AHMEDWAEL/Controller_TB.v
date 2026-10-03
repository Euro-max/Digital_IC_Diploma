`timescale 1ns/1ps

module Controller_TB;

	reg UP_Max,Activate,DN_Max;
	reg clk,rst;
	wire  UP_M_tb,DN_M_tb;
	
	parameter CLK_PERIOD = 20; // 50MHz clock

	Controller DUT (
		.UP_Max(UP_Max),
		.Activate(Activate),
		.DN_Max(DN_Max),
		.clk(clk),
		.rst(rst),
		.UP_M(UP_M_tb),
		.DN_M(DN_M_tb)
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
		$dumpfile("Controller.vcd");
		$dumpvars;
	end


	task check_outputs;
		input exp_UP_M;
		input exp_DN_M;
		input [80*8:1] test_name;
		begin
			#(CLK_PERIOD); // Wait for clock edge to process
			if (UP_M_tb === exp_UP_M && DN_M_tb === exp_DN_M) begin
				$display("[PASS] %s | UP_M: %0d | DN_M: %b time %0t", 
				         test_name, UP_M_tb, DN_M_tb, $time);
			end else begin
				$display("[FAIL] %s | EXPECTED UP_M: %0d, DN_M: %b | GOT UP_M: %0d, DN_M: %b at time %0t", 
				         test_name, exp_UP_M, exp_DN_M, UP_M_tb, DN_M_tb, $time);
			end
		end
	endtask

	// Test Vectors
	initial begin
		// Initializing Input Signals
		Activate=0;
		UP_Max=0;
		DN_Max=0;
		
		// Asynchronous Active-Low Reset Phase
        rst = 1'b0; 
        #(CLK_PERIOD * 2);
        rst = 1'b1; 
        #(CLK_PERIOD);  

         // 1. Initial IDLE State Check
		Activate = 0; UP_Max = 0; DN_Max = 1; // Door is currently closed
		check_outputs(1'b0, 1'b0, "1. Initial IDLE State Check");

		// 2. IDLE to Mv_UP Transition
		Activate = 1; UP_Max = 0; DN_Max = 1; // User presses button while door is closed
		check_outputs(1'b1, 1'b0, "2. IDLE -> Mv_UP Transition");

		// 3. Mv_UP Hold State (Door is moving up)
		Activate = 0; UP_Max = 0; DN_Max = 0; // Door leaves the bottom sensor
		check_outputs(1'b1, 1'b0, "3. Mv_UP Hold (Door moving up)");

		// 4. Mv_UP to IDLE Transition (Door reaches top)
		Activate = 0; UP_Max = 1; DN_Max = 0; // Top sensor triggered
		check_outputs(1'b0, 1'b0, "4. Mv_UP -> IDLE Transition");

		// 5. IDLE to Mv_Dn Transition
		Activate = 1; UP_Max = 1; DN_Max = 0; // User presses button while door is open
		check_outputs(1'b0, 1'b1, "5. IDLE -> Mv_Dn Transition");

		// 6. Mv_Dn Hold State (Door is moving down)
		Activate = 0; UP_Max = 0; DN_Max = 0; // Door leaves the top sensor
		check_outputs(1'b0, 1'b1, "6. Mv_Dn Hold (Door moving down)");

		// 7. Mv_Dn to IDLE Transition (Door reaches bottom)
		Activate = 0; UP_Max = 0; DN_Max = 1; // Bottom sensor triggered
		check_outputs(1'b0, 1'b0, "7. Mv_Dn -> IDLE Transition");

		#(CLK_PERIOD * 2);
		$display("ALL TESTS COMPLETED.");
		$finish;
	end

endmodule