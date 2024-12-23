module FIFO_WR #(parameter W=8)(
	input clk,rst,
	input [W:0] G_RD_PTR,
	input [W:0] G_WR_PTR,
	input wr_flag,
	
	output wire full,
	output wire [W-1:0] WR_ADDR,
	output reg  [W:0] WR_PTR
);
	
	assign full = (G_WR_PTR[W]!=G_RD_PTR[W] && G_WR_PTR[W-1]!=G_RD_PTR[W-1] && G_WR_PTR[W-2:0]==G_RD_PTR[W-2:0]);
	assign WR_ADDR = WR_PTR[W-1:0];
	
	always@(posedge clk or negedge rst)
	begin 
		if(!rst)
		begin
			WR_PTR<='d0;
		end
		
		else if (wr_flag && !(full)) 
		begin
			WR_PTR<=WR_PTR+'d1;
		end
	end
endmodule