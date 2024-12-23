module SYS_CNTRL#(parameter DW=8,FUN_W=4,REGFILE_ADDR_W=4) (

input  CLK,RST,
input  [DW-1:0] sync_data,
input  sync_data_valid,
input  fifo_full,
input  [DW-1:0] alu_out,
input  alu_out_valid,
input  [DW-1:0] regfile_out,
input  regfile_out_valid,

output reg [DW-1:0] wr_data_fifo,
output reg wr_incr,
output reg alu_en,
output reg [FUN_W-1:0] FUN,
output reg [DW-1:0] wr_data_regfile,
output reg rd_en,wr_en,
output reg [REGFILE_ADDR_W-1:0] Addr ,
output reg gate_en

);


/////////////////////// STATES /////////////////////////
typedef enum logic [3:0] {
    IDLE        = 4'b0000,
    FRAME0      = 4'b0001,
    Rf_Wr_Addr  = 4'b0011,
    Rf_Wr_Data  = 4'b0010,
    Rf_Rd_Addr  = 4'b0110,
    Rf_Rd_Data  = 4'b0100,
    FIFO_WRITE  = 4'b0101,
    OperandA    = 4'b0111,
    OperandB    = 4'b1111,
    Alu_FUN     = 4'b1011,
    Alu_Rd_Data = 4'b1001
} state_t;


/////////////////////// signals /////////////////////////
state_t cur_state , nxt_state ;
reg [REGFILE_ADDR_W-1:0] addr_reg,addr;
reg [DW-1:0] fifo_wr_data,fifo_wr_data_reg;
 

			
/////////////////////  state transitions  ////////////////////
always@(posedge CLK or negedge RST)
begin
    
	if(!RST)
	begin
	    cur_state<=IDLE;
	end
	
	else
	begin
	    cur_state<=nxt_state;
	end
end


//////////////////// combinational always for nxt_state  //////////////////////
always@(*)
begin

    case(cur_state)
	
	    IDLE : 
		begin
            if(sync_data_valid) //command recieved completely
			begin
				case(sync_data)
				8'hAA:begin
				
					nxt_state=Rf_Wr_Addr;
				
				end 8'hBB: begin
				
					nxt_state=Rf_Rd_Addr;
				
				end 8'hCC: begin 
				
					nxt_state=OperandA;
				
				end 8'hDD: begin
				
					nxt_state=Alu_FUN;
				
				end default: begin
					nxt_state=IDLE;
				end 
				endcase
			end
			
            else
                nxt_state=IDLE;			
		end


	    Rf_Wr_Addr : //second frame of the regfile write command
		begin
		
			if(sync_data_valid) //addr recieved completely
			begin
				nxt_state = Rf_Wr_Data;
			end else begin
				nxt_state = Rf_Wr_Addr;
			end
		end

		
	    Rf_Wr_Data : //third frame of the regfile write command
		begin
		
			if(sync_data_valid) //Data recieved completely
			begin
				nxt_state = IDLE;
			end else begin
				nxt_state = Rf_Wr_Data;
			end
		end
		
	    Rf_Rd_Addr : //second frame of the regfile read command
		begin
		
			if(sync_data_valid) //addr recieved completely
			begin
				nxt_state = Rf_Rd_Data;
			end else begin
				nxt_state = Rf_Rd_Addr;
			end
		end

		Rf_Rd_Data :  //take the data from the register file
		begin
			if(regfile_out_valid) //data recieved from the regfile 
			begin
				nxt_state = FIFO_WRITE; 
			end
			
			else
				nxt_state = Rf_Rd_Data; //wait for data
		end 
		
		FIFO_WRITE : 
		begin
			if(fifo_full)
			begin
				nxt_state = FIFO_WRITE; //wait for an empty place in the fifo
			end
			
			else
				nxt_state = IDLE;
		end 

	    OperandA : //second frame of the alu operation command
		begin
		
			if(sync_data_valid) //first operand recieved completely
			begin
				nxt_state = OperandB;
			end else begin
				nxt_state = OperandA;
			end
		end
		
	    OperandB : //third frame of the alu operation comman
		begin
		
			if(sync_data_valid) //second operand recieved completely
			begin
				nxt_state = Alu_FUN;
			end else begin
				nxt_state = OperandB;
			end
		end
		
	    Alu_FUN : //fourth frame of the alu operation comman
		begin
		
			if(sync_data_valid) //funct recieved completely
			begin
				nxt_state = Alu_Rd_Data;
			end else begin
				nxt_state = Alu_FUN;
			end
		end
		
	    Alu_Rd_Data : //take the result from the alu
		begin
		
			if(alu_out_valid) //alu result ready
			begin
				nxt_state = FIFO_WRITE;
			end else begin
				nxt_state = Alu_Rd_Data;
			end
		end
		
		
		default :
		begin
			nxt_state=IDLE;
		end
	
	endcase
