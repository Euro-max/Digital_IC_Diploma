module Up_Dn_Counter(
	input clk,
	input[4:0]IN,
	input Load,Up,Down,
	output reg [4:0]Counter,
	output wire High,Low
	);

assign High=(Counter==5'b11111)?1'b1:1'b0;

assign Low=(Counter==5'b0)?1'b1:1'b0;

always@(posedge clk)
begin
	if(Load)
		Counter<=IN;
	else if(Down&&!Low)
		Counter<=Counter-1;
	else if (Up&&!High)
		Counter<=Counter+1;
	else
		Counter<=Counter;
	
end
endmodule