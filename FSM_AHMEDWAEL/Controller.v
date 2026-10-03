module Controller(
	input UP_Max,Activate,DN_Max,
	input clk,rst,
	output reg UP_M,DN_M
	);
localparam IDLE=2'b00;
localparam Mv_UP=2'b01;
localparam Mv_Dn=2'b11;  //Gray Encoding
reg[1:0]next_state,current_state;
always@(posedge clk or negedge rst) begin
	if(!rst)
		current_state<=2'b00;
	else
		current_state<=next_state;
end
always@(*)begin
	case(current_state)
	IDLE: begin 
		if(Activate==0) next_state=IDLE;
		  else if(UP_Max) next_state=Mv_Dn;
		  else if(DN_Max) next_state=Mv_UP;
		  else next_state=IDLE;
		  UP_M=1'b0;
		  DN_M=1'b0;
		end

	Mv_UP: begin 
		UP_M=1'b1;
	       DN_M=1'b0;
	       if(UP_Max) next_state=IDLE;
	       else next_state=Mv_UP;
	   end
	Mv_Dn: begin 
		UP_M=1'b0;
	       DN_M=1'b1;
	       if(DN_Max) next_state=IDLE;
	       else next_state=Mv_Dn;
	   end
	default: begin next_state=IDLE;
		UP_M=1'b0;
		DN_M=1'b0;
	end
	endcase 
end
endmodule