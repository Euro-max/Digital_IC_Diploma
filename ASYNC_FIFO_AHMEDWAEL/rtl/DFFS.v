module DFFS #(
    parameter STAGES     = 2,
    parameter DATA_WIDTH = 8
)(
    input  wire                  clk, //Destination clk
    input  wire                  rst, //Destination rst
    input  wire [DATA_WIDTH-1:0] DATA_IN,
    output wire [DATA_WIDTH-1:0] DATA_OUT
);

    reg [STAGES-1:0] shift_reg [DATA_WIDTH-1:0]; //2D array as a bus multibit signal
                                  //  is transmitted so each bit will have its own shift register.
    integer i;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            for (i = 0; i < DATA_WIDTH; i = i + 1) begin
                shift_reg[i] <= {STAGES{1'b0}};
            end
        end else begin
            for (i = 0; i < DATA_WIDTH; i = i + 1) begin
                if (STAGES == 1) begin
                    shift_reg[i] <= DATA_IN[i];
                end else begin
                    shift_reg[i] <= {shift_reg[i][STAGES-2:0], DATA_IN[i]};
                end
            end
        end
    end

    genvar k;
    generate
        for (k = 0; k < DATA_WIDTH; k = k + 1) begin
            assign DATA_OUT[k] = shift_reg[k][STAGES-1];
        end
    endgenerate

endmodule