end

	
//////////////////// combinational always for output(input,cur_state)  //////////////////////
always@(*)
begin
	
	case(cur_state)
	    IDLE : 
		begin
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			wr_data_regfile='d0;
			rd_en=0;
			wr_en=0;
			Addr='d0;
			gate_en=0;
			addr='d0;
		end

	    Rf_Wr_Addr : //second frame of the regfile write command
		begin
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			wr_data_regfile='d0;
			rd_en=0;
			wr_en=0;
			gate_en='d0;
			Addr='d0;
			addr= 'd0;
			if(sync_data_valid) //addr recieved completely
			begin
				addr = sync_data;
			end
		end

		
	    Rf_Wr_Data : //third frame of the regfile write command
		begin
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			wr_data_regfile='d0;
			rd_en=0;
			wr_en=0;
			Addr = 'd0;
			addr = 'd0;
			gate_en=0;
			if(sync_data_valid) //Data recieved completely
			begin
				wr_data_regfile = sync_data;
				Addr = addr_reg;
				wr_en=1;
			end
		end
		
	    Rf_Rd_Addr : //second frame of the regfile read command
		begin
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			wr_data_regfile='d0;
			rd_en=0;
			wr_en=0;
			Addr = 'd0;
			addr = 1'd0;
			gate_en=0;
			if(sync_data_valid) //addr recieved completely
			begin
				Addr = sync_data;
			end
		end

		Rf_Rd_Data :
		begin
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			wr_data_regfile='d0;
			rd_en=1;
			wr_en=0;
			Addr = 'd0;
			addr='d0;
			gate_en=0;
			if(regfile_out_valid)
				fifo_wr_data = regfile_out;
		end
	
		
		FIFO_WRITE :
		begin
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			wr_data_regfile='d0;
			rd_en=0;
			wr_en=0;
			Addr = 'd0;
			addr='d0;
			gate_en=0;
			
			if(!fifo_full)
			begin
				wr_data_fifo = fifo_wr_data_reg;
				wr_incr = 1;
			end
		end
		
	    OperandA : //second frame of the alu operation command
		begin
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			rd_en=0;
			wr_data_regfile='d0;
			Addr = 'd0;
			addr='d0;
			wr_en=0;
			gate_en=0;			
			if(sync_data_valid) //first operand recieved completely
			begin
				wr_data_regfile=sync_data;
				wr_en=1;
				Addr='d0;
			end
		end
		
	    OperandB : //third frame of the alu operation comman
		begin
		
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			rd_en=0;
			wr_data_regfile='d0;
			Addr = 'd0;
			addr='d0;
			wr_en=0;
			gate_en=0;			
			if(sync_data_valid) //second operand recieved completely
			begin
				wr_data_regfile=sync_data;
				Addr = 'd1;
				wr_en=1;
			end
		end
		
	    Alu_FUN : //fourth frame of the alu operation comman
		begin
			gate_en=1;		
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			rd_en=0;
			wr_data_regfile='d0;
			Addr = 'd0;
			addr='d0;
			wr_en=0;
		
			if(sync_data_valid) //funct recieved completely
			begin
				FUN = sync_data;
				alu_en=1;
			end
		end

		Alu_Rd_Data :
		begin
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			wr_data_regfile='d0;
			rd_en=0;
			wr_en=0;
			Addr = 'd0;
			addr='d0;
			gate_en=0;
			if(alu_out_valid) //alu result is ready
				fifo_wr_data = alu_out;
		end
		
		
		default :
		begin
			wr_data_fifo='d0;
			wr_incr=0;
			alu_en=0;
			FUN='d0;
			wr_data_regfile='d0;
			rd_en=0;
			wr_en=0;
			Addr='d0;
			addr='d0;
			gate_en=0;
		end
	 
	
	endcase

end


always@(posedge CLK or negedge RST)
begin

	if(!RST)
	begin
		addr_reg<='d0;
		fifo_wr_data_reg<='d0;
	end
	
	else
	begin
		addr_reg<=addr;
		fifo_wr_data_reg<=fifo_wr_data;
	end
end

endmodule

