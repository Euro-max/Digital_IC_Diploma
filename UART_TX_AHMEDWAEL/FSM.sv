`include "uart_tx_defines.v"
module FSM(
	input DATA_VALID,ser_done,
	input clk, rst,
	output reg Busy, ser_en,       
	output reg [1:0] mux_sel       
);

//reg [2:0] current_state, next_state;


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
	
	Busy = 0;
	ser_en = 0;
	mux_sel = 2'b11; 

	case(current_state)
		IDLE: begin
			if(DATA_VALID) begin
				next_state = START; //here, Busy stays at 1'b0.
			end
			else next_state = IDLE;
		end
		
		START: begin
			Busy = 1;
			mux_sel = `MUX_START; 
			
			next_state = DATA; 
		end
		
		DATA: begin
			Busy = 1;
			ser_en = 1;      // Enable the serializer to shift data 
			mux_sel = `MUX_DATA; 
			
			if(ser_done) begin 
				if(`PAR_EN)
					next_state = PARITY;
				else
					next_state = STOP;
			end
			else begin
				next_state = DATA;
			end
		end
		
		PARITY: begin
			Busy = 1;
			mux_sel = `MUX_PARITY; 
			next_state = STOP; 
		end
		
		STOP: begin
			Busy = 1;
			mux_sel = `MUX_STOP;
			//if(DATA_VALID) next_state=START; //back-to-back frames
			 next_state = IDLE; //Busy is down for one clock cycle.
		end
		
		default: begin 
			next_state = IDLE;
		end
	endcase
end

endmodule