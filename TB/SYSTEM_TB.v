
`timescale 1ns/1ps

module SYSTEM_TB();

/////////////////////////////////////////////////////////
///////////////////// Parameters ////////////////////////
/////////////////////////////////////////////////////////

parameter DW = 8 ;  
parameter REF_CLK_PERIOD = 20 ;          //50 MHz
parameter UART_CLK_PERIOD = 271.26 ;    //115.2*32 KHz
parameter DATA_SYNC_STAGES=2 ; 
parameter RST_SYNC_STAGES=2 ; 
parameter FUNCT_W=4;
parameter REG_FILE_ADDRW=3;
parameter REGFILE_DEPTH=8;

/////////////////////////////////////////////////////////
//////////////////// DUT Signals ////////////////////////
/////////////////////////////////////////////////////////

reg 	ref_clk,ref_rst,UART_CLK;
reg 	RX_IN;
wire    stp_err,par_err,TX_OUT;



////////////////////////////////////////////////////////
////////////////// initial block /////////////////////// 
////////////////////////////////////////////////////////

initial
 begin

 // Initialization
 initialize() ;

 // Reset
 reset() ; 

 
 ///////////////////////////////////////////////////////// 
 ////////////////   Configuration 1     //////////////////
 ////////////////   PRESCALE : 32       //////////////////
 ////////////////   Parity   : Enabled  //////////////////
 ////////////////   Type   	 : Even     ////////////////// 
 /////////////////////////////////////////////////////////
 
 $display( "************************************** Prescale=%d		Parity Enabled		par_type Even ************************************ " ,DUT.Prescale);
   
 //////****** REGFILE WRITE CMD //////******
 
	// FRAME0 
	DATA_IN(8'hAA);
	 
	// FRAME1 (write address) 
	DATA_IN(8'h06); 

	 // FRAME2 (write Data) 
	 DATA_IN(8'hff);
	 
	 @ (posedge DUT.rf.WrEn) //wait for the edge to write the data 
	 @ (negedge DUT.rf.WrEn) //check 
	 if(DUT.rf.mem[6]==8'hff)
		$display("write in regfile done");
	else
		$display("write in regfile failed , found %h and expected ff	at time %t",DUT.rf.mem[6],$time);
		
 
 //////****** REGFILE Read CMD //////******
 
	// FRAME0 
	DATA_IN(8'hBB);
	 
	// FRAME1 (Rd address) 
	DATA_IN(8'h06); 
	@ (posedge DUT.wr_incr) //for fifo write state
	@ (negedge DUT.wr_incr) //for fifo write state

	 if(DUT.fifo.mem.MEM[0]==8'hff)
		$display("Read CMD done & write in fifo done");
	else
		$display("write in fifo failed , found %h and expected ff	at time %t",DUT.fifo.mem.MEM[0],$time);
 

 //////****** ALU OP CMD //////******
 
	// FRAME0 
	DATA_IN(8'hCC);
	 
	// FRAME1 operand A 
	DATA_IN(8'h03); 
	
	// FRAME2 operand B 
	DATA_IN(8'h06);

	// FRAME3 FUN 
	DATA_IN(8'h02); //mul
	
	@ (posedge DUT.wr_incr) //for fifo write state
	@ (negedge DUT.wr_incr) //for fifo write state

	 if(DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]==8'd18)
		$display("ALU CMD DONE & write in fifo done (mul succeded)");
	else
		$display("write in fifo failed , found %d and expected 18",DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]);
 
 //////****** ALU OP CMD //////******
 
	// FRAME0 
	DATA_IN(8'hDD);

	// FRAME3 FUN 
	DATA_IN(8'h04); //and
	
	@ (posedge DUT.wr_incr) //for fifo write state
	@ (negedge DUT.wr_incr) //for fifo write statete

	 if(DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]==8'd2)
		$display("ALU CMD DONE & write in fifo done (and succeded)");
	else
		$display("write in fifo failed , found %d and expected 2",DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]);


 ///////////////////////////////////////////////////////// 
 ////////////////   Configuration 2     //////////////////
 ////////////////   PRESCALE : 32       //////////////////
 ////////////////   Parity   : Enabled  //////////////////
 ////////////////   Type   	 : ODD     ////////////////// 
 /////////////////////////////////////////////////////////
 
 DUT.rf.mem[2][1]=1'b1; //ODD Parity
 $display( "************************************** Prescale=%d		Parity Enabled		par_type ODD ************************************ " ,DUT.Prescale);
   
 //////****** REGFILE WRITE CMD //////******
 
	// FRAME0 
	DATA_IN(8'hAA);
	 
	// FRAME1 (write address) 
	DATA_IN(8'h07); 

	 // FRAME2 (write Data) 
	 DATA_IN(8'hff);
	 
	 @ (posedge DUT.rf.WrEn) //wait for the edge to write the data 
	 @ (negedge DUT.rf.WrEn) //check 
	 if(DUT.rf.mem[7]==8'hff)
		$display("write in regfile done");
	else
		$display("write in regfile failed , found %h and expected ff	at time %t",DUT.rf.mem[7],$time);
		
 
 //////****** REGFILE Read CMD //////******
 
	// FRAME0 
	DATA_IN(8'hBB);
	 
	// FRAME1 (Rd address) 
	DATA_IN(8'h07); 
	@ (posedge DUT.wr_incr) //for fifo write state
	@ (negedge DUT.wr_incr) //for fifo write state

	 if(DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]==8'hff)
		$display("Read CMD done & write in fifo done");
	else
		$display("write in fifo failed , found %h and expected ff	at time %t",DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1],$time);
 

 //////****** ALU OP CMD //////******
 
	// FRAME0 
	DATA_IN(8'hCC);
	 
	// FRAME1 operand A 
	DATA_IN(8'h0A); 
	
	// FRAME2 operand B 
	DATA_IN(8'h06);

	// FRAME3 FUN 
	DATA_IN(8'h01); //sub
	
	@ (posedge DUT.wr_incr) //for fifo write state
	@ (negedge DUT.wr_incr) //for fifo write state

	 if(DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]==8'd4)
		$display("ALU CMD DONE & write in fifo done (sub succeded)");
	else
		$display("write in fifo failed , found %d and expected 4",DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]);
 
 //////****** ALU OP CMD //////******
 
	// FRAME0 
	DATA_IN(8'hDD);

	// FRAME3 FUN 
	DATA_IN(8'h05); //or
	
	@ (posedge DUT.wr_incr) //for fifo write state
	@ (negedge DUT.wr_incr) //for fifo write statete

	 if(DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]==8'd14)
		$display("ALU CMD DONE & write in fifo done (or succeded)");
	else
		$display("write in fifo failed , found %d and expected 14",DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]);		
		
 ///////////////////////////////////////////////////////// 
 ////////////////   Configuration 3     //////////////////
 ////////////////   PRESCALE : 32       //////////////////
 ////////////////   Parity   : Disabled  //////////////////
 /////////////////////////////////////////////////////////
 
 DUT.rf.mem[2][0]=1'b0; //NO Parity
 $display( "************************************** Prescale=%d		Parity Disabled ************************************ " ,DUT.Prescale);
   
 //////****** REGFILE WRITE CMD //////******
 
	// FRAME0 
	DATA_IN(8'hAA);
	 
	// FRAME1 (write address) 
	DATA_IN(8'h05); 

	 // FRAME2 (write Data) 
	 DATA_IN(8'hff);
	 
	 @ (posedge DUT.rf.WrEn) //wait for the edge to write the data 
	 @ (negedge DUT.rf.WrEn) //check 
	 if(DUT.rf.mem[5]==8'hff)
		$display("write in regfile done");
	else
		$display("write in regfile failed , found %h and expected ff	at time %t",DUT.rf.mem[5],$time);
		
		
 ///////////////////////////////////////////////////////// 
 ////////////////   Configuration 4     //////////////////
 ////////////////   PRESCALE : 16       //////////////////
 ////////////////   Parity   : Enabled  //////////////////
 ////////////////   Type     : Even     //////////////////
 /////////////////////////////////////////////////////////
 
 DUT.rf.mem[2]=8'b010000_01; //Prescale par_type(even) par_en
 $display( "************************************** Prescale=%d		Parity Enabled		par_type Even ************************************ " ,DUT.Prescale);
   
 //////****** REGFILE WRITE CMD //////******
 
	// FRAME0 
	DATA_IN(8'hAA);
	 
	// FRAME1 (write address) 
	DATA_IN(8'h04); 

	 // FRAME2 (write Data) 
	 DATA_IN(8'hff);
	 
	 @ (posedge DUT.rf.WrEn) //wait for the edge to write the data 
	 @ (negedge DUT.rf.WrEn) //check 
	 if(DUT.rf.mem[4]==8'hff)
		$display("write in regfile done");
	else
		$display("write in regfile failed , found %h and expected ff	at time %t",DUT.rf.mem[4],$time);
		
		
		
 ///////////////////////////////////////////////////////// 
 ////////////////   Configuration 4     //////////////////
 ////////////////   PRESCALE : 16       //////////////////
 ////////////////   Parity   : Enabled  //////////////////
 ////////////////   Type     : ODD      //////////////////
 /////////////////////////////////////////////////////////
 
 DUT.rf.mem[2]=8'b010000_11; //Prescale par_type(odd) par_en
 $display( "************************************** Prescale=%d		Parity Enabled		par_type ODD ************************************ " ,DUT.Prescale);
   
 //////****** REGFILE WRITE CMD //////******
 
	// FRAME0 
	DATA_IN(8'hAA);
	 
	// FRAME1 (write address) 
	DATA_IN(8'h06); 

	 // FRAME2 (write Data) 
	 DATA_IN(8'h00);
	 
	 @ (posedge DUT.rf.WrEn) //wait for the edge to write the data 
	 @ (negedge DUT.rf.WrEn) //check 
	 if(DUT.rf.mem[6]==8'h00)
		$display("write in regfile done");
	else
		$display("write in regfile failed , found %h and expected 00	at time %t",DUT.rf.mem[6],$time);
		
		
 ///////////////////////////////////////////////////////// 
 ////////////////   Configuration 5     //////////////////
 ////////////////   PRESCALE : 16       //////////////////
 ////////////////   Parity   : Disabled //////////////////
 /////////////////////////////////////////////////////////
 
 DUT.rf.mem[2]=8'b010000_10; //Prescale par_type(odd) par_en
 $display( "************************************** Prescale=%d		Parity Disabled ************************************ " ,DUT.Prescale);
   
 //////****** ALU OP CMD //////******
 
	// FRAME0 
	DATA_IN(8'hCC);
	 
	// FRAME1 operand A 
	DATA_IN(8'h0A); 
	
	// FRAME2 operand B 
	DATA_IN(8'h06);

	// FRAME3 FUN 
	DATA_IN(8'h00); //add
	
	@ (posedge DUT.wr_incr) //for fifo write state
	@ (negedge DUT.wr_incr) //for fifo write state

	 if(DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]==8'd16)
		$display("ALU CMD DONE & write in fifo done (add succeded)");
	else
		$display("write in fifo failed , found %d and expected 16",DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]);
		
		
		
 ///////////////////////////////////////////////////////// 
 ////////////////   Configuration 6     //////////////////
 ////////////////   PRESCALE : 8        //////////////////
 ////////////////   Parity   : Enabled  //////////////////
 ////////////////   Type     : Even     //////////////////
 /////////////////////////////////////////////////////////
 
 DUT.rf.mem[2]=8'b001000_01; //Prescale par_type(EVEN) par_en
 #ref_clk
 
 $display( "************************************** Prescale=%d		Parity Enabled		par_type Even ************************************ " ,DUT.Prescale);
   
 //////****** ALU OP CMD //////******
 
	// FRAME0 
	DATA_IN(8'hCC);
	 
	// FRAME1 operand A 
	DATA_IN(8'h06); 
	
	// FRAME2 operand B 
	DATA_IN(8'h03);

	// FRAME3 FUN 
	DATA_IN(8'h03); //div
	
	@ (posedge DUT.wr_incr) //for fifo write state
	@ (negedge DUT.wr_incr) //for fifo write state

	 if(DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]==8'd2)
		$display("ALU CMD DONE & write in fifo done (div succeded)");
	else
		$display("write in fifo failed , found %d and expected 2",DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]);
		
		
 ///////////////////////////////////////////////////////// 
 ////////////////   Configuration 6     //////////////////
 ////////////////   PRESCALE : 8        //////////////////
 ////////////////   Parity   : Enabled  //////////////////
 ////////////////   Type     : ODD      //////////////////
 /////////////////////////////////////////////////////////
 
 DUT.rf.mem[2]=8'b001000_01; //Prescale par_type(ODD) par_en
 $display( "************************************** Prescale=%d		Parity Enabled		par_type ODD ************************************ " ,DUT.Prescale);
   
 //////****** ALU OP CMD //////******
 
	// FRAME0 
	DATA_IN(8'hCC);
	 
	// FRAME1 operand A 
	DATA_IN(8'h07); 
	
	// FRAME2 operand B 
	DATA_IN(8'h06);

	// FRAME3 FUN 
	DATA_IN(8'h06); //NAND
	
	@ (posedge DUT.wr_incr) //for fifo write state
	@ (negedge DUT.wr_incr) //for fifo write state

	 if(DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]==8'hf9)
		$display("ALU CMD DONE & write in fifo done (NAND succeded)");
	else
		$display("write in fifo failed , found %d and expected f9",DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]);
		
		
		
///////////////////////////////////////////////////////// 
 ////////////////   Configuration 7     //////////////////
 ////////////////   PRESCALE : 8        //////////////////
 ////////////////   Parity   : Disabled //////////////////
 /////////////////////////////////////////////////////////
 
 DUT.rf.mem[2]=8'b001000_00; //Prescale par_type(ODD) par_en
 $display( "************************************** Prescale=%d		Parity Disabled ************************************ " ,DUT.Prescale);
   
 //////****** ALU OP CMD //////******
 
	// FRAME0 
	DATA_IN(8'hCC);
	 
	// FRAME1 operand A 
	DATA_IN(8'h07); 
	
	// FRAME2 operand B 
	DATA_IN(8'h06);

	// FRAME3 FUN 
	DATA_IN(8'h07); //NOR
	
	@ (posedge DUT.wr_incr) //for fifo write state
	@ (negedge DUT.wr_incr) //for fifo write state

	 if(DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]==8'hf8)
		$display("ALU CMD DONE & write in fifo done (NOR succeded)");
	else
		$display("write in fifo failed , found %d and expected f8",DUT.fifo.mem.MEM[DUT.fifo.wr.WR_ADDR-1]);
		
	#4000

	$stop;

end
 
///////////////////// Clock Generator //////////////////

always #(UART_CLK_PERIOD/2) UART_CLK = ~UART_CLK ;

always #(REF_CLK_PERIOD/2) ref_clk = ~ref_clk ;

////////////////////////////////////////////////////////
/////////////////////// TASKS //////////////////////////
////////////////////////////////////////////////////////

/////////////// Signals Initialization //////////////////

task initialize ;
  begin
		ref_clk		=1'b0;
		ref_rst		=1'b1;
		UART_CLK	=1'b0;
		RX_IN		=1'b1;  //default
  end
endtask

///////////////////////// RESET /////////////////////////
task reset ;
  begin
	#(UART_CLK_PERIOD)
	ref_rst  = 1'b0;           // rst is activated
	#(UART_CLK_PERIOD)
	ref_rst  = 1'b1;
	#(UART_CLK_PERIOD) ;
  end
endtask

///////////////////// Configuration ////////////////////
/*task UART_CONFG ;
  input                   PAR_EN ;
  input                   PAR_TYP ;
  input    [5:0]          PRESCALE;

  begin
	parity_enable_TB  = PAR_EN   ;
	parity_type_TB    = PAR_TYP  ;
	Prescale_TB       = PRESCALE ;    	
  end
endtask*/

/////////////////////// Data IN /////////////////////////
task DATA_IN ;
 input  [DW-1:0]  DATA ;

 integer   i  ;
 
 begin
	
	@(posedge DUT.TX_clk)  
	RX_IN <= 1'b0 ;              // start_bit

	for(i=0; i<8; i=i+1)
		begin
		@ (posedge DUT.TX_clk) 		
		RX_IN <= DATA[i] ;       // data bits
		end 

	if(DUT.rf.REG2[0]) //IF PARITY ENABLED
		begin
			@ (posedge DUT.TX_clk) 
			case(DUT.rf.REG2[1]) //parity type
			1'b0 : RX_IN <= ^DATA  ;     // Even Parity
			1'b1 : RX_IN <= ~^DATA ;     // Odd Parity
			endcase	
		end
	
	@ (posedge DUT.TX_clk) 
	RX_IN <= 1'b1 ;              // stop_bit
	
 end
endtask


//////////////////  Check Output  ////////////////////
/*task chk_rx_out ;
 input  [DATA_WIDTH-1:0]  		expec_out    ;
 input  [4:0]                   Test_NUM;
  
 begin
 
	@(posedge data_valid_TB)	
	if(P_DATA_TB == expec_out) 
		begin
			$display("Test Case %d is succeeded",Test_NUM,);
		end
	else
		begin
			$display("Test Case %d is failed", Test_NUM);
		end
 end
endtask*/
 
//////////////////////////////////////////////////////// 
///////////////// Design Instaniation //////////////////
////////////////////////////////////////////////////////

TOP #(
			.DW(DW) , 
			.DATA_SYNC_STAGES(DATA_SYNC_STAGES) , 
			.RST_SYNC_STAGES(RST_SYNC_STAGES) , 
			.FUNCT_W(FUNCT_W),
			.REG_FILE_ADDRW(REG_FILE_ADDRW),
			.REGFILE_DEPTH(REGFILE_DEPTH) )
			
DUT(

			.ref_clk(ref_clk),
			.ref_rst(ref_rst),
			.UART_CLK(UART_CLK),
			.RX_IN(RX_IN),
			
			.stp_err(stp_err),
			.par_err(par_err),
			.TX_OUT(TX_OUT)
);

endmodule