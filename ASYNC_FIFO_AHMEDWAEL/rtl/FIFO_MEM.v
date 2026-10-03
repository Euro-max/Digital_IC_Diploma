module FIFO_MEM #(parameter DATA_WIDTH=8, parameter ADDR=8)(
	input wclk,rclk,
	input[DATA_WIDTH-1:0] W_DATA,
	input WR_EN,RD_EN,
	input W_FULL,R_EMPTY,
	input[$clog2(ADDR):0] iptr,optr, //additional bit for empty/full flag detection.
	output reg [DATA_WIDTH-1:0] R_DATA
	);
reg [DATA_WIDTH-1:0]mem[0:ADDR-1];
always@(posedge wclk) begin
	if(WR_EN&&!W_FULL) mem[iptr]<=W_DATA;
end
always@(posedge rclk) begin
	if(RD_EN&&!R_EMPTY) begin
		R_DATA<=mem[optr];
	end
end
endmodule
