module CMP #(parameter DATA_WIDTH = 16)(
    input  wire signed [DATA_WIDTH-1:0] A, B,
    input  wire                         CLK, RST,
    input  wire [1:0]                   ALU_FUN,
    input  wire                         CMP_Enable,
    output reg                          CMP_Flag,
    output reg         [DATA_WIDTH-1:0] CMP_OUT
);

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            CMP_OUT  <= {DATA_WIDTH{1'b0}};
            CMP_Flag <= 1'b0;
        end else if (CMP_Enable) begin
            CMP_Flag <= 1'b1;
            case(ALU_FUN)
                2'b00: CMP_OUT <= {DATA_WIDTH{1'b0}}; // NOP
                2'b01: begin
                    if (A == B) CMP_OUT <= 'd1;
                    else        CMP_OUT <= 'd0;
                end
                2'b10: begin
                    if (A > B)  CMP_OUT <= 'd2;
                    else        CMP_OUT <= 'd0;
                end
                2'b11: begin
                    if (A < B)  CMP_OUT <= 'd3;
                    else        CMP_OUT <= 'd0;
                end
            endcase
        end else begin
            CMP_OUT  <= {DATA_WIDTH{1'b0}};
            CMP_Flag <= 1'b0;
        end
    end
endmodule