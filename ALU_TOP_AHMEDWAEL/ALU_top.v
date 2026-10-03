module ALU_TOP #(parameter DATA_WIDTH = 16)(
    input  wire signed [DATA_WIDTH-1:0] A, B,
    input  wire [3:0]                   ALU_FUNC,
    input  wire                         CLK, RST,
    output wire        [DATA_WIDTH-1:0] Arith_OUT,
    output wire                         Arith_Flag,
    output wire        [DATA_WIDTH-1:0] Logic_OUT,
    output wire                         Logic_Flag,
    output wire        [DATA_WIDTH-1:0] CMP_OUT,
    output wire                         CMP_Flag,
    output wire        [DATA_WIDTH-1:0] SHIFT_OUT,
    output wire                         SHIFT_Flag
);

    // Internal wires for enable signals coming from Decoder
    wire Arith_En_Wire;
    wire Logic_En_Wire;
    wire CMP_En_Wire;
    wire Shift_En_Wire;

    // Decoder Instantiation
    Decoder Dec_inst (
        .ALU_FUNC (ALU_FUNC[3:2]),
        .Arith_EN (Arith_En_Wire),
        .Logic_EN (Logic_En_Wire),
        .CMP_EN   (CMP_En_Wire),
        .SHIFT_EN (Shift_En_Wire)
    );

    // Arithmetic Unit Instantiation
    Arth #(DATA_WIDTH) Arith_inst (
        .A            (A),
        .B            (B),
        .CLK          (CLK),
        .RST          (RST),
        .ALU_FUN      (ALU_FUNC[1:0]),
        .Arith_Enable (Arith_En_Wire),
        .Arith_Flag   (Arith_Flag),
        .Arith_OUT    (Arith_OUT)
    );

    // Logic Unit Instantiation
    Logic #(DATA_WIDTH) Logic_inst (
        .A            (A),
        .B            (B),
        .CLK          (CLK),
        .RST          (RST),
        .ALU_FUN      (ALU_FUNC[1:0]),
        .Logic_Enable (Logic_En_Wire),
        .Logic_Flag   (Logic_Flag),
        .Logic_OUT    (Logic_OUT)
    );

    // Comparison Unit Instantiation
    CMP #(DATA_WIDTH) CMP_inst (
        .A            (A),
        .B            (B),
        .CLK          (CLK),
        .RST          (RST),
        .ALU_FUN      (ALU_FUNC[1:0]),
        .CMP_Enable   (CMP_En_Wire),
        .CMP_Flag     (CMP_Flag),
        .CMP_OUT      (CMP_OUT)
    );

    // Shift Unit Instantiation
    Shift #(DATA_WIDTH) Shift_inst (
        .A            (A),
        .B            (B),
        .CLK          (CLK),
        .RST          (RST),
        .ALU_FUN      (ALU_FUNC[1:0]),
        .Shift_Enable (Shift_En_Wire),
        .SHIFT_Flag   (SHIFT_Flag),
        .SHIFT_OUT    (SHIFT_OUT)
    );

endmodule