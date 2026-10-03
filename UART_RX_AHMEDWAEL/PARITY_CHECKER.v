module PARITY_CHECKER (
    input wire clk, rst,
    input wire strt_chk_en,
    input wire [7:0] P_DATA,      
    input wire SAMPLED_BIT,       
    input wire par_chk_en,   
    input wire PAR_TYP,           // 0: Even, 1: Odd     
    output wire PAR_ERR
);

    wire calculated_parity;
    wire is_err;
    reg err_ff;

    // Odd parity inverts the XOR reduction
    assign calculated_parity = PAR_TYP ? (~^P_DATA) : (^P_DATA);
    assign is_err = (calculated_parity != SAMPLED_BIT);

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            err_ff <= 1'b0;
        end
        else if (strt_chk_en) begin 
            err_ff <= 1'b0; 
        end
        else if (par_chk_en) begin
            err_ff <= is_err; 
        end
    end

    assign PAR_ERR = par_chk_en ? is_err : err_ff;

endmodule
/*module PARITY_CHECKER(
	input SAMPLED_BIT,
	input clk,rst,
	input correct,
	input PAR_EN,
	output wire PAR_ERR
	);
     reg[7:0]shift_reg;
     always@(posedge clk or negedge rst)
     begin
     	if(!rst) begin
     		shift_reg<=0;
     	end 
     	else if(PAR_EN) begin
     		shift_reg<={SAMPLED_BIT,shift_reg[7:1]};

     	end
     end
     assign PAR_ERR=^shift_reg&&correct;
     endmodule
     */