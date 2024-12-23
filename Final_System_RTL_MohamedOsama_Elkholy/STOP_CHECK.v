module STOP_CHECK (
    input SAMPLED_BIT,BIT_AVAILABLE,
	input RST,CLK,
	input STOP_CHK_EN,
	
	output reg STOP_ERR
);

reg STOP_ERR_REG ;

always@(posedge CLK or negedge RST)
begin
	if(!RST)
	begin
		STOP_ERR<='d0;
	end
	
	else
	begin
		if(STOP_CHK_EN && BIT_AVAILABLE)
		begin
		
			if(!SAMPLED_BIT)
				STOP_ERR<= 'd1;
		end
	end
	
end

endmodule
