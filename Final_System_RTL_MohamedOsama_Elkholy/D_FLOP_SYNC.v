module D_FLOP_SYNC #(parameter W=8)(
	input clk,rst,
	input [W:0] In,
	output reg  [W:0] Out
);

	reg [W:0] flop1;
	
	always@(posedge clk or negedge rst)
	begin 
		if(!rst)
		begin
			flop1<='d0;
			Out<='d0;
		end
		
		else 
		begin
			flop1<=In;
			Out<=flop1;
		end
	end
endmodule