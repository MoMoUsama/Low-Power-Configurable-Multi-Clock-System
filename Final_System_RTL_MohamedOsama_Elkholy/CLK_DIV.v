module CLK_DIV(
    input ref_clk,rst,en,
	input [7:0] ratio,
	output o_clk
);

    reg  [7:0] Counter;
	wire DIV_EN,ODD;
	reg  clk,flag;
	
	
	
	//////////////// combinational Logic /////////////
	assign ODD = ratio[0];
	assign DIV_EN = (en && !(ratio=='d0) && !(ratio=='d1));
	assign o_clk = DIV_EN? clk : ref_clk ;
	
	////////////// LOGIC  /////////////
	always@(posedge ref_clk or negedge rst)
	begin
		if(!rst)
		begin
		    Counter<='d0;
			flag<='d0;
			clk<='d0;
		end
		
		else if(DIV_EN)
		begin
		   
			
			if(Counter== ((ratio>>1)-'d1) && !ODD)
			begin
			    Counter<='d0;
				clk<=!(clk);
			end
			
			
			else if( ODD && ((Counter== ((ratio>>1)-'d1) && !flag) || (Counter==(ratio>>1) && flag)) )
			begin
			
			    clk<=!(clk);
				Counter<='d0;
				flag<=!(flag);
			end
			else
			     Counter<=Counter + 'd1;
			
		end
		
	end
	
endmodule