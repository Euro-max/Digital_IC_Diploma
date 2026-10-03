module Decoder(
    input  wire [1:0] ALU_FUNC,
    output reg        Arith_EN, 
    output reg        Logic_EN, 
    output reg        CMP_EN, 
    output reg        SHIFT_EN
);

    always @(*) begin
        // Default assignments to prevent latches
        Arith_EN = 1'b0;
        Logic_EN = 1'b0;
        CMP_EN   = 1'b0;
        SHIFT_EN = 1'b0;
        
        case(ALU_FUNC)
            2'b00: Arith_EN = 1'b1;
            2'b01: Logic_EN = 1'b1;
            2'b10: CMP_EN   = 1'b1;
            2'b11: SHIFT_EN = 1'b1;
        endcase
    end
endmodule