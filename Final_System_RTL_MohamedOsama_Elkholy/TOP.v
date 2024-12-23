
module TOP #(parameter 
			DW=8 , 
			DATA_SYNC_STAGES=2 , 
			RST_SYNC_STAGES=2 , 
			FUNCT_W=4,
			REG_FILE_ADDRW=4,
			REGFILE_DEPTH=8)
(

	input ref_clk,ref_rst,UART_CLK,
	input RX_IN,
	
	output stp_err,par_err,
	output TX_OUT
);


////////////////////////////////////////
////////// 		constants 	////////////
////////////////////////////////////////

/*parameter 
			DW=8 , 
			DATA_SYNC_STAGES=2 , 
			RST_SYNC_STAGES=2 , 
			FUNCT_W=4,
			REG_FILE_ADDRW=4,
			REGFILE_DEPTH=8;*/

////////////////////////////////////////
////////// 		signals 	////////////
////////////////////////////////////////


wire [DW-1:0] RX_OUT,DATA_SYNC_OUT;
wire RX_out_valid,DATA_SYNC_OUT_VALID;
wire TX_clk,RX_clk;
wire par_en,par_type;
wire [DW-1:0] A,B;
wire sync_rst2,sync_rst1;
wire [7:0] Div_ratio,REG2; //assign from reg file
wire [5:0] Prescale;  //assign from reg file 
wire fifo_full,wr_incr,rd_incr,BUSY,fifo_empty;
wire rd_en,wr_en,regfile_out_valid;
wire alu_out_valid,alu_en;
wire [FUNCT_W-1:0] FUN ;
wire [DW-1:0] alu_out , regfile_out , wr_data_fifo , wr_data_regfile;
wire [REG_FILE_ADDRW-1:0] Addr;
wire gate_en,alu_clk;

wire [DW-1:0] RdData_fifo;
wire [7:0] rx_divider_ratio;





////////////////////////////////////////
////////// 	Instantiation 	////////////
////////////////////////////////////////

SYS_CNTRL #(.DW(DW), .FUN_W(FUNCT_W), .REGFILE_ADDR_W(REG_FILE_ADDRW)) sys_cntrl(

	.CLK(ref_clk),
	.RST(sync_rst1),
	.sync_data(DATA_SYNC_OUT),
	.sync_data_valid(DATA_SYNC_OUT_VALID),
	.fifo_full(fifo_full),
	.alu_out(alu_out),
	.alu_out_valid(alu_out_valid),
	.regfile_out(regfile_out),
	.regfile_out_valid(regfile_out_valid),

	.wr_data_fifo(wr_data_fifo),
	.wr_incr(wr_incr),
	.alu_en(alu_en),
	.FUN(FUN),
	.wr_data_regfile(wr_data_regfile),
	.rd_en(rd_en),
	.wr_en(wr_en),
	.Addr(Addr),
	.gate_en(gate_en)

);


UART #(.DW(DW)) uart(

	.TX_clk(TX_clk),
	.rst(sync_rst2),
	.RX_clk(RX_clk),
	.RX_IN(RX_IN),  //top  signal
	.P_DATA(RdData_fifo), //fifo
	.empty_flag(fifo_empty), //fifo
	.par_en(par_en), //reg file
	.par_type(par_type), //reg file
	.prescale(Prescale), //reg file
	
	.TX_OUT(TX_OUT),
	.BUSY(BUSY),
	.RX_OUT(RX_OUT), //to DATA_SYNC
	.RX_out_valid(RX_out_valid),  //to DATA_SYNC
	.stp_err(stp_err),
	.parity_err(par_err)
);


DATA_SYNC #(.DATA_WIDTH(DW), .FLOPS(DATA_SYNC_STAGES)) data_sync(
	.unsync_data(RX_OUT),
	.clk(ref_clk),
	.rst(ref_rst),
	.unsync_en(RX_out_valid),
	
	.sync_en(DATA_SYNC_OUT_VALID),
	.sync_data(DATA_SYNC_OUT) //to fsm
);


PRESCALE_MUX prescale_mux(
	.Prescale(Prescale),
	.ratio(rx_divider_ratio)
);

CLK_DIV RX_DIVIDER(
    .ref_clk(UART_CLK),
	.rst(sync_rst2),
	.en(1'b1),
	.ratio(rx_divider_ratio),
	.o_clk(RX_clk)
);


CLK_DIV TX_DIVIDER(
    .ref_clk(UART_CLK),
	.rst(sync_rst2),
	.en(1'b1),
	.ratio(Div_ratio),
	
	.o_clk(TX_clk)
);


RST_SYNC #(.STAGES(RST_SYNC_STAGES)) rst_sync_1(
	.clk(ref_clk),
	.rst(ref_rst),
	
	.sync_rst(sync_rst1)
);


RST_SYNC #(.STAGES(RST_SYNC_STAGES)) rst_sync_2(
	.clk(UART_CLK),
	.rst(ref_rst),
	
	.sync_rst(sync_rst2)
);

RegFile #(.DW(DW) , .DEPTH(REGFILE_DEPTH), .REG_FILE_ADDRW(REG_FILE_ADDRW)) rf(
	.WrData(wr_data_regfile),
	.Address(Addr),
	.WrEn(wr_en),
	.RdEn(rd_en),
	.CLK(ref_clk),
	.RST(sync_rst1),
	
	.RdDataValid(regfile_out_valid),  
	.RdData(regfile_out),
	.REG0(A),
	.REG1(B),
	.REG2(REG2),
	.REG3(Div_ratio)
);
assign Prescale = REG2[7:2];
assign par_type = REG2[1];
assign par_en   = REG2[0];


CLK_GATE clk_gate(
		.CLK_EN(gate_en),
		.CLK(ref_clk),
		.GATED_CLK(alu_clk)
);


ALU #(.OPER_WIDTH(DW),.OUT_WIDTH(DW)) alu (

	  .A(A), 
	  .B(B),
	  .EN(alu_en),
	  .ALU_FUN(FUN),
	  .CLK(alu_clk),
	  .RST(sync_rst1),  
	  
	  .ALU_OUT(alu_out),
	  .OUT_VALID(alu_out_valid)  
);

PULSE_GEN pulse_gen(
	.clk(TX_clk),
	.rst(sync_rst2),
	.in(BUSY),
	
	.out(rd_incr)
);

FIFO #(.DW(DW) , .DD(7) , .ADDR_W(3)) fifo(
	.w_clk(ref_clk),
	.r_clk(TX_clk),
	.w_rst(sync_rst1),
	.r_rst(sync_rst2),
	.WR_DATA(wr_data_fifo),
	.wr_flag(wr_incr),
	.rd_flag(rd_incr),
	
	.RD(RdData_fifo),
	.full(fifo_full),
	.empty(fifo_empty)

);

endmodule
