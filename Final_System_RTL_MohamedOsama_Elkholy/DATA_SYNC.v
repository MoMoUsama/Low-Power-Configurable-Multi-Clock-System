module DATA_SYNC #(parameter DATA_WIDTH=8,FLOPS=3) (
	input [DATA_WIDTH-1:0] unsync_data,
	input clk,rst,unsync_en,
	
	output reg sync_en,
	output reg [DATA_WIDTH-1:0] sync_data
);

//***** 	signals 	*******//
 
 	reg [FLOPS-1:0] shift_reg;
	wire mux_sel;
	wire [DATA_WIDTH-1:0] mux_out;
	
	
//***** pulse generator ******//

PULSE_GEN PG(
	.clk(clk),
	.rst(rst),
	.in(shift_reg[0]),
	
	.out(mux_sel)
);

	assign mux_out = (mux_sel)? unsync_data : sync_data ;

	always@(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			shift_reg<='d0;
		end
		
		else
		begin
		shift_reg<={unsync_en,shift_reg[FLOPS-1:1]};
		end
	end
	
	
	////////////// output ////////////
	always@(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			sync_data<='d0;
			sync_en<=0;
		end
		
		else
		begin
		
			sync_data<=mux_out;
			sync_en<= mux_sel;
		end
	end
	
endmodule