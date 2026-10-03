module ALU_16B(
    input clk,
    input [15:0] A, B,
    input [3:0] ALU_FUN,
    output reg [15:0] ALU_OUT,
    output reg Carry_Flag, Arith_Flag, Logic_Flag, Shift_Flag,
    output reg CMP_Flag 
);

    //reg [16:0] ALU_REG; To avoid simulation-synthesis mismatch no blocking statements in the always block.
    
    // Internal variable to hold the combinational calculation before the register
    reg [15:0] ALU_OUT_comb;

    // ==============================================================
    // 1. COMBINATIONAL BLOCK 
    // Use blocking assignments (=)
    // ==============================================================
    always @(*) begin 
        // Default assignments to clear outputs (prevents latches)
        ALU_OUT_comb = 16'b0;
        Carry_Flag   = 1'b0;
        Arith_Flag   = 1'b0;
        Logic_Flag   = 1'b0;
        CMP_Flag     = 1'b0;
        Shift_Flag   = 1'b0;

        case(ALU_FUN)
            // --- Arithmetic Operations ---
            4'b0000: begin // Unsigned Addition
                {Carry_Flag, ALU_OUT_comb} = A + B; //Used concantenation to avoid ALU_REG=A+B
                Arith_Flag = 1'b1;
            end 
            4'b0001: begin // Unsigned Subtraction
                {Carry_Flag, ALU_OUT_comb} = A - B;
                Arith_Flag = 1'b1;
            end
            4'b0010: begin // Unsigned Multiplication
                ALU_OUT_comb = A * B;
                Arith_Flag = 1'b1;
            end
            4'b0011: begin // Unsigned Division
                if (B != 16'b0) begin
                    ALU_OUT_comb = A / B;
                end else begin
                    ALU_OUT_comb = 16'b0; // division-by-zero
                end
                Arith_Flag = 1'b1;
            end

            // --- Logic Operations ---
            4'b0100: begin // AND
                ALU_OUT_comb = A & B;
                Logic_Flag = 1'b1;
            end
            4'b0101: begin // OR
                ALU_OUT_comb = A | B;
                Logic_Flag = 1'b1;
            end
            4'b0110: begin // NAND 
                ALU_OUT_comb = ~(A & B);
                Logic_Flag = 1'b1;
            end
            4'b0111: begin // NOR 
                ALU_OUT_comb = ~(A | B);
                Logic_Flag = 1'b1;
            end
            4'b1000: begin // XOR
                ALU_OUT_comb = A ^ B;
                Logic_Flag = 1'b1;
            end
            4'b1001: begin // XNOR 
                ALU_OUT_comb = ~(A ^ B);
                Logic_Flag = 1'b1;
            end

            // --- Comparison Operations ---
            4'b1010: begin // CMP: A = B
                ALU_OUT_comb = (A == B) ? 16'd1 : 16'd0;
                CMP_Flag = 1'b1;
            end
            4'b1011: begin // CMP: A > B
                ALU_OUT_comb = (A > B) ? 16'd2 : 16'd0;
                CMP_Flag = 1'b1;
            end
            4'b1100: begin // CMP: A < B
                ALU_OUT_comb = (A < B) ? 16'd3 : 16'd0;
                CMP_Flag = 1'b1;
            end

            // --- Shift Operations ---
            4'b1101: begin // Shift Right
                ALU_OUT_comb = A >> 1;
                Shift_Flag = 1'b1;
            end
            4'b1110: begin // Shift Left
                ALU_OUT_comb = A << 1;
                Shift_Flag = 1'b1;
            end

            // --- Default Saturation State ---
            default: begin
                ALU_OUT_comb = 16'b0;
                // Flags retain their default cleared 0 state
            end
        endcase
    end

    // ==============================================================
    // 2. SEQUENTIAL BLOCK 
    // ==============================================================
    always @(posedge clk) begin //sequential always block. Use non-blocking assignments
        ALU_OUT <= ALU_OUT_comb;
    end

endmodule