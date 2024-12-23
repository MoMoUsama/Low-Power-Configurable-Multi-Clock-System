module Data_Sampling(

    input CLK,RST,
	input [5:0] EDG_CNT,
	input DAT_SAMPL_EN,
	input [5:0] PRESCALE,
	input S_DATA,
	
	output reg SAMPLED_BIT ,
	output reg BIT_AVAILABLE
);


reg [1:0] one ;
reg [1:0] zero;
reg [5:0] Mid ; 


always@(posedge CLK or negedge RST)
begin

	if(!RST)
	begin
		Mid<='d0;
		one<='d0;
		zero<='d0;
		BIT_AVAILABLE <= 1'd0;
	end
	
	else
	begin
		Mid <= (PRESCALE >> 1) ;
		
		if(DAT_SAMPL_EN)
		begin
			BIT_AVAILABLE <= 1'd0;
		
			if(EDG_CNT == (Mid-'d1) )
			begin
				
				one <= one + S_DATA;
				if(S_DATA == 1'b0)
					zero <= zero + 1'b1;
			end
			
			else if(EDG_CNT == Mid )
			begin
				
				one <= one + S_DATA;
				if(S_DATA == 1'b0)
					zero <= zero + 1'b1;
			end
			
			else if(EDG_CNT == (Mid + 1'd1) )
			begin
				
				one <= one + S_DATA;
				if(S_DATA == 1'b0)
					zero <= zero + 1'b1;
					
		
				if(one > zero )
					SAMPLED_BIT <= 1'b1;
				else
					SAMPLED_BIT <= 1'b0;
					
				BIT_AVAILABLE <= 1'b1;	
				
				//reintialization
				one <= 2'd0;
				zero <= 2'd0;			
			end
		
		end
	end
	
end

endmodule
