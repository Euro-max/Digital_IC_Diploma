module G2B #(
    parameter DATA_WIDTH = 8
)(
    input  wire [DATA_WIDTH-1:0] GRAY_DATA,
    output wire [DATA_WIDTH-1:0] BIN_DATA
);

    assign BIN_DATA[DATA_WIDTH-1] = GRAY_DATA[DATA_WIDTH-1];
    genvar i;
    generate
        for (i = DATA_WIDTH-2; i >= 0; i = i - 1) begin
            assign BIN_DATA[i] = BIN_DATA[i+1] ^ GRAY_DATA[i];
        end
    endgenerate

endmodule