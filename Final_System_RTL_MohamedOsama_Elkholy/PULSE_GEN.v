module PULSE_GEN(
	input clk,rst,in,
	
	output out
);

reg ff_out;
assign out = in & !(ff_out) ;



always@(posedge clk or negedge rst)
begin
	if(!rst)
		ff_out<=0;
	else
		ff_out<=in;
end
endmodule