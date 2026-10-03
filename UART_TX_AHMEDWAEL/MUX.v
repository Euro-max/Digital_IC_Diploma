`include "uart_tx_defines.v"
module MUX(
	input IO,I1,I2,I3,
	input[1:0]sel,
	output reg Op
	);
always@(*)begin
	case(sel)
		2'b00:Op=IO;
		2'b01:Op=I1;
		2'b10:Op=I2;
		2'b11:Op=I3;
	default:Op=I3;
	endcase
end
endmodule