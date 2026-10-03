module mult_unit (
    input         clk,
    input         rst_n,
    input         en,
    input  [7:0]  a,
    input  [7:0]  b,
    output reg [15:0] product,
    output reg        valid
);

    // ------------------------------------------------------------
    // Input Register Stage
    // ------------------------------------------------------------
    reg [7:0] a_reg;
    reg [7:0] b_reg;
    reg       en_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            a_reg  <= 8'd0;
            b_reg  <= 8'd0;
            en_reg <= 1'b0;
        end
        else begin
            a_reg  <= a;
            b_reg  <= b;
            en_reg <= en;
        end
    end

    wire [7:0] pp [0:7];

    // ------------------------------------------------------------
    // STAGE 1 COMBINATIONAL (PP0 to PP3)
    // ------------------------------------------------------------
    assign pp[0][0] = a_reg[0] & b_reg[0]; assign pp[0][1] = a_reg[1] & b_reg[0];
    assign pp[0][2] = a_reg[2] & b_reg[0]; assign pp[0][3] = a_reg[3] & b_reg[0];
    assign pp[0][4] = a_reg[4] & b_reg[0]; assign pp[0][5] = a_reg[5] & b_reg[0];
    assign pp[0][6] = a_reg[6] & b_reg[0]; assign pp[0][7] = a_reg[7] & b_reg[0];

    assign pp[1][0] = a_reg[0] & b_reg[1]; assign pp[1][1] = a_reg[1] & b_reg[1];
    assign pp[1][2] = a_reg[2] & b_reg[1]; assign pp[1][3] = a_reg[3] & b_reg[1];
    assign pp[1][4] = a_reg[4] & b_reg[1]; assign pp[1][5] = a_reg[5] & b_reg[1];
    assign pp[1][6] = a_reg[6] & b_reg[1]; assign pp[1][7] = a_reg[7] & b_reg[1];

    assign pp[2][0] = a_reg[0] & b_reg[2]; assign pp[2][1] = a_reg[1] & b_reg[2];
    assign pp[2][2] = a_reg[2] & b_reg[2]; assign pp[2][3] = a_reg[3] & b_reg[2];
    assign pp[2][4] = a_reg[4] & b_reg[2]; assign pp[2][5] = a_reg[5] & b_reg[2];
    assign pp[2][6] = a_reg[6] & b_reg[2]; assign pp[2][7] = a_reg[7] & b_reg[2];

    assign pp[3][0] = a_reg[0] & b_reg[3]; assign pp[3][1] = a_reg[1] & b_reg[3];
    assign pp[3][2] = a_reg[2] & b_reg[3]; assign pp[3][3] = a_reg[3] & b_reg[3];
    assign pp[3][4] = a_reg[4] & b_reg[3]; assign pp[3][5] = a_reg[5] & b_reg[3];
    assign pp[3][6] = a_reg[6] & b_reg[3]; assign pp[3][7] = a_reg[7] & b_reg[3];

    wire [15:0] level0 = {8'b0, pp[0]};                   
    wire [15:0] level1 = level0 + (pp[1] << 1);   
    wire [15:0] level2 = level1 + (pp[2] << 2);    
    wire [15:0] level3 = level2 + (pp[3] << 3);  

    // ------------------------------------------------------------
    // THE SINGLE PIPELINE STAGE (To Maximize Fmax)
    // ------------------------------------------------------------
    reg [15:0] level3_pipe; 
    reg [7:0]  a_pipe;      
    reg [7:4]  b_pipe;      
    reg        en_pipe;     

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            level3_pipe <= 16'd0;
            a_pipe      <= 8'd0;
            b_pipe      <= 4'd0;
            en_pipe     <= 1'b0;
        end
        else begin
            level3_pipe <= level3;      // Cut the adder chain here
            a_pipe      <= a_reg;       // Pass A forward for PP4-7
            b_pipe      <= b_reg[7:4];  // Pass B[7:4] forward for PP4-7
            en_pipe     <= en_reg;      // Sync the enable signal
        end
    end

    // ------------------------------------------------------------
    // STAGE 2 COMBINATIONAL (PP4 to PP7)
    // ------------------------------------------------------------
    assign pp[4][0] = a_pipe[0] & b_pipe[4]; assign pp[4][1] = a_pipe[1] & b_pipe[4];
    assign pp[4][2] = a_pipe[2] & b_pipe[4]; assign pp[4][3] = a_pipe[3] & b_pipe[4];
    assign pp[4][4] = a_pipe[4] & b_pipe[4]; assign pp[4][5] = a_pipe[5] & b_pipe[4];
    assign pp[4][6] = a_pipe[6] & b_pipe[4]; assign pp[4][7] = a_pipe[7] & b_pipe[4];

    assign pp[5][0] = a_pipe[0] & b_pipe[5]; assign pp[5][1] = a_pipe[1] & b_pipe[5];
    assign pp[5][2] = a_pipe[2] & b_pipe[5]; assign pp[5][3] = a_pipe[3] & b_pipe[5];
    assign pp[5][4] = a_pipe[4] & b_pipe[5]; assign pp[5][5] = a_pipe[5] & b_pipe[5];
    assign pp[5][6] = a_pipe[6] & b_pipe[5]; assign pp[5][7] = a_pipe[7] & b_pipe[5];

    assign pp[6][0] = a_pipe[0] & b_pipe[6]; assign pp[6][1] = a_pipe[1] & b_pipe[6];
    assign pp[6][2] = a_pipe[2] & b_pipe[6]; assign pp[6][3] = a_pipe[3] & b_pipe[6];
    assign pp[6][4] = a_pipe[4] & b_pipe[6]; assign pp[6][5] = a_pipe[5] & b_pipe[6];
    assign pp[6][6] = a_pipe[6] & b_pipe[6]; assign pp[6][7] = a_pipe[7] & b_pipe[6];

    assign pp[7][0] = a_pipe[0] & b_pipe[7]; assign pp[7][1] = a_pipe[1] & b_pipe[7];
    assign pp[7][2] = a_pipe[2] & b_pipe[7]; assign pp[7][3] = a_pipe[3] & b_pipe[7];
    assign pp[7][4] = a_pipe[4] & b_pipe[7]; assign pp[7][5] = a_pipe[5] & b_pipe[7];
    assign pp[7][6] = a_pipe[6] & b_pipe[7]; assign pp[7][7] = a_pipe[7] & b_pipe[7];

    wire [15:0] level4 = level3_pipe + (pp[4] << 4);  
    wire [15:0] level5 = level4 + (pp[5] << 5); 
    wire [15:0] level6 = level5 + (pp[6] << 6); 
    wire [15:0] level7 = level6 + (pp[7] << 7); 

    // ------------------------------------------------------------
    // Output Register Stage
    // ------------------------------------------------------------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            product <= 16'd0;
            valid   <= 1'b0;
        end
        else if (en_pipe) begin  
            product <= level7;
            valid   <= 1'b1;
        end
        else begin
            valid <= 1'b0;
        end
    end

endmodule
