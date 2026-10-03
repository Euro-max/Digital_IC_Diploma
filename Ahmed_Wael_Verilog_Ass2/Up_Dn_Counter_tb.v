`timescale 1ns/1ps

module Up_Dn_Counter_tb;

	reg clk, Load, Up, Down;
	reg [4:0] IN;
	
	wire High_tb, Low_tb;
	wire [4:0] Counter_tb;
	
	parameter CLK_PERIOD = 10; // 100MHz clock

	Up_Dn_Counter DUT (
		.clk(clk),
		.Load(Load),
		.Up(Up),
		.Down(Down),
		.IN(IN),
		.High(High_tb),
		.Low(Low_tb),
		.Counter(Counter_tb)
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
		$dumpfile("Up_Dn_Counter.vcd");
		$dumpvars;
	end


	task check_outputs;
		input [4:0] exp_count;
		input exp_high;
		input exp_low;
		input [80*8:1] test_name;
		begin
			#(CLK_PERIOD); // Wait for clock edge to process
			if (Counter_tb === exp_count && High_tb === exp_high && Low_tb === exp_low) begin
				$display("[PASS] %s | Counter: %0d | High: %b | Low: %b at time %0t", 
				         test_name, Counter_tb, High_tb, Low_tb, $time);
			end else begin
				$display("[FAIL] %s | EXPECTED Counter: %0d, High: %b, Low: %b | GOT Counter: %0d, High: %b, Low: %b at time %0t", 
				         test_name, exp_count, exp_high, exp_low, Counter_tb, High_tb, Low_tb, $time);
			end
		end
	endtask

	// Test Vectors
	initial begin
		// Initializing Input Signals
		Load = 1'b0;
		Up = 1'b0;
		Down = 1'b0;
		IN = 5'b00000;
		
		#(CLK_PERIOD); 

		// 1. Initialization (Base Load)
		Load = 1'b1; IN = 5'd5; Up = 0; Down = 0;
		check_outputs(5'd5, 1'b0, 1'b0, "Initialization (Load=5)");

		// 2. Normal Count Up by 1
		Load = 1'b0; Up = 1'b1; Down = 1'b0;
		check_outputs(5'd6, 1'b0, 1'b0, "Normal Count Up");

		// 3. Normal Count Down by 1
		Load = 1'b0; Up = 1'b0; Down = 1'b1;
		check_outputs(5'd5, 1'b0, 1'b0, "Normal Count Down");

		// 4. Hold State
		Load = 1'b0; Up = 1'b0; Down = 1'b0;
		check_outputs(5'd5, 1'b0, 1'b0, "Hold State");

		// 5. Priority: Load overrides Up
		Load = 1'b1; IN = 5'd10; Up = 1'b1; Down = 1'b0;
		check_outputs(5'd10, 1'b0, 1'b0, "Priority: Load overrides Up");

		// 6. Priority: Load overrides Down
		Load = 1'b1; IN = 5'd15; Up = 1'b0; Down = 1'b1;
		check_outputs(5'd15, 1'b0, 1'b0, "Priority: Load overrides Down");

		// 7. Priority: Down overrides Up
		Load = 1'b0; Up = 1'b1; Down = 1'b1;
		check_outputs(5'd14, 1'b0, 1'b0, "Priority: Down overrides Up");

		// 8. Priority: Load overrides ALL
		Load = 1'b1; IN = 5'd20; Up = 1'b1; Down = 1'b1;
		check_outputs(5'd20, 1'b0, 1'b0, "Priority: Load overrides ALL");

		// 9. Upper Boundary (Normal Count to Max & Saturation)
		Load = 1'b1; IN = 5'd30; Up = 1'b0; Down = 1'b0; 
		#(CLK_PERIOD); // load 30 directly
		
		Load = 1'b0; Up = 1'b1; Down = 1'b0;
		check_outputs(5'd31, 1'b1, 1'b0, "Upper Boundary (Count to Max)");
		
		// 10. Saturation (Up at Max - No Rollover)
		Load = 1'b0; Up = 1'b1; Down = 1'b0;
		check_outputs(5'd31, 1'b1, 1'b0, "Saturation (Up at Max)");

		// 11. Lower Boundary (Normal Count to Min & Saturation)
		Load = 1'b1; IN = 5'd1; Up = 1'b0; Down = 1'b0; 
		#(CLK_PERIOD); // load 1 directly
		
		Load = 1'b0; Up = 1'b0; Down = 1'b1;
		check_outputs(5'd0, 1'b0, 1'b1, "Lower Boundary (Count to Min)");
		
		// 12. Saturation (Down at Min - No Underflow)
		Load = 1'b0; Up = 1'b0; Down = 1'b1;
		check_outputs(5'd0, 1'b0, 1'b1, "Saturation (Down at Min)");

		// 13. Flag Edge Case: Load Max directly
		Load = 1'b1; IN = 5'd31; Up = 1'b0; Down = 1'b0;
		check_outputs(5'd31, 1'b1, 1'b0, "Flag Edge Case (Load Max directly)");

		// 14. Flag Edge Case: Load Min directly
		Load = 1'b1; IN = 5'd0; Up = 1'b0; Down = 1'b0;
		check_outputs(5'd0, 1'b0, 1'b1, "Flag Edge Case (Load Min directly)");

		#(CLK_PERIOD * 2);
		$display("ALL TESTS COMPLETED.");
		$finish;
	end

endmodule