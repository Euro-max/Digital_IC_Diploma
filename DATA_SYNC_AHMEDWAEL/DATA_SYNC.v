module DATA_SYNC#(parameter STAGES=5, parameter BUS_WIDTH=8)
	(input CLK,RST,
	 input[BUS_WIDTH-1:0] UNSYNC_BUS,
	 input bus_enable,
	 output reg[BUS_WIDTH-1:0]sync_bus,
	 output reg enable_pulse
		);
reg [STAGES-1:0] shift_reg;
wire en_out;
reg en_out_del;
wire pulse_gen;
wire [BUS_WIDTH-1:0]insyn;
always@(posedge CLK or negedge RST) begin
	if(!RST) begin
		shift_reg<=0;
	end 
	else begin
		if (STAGES== 1) begin
			shift_reg <= bus_enable;
		end else begin
			shift_reg <= {shift_reg[STAGES-2:0], bus_enable};
		end
	end
end
assign en_out=shift_reg[STAGES-1];
always@(posedge CLK or negedge RST) begin
	if(!RST) begin
		en_out_del<=0;
	end
	else en_out_del<=en_out;
end
assign pulse_gen=en_out&&!en_out_del;
assign insyn=pulse_gen?UNSYNC_BUS:sync_bus;
always@(posedge CLK or negedge RST) begin
	if(!RST) begin
		enable_pulse<=0;
		sync_bus<=0;
	end
	else begin 
		enable_pulse<=pulse_gen;
		sync_bus<=insyn;
	end
end
endmodule