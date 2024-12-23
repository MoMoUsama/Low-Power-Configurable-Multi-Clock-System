module RST_SYNC #(parameter STAGES=8) (
	input clk,rst,
	
	output sync_rst
);


	reg [STAGES-1:0] shift_reg;
	
	assign sync_rst = shift_reg[0];

	always@(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			shift_reg<='d0;
		end
		
		else
		begin
		    shift_reg<={1'b1,shift_reg[STAGES-1:1]};
		end
	end
	
endmodule
