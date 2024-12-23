module FIFO #(parameter DW=8 ,DD=16 ,ADDR_W=8) (
	input w_clk,r_clk,
	input w_rst,r_rst,
	input [DW-1:0] WR_DATA,
	input wr_flag,rd_flag,
	
	output [DW-1:0] RD,
	output full,empty

);

////////////////  signals declaration  /////////////

	wire [ADDR_W:0] G_RD_PTR,G_WR_PTR,WR_PTR,RD_PTR;
	wire [ADDR_W:0] G_RD_PTR_SYNCH,G_WR_PTR_SYNCH;
	wire [ADDR_W-1:0] RD_ADDR,WR_ADDR;
	

///////////////    Memory Controller   /////////////
	MEM_CNTRL #(.ADD_W(ADDR_W), .DATA_W(DW), .DATA_D(DD)) mem(

		.wr_flag(wr_flag),
		.full(full),
		.RD_ADDR(RD_ADDR),
		.WR_ADDR(WR_ADDR),
		.WR_DATA(WR_DATA),
		.clk(w_clk),
		
		.RD_DATA(RD)
	);




///////////////  for write part /////////////
	FIFO_WR #(.W(ADDR_W)) wr(
		.clk(w_clk),
		.rst(w_rst),
		.G_RD_PTR(G_RD_PTR_SYNCH),
		.G_WR_PTR(G_WR_PTR),
		.wr_flag(wr_flag),
		
		.full(full),
		.WR_ADDR(WR_ADDR),
		.WR_PTR(WR_PTR)
	);

	BINARY_TO_GRAY #(.W(ADDR_W)) B2G_WR(
		.In(WR_PTR),
		.Out(G_WR_PTR)
	);
	
	D_FLOP_SYNC #(.W(ADDR_W)) W2R_SYNC(
		.clk(r_clk),
		.rst(r_rst),
		.In(G_WR_PTR),
		.Out(G_WR_PTR_SYNCH)
	);
	
	
///////////////  for read part /////////////
	FIFO_RD #(.W(ADDR_W)) rd(
		.clk(r_clk),
		.rst(r_rst),
		.G_RD_PTR(G_RD_PTR),
		.G_WR_PTR(G_WR_PTR_SYNCH),
		.rd_flag(rd_flag),
		
		.empty(empty),
		.RD_ADDR(RD_ADDR),
		.RD_PTR(RD_PTR)
	);

	BINARY_TO_GRAY #(.W(ADDR_W)) B2G_RD(
		.In(RD_PTR),
		.Out(G_RD_PTR)
	);
	
	 D_FLOP_SYNC #(.W(ADDR_W)) R2W_SYNC(
		.clk(w_clk),
		.rst(w_rst),
		.In(G_RD_PTR),
		.Out(G_RD_PTR_SYNCH)
	);
	
	
endmodule
