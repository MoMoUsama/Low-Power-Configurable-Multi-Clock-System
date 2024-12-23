module PRESCALE_MUX (
	input [5:0] Prescale,
	output reg [7:0] ratio
);

always@(*)
begin
	case(Prescale)
	
	6'd32: ratio='d1;
	6'd16: ratio='d2;
	6'd8: ratio='d4;
	6'd4: ratio='d8;
	default: ratio = 'd1;
	endcase
	

end
endmodule