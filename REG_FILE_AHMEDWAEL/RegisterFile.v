module RegisterFile#(parameter DATA_WIDTH=16,parameter DATA_DEPTH=8, parameter ADDR_WIDTH=$clog2(DATA_DEPTH))(
	input[DATA_WIDTH-1:0]WrData,
	input[ADDR_WIDTH-1:0]Address,
	input clk,
	input rst,
	input WREn,RDEn,
	output reg [DATA_WIDTH-1:0] RdData
	);
reg[DATA_WIDTH-1:0]mem[0:DATA_DEPTH-1];
integer i;
always@(posedge clk or negedge rst)
begin
	if(!rst)
		begin
			for(i=0;i<DATA_DEPTH;i=i+1)
			mem[i]<=16'b0;
		end
	else if(WREn) mem[Address]<=WrData;
	else if(RDEn) RdData<=mem[Address];
end
endmodule : RegisterFile