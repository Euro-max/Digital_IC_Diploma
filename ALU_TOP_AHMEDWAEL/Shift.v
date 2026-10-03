module Shift #(parameter DATA_WIDTH = 16)(
    input  wire signed [DATA_WIDTH-1:0] A, B,
    input  wire                         CLK, RST,
    input  wire [1:0]                   ALU_FUN,
    input  wire                         Shift_Enable,
    output reg                          SHIFT_Flag,
    output reg  signed [DATA_WIDTH-1:0] SHIFT_OUT
);

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            SHIFT_OUT  <= {DATA_WIDTH{1'b0}};
            SHIFT_Flag <= 1'b0;
        end else if (Shift_Enable) begin
            SHIFT_Flag <= 1'b1;
            case(ALU_FUN)
                2'b00: SHIFT_OUT <= A >>> 1;
                2'b01: SHIFT_OUT <= A <<< 1;
                2'b10: SHIFT_OUT <= B >>> 1;
                2'b11: SHIFT_OUT <= B <<< 1;
            endcase
        end else begin
            SHIFT_OUT  <= {DATA_WIDTH{1'b0}};
            SHIFT_Flag <= 1'b0;
        end
    end
endmodule