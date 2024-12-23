module FIFO_RD #(parameter W=8)(
	input clk,rst,
	input [W:0] G_RD_PTR,
	input [W:0] G_WR_PTR,
	input rd_flag,
	
	output wire empty,
	output wire [W-1:0] RD_ADDR,
	output reg  [W:0] RD_PTR
);
	
	assign empty = (!rst)? 0 : (G_WR_PTR == G_RD_PTR);
	assign RD_ADDR = RD_PTR[W-1:0];
	
	always@(posedge clk or negedge rst)
	begin 
		if(!rst)
		begin
			RD_PTR<='d0;
		end
		
		else if (rd_flag && !(empty)) 
		begin
			RD_PTR<=RD_PTR+'d1;
		end
	end
endmodule