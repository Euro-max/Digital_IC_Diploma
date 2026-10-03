module B2G #(parameter DATA_WIDTH=8)(
	input[DATA_WIDTH-1:0] BIN_DATA,
	output[DATA_WIDTH-1:0] GRAY_DATA
	);
assign GRAY_DATA[DATA_WIDTH-1]=BIN_DATA[DATA_WIDTH-1];
genvar i;
generate
	for(i=DATA_WIDTH-1;i>0;i=i-1) begin
	assign GRAY_DATA[i-1]=BIN_DATA[i]^BIN_DATA[i-1];
	end
endgenerate
endmodule 