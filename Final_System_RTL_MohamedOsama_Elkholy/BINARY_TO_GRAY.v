module BINARY_TO_GRAY #(parameter W=8)(
	input  wire [W:0] In,
	output reg  [W:0] Out
);
integer i;
	always@(*)
	begin
	
		Out[W] = In[W];
		for(i=W-1 ; i!=-1 ; i=i-1)
		    Out[i] = In[i] ^ In[i+1];
	end
endmodule