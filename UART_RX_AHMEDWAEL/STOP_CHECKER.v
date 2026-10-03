module STOP_CHECKER (
	input wire clk, rst,
	input wire strt_chk_en,
	input wire SAMPLED_STOP_BIT,
	input wire STOP_CHECK_EN,
	output wire STOP_ERR
);

	wire is_err;
	reg err_ff;

	assign is_err = (SAMPLED_STOP_BIT == 1'b0);

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			err_ff <= 1'b0;
		end
		else if (strt_chk_en) begin
			err_ff <= 1'b0; 
		end
		else if (STOP_CHECK_EN) begin
			err_ff <= is_err; 
		end
	end

	assign STOP_ERR = STOP_CHECK_EN ? is_err : err_ff;

endmodule