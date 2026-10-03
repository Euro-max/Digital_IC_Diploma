module UART_RX_TOP (
    input wire clk,
    input wire rst,
    input wire RX_IN,
    input wire PAR_EN,
    input wire PAR_TYP, // 0 for Even, 1 for Odd
    output wire [7:0] P_DATA,
    output wire data_valid,
    output wire par_err,
    output wire stp_err
);

    // -----------------------------------------
    // Internal Wires
    // -----------------------------------------
    wire sampled_bit;
    wire dat_samp_en;
    wire deser_en;
    wire enable;
    wire par_chk_en;
    wire strt_chk_en;
    wire stp_chk_en;
    
    wire strt_glitch;
    
    wire [7:0] edge_cnt;
    wire [7:0] bit_cnt;

    // -----------------------------------------
    // Module Instantiations
    // -----------------------------------------

    DATA_SAMPLING #(
        .OVERSAMPLE(3)
    ) u_DATA_SAMPLING (
        .RX_IN(RX_IN),
        .DAT_SAMP_EN(dat_samp_en),
        .EDGE_CNT(edge_cnt[5:0]),
        .clk(clk),
        .rst(rst),
        .SAMPLED_BIT(sampled_bit),
        .PRESCALE(8)
    );

    DESERIALIZER u_DESERIALIZER (
        .SAMPLED_BIT(sampled_bit),
        .DESER_EN(deser_en),
        .clk(clk),
        .rst(rst),
        .P_DATA(P_DATA)
    );

    EDGE_COUNTER u_EDGE_COUNTER (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .bit_cnt(bit_cnt),
        .edge_cnt(edge_cnt)
    );

    PARITY_CHECKER u_PARITY_CHECKER (
        .clk(clk),
        .rst(rst),
        .strt_chk_en(strt_chk_en),
        .P_DATA(P_DATA),
        .SAMPLED_BIT(sampled_bit),
        .par_chk_en(par_chk_en),
        .PAR_TYP(PAR_TYP),
        .PAR_ERR(par_err)
    );

    START_CHECKER u_START_CHECKER (
        .SAMPLED_START_BIT(sampled_bit),
        .STRT_CHECK_EN(strt_chk_en),
        .STRT_GLITCH(strt_glitch)
    );

    STOP_CHECKER u_STOP_CHECKER (
        .clk(clk),
        .rst(rst),
        .strt_chk_en(strt_chk_en),
        .SAMPLED_STOP_BIT(sampled_bit),
        .STOP_CHECK_EN(stp_chk_en),
        .STOP_ERR(stp_err)
    );

    RX_FSM u_RX_FSM (
        .RX_IN(RX_IN),
        .clk(clk),
        .rst(rst),
        .bit_cnt(bit_cnt),
        .edge_cnt(edge_cnt),
        .par_err(par_err),
        .strt_glitch(strt_glitch),
        .stp_err(stp_err),
        .PAR_EN(PAR_EN),
        .par_chk_en(par_chk_en),
        .strt_chk_en(strt_chk_en),
        .stp_chk_en(stp_chk_en),
        .enable(enable),
        .data_valid(data_valid),
        .deser_en(deser_en),
        .dat_samp_en(dat_samp_en)
    );

endmodule