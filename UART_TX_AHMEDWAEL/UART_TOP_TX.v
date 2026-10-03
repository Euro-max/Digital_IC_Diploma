`include "uart_tx_defines.v"
module UART_TOP_TX (
	input[`DATA_WIDTH-1:0]P_DATA,
	input Data_Valid,
	input clk,rst,
	output TX_out,Busy
	);
wire [1:0]mux_sel_wire;
wire ser_data_wire,par_bit_wire;
wire ser_en_wire,ser_done_wire;

Serializer Ser (.P_DATA(P_DATA),
	.ser_en(ser_en_wire),
	.ser_done(ser_done_wire),
	.clk(clk),
	.rst(rst),
	.ser_data(ser_data_wire));

MUX mux (
	.IO(1'b0),           // 00: Start Bit
	.I1(ser_data_wire),  // 01: Serial Data
	.I2(par_bit_wire),   // 10: Parity Bit
	.I3(1'b1),           // 11: Stop/Idle Bit
	.sel(mux_sel_wire),
	.Op(TX_out)
);
Parity par(.P_DATA(P_DATA),
	.DATA_VALID(Data_Valid),
	.par_bit(par_bit_wire));

FSM fsm (.clk(clk),
	.rst(rst),
	.DATA_VALID(Data_Valid),
	.Busy(Busy),
	.mux_sel(mux_sel_wire),
	.ser_done(ser_done_wire),
	.ser_en(ser_en_wire));
endmodule