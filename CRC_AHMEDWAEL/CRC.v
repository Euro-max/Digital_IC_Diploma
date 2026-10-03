module CRC #(
	parameter [7:0] SEED = 8'hd8
) ( 
	input DATA,
	input ACTIVE,
	input clk, rst,
	output reg CRC, Valid
);

	reg [7:0] LFSR;
	reg [3:0] count; //Count reg acts as shift register for serial bit tranmission to CRC.
	integer i; 

	
	parameter [7:0] TAPS = 8'b01000100; 

	always @(posedge clk or negedge rst) begin
		if (!rst) begin
			LFSR  <= SEED;
			Valid <= 0;
			count <= 0;
			CRC   <= 1'b0;
		end 
		else if (ACTIVE) begin
			LFSR[7] <= DATA + LFSR[0];
			
			for (i = 6; i >= 0; i = i - 1) begin
				if (TAPS[i]) 
					
					LFSR[i] <= DATA + LFSR[0] + LFSR[i+1]; 
				else 
					LFSR[i] <= LFSR[i+1];
			end
			
			Valid <= 1'b0;
			CRC   <= 1'b0;
			count <= 4'd8;
		end 
		else if (count > 0) begin
			CRC   <= LFSR[0];           // Output the LSB first (R0)
			Valid <= 1'b1;              // Keep Valid high during transmission
			
			LFSR  <= {1'b0, LFSR[7:1]}; // Shift the LFSR right to queue the next bit
			count <= count - 1;         // Count down the 8 clock cycles. Remember that for loops execute in zero time. 
		end 
		else begin
			// Idle State to pull signals low when counting is finished
			Valid <= 1'b0;
			CRC   <= 1'b0;
		end
	end
endmodule