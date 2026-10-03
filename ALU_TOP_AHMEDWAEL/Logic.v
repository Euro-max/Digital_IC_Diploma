module Logic #(parameter DATA_WIDTH = 16)(
    input  wire signed [DATA_WIDTH-1:0] A, B,
    input  wire                         CLK, RST,
    input  wire [1:0]                   ALU_FUN,
    input  wire                         Logic_Enable,
    output reg                          Logic_Flag,
    output reg  signed [DATA_WIDTH-1:0] Logic_OUT
);

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            Logic_OUT  <= {DATA_WIDTH{1'b0}};
            Logic_Flag <= 1'b0;
        end else if (Logic_Enable) begin
            Logic_Flag <= 1'b1;
            case(ALU_FUN)
                2'b00: Logic_OUT <= A & B;
                2'b01: Logic_OUT <= A | B;
                2'b10: Logic_OUT <= ~(A & B);
                2'b11: Logic_OUT <= ~(A | B);
            endcase
        end else begin
            Logic_OUT  <= {DATA_WIDTH{1'b0}};
            Logic_Flag <= 1'b0;
        end
    end
endmodule