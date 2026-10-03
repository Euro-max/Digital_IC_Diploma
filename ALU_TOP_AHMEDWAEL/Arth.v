module Arth #(parameter DATA_WIDTH = 16)(
    input  wire signed [DATA_WIDTH-1:0] A, B,
    input  wire                         CLK, RST,
    input  wire [1:0]                   ALU_FUN,
    input  wire                         Arith_Enable,
    output reg                          Arith_Flag,
    output reg  signed [DATA_WIDTH-1:0] Arith_OUT
);

    // 1. Declare an internal variable twice as wide to safely hold multiplication results
    // For a 16-bit DATA_WIDTH, this creates a 32-bit internal register.
    reg signed [(2*DATA_WIDTH)-1:0] internal_math;

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            Arith_OUT     <= {DATA_WIDTH{1'b0}};
            Arith_Flag    <= 1'b0;
            internal_math = {(2*DATA_WIDTH){1'b0}};
        end else if (Arith_Enable) begin
            Arith_Flag <= 1'b1;
            
            // 2. Perform the math using blocking assignments (=) into the wide internal register
            // This ensures no data is lost during the actual calculation phase.
            case(ALU_FUN)
                2'b00: internal_math = A + B;
                2'b01: internal_math = A - B;
                2'b10: internal_math = A * B;
                2'b11: internal_math = A / B;
                default: internal_math = {(2*DATA_WIDTH){1'b0}};
            endcase
            
            Arith_OUT <= internal_math[DATA_WIDTH-1:0];
            
        end else begin
            Arith_OUT  <= {DATA_WIDTH{1'b0}};
            Arith_Flag <= 1'b0;
        end
    end
endmodule