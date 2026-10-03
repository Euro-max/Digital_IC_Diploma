module RX_FSM(
	input RX_IN,
	input clk,rst,
	input [7:0] bit_cnt, edge_cnt,
	input par_err, strt_glitch, stp_err,
	input PAR_EN,
	output reg par_chk_en, strt_chk_en, stp_chk_en,
	output reg enable, data_valid, deser_en, dat_samp_en
);

(* fsm_encoding = "gray" *)
typedef enum logic [2:0] {
    IDLE   = 3'b000,
    START  = 3'b001,
    DATA   = 3'b010,
    PARITY = 3'b011,
    STOP   = 3'b100
} state_t;

state_t current_state, next_state;

always@(posedge clk or negedge rst) begin
	if(!rst) current_state <= IDLE;
	else current_state <= next_state;
end

always@(*) begin
	par_chk_en = 0;
	strt_chk_en = 0;
	stp_chk_en = 0;
	enable = 0;
	data_valid = 0;
	deser_en = 0;
	dat_samp_en = 0;
	
	case(current_state)
		IDLE: begin 
			if(RX_IN) next_state = IDLE;
			else next_state = START;
		end
		
		START: begin
			dat_samp_en = 1;
			enable = 1; 
			if(bit_cnt == 8'd1) begin
				strt_chk_en = 1; 
              	if(strt_glitch) begin 
              		next_state = IDLE;
              	end
              	else begin 
              		next_state = DATA;
              	end
			end
            else begin 
            	next_state = START;
            end
		end
		
		DATA: begin
			dat_samp_en = 1;
			if(edge_cnt == 8'd7) begin 
				deser_en = 1;
			end
			enable = 1;
			if(bit_cnt == 8'd9) begin
				if(PAR_EN) 
					next_state = PARITY;
				else 
					next_state = STOP; // Skip parity if disabled
			end
			else begin 
				next_state = DATA;
			end
		end
		
		PARITY: begin
			enable = 1;
			dat_samp_en = 1;
			if(bit_cnt == 8'd10) begin
    			par_chk_en = 1;
    			next_state = STOP;
   			end
  			else 
  				next_state = PARITY;
		end
		
		STOP: begin
			enable = 1;
			dat_samp_en = 1;
			
			// If PAR_EN is 1, STOP bit ends at bit_cnt 11. If 0, it ends at bit_cnt 10.
			if((PAR_EN && (bit_cnt == 8'd11)) || (!PAR_EN && (bit_cnt == 8'd10))) begin
				stp_chk_en = 1;
				
				// Drop enable to strictly 0 to synchronously clear EDGE_COUNTER for back-to-back
				enable = 0;
				
				if(!stp_err && (!PAR_EN || !par_err)) begin
					data_valid = 1; 
				end
				
				// Support Back-to-Back Frames
				if(RX_IN == 1'b0) begin
					next_state = START; // Immediate new frame
				end 
				else begin
					next_state = IDLE;
				end
			end
			else 
				next_state = STOP;
		end
		
		default: begin
			next_state = IDLE;
		end
	endcase
end
endmodule