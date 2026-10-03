`include "uart_tx_defines.v"
module Parity(
	input[`DATA_WIDTH-1:0] P_DATA,
	input DATA_VALID,
	output reg par_bit
	);
always@(*) begin
	if(DATA_VALID) begin
	if(`PARITY_TYPE)
		par_bit=^P_DATA;
	else
		par_bit=~^P_DATA;
end
else par_bit=0;
end
endmodule