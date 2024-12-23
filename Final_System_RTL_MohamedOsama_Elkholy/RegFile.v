module RegFile #(parameter DW=8 , DEPTH = 8 , REG_FILE_ADDRW=3) (
  input [DW-1:0] WrData,
  input [REG_FILE_ADDRW-1:0] Address,
  input WrEn,RdEn,CLK,RST,
  
  output reg [DW-1:0] RdData,
  output [DW-1:0] REG0,REG1,REG2,REG3,
  output reg RdDataValid
);


////**** 	signals  	////****
reg [DW-1:0] mem [0:DEPTH-1] ;
integer i;

assign  REG0 = mem[0]; //operand A
assign  REG1 = mem[1]; //operand B
assign  REG2 = mem[2]; // (7:2) prescale ,  parity_type , parity_en
assign  REG3 = mem[3]; //division ratio


//seq always
always@(posedge CLK or negedge RST)
  begin
  
    if(!RST)
	begin
		RdDataValid<=0;
		RdData<='d0;
		for(i=0 ; i<DEPTH ; i=i+1)
			mem[i]<='d0;
		
		mem[2] <= 8'h81;
		mem[3] <= 8'h20;  
	end
		
	else if (RdEn)
	    begin
		RdData<=mem[Address];
		RdDataValid<=1;
		end
		
	else if (WrEn)
	     begin
		 mem[Address]<=WrData;
		 end	
	else
		RdDataValid<=0;
  end
 endmodule
