module MEM_CNTRL #(parameter ADD_W=8 , DATA_W=8 , DATA_D=16)(

    input wr_flag,full,clk,
	input [ADD_W-1:0] RD_ADDR,WR_ADDR,
	input [DATA_W-1:0] WR_DATA,

	output wire [DATA_W-1:0] RD_DATA
);

	reg [DATA_W-1:0] MEM [0:DATA_D];
	assign RD_DATA = MEM[RD_ADDR];
	
	always@(posedge clk)
	begin
	
		if(wr_flag && !(full))
			MEM[WR_ADDR] <= WR_DATA;
	end
	
endmodule