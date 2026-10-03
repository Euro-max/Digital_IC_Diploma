module CLK_DIV (
    input  wire       i_ref_clk,
    input  wire       i_rst_n,
    input  wire       i_clk_en,
    input  wire [7:0] i_div_ratio,
    output wire       o_div_clk
);

    wire       clk_div_en;
    wire [7:0] half_ratio_pos;
    wire [7:0] half_ratio_neg;

    reg  [7:0] cnt;
    reg        t1;
    reg        t2_pos;
    reg        t2_neg;

    assign clk_div_en     = i_clk_en && (i_div_ratio != 8'd0) && (i_div_ratio != 8'd1);
    assign half_ratio_pos = i_div_ratio >> 1;
    assign half_ratio_neg = (i_div_ratio >> 1) + {7'b0, i_div_ratio[0]};

    always @(posedge i_ref_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            cnt    <= 8'd0;
            t1     <= 1'b0;
            t2_pos <= 1'b0;
        end else if (clk_div_en) begin
            if (cnt == i_div_ratio - 1'b1) begin
                cnt <= 8'd0;
            end else begin
                cnt <= cnt + 1'b1;
            end

            if (cnt == 8'd0) begin
                t1 <= ~t1;
            end

            if (cnt == half_ratio_pos) begin
                t2_pos <= ~t2_pos;
            end
        end else begin
            cnt    <= 8'd0;
            t1     <= 1'b0;
            t2_pos <= 1'b0;
        end
    end

    always @(negedge i_ref_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            t2_neg <= 1'b0;
        end else if (clk_div_en) begin
            if (cnt == half_ratio_neg) begin
                t2_neg <= ~t2_neg;
            end
        end else begin
            t2_neg <= 1'b0;
        end
    end

    assign o_div_clk = clk_div_en ? (t1 ^ (i_div_ratio[0] ? t2_neg : t2_pos)) :
                       (i_clk_en && (i_div_ratio == 8'd1)) ? i_ref_clk : 1'b0;

endmodule