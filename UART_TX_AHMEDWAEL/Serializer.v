`include "uart_tx_defines.v"
module Serializer (
	input [`DATA_WIDTH-1:0] P_DATA,
	input ser_en,
	input clk, rst,
	output ser_data,  
	output ser_done
);


reg [$clog2(`DATA_WIDTH):0] count;
reg [`DATA_WIDTH-1:0] shift_reg;

always@(posedge clk or negedge rst) 
begin
	if(!rst) begin 
		shift_reg <= {`DATA_WIDTH{1'b0}};
		count     <= `DATA_WIDTH; 
	end
	else if(ser_en) begin
        
		if (count == `DATA_WIDTH) begin 
			shift_reg <= {1'b0, P_DATA[`DATA_WIDTH-1:1]};
			count     <= `DATA_WIDTH - 1;
		end
        
		else if(count > 0) begin
			shift_reg <= {1'b0, shift_reg[`DATA_WIDTH-1:1]};
			count     <= count - 1;
		end
	end
	else begin
		count <= `DATA_WIDTH;
	end
end


assign ser_data = (count == `DATA_WIDTH) ? P_DATA[0] : shift_reg[0]; //Before, It was inside the always block (sequential), It caused synchronization 
//errors as all the bits were checked one clock cycle before that when it was asserted on the bus, making the checks fail.
//Furthermore, In the state of DATA, the FSM forced the multiplexer selection line, but TX_out is the ser_data one clock before.

assign ser_done = (count == 1); 

endmodule