`timescale 1ns / 1ps

module TB();
    parameter DATA_WIDTH = 16;
    parameter CLK_PERIOD = 10000; // 100 kHz = 10,000 ns period

    // --- DUT Inputs ---
    reg signed [DATA_WIDTH-1:0] A, B;
    reg [3:0]                   ALU_FUNC;
    reg                         CLK, RST;
    
    // --- DUT Outputs ---
    wire signed [DATA_WIDTH-1:0] Arith_OUT;
    wire                         Arith_Flag;
    wire signed [DATA_WIDTH-1:0] Logic_OUT;
    wire                         Logic_Flag;
    wire        [DATA_WIDTH-1:0] CMP_OUT;
    wire                         CMP_Flag;
    wire signed [DATA_WIDTH-1:0] SHIFT_OUT;
    wire                         SHIFT_Flag;

    // --- Expected Golden Model Variables ---
    reg signed [DATA_WIDTH-1:0] exp_Arith_OUT;
    reg                         exp_Arith_Flag;
    reg signed [DATA_WIDTH-1:0] exp_Logic_OUT;
    reg                         exp_Logic_Flag;
    reg        [DATA_WIDTH-1:0] exp_CMP_OUT;
    reg                         exp_CMP_Flag;
    reg signed [DATA_WIDTH-1:0] exp_SHIFT_OUT;
    reg                         exp_SHIFT_Flag;

    // --- CLOCK GENERATION (Independent Block) ---
    // 40% Low (4,000 ns), 60% High (6,000 ns)
    initial begin
        CLK = 1'b0;
        forever begin
            #4000 CLK = 1'b1; 
            #6000 CLK = 1'b0; 
        end
    end

    // --- DUT Instantiation ---
    ALU_TOP #(DATA_WIDTH) DUT (
        .A          (A),
        .B          (B),
        .ALU_FUNC   (ALU_FUNC),
        .CLK        (CLK),
        .RST        (RST),
        .Arith_OUT  (Arith_OUT),
        .Arith_Flag (Arith_Flag),
        .Logic_OUT  (Logic_OUT),
        .Logic_Flag (Logic_Flag),
        .CMP_OUT    (CMP_OUT),
        .CMP_Flag   (CMP_Flag),
        .SHIFT_OUT  (SHIFT_OUT),
        .SHIFT_Flag (SHIFT_Flag)
    );

    // --- GOLDEN MODEL TASK ---
    task golden_model;
        input signed [DATA_WIDTH-1:0] a_val;
        input signed [DATA_WIDTH-1:0] b_val;
        input [3:0] func_val;
        begin
            // Default all to 0 
            exp_Arith_OUT  = 0; exp_Arith_Flag  = 0;
            exp_Logic_OUT  = 0; exp_Logic_Flag  = 0;
            exp_CMP_OUT    = 0; exp_CMP_Flag    = 0;
            exp_SHIFT_OUT  = 0; exp_SHIFT_Flag  = 0;

            case(func_val[3:2]) // Decoder Logic
                2'b00: begin // Arithmetic
                    exp_Arith_Flag = 1;
                    case(func_val[1:0])
                        2'b00: exp_Arith_OUT = a_val + b_val;
                        2'b01: exp_Arith_OUT = a_val - b_val;
                        2'b10: exp_Arith_OUT = a_val * b_val;
                        2'b11: exp_Arith_OUT = a_val / b_val;
                    endcase
                end
                2'b01: begin // Logic
                    exp_Logic_Flag = 1;
                    case(func_val[1:0])
                        2'b00: exp_Logic_OUT = a_val & b_val;
                        2'b01: exp_Logic_OUT = a_val | b_val;
                        2'b10: exp_Logic_OUT = ~(a_val & b_val);
                        2'b11: exp_Logic_OUT = ~(a_val | b_val);
                    endcase
                end
                2'b10: begin // Compare & NOP
                    exp_CMP_Flag = 1;
                    case(func_val[1:0])
                        2'b00: exp_CMP_OUT = 0; // NOP
                        2'b01: exp_CMP_OUT = (a_val == b_val) ? 1 : 0;
                        2'b10: exp_CMP_OUT = (a_val > b_val)  ? 2 : 0;
                        2'b11: exp_CMP_OUT = (a_val < b_val)  ? 3 : 0;
                    endcase
                end
                2'b11: begin // Shift
                    exp_SHIFT_Flag = 1;
                    case(func_val[1:0])
                        2'b00: exp_SHIFT_OUT = a_val >>> 1;
                        2'b01: exp_SHIFT_OUT = a_val <<< 1;
                        2'b10: exp_SHIFT_OUT = b_val >>> 1;
                        2'b11: exp_SHIFT_OUT = b_val <<< 1;
                    endcase
                end
            endcase
        end
    endtask

    // --- CHECK TASK ---
    task check;
        input [400:0] test_name; // String literal for test case label
        begin
            // Compare DUT outputs to Golden Model expected outputs
            if (Arith_OUT  !== exp_Arith_OUT  || Arith_Flag  !== exp_Arith_Flag ||
                Logic_OUT  !== exp_Logic_OUT  || Logic_Flag  !== exp_Logic_Flag ||
                CMP_OUT    !== exp_CMP_OUT    || CMP_Flag    !== exp_CMP_Flag   ||
                SHIFT_OUT  !== exp_SHIFT_OUT  || SHIFT_Flag  !== exp_SHIFT_Flag) begin
                
                $display("\n[FAILED] %s", test_name);
                $display("Time: %0t", $time);
                $display("Inputs -> A: %0d, B: %0d, FUNC: %b", A, B, ALU_FUNC);
                $display("Expected -> Arith:(%0d, %b), Logic:(%0d, %b), CMP:(%0d, %b), Shift:(%0d, %b)", 
                          exp_Arith_OUT, exp_Arith_Flag, exp_Logic_OUT, exp_Logic_Flag, exp_CMP_OUT, exp_CMP_Flag, exp_SHIFT_OUT, exp_SHIFT_Flag);
                $display("Actual   -> Arith:(%0d, %b), Logic:(%0d, %b), CMP:(%0d, %b), Shift:(%0d, %b)", 
                          Arith_OUT, Arith_Flag, Logic_OUT, Logic_Flag, CMP_OUT, CMP_Flag, SHIFT_OUT, SHIFT_Flag);
            end else begin
                $display("[PASSED] %s", test_name);
            end
        end
    endtask

    // --- STIMULUS TASK ---
    // Helper task to apply inputs, wait for evaluation, and check automatically
    task apply_and_check;
        input signed [DATA_WIDTH-1:0] a_in;
        input signed [DATA_WIDTH-1:0] b_in;
        input [3:0] func_in;
        input [400:0] name_in;
        begin
            @(negedge CLK); // Apply inputs on negative edge
            A = a_in;
            B = b_in;
            ALU_FUNC = func_in;
            
            golden_model(A, B, ALU_FUNC); // Calculate expected result
            
            @(negedge CLK); // Wait for a full clock cycle for outputs to register
            check(name_in); // Verify the registered outputs
        end
    endtask

    // --- MAIN TEST SEQUENCE (28 Test Cases) ---
    initial begin
        // --- 1. Asynchronous Reset Logic ---
        A = 0; B = 0; ALU_FUNC = 4'b0000;
        RST = 1'b0;  
        #(CLK_PERIOD * 1.5); 
        RST = 1'b1;  

        // --- 2. Test Cases ---

        $display("--------------------------------------------------");
        $display("STARTING ALU VERIFICATION");
        $display("--------------------------------------------------");

        // Addition
        apply_and_check(-10, -5,  4'b0000, "ADD: A is Negative & B is Negative");
        apply_and_check( 15, -5,  4'b0000, "ADD: A is Positive & B is Negative");
        apply_and_check(-20,  7,  4'b0000, "ADD: A is Negative & B is Positive");
        apply_and_check( 10,  8,  4'b0000, "ADD: A is Positive & B is Positive");

        // Subtraction
        apply_and_check(-12, -4,  4'b0001, "SUB: A is Negative & B is Negative");
        apply_and_check( 10, -8,  4'b0001, "SUB: A is Positive & B is Negative");
        apply_and_check(-15,  6,  4'b0001, "SUB: A is Negative & B is Positive");
        apply_and_check( 20, 10,  4'b0001, "SUB: A is Positive & B is Positive");

        // Multiplication
        apply_and_check(-5, -6,   4'b0010, "MUL: A is Negative & B is Negative");
        apply_and_check( 7, -3,   4'b0010, "MUL: A is Positive & B is Negative");
        apply_and_check(-4,  8,   4'b0010, "MUL: A is Negative & B is Positive");
        apply_and_check( 9,  9,   4'b0010, "MUL: A is Positive & B is Positive");

        // Division
        apply_and_check(-20, -5,  4'b0011, "DIV: A is Negative & B is Negative");
        apply_and_check( 30, -6,  4'b0011, "DIV: A is Positive & B is Negative");
        apply_and_check(-18,  2,  4'b0011, "DIV: A is Negative & B is Positive");
        apply_and_check( 24,  4,  4'b0011, "DIV: A is Positive & B is Positive");

        // Logical Operations
        apply_and_check(16'hAAAA, 16'h5555, 4'b0100, "LOGIC: AND");
        apply_and_check(16'hAAAA, 16'h5555, 4'b0101, "LOGIC: OR");
        apply_and_check(16'hAAAA, 16'h5555, 4'b0110, "LOGIC: NAND");
        apply_and_check(16'h0000, 16'h0000, 4'b0111, "LOGIC: NOR");

        // NOP
        apply_and_check(16'h1234, 16'h5678, 4'b1000, "NOP: No Operation");

        // Compare Operations
        apply_and_check( 10,  10, 4'b1001, "CMP: A = B");
        apply_and_check( 25,  15, 4'b1010, "CMP: A > B");
        apply_and_check(-10,   5, 4'b1011, "CMP: A < B");

        // Shift Operations
        apply_and_check(-16,   0, 4'b1100, "SHIFT: A shift right (A >> 1)");
        apply_and_check(  8,   0, 4'b1101, "SHIFT: A shift left (A << 1)");
        apply_and_check(  0, -32, 4'b1110, "SHIFT: B shift right (B >> 1)");
        apply_and_check(  0,   4, 4'b1111, "SHIFT: B shift left (B << 1)");

        $display("--------------------------------------------------");
        $display("VERIFICATION COMPLETE");
        $display("--------------------------------------------------");
        $finish;
    end
endmodule