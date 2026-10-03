`timescale 1us/1ns

module ALU_16B_tb;

	reg clk;
	reg [15:0] A,B;
	reg[3:0]ALU_FUN;
	
	wire Carry_Flag_tb, Arith_Flag_tb, Logic_Flag_tb, Shift_Flag_tb, CMP_Flag_tb;
	wire [15:0] ALU_OUT_tb;
	
	parameter CLK_PERIOD = 10; // 100KHz clock

	ALU_16B DUT (
		.clk(clk),
		.A(A),
		.B(B),
		.ALU_FUN(ALU_FUN),
		.Carry_Flag(Carry_Flag_tb),
		.Arith_Flag(Arith_Flag_tb),
		.Logic_Flag(Logic_Flag_tb),
		.Shift_Flag(Shift_Flag_tb),
		.CMP_Flag  (CMP_Flag_tb),
		.ALU_OUT(ALU_OUT_tb)
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
		$dumpfile("ALU_16B.vcd");
		$dumpvars;
	end

task check_outputs;
		input [15:0] exp_ALU_OUT;
		input exp_Carry_Flag, exp_Shift_Flag, exp_Logic_Flag, exp_Arith_Flag, exp_CMP_Flag;
		input [80*8:1] test_name;
		begin
			#(CLK_PERIOD); // Wait for clock edge to process
			
			// Compare all actual testbench outputs against expected inputs
			if (ALU_OUT_tb    === exp_ALU_OUT    && 
			    Carry_Flag_tb === exp_Carry_Flag && 
			    Shift_Flag_tb === exp_Shift_Flag && 
			    Logic_Flag_tb === exp_Logic_Flag && 
			    Arith_Flag_tb === exp_Arith_Flag && 
			    CMP_Flag_tb   === exp_CMP_Flag) begin
				
				$display("[PASS] %s | ALU_OUT: 0x%h (Dec: %0d) | Flags (C,S,L,A,CMP): %b%b%b%b%b at time %0t", 
				         test_name, ALU_OUT_tb, ALU_OUT_tb, Carry_Flag_tb, Shift_Flag_tb, Logic_Flag_tb, Arith_Flag_tb, CMP_Flag_tb, $time);
			end else begin
				$display("[FAIL] %s at time %0t", test_name, $time);
				$display("       EXPECTED -> ALU_OUT: 0x%h | Flags (C=%b, S=%b, L=%b, A=%b, CMP=%b)", 
				         exp_ALU_OUT, exp_Carry_Flag, exp_Shift_Flag, exp_Logic_Flag, exp_Arith_Flag, exp_CMP_Flag);
				$display("       GOT      -> ALU_OUT: 0x%h | Flags (C=%b, S=%b, L=%b, A=%b, CMP=%b)", 
				         ALU_OUT_tb, Carry_Flag_tb, Shift_Flag_tb, Logic_Flag_tb, Arith_Flag_tb, CMP_Flag_tb);
			end
		end
	endtask

	// Test Vectors
	initial begin
		// Initializing Input Signals
		A       = 16'b0;
		B       = 16'b0;
		ALU_FUN = 4'b1111; // Start in unhandled state
		
		// Wait an initial clock period for things to settle
		#(CLK_PERIOD); 

		// ==========================================
		// ARITHMETIC OPERATIONS (Arith_Flag should be 1)
		// ==========================================
		
		// 1. Normal Addition
		A = 16'd25; B = 16'd10; ALU_FUN = 4'b0000;
		// exp: ALU_OUT=35, Carry=0, Shift=0, Logic=0, Arith=1, CMP=0
		check_outputs(16'd35, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, "Normal Addition");

		// 2. Addition with Overflow (Carry Out)
		A = 16'hFFFF; B = 16'h0001; ALU_FUN = 4'b0000;
		// exp: ALU_OUT=0, Carry=1, Shift=0, Logic=0, Arith=1, CMP=0
		check_outputs(16'h0000, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, "Addition with Overflow");

		// 3. Normal Subtraction
		A = 16'd50; B = 16'd20; ALU_FUN = 4'b0001;
		// exp: ALU_OUT=30, Carry=0, Shift=0, Logic=0, Arith=1, CMP=0
		check_outputs(16'd30, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, "Normal Subtraction");

		// 4. Subtraction with Borrow (Underflow)
		A = 16'd10; B = 16'd15; ALU_FUN = 4'b0001;
		// exp: 10 - 15 = -5 (16'hFFFB), Carry/Borrow=1, Arith=1
		check_outputs(16'hFFFB, 1'b1, 1'b0, 1'b0, 1'b1, 1'b0, "Subtraction with Borrow");

		// 5. Normal Multiplication
		A = 16'd6; B = 16'd7; ALU_FUN = 4'b0010;
		// exp: ALU_OUT=42, Carry=0, Shift=0, Logic=0, Arith=1, CMP=0
		check_outputs(16'd42, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, "Normal Multiplication");

		// 6. Normal Division
		A = 16'd40; B = 16'd8; ALU_FUN = 4'b0011;
		// exp: ALU_OUT=5, Carry=0, Shift=0, Logic=0, Arith=1, CMP=0
		check_outputs(16'd5, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, "Normal Division");

		// 7. Division By Zero 
		A = 16'd100; B = 16'd0; ALU_FUN = 4'b0011;
		// exp: ALU_OUT=0, Carry=0, Shift=0, Logic=0, Arith=1, CMP=0
		check_outputs(16'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, "Division By Zero Protection");


		// ==========================================
		// LOGIC OPERATIONS (Logic_Flag should be 1)
		// ==========================================
		
		// 8. Bitwise AND
		A = 16'h00FF; B = 16'h0F0F; ALU_FUN = 4'b0100;
		// exp: ALU_OUT=16'h000F, Logic=1
		check_outputs(16'h000F, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, "Bitwise AND");

		// 9. Bitwise NAND
		A = 16'h00FF; B = 16'h0F0F; ALU_FUN = 4'b0110;
		// exp: ALU_OUT=16'hFFF0, Logic=1
		check_outputs(16'hFFF0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0, "Bitwise NAND");


		// ==========================================
		// COMPARISON OPERATIONS (CMP_Flag should be 1)
		// ==========================================
		
		// 10. Comparison: A == B
		A = 16'd12; B = 16'd12; ALU_FUN = 4'b1010;
		// exp: ALU_OUT=1, CMP_Flag=1
		check_outputs(16'd1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, "Comparison: A Equal to B");

		// 11. Comparison: A > B
		A = 16'd20; B = 16'd12; ALU_FUN = 4'b1011;
		// exp: ALU_OUT=2, CMP_Flag=1
		check_outputs(16'd2, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, "Comparison: A Greater Than B");


		// ==========================================
		// SHIFT OPERATIONS (Shift_Flag should be 1)
		// ==========================================
		
		// 12. Logical Shift Right
		A = 16'h00F0; B = 16'b0; ALU_FUN = 4'b1101;
		// exp: ALU_OUT=16'h0078, Shift=1
		check_outputs(16'h0078, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, "Shift Right");

		// 13. Logical Shift Left
		A = 16'h00F0; B = 16'b0; ALU_FUN = 4'b1110;
		// exp: ALU_OUT=16'h01E0, Shift=1
		check_outputs(16'h01E0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, "Shift Left");


		// ==========================================
		// DEFAULT UNHANDLED FUNCTION PROTECTION
		// ==========================================
		
		// 14. Unhandled ALU_FUN Opcode (Should settle ALU_OUT to zero, all flags 0)
		A = 16'hAAAA; B = 16'h5555; ALU_FUN = 4'b1111;
		// exp: ALU_OUT=0, All flags=0
		check_outputs(16'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, "Unhandled ALU_FUN Protection");

		// Wrap up simulation
		#(CLK_PERIOD * 2);
		$display("=======================================");
		$display("        ALL ALU TESTS COMPLETED        ");
		$display("=======================================");
		$finish;
	end

endmodule