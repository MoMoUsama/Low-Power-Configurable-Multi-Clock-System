/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 16 06:40:05 2024
/////////////////////////////////////////////////////////////


module SYS_CNTRL_DW8_FUN_W4_REGFILE_ADDR_W4 ( CLK, RST, sync_data, 
        sync_data_valid, fifo_full, alu_out, alu_out_valid, regfile_out, 
        regfile_out_valid, wr_data_fifo, wr_incr, alu_en, FUN, wr_data_regfile, 
        rd_en, wr_en, Addr, gate_en );
  input [7:0] sync_data;
  input [7:0] alu_out;
  input [7:0] regfile_out;
  output [7:0] wr_data_fifo;
  output [3:0] FUN;
  output [7:0] wr_data_regfile;
  output [3:0] Addr;
  input CLK, RST, sync_data_valid, fifo_full, alu_out_valid, regfile_out_valid;
  output wr_incr, alu_en, rd_en, wr_en, gate_en;
  wire   n50, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n2, n3, n4, n5, n6,
         n7, n9, n10, n11, n49;
  wire   [3:0] cur_state;
  wire   [3:0] nxt_state;
  wire   [3:0] addr;
  wire   [7:0] fifo_wr_data;
  wire   [3:0] addr_reg;
  wire   [7:0] fifo_wr_data_reg;

  DFFRQX2M \addr_reg_reg[3]  ( .D(addr[3]), .CK(CLK), .RN(RST), .Q(addr_reg[3]) );
  DFFRQX2M \addr_reg_reg[2]  ( .D(addr[2]), .CK(CLK), .RN(RST), .Q(addr_reg[2]) );
  DFFRQX2M \addr_reg_reg[1]  ( .D(addr[1]), .CK(CLK), .RN(RST), .Q(addr_reg[1]) );
  DFFRQX2M \fifo_wr_data_reg_reg[7]  ( .D(fifo_wr_data[7]), .CK(CLK), .RN(RST), 
        .Q(fifo_wr_data_reg[7]) );
  DFFRQX2M \fifo_wr_data_reg_reg[6]  ( .D(fifo_wr_data[6]), .CK(CLK), .RN(RST), 
        .Q(fifo_wr_data_reg[6]) );
  DFFRQX2M \fifo_wr_data_reg_reg[5]  ( .D(fifo_wr_data[5]), .CK(CLK), .RN(RST), 
        .Q(fifo_wr_data_reg[5]) );
  DFFRQX2M \fifo_wr_data_reg_reg[4]  ( .D(fifo_wr_data[4]), .CK(CLK), .RN(RST), 
        .Q(fifo_wr_data_reg[4]) );
  DFFRQX2M \fifo_wr_data_reg_reg[3]  ( .D(fifo_wr_data[3]), .CK(CLK), .RN(RST), 
        .Q(fifo_wr_data_reg[3]) );
  DFFRQX2M \fifo_wr_data_reg_reg[2]  ( .D(fifo_wr_data[2]), .CK(CLK), .RN(RST), 
        .Q(fifo_wr_data_reg[2]) );
  DFFRQX2M \fifo_wr_data_reg_reg[1]  ( .D(fifo_wr_data[1]), .CK(CLK), .RN(RST), 
        .Q(fifo_wr_data_reg[1]) );
  DFFRQX2M \fifo_wr_data_reg_reg[0]  ( .D(fifo_wr_data[0]), .CK(CLK), .RN(RST), 
        .Q(fifo_wr_data_reg[0]) );
  DFFRQX2M \addr_reg_reg[0]  ( .D(addr[0]), .CK(CLK), .RN(RST), .Q(addr_reg[0]) );
  DFFRQX2M \cur_state_reg[0]  ( .D(nxt_state[0]), .CK(CLK), .RN(RST), .Q(
        cur_state[0]) );
  DFFRQX2M \cur_state_reg[2]  ( .D(nxt_state[2]), .CK(CLK), .RN(RST), .Q(
        cur_state[2]) );
  DFFRQX2M \cur_state_reg[3]  ( .D(nxt_state[3]), .CK(CLK), .RN(RST), .Q(
        cur_state[3]) );
  DFFRQX2M \cur_state_reg[1]  ( .D(nxt_state[1]), .CK(CLK), .RN(RST), .Q(
        cur_state[1]) );
  OAI2BB2X4M U3 ( .B0(n15), .B1(n21), .A0N(addr_reg[1]), .A1N(n47), .Y(Addr[1]) );
  NOR2X2M U4 ( .A(n14), .B(n45), .Y(FUN[2]) );
  OAI21X2M U5 ( .A0(n16), .A1(n21), .B0(n48), .Y(Addr[0]) );
  OAI2BB2X1M U6 ( .B0(n14), .B1(n21), .A0N(addr_reg[2]), .A1N(n47), .Y(Addr[2]) );
  NOR2X2M U7 ( .A(n16), .B(n45), .Y(FUN[0]) );
  NOR2X2M U8 ( .A(n7), .B(n21), .Y(rd_en) );
  AND3X2M U9 ( .A(n17), .B(n18), .C(n19), .Y(n12) );
  NOR2X2M U10 ( .A(n15), .B(n45), .Y(FUN[1]) );
  NOR2X2M U11 ( .A(n7), .B(n12), .Y(wr_en) );
  NOR2X2M U12 ( .A(n17), .B(n7), .Y(n47) );
  NOR2X2M U13 ( .A(n12), .B(n16), .Y(wr_data_regfile[0]) );
  NOR2X2M U14 ( .A(n12), .B(n15), .Y(wr_data_regfile[1]) );
  NOR2X2M U15 ( .A(n12), .B(n14), .Y(wr_data_regfile[2]) );
  NOR2X2M U16 ( .A(n12), .B(n13), .Y(wr_data_regfile[3]) );
  NAND3X2M U17 ( .A(n9), .B(n49), .C(n32), .Y(n17) );
  NAND4X2M U18 ( .A(n29), .B(n4), .C(n30), .D(n31), .Y(nxt_state[1]) );
  OAI21X2M U19 ( .A0(n32), .A1(gate_en), .B0(n7), .Y(n30) );
  BUFX2M U20 ( .A(n50), .Y(wr_incr) );
  NOR2BX2M U21 ( .AN(n20), .B(fifo_full), .Y(n50) );
  NOR2X2M U22 ( .A(n13), .B(n45), .Y(FUN[3]) );
  INVX2M U23 ( .A(n18), .Y(n10) );
  NAND2X2M U24 ( .A(n46), .B(n32), .Y(n31) );
  NOR2X2M U25 ( .A(n7), .B(n45), .Y(alu_en) );
  INVX2M U26 ( .A(n45), .Y(gate_en) );
  NOR2X2M U27 ( .A(n16), .B(n31), .Y(addr[0]) );
  NOR2X2M U28 ( .A(n15), .B(n31), .Y(addr[1]) );
  NOR2X2M U29 ( .A(n14), .B(n31), .Y(addr[2]) );
  NOR2X2M U30 ( .A(n13), .B(n31), .Y(addr[3]) );
  INVX2M U31 ( .A(n35), .Y(n3) );
  AOI22X1M U32 ( .A0(addr_reg[0]), .A1(n47), .B0(n10), .B1(sync_data_valid), 
        .Y(n48) );
  NOR2X2M U33 ( .A(n11), .B(cur_state[3]), .Y(n32) );
  NAND3X2M U34 ( .A(cur_state[2]), .B(n9), .C(n32), .Y(n21) );
  INVX2M U35 ( .A(cur_state[1]), .Y(n11) );
  OAI2BB2X1M U36 ( .B0(n13), .B1(n21), .A0N(addr_reg[3]), .A1N(n47), .Y(
        Addr[3]) );
  NAND3X2M U37 ( .A(cur_state[3]), .B(cur_state[1]), .C(n46), .Y(n45) );
  NOR2X2M U38 ( .A(n9), .B(cur_state[2]), .Y(n46) );
  NAND4BX1M U39 ( .AN(n13), .B(sync_data[7]), .C(n9), .D(n41), .Y(n35) );
  NOR3X2M U40 ( .A(cur_state[1]), .B(cur_state[3]), .C(cur_state[2]), .Y(n41)
         );
  NOR3X2M U41 ( .A(cur_state[1]), .B(cur_state[3]), .C(n49), .Y(n43) );
  NAND4X2M U42 ( .A(cur_state[3]), .B(cur_state[1]), .C(cur_state[0]), .D(
        cur_state[2]), .Y(n18) );
  NAND2X2M U43 ( .A(sync_data[3]), .B(sync_data_valid), .Y(n13) );
  NAND2X2M U44 ( .A(sync_data[1]), .B(sync_data_valid), .Y(n15) );
  NAND2X2M U45 ( .A(sync_data[2]), .B(sync_data_valid), .Y(n14) );
  NAND2X2M U46 ( .A(sync_data[0]), .B(sync_data_valid), .Y(n16) );
  OAI211X2M U47 ( .A0(sync_data_valid), .A1(n18), .B0(n4), .C0(n25), .Y(
        nxt_state[2]) );
  AOI211X2M U48 ( .A0(n26), .A1(n3), .B0(n27), .C0(n28), .Y(n25) );
  AOI211X2M U49 ( .A0(cur_state[0]), .A1(n2), .B0(n49), .C0(cur_state[3]), .Y(
        n28) );
  INVX2M U50 ( .A(fifo_full), .Y(n2) );
  INVX2M U51 ( .A(sync_data_valid), .Y(n7) );
  AND2X2M U52 ( .A(fifo_wr_data_reg[0]), .B(wr_incr), .Y(wr_data_fifo[0]) );
  AND2X2M U53 ( .A(fifo_wr_data_reg[1]), .B(wr_incr), .Y(wr_data_fifo[1]) );
  AND2X2M U54 ( .A(fifo_wr_data_reg[2]), .B(wr_incr), .Y(wr_data_fifo[2]) );
  AND2X2M U55 ( .A(fifo_wr_data_reg[3]), .B(wr_incr), .Y(wr_data_fifo[3]) );
  AND2X2M U56 ( .A(fifo_wr_data_reg[4]), .B(wr_incr), .Y(wr_data_fifo[4]) );
  AND2X2M U57 ( .A(fifo_wr_data_reg[5]), .B(wr_incr), .Y(wr_data_fifo[5]) );
  AND2X2M U58 ( .A(fifo_wr_data_reg[6]), .B(wr_incr), .Y(wr_data_fifo[6]) );
  AND2X2M U59 ( .A(fifo_wr_data_reg[7]), .B(wr_incr), .Y(wr_data_fifo[7]) );
  AND2X2M U60 ( .A(wr_en), .B(sync_data[4]), .Y(wr_data_regfile[4]) );
  AND2X2M U61 ( .A(wr_en), .B(sync_data[5]), .Y(wr_data_regfile[5]) );
  AND2X2M U62 ( .A(wr_en), .B(sync_data[6]), .Y(wr_data_regfile[6]) );
  AND2X2M U63 ( .A(sync_data[7]), .B(wr_en), .Y(wr_data_regfile[7]) );
  INVX2M U64 ( .A(n33), .Y(n4) );
  OAI31X1M U65 ( .A0(n34), .A1(n35), .A2(n36), .B0(n19), .Y(n33) );
  NAND2X2M U66 ( .A(sync_data[0]), .B(sync_data[4]), .Y(n34) );
  NAND3X2M U67 ( .A(cur_state[0]), .B(cur_state[2]), .C(n32), .Y(n19) );
  INVX2M U68 ( .A(cur_state[0]), .Y(n9) );
  INVX2M U69 ( .A(cur_state[2]), .Y(n49) );
  AND2X2M U70 ( .A(n43), .B(cur_state[0]), .Y(n20) );
  NOR3BX2M U71 ( .AN(n42), .B(sync_data[0]), .C(sync_data[4]), .Y(n26) );
  NOR2BX2M U72 ( .AN(alu_out_valid), .B(n22), .Y(n27) );
  OAI221X1M U73 ( .A0(alu_out_valid), .A1(n22), .B0(n7), .B1(n19), .C0(n23), 
        .Y(nxt_state[3]) );
  AOI211X2M U74 ( .A0(n3), .A1(n24), .B0(n10), .C0(gate_en), .Y(n23) );
  NOR4X1M U75 ( .A(n6), .B(n5), .C(sync_data[1]), .D(sync_data[5]), .Y(n42) );
  NAND4X2M U76 ( .A(sync_data[1]), .B(sync_data[5]), .C(n6), .D(n5), .Y(n36)
         );
  NAND3X2M U77 ( .A(cur_state[3]), .B(n11), .C(n46), .Y(n22) );
  AND3X2M U78 ( .A(n43), .B(n9), .C(regfile_out_valid), .Y(n44) );
  INVX2M U79 ( .A(sync_data[2]), .Y(n6) );
  INVX2M U80 ( .A(sync_data[6]), .Y(n5) );
  NAND3BX2M U81 ( .AN(n37), .B(n38), .C(n29), .Y(nxt_state[0]) );
  NAND4BX1M U82 ( .AN(n44), .B(n19), .C(n45), .D(n22), .Y(n37) );
  AOI2BB2XLM U83 ( .B0(fifo_full), .B1(n20), .A0N(n31), .A1N(sync_data_valid), 
        .Y(n38) );
  AND3X2M U84 ( .A(sync_data[0]), .B(sync_data[4]), .C(n42), .Y(n24) );
  AND2X2M U85 ( .A(n39), .B(n18), .Y(n29) );
  OAI31X1M U86 ( .A0(n40), .A1(n24), .A2(n26), .B0(n3), .Y(n39) );
  NOR3X2M U87 ( .A(n36), .B(sync_data[4]), .C(sync_data[0]), .Y(n40) );
  AO22X1M U88 ( .A0(alu_out[0]), .A1(n27), .B0(regfile_out[0]), .B1(n44), .Y(
        fifo_wr_data[0]) );
  AO22X1M U89 ( .A0(alu_out[1]), .A1(n27), .B0(regfile_out[1]), .B1(n44), .Y(
        fifo_wr_data[1]) );
  AO22X1M U90 ( .A0(alu_out[2]), .A1(n27), .B0(regfile_out[2]), .B1(n44), .Y(
        fifo_wr_data[2]) );
  AO22X1M U91 ( .A0(alu_out[3]), .A1(n27), .B0(regfile_out[3]), .B1(n44), .Y(
        fifo_wr_data[3]) );
  AO22X1M U92 ( .A0(alu_out[4]), .A1(n27), .B0(regfile_out[4]), .B1(n44), .Y(
        fifo_wr_data[4]) );
  AO22X1M U93 ( .A0(alu_out[5]), .A1(n27), .B0(regfile_out[5]), .B1(n44), .Y(
        fifo_wr_data[5]) );
  AO22X1M U94 ( .A0(alu_out[6]), .A1(n27), .B0(regfile_out[6]), .B1(n44), .Y(
        fifo_wr_data[6]) );
  AO22X1M U95 ( .A0(alu_out[7]), .A1(n27), .B0(regfile_out[7]), .B1(n44), .Y(
        fifo_wr_data[7]) );
endmodule


module Parity_Calc ( PARALLEL_DATA, Parity_Type, RST, CLK, DATA_VALID, BUSY, 
        Parity_bit );
  input [7:0] PARALLEL_DATA;
  input Parity_Type, RST, CLK, DATA_VALID, BUSY;
  output Parity_bit;
  wire   n1, n2, n3, n4;

  XNOR2X2M U3 ( .A(PARALLEL_DATA[7]), .B(PARALLEL_DATA[6]), .Y(n4) );
  XOR3XLM U4 ( .A(Parity_Type), .B(n1), .C(n2), .Y(Parity_bit) );
  XOR3XLM U5 ( .A(PARALLEL_DATA[1]), .B(PARALLEL_DATA[0]), .C(n3), .Y(n2) );
  XOR3XLM U6 ( .A(PARALLEL_DATA[5]), .B(PARALLEL_DATA[4]), .C(n4), .Y(n1) );
  XNOR2X2M U7 ( .A(PARALLEL_DATA[3]), .B(PARALLEL_DATA[2]), .Y(n3) );
endmodule


module TX_FSM ( CLK, RST, SER_DONE, Parity_EN, DATA_VALID, SER_EN, BUSY, 
        MUX_SELECT );
  output [1:0] MUX_SELECT;
  input CLK, RST, SER_DONE, Parity_EN, DATA_VALID;
  output SER_EN, BUSY;
  wire   n6, n7, n8, n9, n1, n2, n3, n4, n5;
  wire   [2:0] cur_state;
  wire   [2:0] nxt_state;

  DFFRQX2M \cur_state_reg[2]  ( .D(nxt_state[2]), .CK(CLK), .RN(RST), .Q(
        cur_state[2]) );
  DFFRQX2M \cur_state_reg[1]  ( .D(nxt_state[1]), .CK(CLK), .RN(RST), .Q(
        cur_state[1]) );
  DFFRQX2M \cur_state_reg[0]  ( .D(nxt_state[0]), .CK(CLK), .RN(RST), .Q(
        cur_state[0]) );
  OAI211X2M U3 ( .A0(SER_DONE), .A1(n6), .B0(n8), .C0(n9), .Y(nxt_state[0]) );
  NAND3X2M U4 ( .A(n5), .B(n4), .C(DATA_VALID), .Y(n8) );
  NOR2X2M U5 ( .A(SER_DONE), .B(n6), .Y(SER_EN) );
  NAND2X2M U6 ( .A(n6), .B(n7), .Y(MUX_SELECT[1]) );
  OAI211X2M U7 ( .A0(cur_state[0]), .A1(n5), .B0(n9), .C0(n2), .Y(BUSY) );
  INVX2M U8 ( .A(MUX_SELECT[1]), .Y(n2) );
  NAND3X2M U9 ( .A(cur_state[0]), .B(n4), .C(cur_state[1]), .Y(n6) );
  INVX2M U10 ( .A(cur_state[2]), .Y(n4) );
  NAND3X2M U11 ( .A(n3), .B(n4), .C(cur_state[1]), .Y(n7) );
  NAND3X2M U12 ( .A(n5), .B(n4), .C(cur_state[0]), .Y(n9) );
  INVX2M U13 ( .A(cur_state[1]), .Y(n5) );
  INVX2M U14 ( .A(cur_state[0]), .Y(n3) );
  OAI31X1M U15 ( .A0(n1), .A1(Parity_EN), .A2(n6), .B0(n7), .Y(nxt_state[2])
         );
  INVX2M U16 ( .A(SER_DONE), .Y(n1) );
  NAND2X2M U17 ( .A(cur_state[0]), .B(n4), .Y(MUX_SELECT[0]) );
  AOI21X2M U18 ( .A0(n3), .A1(n5), .B0(cur_state[2]), .Y(nxt_state[1]) );
endmodule


module Serializer ( PARALLEL_DATA, SER_EN, DATA_VALID, CLK, RST, BUSY, 
        SER_DONE, SER_OUT );
  input [7:0] PARALLEL_DATA;
  input SER_EN, DATA_VALID, CLK, RST, BUSY;
  output SER_DONE, SER_OUT;
  wire   N23, N24, N25, N27, n1, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n2, n3, n4;
  wire   [7:1] data;
  wire   [2:0] counter;
  assign SER_DONE = N27;

  DFFRQX2M \data_reg[6]  ( .D(n20), .CK(CLK), .RN(RST), .Q(data[6]) );
  DFFRQX2M \data_reg[5]  ( .D(n21), .CK(CLK), .RN(RST), .Q(data[5]) );
  DFFRQX2M \data_reg[4]  ( .D(n22), .CK(CLK), .RN(RST), .Q(data[4]) );
  DFFRQX2M \data_reg[3]  ( .D(n23), .CK(CLK), .RN(RST), .Q(data[3]) );
  DFFRQX2M \data_reg[2]  ( .D(n24), .CK(CLK), .RN(RST), .Q(data[2]) );
  DFFRQX2M \data_reg[1]  ( .D(n25), .CK(CLK), .RN(RST), .Q(data[1]) );
  DFFRQX2M \data_reg[0]  ( .D(n18), .CK(CLK), .RN(RST), .Q(SER_OUT) );
  DFFRQX2M \data_reg[7]  ( .D(n19), .CK(CLK), .RN(RST), .Q(data[7]) );
  DFFRQX2M \counter_reg[1]  ( .D(N24), .CK(CLK), .RN(RST), .Q(counter[1]) );
  DFFRQX2M \counter_reg[0]  ( .D(N23), .CK(CLK), .RN(RST), .Q(counter[0]) );
  DFFRX1M \counter_reg[2]  ( .D(N25), .CK(CLK), .RN(RST), .QN(n1) );
  NOR2X2M U3 ( .A(n2), .B(n8), .Y(n7) );
  NOR2X2M U4 ( .A(n8), .B(n7), .Y(n5) );
  INVX2M U5 ( .A(SER_EN), .Y(n2) );
  NOR2BX2M U6 ( .AN(DATA_VALID), .B(BUSY), .Y(n8) );
  OAI2BB1X2M U7 ( .A0N(SER_OUT), .A1N(n5), .B0(n6), .Y(n18) );
  AOI22X1M U8 ( .A0(data[1]), .A1(n7), .B0(PARALLEL_DATA[0]), .B1(n8), .Y(n6)
         );
  OAI2BB1X2M U9 ( .A0N(data[1]), .A1N(n5), .B0(n14), .Y(n25) );
  AOI22X1M U10 ( .A0(data[2]), .A1(n7), .B0(PARALLEL_DATA[1]), .B1(n8), .Y(n14) );
  OAI2BB1X2M U11 ( .A0N(n5), .A1N(data[2]), .B0(n13), .Y(n24) );
  AOI22X1M U12 ( .A0(data[3]), .A1(n7), .B0(PARALLEL_DATA[2]), .B1(n8), .Y(n13) );
  OAI2BB1X2M U13 ( .A0N(n5), .A1N(data[3]), .B0(n12), .Y(n23) );
  AOI22X1M U14 ( .A0(data[4]), .A1(n7), .B0(PARALLEL_DATA[3]), .B1(n8), .Y(n12) );
  OAI2BB1X2M U15 ( .A0N(n5), .A1N(data[4]), .B0(n11), .Y(n22) );
  AOI22X1M U16 ( .A0(data[5]), .A1(n7), .B0(PARALLEL_DATA[4]), .B1(n8), .Y(n11) );
  OAI2BB1X2M U17 ( .A0N(n5), .A1N(data[5]), .B0(n10), .Y(n21) );
  AOI22X1M U18 ( .A0(data[6]), .A1(n7), .B0(PARALLEL_DATA[5]), .B1(n8), .Y(n10) );
  OAI2BB1X2M U19 ( .A0N(n5), .A1N(data[6]), .B0(n9), .Y(n20) );
  AOI22X1M U20 ( .A0(data[7]), .A1(n7), .B0(PARALLEL_DATA[6]), .B1(n8), .Y(n9)
         );
  AO22X1M U21 ( .A0(n5), .A1(data[7]), .B0(PARALLEL_DATA[7]), .B1(n8), .Y(n19)
         );
  NOR3X2M U22 ( .A(n1), .B(n3), .C(n4), .Y(N27) );
  OAI32X1M U23 ( .A0(n15), .A1(n3), .A2(n4), .B0(n16), .B1(n1), .Y(N25) );
  NAND2X2M U24 ( .A(SER_EN), .B(n1), .Y(n15) );
  AOI21X2M U25 ( .A0(SER_EN), .A1(n4), .B0(N23), .Y(n16) );
  NOR2X2M U26 ( .A(n2), .B(counter[0]), .Y(N23) );
  INVX2M U27 ( .A(counter[1]), .Y(n4) );
  INVX2M U28 ( .A(counter[0]), .Y(n3) );
  NOR2X2M U29 ( .A(n17), .B(n2), .Y(N24) );
  XNOR2X2M U30 ( .A(counter[0]), .B(counter[1]), .Y(n17) );
endmodule


module MUX ( IN0, IN1, IN2, IN3, CLK, RST, SELECT, OUT );
  input [1:0] SELECT;
  input IN0, IN1, IN2, IN3, CLK, RST;
  output OUT;
  wire   mux_out, n2, n3, n1;

  DFFRQX2M OUT_reg ( .D(mux_out), .CK(CLK), .RN(RST), .Q(OUT) );
  OAI2B2X1M U3 ( .A1N(SELECT[1]), .A0(n2), .B0(SELECT[1]), .B1(n3), .Y(mux_out) );
  AOI22X1M U4 ( .A0(IN0), .A1(n1), .B0(SELECT[0]), .B1(IN1), .Y(n3) );
  AOI22X1M U5 ( .A0(IN2), .A1(n1), .B0(IN3), .B1(SELECT[0]), .Y(n2) );
  INVX2M U6 ( .A(SELECT[0]), .Y(n1) );
endmodule


module UART_TX ( CLK_TOP, RST_TOP, PARALLEL_DATA_TOP, PARITY_TYPE_TOP, 
        PARITY_EN_TOP, DATA_VALID_TOP, SER_OUT_TOP, BUSY_TOP );
  input [7:0] PARALLEL_DATA_TOP;
  input CLK_TOP, RST_TOP, PARITY_TYPE_TOP, PARITY_EN_TOP, DATA_VALID_TOP;
  output SER_OUT_TOP, BUSY_TOP;
  wire   parity_bit, ser_done, ser_en, serial_data;
  wire   [1:0] selection_lines;

  Parity_Calc parity_calc ( .PARALLEL_DATA(PARALLEL_DATA_TOP), .Parity_Type(
        PARITY_TYPE_TOP), .RST(RST_TOP), .CLK(CLK_TOP), .DATA_VALID(
        DATA_VALID_TOP), .BUSY(BUSY_TOP), .Parity_bit(parity_bit) );
  TX_FSM FSM_TOP ( .CLK(CLK_TOP), .RST(RST_TOP), .SER_DONE(ser_done), 
        .Parity_EN(PARITY_EN_TOP), .DATA_VALID(DATA_VALID_TOP), .SER_EN(ser_en), .BUSY(BUSY_TOP), .MUX_SELECT(selection_lines) );
  Serializer Serializer_TOP ( .PARALLEL_DATA(PARALLEL_DATA_TOP), .SER_EN(
        ser_en), .DATA_VALID(DATA_VALID_TOP), .CLK(CLK_TOP), .RST(RST_TOP), 
        .BUSY(BUSY_TOP), .SER_DONE(ser_done), .SER_OUT(serial_data) );
  MUX MUX_TOP ( .IN0(1'b0), .IN1(1'b1), .IN2(serial_data), .IN3(parity_bit), 
        .CLK(CLK_TOP), .RST(RST_TOP), .SELECT(selection_lines), .OUT(
        SER_OUT_TOP) );
endmodule


module RX_FSM ( S_DATA, CLK, RST, START_GLSH, PAR_ERR, STP_ERR, BIT_CNT, 
        BIT_AVAILABLE, PAR_EN, DATA_VALID, STR_CHK_EN, STP_CHK_EN, PRT_CHK_EN, 
        DSER_EN, DAT_SAMPL_EN, COUNTER_EN );
  input [3:0] BIT_CNT;
  input S_DATA, CLK, RST, START_GLSH, PAR_ERR, STP_ERR, BIT_AVAILABLE, PAR_EN;
  output DATA_VALID, STR_CHK_EN, STP_CHK_EN, PRT_CHK_EN, DSER_EN, DAT_SAMPL_EN,
         COUNTER_EN;
  wire   DAT_SAMPL_EN, Data_VALID_REGISTER, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n1, n2, n4, n5;
  wire   [2:0] curr_state;
  wire   [2:0] nxt_state;
  assign COUNTER_EN = DAT_SAMPL_EN;

  DFFRQX2M \curr_state_reg[0]  ( .D(nxt_state[0]), .CK(CLK), .RN(RST), .Q(
        curr_state[0]) );
  DFFRQX2M \curr_state_reg[1]  ( .D(nxt_state[1]), .CK(CLK), .RN(RST), .Q(
        curr_state[1]) );
  DFFRQX2M \curr_state_reg[2]  ( .D(nxt_state[2]), .CK(CLK), .RN(RST), .Q(
        curr_state[2]) );
  DFFRQX2M DATA_VALID_reg ( .D(Data_VALID_REGISTER), .CK(CLK), .RN(RST), .Q(
        DATA_VALID) );
  INVX2M U3 ( .A(n14), .Y(DSER_EN) );
  NOR2X2M U4 ( .A(n4), .B(n9), .Y(STP_CHK_EN) );
  NOR3X2M U5 ( .A(n5), .B(curr_state[2]), .C(n9), .Y(PRT_CHK_EN) );
  OAI21X2M U6 ( .A0(curr_state[2]), .A1(n16), .B0(n9), .Y(DAT_SAMPL_EN) );
  OAI22X1M U7 ( .A0(BIT_AVAILABLE), .A1(n9), .B0(curr_state[2]), .B1(n12), .Y(
        nxt_state[1]) );
  AOI31X2M U8 ( .A0(curr_state[0]), .A1(n1), .A2(BIT_AVAILABLE), .B0(
        curr_state[1]), .Y(n12) );
  INVX2M U9 ( .A(START_GLSH), .Y(n1) );
  NOR3X2M U10 ( .A(n16), .B(curr_state[2]), .C(curr_state[1]), .Y(STR_CHK_EN)
         );
  OAI32X1M U11 ( .A0(n13), .A1(curr_state[2]), .A2(curr_state[1]), .B0(n11), 
        .B1(n14), .Y(nxt_state[0]) );
  AOI2BB2XLM U12 ( .B0(curr_state[0]), .B1(n15), .A0N(S_DATA), .A1N(
        curr_state[0]), .Y(n13) );
  NAND2X2M U13 ( .A(START_GLSH), .B(BIT_AVAILABLE), .Y(n15) );
  AND2X2M U14 ( .A(S_DATA), .B(n2), .Y(n16) );
  NAND2X2M U15 ( .A(curr_state[1]), .B(n2), .Y(n9) );
  INVX2M U16 ( .A(curr_state[2]), .Y(n4) );
  NAND3X2M U17 ( .A(curr_state[1]), .B(n4), .C(curr_state[0]), .Y(n14) );
  INVX2M U18 ( .A(curr_state[0]), .Y(n2) );
  NOR4BBX1M U19 ( .AN(BIT_CNT[0]), .BN(BIT_CNT[3]), .C(BIT_CNT[1]), .D(
        BIT_CNT[2]), .Y(n11) );
  NOR4X1M U20 ( .A(STP_ERR), .B(n17), .C(PAR_ERR), .D(n4), .Y(
        Data_VALID_REGISTER) );
  OR2X2M U21 ( .A(curr_state[1]), .B(curr_state[0]), .Y(n17) );
  NOR3X2M U22 ( .A(BIT_CNT[0]), .B(curr_state[2]), .C(BIT_CNT[2]), .Y(n10) );
  NAND3X2M U23 ( .A(n6), .B(n7), .C(n8), .Y(nxt_state[2]) );
  OAI2BB1X2M U24 ( .A0N(BIT_AVAILABLE), .A1N(STP_ERR), .B0(STP_CHK_EN), .Y(n8)
         );
  NAND4BX1M U25 ( .AN(n9), .B(BIT_CNT[1]), .C(BIT_CNT[3]), .D(n10), .Y(n7) );
  NAND3X2M U26 ( .A(n11), .B(n5), .C(DSER_EN), .Y(n6) );
  INVX2M U27 ( .A(PAR_EN), .Y(n5) );
endmodule


module Parity_Check_DW8 ( CLK, RST, Parity_Type, Parity_Chk_En, Sampled_bit, 
        P_Data, Bit_Available, Bit_Cnt, Parity_Err );
  input [7:0] P_Data;
  input [3:0] Bit_Cnt;
  input CLK, RST, Parity_Type, Parity_Chk_En, Sampled_bit, Bit_Available;
  output Parity_Err;
  wire   N3, parity_bit, check, N5, N6, n1, n2, n3, n4, n5, n6, n7, n8;

  EDFFHQX2M parity_bit_reg ( .D(Sampled_bit), .E(N6), .CK(CLK), .Q(parity_bit)
         );
  EDFFHQX2M check_reg ( .D(N3), .E(N5), .CK(CLK), .Q(check) );
  DFFRQX2M Parity_Err_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(Parity_Err) );
  NOR2BX2M U2 ( .AN(RST), .B(n2), .Y(N5) );
  XNOR2X2M U3 ( .A(P_Data[3]), .B(P_Data[2]), .Y(n6) );
  CLKXOR2X2M U4 ( .A(n4), .B(n5), .Y(N3) );
  XOR3XLM U5 ( .A(P_Data[5]), .B(P_Data[4]), .C(n7), .Y(n4) );
  XOR3XLM U6 ( .A(P_Data[1]), .B(P_Data[0]), .C(n6), .Y(n5) );
  XNOR2X2M U7 ( .A(P_Data[7]), .B(P_Data[6]), .Y(n7) );
  NAND4X2M U8 ( .A(Bit_Cnt[3]), .B(Bit_Cnt[0]), .C(n3), .D(Bit_Available), .Y(
        n2) );
  NOR2X2M U9 ( .A(Bit_Cnt[2]), .B(Bit_Cnt[1]), .Y(n3) );
  OAI2BB2X1M U10 ( .B0(n1), .B1(n2), .A0N(Parity_Err), .A1N(n2), .Y(n8) );
  XNOR2X2M U11 ( .A(parity_bit), .B(check), .Y(n1) );
  AND3X2M U12 ( .A(Parity_Chk_En), .B(Bit_Available), .C(RST), .Y(N6) );
endmodule


module STOP_CHECK ( SAMPLED_BIT, BIT_AVAILABLE, RST, CLK, STOP_CHK_EN, 
        STOP_ERR );
  input SAMPLED_BIT, BIT_AVAILABLE, RST, CLK, STOP_CHK_EN;
  output STOP_ERR;
  wire   n1, n2;

  DFFRQX2M STOP_ERR_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(STOP_ERR) );
  NAND2BX2M U3 ( .AN(STOP_ERR), .B(n1), .Y(n2) );
  NAND3BX2M U4 ( .AN(SAMPLED_BIT), .B(BIT_AVAILABLE), .C(STOP_CHK_EN), .Y(n1)
         );
endmodule


module Start_Check ( CLK, RST, START_EN, SAMPLED_BIT, BIT_AVAILABLE, START_ERR
 );
  input CLK, RST, START_EN, SAMPLED_BIT, BIT_AVAILABLE;
  output START_ERR;


  AND3X2M U2 ( .A(SAMPLED_BIT), .B(BIT_AVAILABLE), .C(START_EN), .Y(START_ERR)
         );
endmodule


module Deserializer_DW8 ( CLK, RST, Sampled_Bit, Deser_En, BIT_AVAILABLE, 
        P_DATA );
  output [7:0] P_DATA;
  input CLK, RST, Sampled_Bit, Deser_En, BIT_AVAILABLE;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [3:0] i;
  wire   [7:0] P_DATA_REG;

  DFFRQX2M \P_DATA_REG_reg[6]  ( .D(n31), .CK(CLK), .RN(RST), .Q(P_DATA_REG[6]) );
  DFFRQX2M \P_DATA_REG_reg[3]  ( .D(n34), .CK(CLK), .RN(RST), .Q(P_DATA_REG[3]) );
  DFFRQX2M \P_DATA_REG_reg[2]  ( .D(n35), .CK(CLK), .RN(RST), .Q(P_DATA_REG[2]) );
  DFFRQX2M \P_DATA_REG_reg[5]  ( .D(n32), .CK(CLK), .RN(RST), .Q(P_DATA_REG[5]) );
  DFFRQX2M \P_DATA_REG_reg[4]  ( .D(n33), .CK(CLK), .RN(RST), .Q(P_DATA_REG[4]) );
  DFFRQX2M \P_DATA_REG_reg[1]  ( .D(n36), .CK(CLK), .RN(RST), .Q(P_DATA_REG[1]) );
  DFFRQX2M \P_DATA_REG_reg[0]  ( .D(n37), .CK(CLK), .RN(RST), .Q(P_DATA_REG[0]) );
  DFFRQX2M \P_DATA_reg[4]  ( .D(P_DATA_REG[4]), .CK(CLK), .RN(RST), .Q(
        P_DATA[4]) );
  DFFRQX2M \P_DATA_reg[0]  ( .D(P_DATA_REG[0]), .CK(CLK), .RN(RST), .Q(
        P_DATA[0]) );
  DFFRQX2M \P_DATA_reg[7]  ( .D(P_DATA_REG[7]), .CK(CLK), .RN(RST), .Q(
        P_DATA[7]) );
  DFFRQX2M \P_DATA_reg[3]  ( .D(P_DATA_REG[3]), .CK(CLK), .RN(RST), .Q(
        P_DATA[3]) );
  DFFRQX2M \P_DATA_reg[6]  ( .D(P_DATA_REG[6]), .CK(CLK), .RN(RST), .Q(
        P_DATA[6]) );
  DFFRQX2M \P_DATA_REG_reg[7]  ( .D(n30), .CK(CLK), .RN(RST), .Q(P_DATA_REG[7]) );
  DFFRQX2M \i_reg[2]  ( .D(n39), .CK(CLK), .RN(RST), .Q(i[2]) );
  DFFRQX2M \i_reg[1]  ( .D(n40), .CK(CLK), .RN(RST), .Q(i[1]) );
  DFFRQX2M \P_DATA_reg[5]  ( .D(P_DATA_REG[5]), .CK(CLK), .RN(RST), .Q(
        P_DATA[5]) );
  DFFRQX2M \P_DATA_reg[1]  ( .D(P_DATA_REG[1]), .CK(CLK), .RN(RST), .Q(
        P_DATA[1]) );
  DFFRQX2M \P_DATA_reg[2]  ( .D(P_DATA_REG[2]), .CK(CLK), .RN(RST), .Q(
        P_DATA[2]) );
  DFFRQX2M \i_reg[3]  ( .D(n38), .CK(CLK), .RN(RST), .Q(i[3]) );
  DFFRQX2M \i_reg[0]  ( .D(n41), .CK(CLK), .RN(RST), .Q(i[0]) );
  INVX2M U3 ( .A(Deser_En), .Y(n9) );
  INVX2M U4 ( .A(n29), .Y(n1) );
  AOI21X2M U5 ( .A0(n4), .A1(Deser_En), .B0(n1), .Y(n28) );
  NOR2X2M U6 ( .A(n9), .B(n2), .Y(n13) );
  NAND2X2M U7 ( .A(Deser_En), .B(n2), .Y(n29) );
  INVX2M U8 ( .A(n16), .Y(n6) );
  INVX2M U9 ( .A(n22), .Y(n5) );
  NOR3X2M U10 ( .A(n2), .B(i[3]), .C(n9), .Y(n15) );
  OAI32X1M U11 ( .A0(n9), .A1(i[0]), .A2(n1), .B0(n4), .B1(n29), .Y(n41) );
  OAI32X1M U12 ( .A0(n25), .A1(i[3]), .A2(n16), .B0(n26), .B1(n8), .Y(n38) );
  AOI21X2M U13 ( .A0(Deser_En), .A1(n7), .B0(n27), .Y(n26) );
  NOR2BX2M U14 ( .AN(n15), .B(i[1]), .Y(n18) );
  OAI31X1M U15 ( .A0(n10), .A1(n3), .A2(n4), .B0(n11), .Y(n30) );
  NAND2X2M U16 ( .A(P_DATA_REG[7]), .B(n12), .Y(n11) );
  NAND3X2M U17 ( .A(n13), .B(n8), .C(n6), .Y(n10) );
  NAND4X2M U18 ( .A(i[0]), .B(n6), .C(n13), .D(n8), .Y(n12) );
  OAI2B2X1M U19 ( .A1N(i[1]), .A0(n28), .B0(i[1]), .B1(n25), .Y(n40) );
  OAI21X2M U20 ( .A0(i[1]), .A1(n9), .B0(n28), .Y(n27) );
  INVX2M U21 ( .A(i[0]), .Y(n4) );
  OAI2BB2X1M U22 ( .B0(n3), .B1(n24), .A0N(P_DATA_REG[0]), .A1N(n24), .Y(n37)
         );
  NAND3X2M U23 ( .A(n4), .B(n7), .C(n18), .Y(n24) );
  OAI2BB2X1M U24 ( .B0(n3), .B1(n23), .A0N(P_DATA_REG[1]), .A1N(n23), .Y(n36)
         );
  NAND3X2M U25 ( .A(i[0]), .B(n7), .C(n18), .Y(n23) );
  OAI2BB2X1M U26 ( .B0(n3), .B1(n19), .A0N(P_DATA_REG[4]), .A1N(n19), .Y(n33)
         );
  NAND3X2M U27 ( .A(i[2]), .B(n4), .C(n18), .Y(n19) );
  OAI2BB2X1M U28 ( .B0(n3), .B1(n17), .A0N(P_DATA_REG[5]), .A1N(n17), .Y(n32)
         );
  NAND3X2M U29 ( .A(i[0]), .B(i[2]), .C(n18), .Y(n17) );
  OAI2BB2X1M U30 ( .B0(n3), .B1(n21), .A0N(P_DATA_REG[2]), .A1N(n21), .Y(n35)
         );
  NAND3X2M U31 ( .A(n15), .B(n4), .C(n5), .Y(n21) );
  OAI2BB2X1M U32 ( .B0(n3), .B1(n20), .A0N(P_DATA_REG[3]), .A1N(n20), .Y(n34)
         );
  NAND3X2M U33 ( .A(n15), .B(i[0]), .C(n5), .Y(n20) );
  OAI2BB2X1M U34 ( .B0(n22), .B1(n25), .A0N(n27), .A1N(i[2]), .Y(n39) );
  NAND3X2M U35 ( .A(Deser_En), .B(n29), .C(i[0]), .Y(n25) );
  INVX2M U36 ( .A(BIT_AVAILABLE), .Y(n2) );
  OAI2BB2X1M U37 ( .B0(n3), .B1(n14), .A0N(P_DATA_REG[6]), .A1N(n14), .Y(n31)
         );
  NAND3X2M U38 ( .A(n6), .B(n4), .C(n15), .Y(n14) );
  INVX2M U39 ( .A(Sampled_Bit), .Y(n3) );
  NAND2X2M U40 ( .A(i[1]), .B(n7), .Y(n22) );
  INVX2M U41 ( .A(i[2]), .Y(n7) );
  NAND2X2M U42 ( .A(i[2]), .B(i[1]), .Y(n16) );
  INVX2M U43 ( .A(i[3]), .Y(n8) );
endmodule


module Edge_Bit_Counter ( CLK, RST, EN, PRESCALE, Edge_Cnt, Bit_Cnt );
  input [5:0] PRESCALE;
  output [5:0] Edge_Cnt;
  output [3:0] Bit_Cnt;
  input CLK, RST, EN;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N21, N22, N23, N24, N37, N38,
         N39, N40, N41, N42, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         \add_30/carry[5] , \add_30/carry[4] , \add_30/carry[3] ,
         \add_30/carry[2] , \add_23/carry[5] , \add_23/carry[4] ,
         \add_23/carry[3] , \add_23/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8,
         n19, n20, n21, n22, n23, n24;

  DFFRQX2M \Bit_Cnt_reg[3]  ( .D(n18), .CK(CLK), .RN(RST), .Q(Bit_Cnt[3]) );
  DFFRQX2M \Bit_Cnt_reg[1]  ( .D(n16), .CK(CLK), .RN(RST), .Q(Bit_Cnt[1]) );
  DFFRQX2M \Bit_Cnt_reg[0]  ( .D(n17), .CK(CLK), .RN(RST), .Q(Bit_Cnt[0]) );
  DFFRQX2M \Bit_Cnt_reg[2]  ( .D(n15), .CK(CLK), .RN(RST), .Q(Bit_Cnt[2]) );
  DFFRQX2M \Edge_Cnt_reg[5]  ( .D(N42), .CK(CLK), .RN(RST), .Q(Edge_Cnt[5]) );
  DFFRQX2M \Edge_Cnt_reg[0]  ( .D(N37), .CK(CLK), .RN(RST), .Q(Edge_Cnt[0]) );
  DFFRQX2M \Edge_Cnt_reg[3]  ( .D(N40), .CK(CLK), .RN(RST), .Q(Edge_Cnt[3]) );
  DFFRQX2M \Edge_Cnt_reg[2]  ( .D(N39), .CK(CLK), .RN(RST), .Q(Edge_Cnt[2]) );
  DFFRQX2M \Edge_Cnt_reg[4]  ( .D(N41), .CK(CLK), .RN(RST), .Q(Edge_Cnt[4]) );
  DFFRQX2M \Edge_Cnt_reg[1]  ( .D(N38), .CK(CLK), .RN(RST), .Q(Edge_Cnt[1]) );
  INVX2M U3 ( .A(n12), .Y(n21) );
  NOR2X2M U4 ( .A(n24), .B(N14), .Y(n12) );
  INVX2M U5 ( .A(EN), .Y(n24) );
  NOR2BX2M U6 ( .AN(N21), .B(n21), .Y(N38) );
  NOR2BX2M U7 ( .AN(N22), .B(n21), .Y(N39) );
  NOR2BX2M U8 ( .AN(N23), .B(n21), .Y(N40) );
  NOR2BX2M U9 ( .AN(N24), .B(n21), .Y(N41) );
  OAI32X1M U10 ( .A0(n24), .A1(Bit_Cnt[0]), .A2(n12), .B0(n22), .B1(n21), .Y(
        n17) );
  OAI22X1M U11 ( .A0(n23), .A1(n21), .B0(n11), .B1(n24), .Y(n16) );
  AOI32X1M U12 ( .A0(n21), .A1(n23), .A2(Bit_Cnt[0]), .B0(Bit_Cnt[1]), .B1(n22), .Y(n11) );
  INVX2M U13 ( .A(Bit_Cnt[1]), .Y(n23) );
  NOR2X2M U14 ( .A(n1), .B(n21), .Y(N42) );
  XNOR2X2M U15 ( .A(\add_30/carry[5] ), .B(Edge_Cnt[5]), .Y(n1) );
  NOR2X2M U16 ( .A(Edge_Cnt[0]), .B(n21), .Y(N37) );
  NOR2X2M U17 ( .A(n13), .B(n24), .Y(n18) );
  CLKXOR2X2M U18 ( .A(n14), .B(Bit_Cnt[3]), .Y(n13) );
  NAND2X2M U19 ( .A(n10), .B(Bit_Cnt[2]), .Y(n14) );
  NOR2X2M U20 ( .A(n9), .B(n24), .Y(n15) );
  XNOR2X2M U21 ( .A(n10), .B(Bit_Cnt[2]), .Y(n9) );
  AND3X2M U22 ( .A(N14), .B(Bit_Cnt[1]), .C(Bit_Cnt[0]), .Y(n10) );
  ADDHX1M U23 ( .A(Edge_Cnt[5]), .B(\add_23/carry[5] ), .CO(N13), .S(N12) );
  ADDHX1M U24 ( .A(Edge_Cnt[1]), .B(Edge_Cnt[0]), .CO(\add_23/carry[2] ), .S(
        N8) );
  ADDHX1M U25 ( .A(Edge_Cnt[4]), .B(\add_23/carry[4] ), .CO(\add_23/carry[5] ), 
        .S(N11) );
  ADDHX1M U26 ( .A(Edge_Cnt[3]), .B(\add_23/carry[3] ), .CO(\add_23/carry[4] ), 
        .S(N10) );
  ADDHX1M U27 ( .A(Edge_Cnt[2]), .B(\add_23/carry[2] ), .CO(\add_23/carry[3] ), 
        .S(N9) );
  INVX2M U28 ( .A(Edge_Cnt[0]), .Y(N7) );
  ADDHX1M U29 ( .A(Edge_Cnt[1]), .B(Edge_Cnt[0]), .CO(\add_30/carry[2] ), .S(
        N21) );
  ADDHX1M U30 ( .A(Edge_Cnt[2]), .B(\add_30/carry[2] ), .CO(\add_30/carry[3] ), 
        .S(N22) );
  ADDHX1M U31 ( .A(Edge_Cnt[3]), .B(\add_30/carry[3] ), .CO(\add_30/carry[4] ), 
        .S(N23) );
  ADDHX1M U32 ( .A(Edge_Cnt[4]), .B(\add_30/carry[4] ), .CO(\add_30/carry[5] ), 
        .S(N24) );
  INVX2M U33 ( .A(Bit_Cnt[0]), .Y(n22) );
  NOR2BX1M U34 ( .AN(N7), .B(PRESCALE[0]), .Y(n2) );
  OAI2B2X1M U35 ( .A1N(PRESCALE[1]), .A0(n2), .B0(N8), .B1(n2), .Y(n6) );
  XNOR2X1M U36 ( .A(N12), .B(PRESCALE[5]), .Y(n5) );
  NOR2BX1M U37 ( .AN(PRESCALE[0]), .B(N7), .Y(n3) );
  OAI2B2X1M U38 ( .A1N(N8), .A0(n3), .B0(PRESCALE[1]), .B1(n3), .Y(n4) );
  NAND4BX1M U39 ( .AN(N13), .B(n6), .C(n5), .D(n4), .Y(n20) );
  CLKXOR2X2M U40 ( .A(N11), .B(PRESCALE[4]), .Y(n19) );
  CLKXOR2X2M U41 ( .A(N9), .B(PRESCALE[2]), .Y(n8) );
  CLKXOR2X2M U42 ( .A(N10), .B(PRESCALE[3]), .Y(n7) );
  NOR4X1M U43 ( .A(n20), .B(n19), .C(n8), .D(n7), .Y(N14) );
endmodule


module Data_Sampling ( CLK, RST, EDG_CNT, DAT_SAMPL_EN, PRESCALE, S_DATA, 
        SAMPLED_BIT, BIT_AVAILABLE );
  input [5:0] EDG_CNT;
  input [5:0] PRESCALE;
  input CLK, RST, DAT_SAMPL_EN, S_DATA;
  output SAMPLED_BIT, BIT_AVAILABLE;
  wire   N7, N8, N9, N10, N11, N13, N14, N17, N18, N19, N20, N21, n33, n35,
         n36, n37, n38, \add_54/carry[4] , \add_54/carry[3] ,
         \add_54/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n34, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53;
  wire   [1:0] one;
  wire   [1:0] zero;
  wire   [5:0] Mid;

  DFFRQX2M \one_reg[1]  ( .D(n35), .CK(CLK), .RN(RST), .Q(one[1]) );
  DFFRQX2M \zero_reg[1]  ( .D(n38), .CK(CLK), .RN(RST), .Q(zero[1]) );
  DFFRQX2M \zero_reg[0]  ( .D(n37), .CK(CLK), .RN(RST), .Q(zero[0]) );
  DFFRQX2M \one_reg[0]  ( .D(n36), .CK(CLK), .RN(RST), .Q(one[0]) );
  DFFRQX2M BIT_AVAILABLE_reg ( .D(n33), .CK(CLK), .RN(RST), .Q(BIT_AVAILABLE)
         );
  DFFRQX2M \Mid_reg[1]  ( .D(PRESCALE[2]), .CK(CLK), .RN(RST), .Q(Mid[1]) );
  DFFRQX2M \Mid_reg[2]  ( .D(PRESCALE[3]), .CK(CLK), .RN(RST), .Q(Mid[2]) );
  DFFRQX2M \Mid_reg[4]  ( .D(PRESCALE[5]), .CK(CLK), .RN(RST), .Q(Mid[4]) );
  DFFRQX2M \Mid_reg[3]  ( .D(PRESCALE[4]), .CK(CLK), .RN(RST), .Q(Mid[3]) );
  DFFRQX2M \Mid_reg[0]  ( .D(PRESCALE[1]), .CK(CLK), .RN(RST), .Q(Mid[0]) );
  EDFFX1M SAMPLED_BIT_reg ( .D(n31), .E(n32), .CK(CLK), .Q(SAMPLED_BIT) );
  ADDHX1M U3 ( .A(Mid[4]), .B(\add_54/carry[4] ), .CO(N21), .S(N20) );
  ADDHX1M U4 ( .A(Mid[1]), .B(Mid[0]), .CO(\add_54/carry[2] ), .S(N17) );
  ADDHX1M U5 ( .A(Mid[3]), .B(\add_54/carry[3] ), .CO(\add_54/carry[4] ), .S(
        N19) );
  ADDHX1M U6 ( .A(Mid[2]), .B(\add_54/carry[2] ), .CO(\add_54/carry[3] ), .S(
        N18) );
  INVX2M U7 ( .A(Mid[0]), .Y(N7) );
  NAND2BX1M U8 ( .AN(Mid[1]), .B(N7), .Y(n1) );
  OAI2BB1X1M U9 ( .A0N(Mid[0]), .A1N(Mid[1]), .B0(n1), .Y(N8) );
  OR2X1M U10 ( .A(n1), .B(Mid[2]), .Y(n2) );
  OAI2BB1X1M U11 ( .A0N(n1), .A1N(Mid[2]), .B0(n2), .Y(N9) );
  XNOR2X1M U12 ( .A(Mid[3]), .B(n2), .Y(N10) );
  NOR3X1M U13 ( .A(Mid[3]), .B(Mid[4]), .C(n2), .Y(N13) );
  OAI21X1M U14 ( .A0(Mid[3]), .A1(n2), .B0(Mid[4]), .Y(n3) );
  NAND2BX1M U15 ( .AN(N13), .B(n3), .Y(N11) );
  NOR2BX1M U16 ( .AN(N7), .B(EDG_CNT[0]), .Y(n4) );
  OAI2B2X1M U17 ( .A1N(EDG_CNT[1]), .A0(n4), .B0(N8), .B1(n4), .Y(n8) );
  XNOR2X1M U18 ( .A(N13), .B(EDG_CNT[5]), .Y(n7) );
  NOR2BX1M U19 ( .AN(EDG_CNT[0]), .B(N7), .Y(n5) );
  OAI2B2X1M U20 ( .A1N(N8), .A0(n5), .B0(EDG_CNT[1]), .B1(n5), .Y(n6) );
  NAND4BX1M U21 ( .AN(N13), .B(n8), .C(n7), .D(n6), .Y(n12) );
  CLKXOR2X2M U22 ( .A(N11), .B(EDG_CNT[4]), .Y(n11) );
  CLKXOR2X2M U23 ( .A(N9), .B(EDG_CNT[2]), .Y(n10) );
  CLKXOR2X2M U24 ( .A(N10), .B(EDG_CNT[3]), .Y(n9) );
  NOR4X1M U25 ( .A(n12), .B(n11), .C(n10), .D(n9), .Y(N14) );
  MXI2X1M U26 ( .A(n13), .B(n14), .S0(zero[1]), .Y(n38) );
  AOI21X1M U27 ( .A0(n15), .A1(n16), .B0(n17), .Y(n14) );
  NAND3X1M U28 ( .A(n18), .B(n15), .C(zero[0]), .Y(n13) );
  MXI2X1M U29 ( .A(n19), .B(n18), .S0(zero[0]), .Y(n37) );
  CLKNAND2X2M U30 ( .A(n18), .B(n15), .Y(n19) );
  CLKINVX1M U31 ( .A(n17), .Y(n18) );
  CLKNAND2X2M U32 ( .A(n20), .B(n21), .Y(n17) );
  MXI2X1M U33 ( .A(n22), .B(n23), .S0(one[0]), .Y(n36) );
  CLKINVX1M U34 ( .A(n24), .Y(n23) );
  CLKNAND2X2M U35 ( .A(n25), .B(DAT_SAMPL_EN), .Y(n22) );
  MXI2X1M U36 ( .A(n26), .B(n27), .S0(one[1]), .Y(n35) );
  AOI2BB1X1M U37 ( .A0N(one[0]), .A1N(n28), .B0(n24), .Y(n27) );
  OAI21X1M U38 ( .A0(S_DATA), .A1(n28), .B0(n20), .Y(n24) );
  AOI21X1M U39 ( .A0(n29), .A1(n28), .B0(n30), .Y(n20) );
  CLKINVX1M U40 ( .A(n15), .Y(n28) );
  NAND3X1M U41 ( .A(n25), .B(DAT_SAMPL_EN), .C(one[0]), .Y(n26) );
  CLKINVX1M U42 ( .A(n21), .Y(n25) );
  CLKNAND2X2M U43 ( .A(S_DATA), .B(n15), .Y(n21) );
  NOR4BX1M U44 ( .AN(RST), .B(n15), .C(n30), .D(n29), .Y(n32) );
  CLKINVX1M U45 ( .A(DAT_SAMPL_EN), .Y(n30) );
  OAI2B1X1M U46 ( .A1N(one[1]), .A0(zero[1]), .B0(n34), .Y(n31) );
  OAI2B11X1M U47 ( .A1N(zero[1]), .A0(one[1]), .B0(n16), .C0(one[0]), .Y(n34)
         );
  CLKINVX1M U48 ( .A(zero[0]), .Y(n16) );
  CLKMX2X2M U49 ( .A(BIT_AVAILABLE), .B(n39), .S0(DAT_SAMPL_EN), .Y(n33) );
  NOR2X1M U50 ( .A(n15), .B(n29), .Y(n39) );
  NAND4X1M U51 ( .A(n40), .B(n41), .C(n42), .D(n43), .Y(n29) );
  NOR3X1M U52 ( .A(n44), .B(n45), .C(n46), .Y(n43) );
  CLKXOR2X2M U53 ( .A(N20), .B(EDG_CNT[4]), .Y(n46) );
  CLKXOR2X2M U54 ( .A(N17), .B(EDG_CNT[1]), .Y(n45) );
  CLKXOR2X2M U55 ( .A(N7), .B(EDG_CNT[0]), .Y(n44) );
  XNOR2X1M U56 ( .A(EDG_CNT[2]), .B(N18), .Y(n42) );
  XNOR2X1M U57 ( .A(EDG_CNT[3]), .B(N19), .Y(n41) );
  XNOR2X1M U58 ( .A(EDG_CNT[5]), .B(N21), .Y(n40) );
  OAI21BX1M U59 ( .A0(n47), .A1(n48), .B0N(N14), .Y(n15) );
  NAND3X1M U60 ( .A(n49), .B(n50), .C(n51), .Y(n48) );
  XNOR2X1M U61 ( .A(EDG_CNT[3]), .B(Mid[3]), .Y(n51) );
  XNOR2X1M U62 ( .A(EDG_CNT[4]), .B(Mid[4]), .Y(n50) );
  XNOR2X1M U63 ( .A(EDG_CNT[2]), .B(Mid[2]), .Y(n49) );
  NAND3BX1M U64 ( .AN(EDG_CNT[5]), .B(n52), .C(n53), .Y(n47) );
  XNOR2X1M U65 ( .A(EDG_CNT[0]), .B(Mid[0]), .Y(n53) );
  XNOR2X1M U66 ( .A(EDG_CNT[1]), .B(Mid[1]), .Y(n52) );
endmodule


module UART_RX_DW8 ( CLK_TOP, RST_TOP, S_DATA_TOP, PARITY_EN_TOP, 
        PARITY_TYPE_TOP, PRESCALE_TOP, P_DATA, VALID, STOP_ERR, PARITY_ERR );
  input [5:0] PRESCALE_TOP;
  output [7:0] P_DATA;
  input CLK_TOP, RST_TOP, S_DATA_TOP, PARITY_EN_TOP, PARITY_TYPE_TOP;
  output VALID, STOP_ERR, PARITY_ERR;
  wire   START_GLSH_TOP, BIT_AVAILABLE_TOP, STR_CHK_EN_TOP, STP_CHK_EN_TOP,
         DSER_EN_TOP, DAT_SAMPL_EN_TOP, COUNTER_EN_TOP, Sampled_bit_TOP, n1,
         n2;
  wire   [3:0] BIT_CNT_TOP;
  wire   [5:0] EDG_CNT_TOP;

  RX_FSM FSM_TOP ( .S_DATA(S_DATA_TOP), .CLK(CLK_TOP), .RST(n1), .START_GLSH(
        START_GLSH_TOP), .PAR_ERR(PARITY_ERR), .STP_ERR(STOP_ERR), .BIT_CNT(
        BIT_CNT_TOP), .BIT_AVAILABLE(BIT_AVAILABLE_TOP), .PAR_EN(PARITY_EN_TOP), .DATA_VALID(VALID), .STR_CHK_EN(STR_CHK_EN_TOP), .STP_CHK_EN(STP_CHK_EN_TOP), 
        .DSER_EN(DSER_EN_TOP), .DAT_SAMPL_EN(DAT_SAMPL_EN_TOP), .COUNTER_EN(
        COUNTER_EN_TOP) );
  Parity_Check_DW8 Parity_Check_TOP ( .CLK(CLK_TOP), .RST(n1), .Parity_Type(
        PARITY_TYPE_TOP), .Parity_Chk_En(1'b0), .Sampled_bit(Sampled_bit_TOP), 
        .P_Data(P_DATA), .Bit_Available(BIT_AVAILABLE_TOP), .Bit_Cnt(
        BIT_CNT_TOP), .Parity_Err(PARITY_ERR) );
  STOP_CHECK STOP_CHECK_TOP ( .SAMPLED_BIT(Sampled_bit_TOP), .BIT_AVAILABLE(
        BIT_AVAILABLE_TOP), .RST(n1), .CLK(CLK_TOP), .STOP_CHK_EN(
        STP_CHK_EN_TOP), .STOP_ERR(STOP_ERR) );
  Start_Check Start_Check_TOP ( .CLK(CLK_TOP), .RST(n1), .START_EN(
        STR_CHK_EN_TOP), .SAMPLED_BIT(Sampled_bit_TOP), .BIT_AVAILABLE(
        BIT_AVAILABLE_TOP), .START_ERR(START_GLSH_TOP) );
  Deserializer_DW8 Deserializer_TOP ( .CLK(CLK_TOP), .RST(n1), .Sampled_Bit(
        Sampled_bit_TOP), .Deser_En(DSER_EN_TOP), .BIT_AVAILABLE(
        BIT_AVAILABLE_TOP), .P_DATA(P_DATA) );
  Edge_Bit_Counter Edge_Bit_Counter_TOP ( .CLK(CLK_TOP), .RST(n1), .EN(
        COUNTER_EN_TOP), .PRESCALE(PRESCALE_TOP), .Edge_Cnt(EDG_CNT_TOP), 
        .Bit_Cnt(BIT_CNT_TOP) );
  Data_Sampling Data_Sampling_TOP ( .CLK(CLK_TOP), .RST(n1), .EDG_CNT(
        EDG_CNT_TOP), .DAT_SAMPL_EN(DAT_SAMPL_EN_TOP), .PRESCALE(PRESCALE_TOP), 
        .S_DATA(S_DATA_TOP), .SAMPLED_BIT(Sampled_bit_TOP), .BIT_AVAILABLE(
        BIT_AVAILABLE_TOP) );
  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST_TOP), .Y(n2) );
endmodule


module UART_DW8 ( TX_clk, RX_clk, rst, RX_IN, P_DATA, empty_flag, par_en, 
        par_type, prescale, TX_OUT, BUSY, RX_OUT, RX_out_valid, stp_err, 
        parity_err );
  input [7:0] P_DATA;
  input [5:0] prescale;
  output [7:0] RX_OUT;
  input TX_clk, RX_clk, rst, RX_IN, empty_flag, par_en, par_type;
  output TX_OUT, BUSY, RX_out_valid, stp_err, parity_err;
  wire   n1, n2, n3;

  UART_TX uart_tx ( .CLK_TOP(TX_clk), .RST_TOP(n1), .PARALLEL_DATA_TOP(P_DATA), 
        .PARITY_TYPE_TOP(par_type), .PARITY_EN_TOP(par_en), .DATA_VALID_TOP(n3), .SER_OUT_TOP(TX_OUT), .BUSY_TOP(BUSY) );
  UART_RX_DW8 uart_rx ( .CLK_TOP(RX_clk), .RST_TOP(n1), .S_DATA_TOP(RX_IN), 
        .PARITY_EN_TOP(par_en), .PARITY_TYPE_TOP(par_type), .PRESCALE_TOP(
        prescale), .P_DATA(RX_OUT), .VALID(RX_out_valid), .STOP_ERR(stp_err), 
        .PARITY_ERR(parity_err) );
  INVX2M U1 ( .A(empty_flag), .Y(n3) );
  INVX2M U2 ( .A(n2), .Y(n1) );
  INVX2M U3 ( .A(rst), .Y(n2) );
endmodule


module PULSE_GEN_1 ( clk, rst, in, out );
  input clk, rst, in;
  output out;
  wire   ff_out;

  DFFRQX2M ff_out_reg ( .D(in), .CK(clk), .RN(rst), .Q(ff_out) );
  NOR2BX2M U3 ( .AN(in), .B(ff_out), .Y(out) );
endmodule


module DATA_SYNC_DATA_WIDTH8_FLOPS2 ( unsync_data, clk, rst, unsync_en, 
        sync_en, sync_data );
  input [7:0] unsync_data;
  output [7:0] sync_data;
  input clk, rst, unsync_en;
  output sync_en;
  wire   mux_sel, n1;
  wire   [1:0] shift_reg;
  wire   [7:0] mux_out;

  PULSE_GEN_1 PG ( .clk(clk), .rst(rst), .in(shift_reg[0]), .out(mux_sel) );
  DFFRQX2M \shift_reg_reg[0]  ( .D(shift_reg[1]), .CK(clk), .RN(rst), .Q(
        shift_reg[0]) );
  DFFRQX2M \sync_data_reg[7]  ( .D(mux_out[7]), .CK(clk), .RN(rst), .Q(
        sync_data[7]) );
  DFFRQX2M \sync_data_reg[6]  ( .D(mux_out[6]), .CK(clk), .RN(rst), .Q(
        sync_data[6]) );
  DFFRQX2M \sync_data_reg[5]  ( .D(mux_out[5]), .CK(clk), .RN(rst), .Q(
        sync_data[5]) );
  DFFRQX2M \sync_data_reg[4]  ( .D(mux_out[4]), .CK(clk), .RN(rst), .Q(
        sync_data[4]) );
  DFFRQX2M \sync_data_reg[3]  ( .D(mux_out[3]), .CK(clk), .RN(rst), .Q(
        sync_data[3]) );
  DFFRQX2M \sync_data_reg[2]  ( .D(mux_out[2]), .CK(clk), .RN(rst), .Q(
        sync_data[2]) );
  DFFRQX2M \sync_data_reg[0]  ( .D(mux_out[0]), .CK(clk), .RN(rst), .Q(
        sync_data[0]) );
  DFFRQX2M \sync_data_reg[1]  ( .D(mux_out[1]), .CK(clk), .RN(rst), .Q(
        sync_data[1]) );
  DFFRQX2M sync_en_reg ( .D(mux_sel), .CK(clk), .RN(rst), .Q(sync_en) );
  DFFRQX2M \shift_reg_reg[1]  ( .D(unsync_en), .CK(clk), .RN(rst), .Q(
        shift_reg[1]) );
  INVX2M U3 ( .A(mux_sel), .Y(n1) );
  AO22X1M U4 ( .A0(unsync_data[0]), .A1(mux_sel), .B0(sync_data[0]), .B1(n1), 
        .Y(mux_out[0]) );
  AO22X1M U5 ( .A0(unsync_data[1]), .A1(mux_sel), .B0(sync_data[1]), .B1(n1), 
        .Y(mux_out[1]) );
  AO22X1M U6 ( .A0(unsync_data[2]), .A1(mux_sel), .B0(sync_data[2]), .B1(n1), 
        .Y(mux_out[2]) );
  AO22X1M U7 ( .A0(unsync_data[3]), .A1(mux_sel), .B0(sync_data[3]), .B1(n1), 
        .Y(mux_out[3]) );
  AO22X1M U8 ( .A0(unsync_data[4]), .A1(mux_sel), .B0(sync_data[4]), .B1(n1), 
        .Y(mux_out[4]) );
  AO22X1M U9 ( .A0(unsync_data[5]), .A1(mux_sel), .B0(sync_data[5]), .B1(n1), 
        .Y(mux_out[5]) );
  AO22X1M U10 ( .A0(unsync_data[6]), .A1(mux_sel), .B0(sync_data[6]), .B1(n1), 
        .Y(mux_out[6]) );
  AO22X1M U11 ( .A0(unsync_data[7]), .A1(mux_sel), .B0(sync_data[7]), .B1(n1), 
        .Y(mux_out[7]) );
endmodule


module PRESCALE_MUX ( Prescale, ratio );
  input [5:0] Prescale;
  output [7:0] ratio;
  wire   n5, n6, n7, n8, n9, n1, n2, n3, n4;
  assign ratio[4] = 1'b0;
  assign ratio[5] = 1'b0;
  assign ratio[6] = 1'b0;
  assign ratio[7] = 1'b0;

  NOR3X2M U3 ( .A(n7), .B(Prescale[1]), .C(Prescale[0]), .Y(ratio[1]) );
  NAND4BX1M U4 ( .AN(Prescale[4]), .B(Prescale[3]), .C(n2), .D(n1), .Y(n6) );
  NAND4BX1M U5 ( .AN(Prescale[3]), .B(Prescale[4]), .C(n2), .D(n1), .Y(n7) );
  NOR3X2M U6 ( .A(n6), .B(Prescale[1]), .C(Prescale[0]), .Y(ratio[2]) );
  OAI211X2M U7 ( .A0(n8), .A1(n9), .B0(n4), .C0(n3), .Y(ratio[0]) );
  NAND2X2M U8 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U9 ( .A(Prescale[5]), .B(Prescale[4]), .C(Prescale[3]), .D(n2), .Y(
        n8) );
  NOR4X1M U10 ( .A(n5), .B(Prescale[3]), .C(Prescale[5]), .D(Prescale[4]), .Y(
        ratio[3]) );
  NAND3X2M U11 ( .A(n4), .B(n3), .C(Prescale[2]), .Y(n5) );
  INVX2M U12 ( .A(Prescale[2]), .Y(n2) );
  INVX2M U13 ( .A(Prescale[1]), .Y(n3) );
  INVX2M U14 ( .A(Prescale[0]), .Y(n4) );
  INVX2M U15 ( .A(Prescale[5]), .Y(n1) );
endmodule


module CLK_DIV_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module CLK_DIV_0 ( ref_clk, rst, en, ratio, o_clk );
  input [7:0] ratio;
  input ref_clk, rst, en;
  output o_clk;
  wire   clk, flag, N10, N12, N13, N14, N15, N16, N17, N21, N25, N26, N27, N28,
         N29, N30, N31, N32, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [7:0] Counter;

  CLK_DIV_0_DW01_inc_0 add_47 ( .A(Counter), .SUM({N32, N31, N30, N29, N28, 
        N27, N26, N25}) );
  DFFRQX2M clk_reg ( .D(n19), .CK(ref_clk), .RN(rst), .Q(clk) );
  DFFRQX2M \Counter_reg[7]  ( .D(n20), .CK(ref_clk), .RN(rst), .Q(Counter[7])
         );
  DFFRQX2M flag_reg ( .D(n28), .CK(ref_clk), .RN(rst), .Q(flag) );
  DFFRQX2M \Counter_reg[2]  ( .D(n25), .CK(ref_clk), .RN(rst), .Q(Counter[2])
         );
  DFFRQX2M \Counter_reg[3]  ( .D(n24), .CK(ref_clk), .RN(rst), .Q(Counter[3])
         );
  DFFRQX2M \Counter_reg[4]  ( .D(n23), .CK(ref_clk), .RN(rst), .Q(Counter[4])
         );
  DFFRQX2M \Counter_reg[5]  ( .D(n22), .CK(ref_clk), .RN(rst), .Q(Counter[5])
         );
  DFFRQX2M \Counter_reg[6]  ( .D(n21), .CK(ref_clk), .RN(rst), .Q(Counter[6])
         );
  DFFRQX2M \Counter_reg[1]  ( .D(n26), .CK(ref_clk), .RN(rst), .Q(Counter[1])
         );
  DFFRQX2M \Counter_reg[0]  ( .D(n27), .CK(ref_clk), .RN(rst), .Q(Counter[0])
         );
  AND2X2M U3 ( .A(n11), .B(n51), .Y(n13) );
  MX2X2M U4 ( .A(ref_clk), .B(clk), .S0(n51), .Y(o_clk) );
  OA21X2M U5 ( .A0(ratio[0]), .A1(n2), .B0(n14), .Y(n11) );
  INVX2M U6 ( .A(ratio[1]), .Y(N10) );
  AOI21BX2M U7 ( .A0(ratio[1]), .A1(ratio[2]), .B0N(n4), .Y(n1) );
  INVX2M U8 ( .A(n3), .Y(n51) );
  NAND2X2M U9 ( .A(ratio[0]), .B(n16), .Y(n14) );
  OAI2BB2X1M U10 ( .B0(flag), .B1(n2), .A0N(flag), .A1N(N21), .Y(n16) );
  NAND4X2M U11 ( .A(n38), .B(n37), .C(n36), .D(n35), .Y(n2) );
  AO22X1M U12 ( .A0(Counter[7]), .A1(n3), .B0(N32), .B1(n13), .Y(n20) );
  AO22X1M U13 ( .A0(Counter[6]), .A1(n3), .B0(N31), .B1(n13), .Y(n21) );
  AO22X1M U14 ( .A0(Counter[5]), .A1(n3), .B0(N30), .B1(n13), .Y(n22) );
  AO22X1M U15 ( .A0(Counter[4]), .A1(n3), .B0(N29), .B1(n13), .Y(n23) );
  AO22X1M U16 ( .A0(Counter[3]), .A1(n3), .B0(N28), .B1(n13), .Y(n24) );
  AO22X1M U17 ( .A0(Counter[2]), .A1(n3), .B0(N27), .B1(n13), .Y(n25) );
  AO22X1M U18 ( .A0(Counter[1]), .A1(n3), .B0(N26), .B1(n13), .Y(n26) );
  AO22X1M U19 ( .A0(Counter[0]), .A1(n3), .B0(N25), .B1(n13), .Y(n27) );
  INVX2M U20 ( .A(Counter[0]), .Y(n39) );
  CLKXOR2X2M U21 ( .A(clk), .B(n10), .Y(n19) );
  NOR2X2M U22 ( .A(n11), .B(n3), .Y(n10) );
  CLKXOR2X2M U23 ( .A(flag), .B(n15), .Y(n28) );
  NOR2X2M U24 ( .A(n3), .B(n14), .Y(n15) );
  BUFX2M U25 ( .A(n12), .Y(n3) );
  OAI2BB1X2M U26 ( .A0N(n17), .A1N(n18), .B0(en), .Y(n12) );
  NOR4X1M U27 ( .A(ratio[7]), .B(ratio[6]), .C(ratio[5]), .D(ratio[4]), .Y(n18) );
  NOR3X2M U28 ( .A(ratio[1]), .B(ratio[3]), .C(ratio[2]), .Y(n17) );
  NAND2BX1M U29 ( .AN(ratio[2]), .B(N10), .Y(n4) );
  OR2X1M U30 ( .A(n4), .B(ratio[3]), .Y(n5) );
  OAI2BB1X1M U31 ( .A0N(n4), .A1N(ratio[3]), .B0(n5), .Y(N12) );
  OR2X1M U32 ( .A(n5), .B(ratio[4]), .Y(n6) );
  OAI2BB1X1M U33 ( .A0N(n5), .A1N(ratio[4]), .B0(n6), .Y(N13) );
  OR2X1M U34 ( .A(n6), .B(ratio[5]), .Y(n7) );
  OAI2BB1X1M U35 ( .A0N(n6), .A1N(ratio[5]), .B0(n7), .Y(N14) );
  XNOR2X1M U36 ( .A(ratio[6]), .B(n7), .Y(N15) );
  NOR3X1M U37 ( .A(ratio[6]), .B(ratio[7]), .C(n7), .Y(N17) );
  OAI21X1M U38 ( .A0(ratio[6]), .A1(n7), .B0(ratio[7]), .Y(n8) );
  NAND2BX1M U39 ( .AN(N17), .B(n8), .Y(N16) );
  XNOR2X1M U40 ( .A(N12), .B(Counter[2]), .Y(n38) );
  NOR2X1M U41 ( .A(n39), .B(N10), .Y(n9) );
  OAI22X1M U42 ( .A0(Counter[1]), .A1(n9), .B0(n9), .B1(n1), .Y(n37) );
  CLKNAND2X2M U43 ( .A(N10), .B(n39), .Y(n29) );
  AOI22X1M U44 ( .A0(n29), .A1(n1), .B0(n29), .B1(Counter[1]), .Y(n30) );
  NOR3X1M U45 ( .A(n30), .B(N17), .C(Counter[7]), .Y(n36) );
  CLKXOR2X2M U46 ( .A(N13), .B(Counter[3]), .Y(n34) );
  CLKXOR2X2M U47 ( .A(N14), .B(Counter[4]), .Y(n33) );
  CLKXOR2X2M U48 ( .A(N15), .B(Counter[5]), .Y(n32) );
  CLKXOR2X2M U49 ( .A(N16), .B(Counter[6]), .Y(n31) );
  NOR4X1M U50 ( .A(n34), .B(n33), .C(n32), .D(n31), .Y(n35) );
  NOR2BX1M U51 ( .AN(Counter[0]), .B(ratio[1]), .Y(n40) );
  OAI2B2X1M U52 ( .A1N(ratio[2]), .A0(n40), .B0(Counter[1]), .B1(n40), .Y(n44)
         );
  XNOR2X1M U53 ( .A(ratio[3]), .B(Counter[2]), .Y(n43) );
  NOR2BX1M U54 ( .AN(ratio[1]), .B(Counter[0]), .Y(n41) );
  OAI2B2X1M U55 ( .A1N(Counter[1]), .A0(n41), .B0(ratio[2]), .B1(n41), .Y(n42)
         );
  NAND4BX1M U56 ( .AN(Counter[7]), .B(n44), .C(n43), .D(n42), .Y(n50) );
  XNOR2X1M U57 ( .A(ratio[7]), .B(Counter[6]), .Y(n48) );
  XNOR2X1M U58 ( .A(ratio[6]), .B(Counter[5]), .Y(n47) );
  XNOR2X1M U59 ( .A(ratio[5]), .B(Counter[4]), .Y(n46) );
  XNOR2X1M U60 ( .A(ratio[4]), .B(Counter[3]), .Y(n45) );
  NAND4X1M U61 ( .A(n48), .B(n47), .C(n46), .D(n45), .Y(n49) );
  NOR2X1M U62 ( .A(n50), .B(n49), .Y(N21) );
endmodule


module CLK_DIV_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module CLK_DIV_1 ( ref_clk, rst, en, ratio, o_clk );
  input [7:0] ratio;
  input ref_clk, rst, en;
  output o_clk;
  wire   clk, flag, N10, N12, N13, N14, N15, N16, N17, N21, N25, N26, N27, N28,
         N29, N30, N31, N32, n1, n2, n3, n4, n5, n6, n7, n8, n9, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70;
  wire   [7:0] Counter;

  CLK_DIV_1_DW01_inc_0 add_47 ( .A(Counter), .SUM({N32, N31, N30, N29, N28, 
        N27, N26, N25}) );
  DFFRQX2M clk_reg ( .D(n61), .CK(ref_clk), .RN(rst), .Q(clk) );
  DFFRQX2M \Counter_reg[7]  ( .D(n60), .CK(ref_clk), .RN(rst), .Q(Counter[7])
         );
  DFFRQX2M flag_reg ( .D(n52), .CK(ref_clk), .RN(rst), .Q(flag) );
  DFFRQX2M \Counter_reg[2]  ( .D(n55), .CK(ref_clk), .RN(rst), .Q(Counter[2])
         );
  DFFRQX2M \Counter_reg[3]  ( .D(n56), .CK(ref_clk), .RN(rst), .Q(Counter[3])
         );
  DFFRQX2M \Counter_reg[4]  ( .D(n57), .CK(ref_clk), .RN(rst), .Q(Counter[4])
         );
  DFFRQX2M \Counter_reg[5]  ( .D(n58), .CK(ref_clk), .RN(rst), .Q(Counter[5])
         );
  DFFRQX2M \Counter_reg[6]  ( .D(n59), .CK(ref_clk), .RN(rst), .Q(Counter[6])
         );
  DFFRQX2M \Counter_reg[1]  ( .D(n54), .CK(ref_clk), .RN(rst), .Q(Counter[1])
         );
  DFFRQX2M \Counter_reg[0]  ( .D(n53), .CK(ref_clk), .RN(rst), .Q(Counter[0])
         );
  MX2X2M U3 ( .A(ref_clk), .B(clk), .S0(n51), .Y(o_clk) );
  AND2X2M U4 ( .A(n69), .B(n51), .Y(n67) );
  INVX2M U5 ( .A(n3), .Y(n51) );
  NAND2X2M U6 ( .A(ratio[0]), .B(n64), .Y(n66) );
  OAI2BB2X1M U7 ( .B0(flag), .B1(n1), .A0N(flag), .A1N(N21), .Y(n64) );
  OA21X2M U8 ( .A0(ratio[0]), .A1(n1), .B0(n66), .Y(n69) );
  NAND4X2M U9 ( .A(n38), .B(n37), .C(n36), .D(n35), .Y(n1) );
  AO22X1M U10 ( .A0(Counter[7]), .A1(n3), .B0(N32), .B1(n67), .Y(n60) );
  AO22X1M U11 ( .A0(Counter[6]), .A1(n3), .B0(N31), .B1(n67), .Y(n59) );
  AO22X1M U12 ( .A0(Counter[5]), .A1(n3), .B0(N30), .B1(n67), .Y(n58) );
  AO22X1M U13 ( .A0(Counter[4]), .A1(n3), .B0(N29), .B1(n67), .Y(n57) );
  AO22X1M U14 ( .A0(Counter[3]), .A1(n3), .B0(N28), .B1(n67), .Y(n56) );
  AO22X1M U15 ( .A0(Counter[2]), .A1(n3), .B0(N27), .B1(n67), .Y(n55) );
  AO22X1M U16 ( .A0(Counter[1]), .A1(n3), .B0(N26), .B1(n67), .Y(n54) );
  AO22X1M U17 ( .A0(Counter[0]), .A1(n3), .B0(N25), .B1(n67), .Y(n53) );
  INVX2M U18 ( .A(Counter[0]), .Y(n39) );
  CLKXOR2X2M U19 ( .A(clk), .B(n70), .Y(n61) );
  NOR2X2M U20 ( .A(n69), .B(n3), .Y(n70) );
  CLKXOR2X2M U21 ( .A(flag), .B(n65), .Y(n52) );
  NOR2X2M U22 ( .A(n3), .B(n66), .Y(n65) );
  BUFX2M U23 ( .A(n68), .Y(n3) );
  OAI2BB1X2M U24 ( .A0N(n63), .A1N(n62), .B0(en), .Y(n68) );
  NOR3X2M U25 ( .A(ratio[1]), .B(ratio[3]), .C(ratio[2]), .Y(n63) );
  NOR4X1M U26 ( .A(ratio[7]), .B(ratio[6]), .C(ratio[5]), .D(ratio[4]), .Y(n62) );
  AOI21BX2M U27 ( .A0(ratio[1]), .A1(ratio[2]), .B0N(n4), .Y(n2) );
  INVX2M U28 ( .A(ratio[1]), .Y(N10) );
  NAND2BX1M U29 ( .AN(ratio[2]), .B(N10), .Y(n4) );
  OR2X1M U30 ( .A(n4), .B(ratio[3]), .Y(n5) );
  OAI2BB1X1M U31 ( .A0N(n4), .A1N(ratio[3]), .B0(n5), .Y(N12) );
  OR2X1M U32 ( .A(n5), .B(ratio[4]), .Y(n6) );
  OAI2BB1X1M U33 ( .A0N(n5), .A1N(ratio[4]), .B0(n6), .Y(N13) );
  OR2X1M U34 ( .A(n6), .B(ratio[5]), .Y(n7) );
  OAI2BB1X1M U35 ( .A0N(n6), .A1N(ratio[5]), .B0(n7), .Y(N14) );
  XNOR2X1M U36 ( .A(ratio[6]), .B(n7), .Y(N15) );
  NOR3X1M U37 ( .A(ratio[6]), .B(ratio[7]), .C(n7), .Y(N17) );
  OAI21X1M U38 ( .A0(ratio[6]), .A1(n7), .B0(ratio[7]), .Y(n8) );
  NAND2BX1M U39 ( .AN(N17), .B(n8), .Y(N16) );
  XNOR2X1M U40 ( .A(N12), .B(Counter[2]), .Y(n38) );
  NOR2X1M U41 ( .A(n39), .B(N10), .Y(n9) );
  OAI22X1M U42 ( .A0(Counter[1]), .A1(n9), .B0(n9), .B1(n2), .Y(n37) );
  CLKNAND2X2M U43 ( .A(N10), .B(n39), .Y(n29) );
  AOI22X1M U44 ( .A0(n29), .A1(n2), .B0(n29), .B1(Counter[1]), .Y(n30) );
  NOR3X1M U45 ( .A(n30), .B(N17), .C(Counter[7]), .Y(n36) );
  CLKXOR2X2M U46 ( .A(N13), .B(Counter[3]), .Y(n34) );
  CLKXOR2X2M U47 ( .A(N14), .B(Counter[4]), .Y(n33) );
  CLKXOR2X2M U48 ( .A(N15), .B(Counter[5]), .Y(n32) );
  CLKXOR2X2M U49 ( .A(N16), .B(Counter[6]), .Y(n31) );
  NOR4X1M U50 ( .A(n34), .B(n33), .C(n32), .D(n31), .Y(n35) );
  NOR2BX1M U51 ( .AN(Counter[0]), .B(ratio[1]), .Y(n40) );
  OAI2B2X1M U52 ( .A1N(ratio[2]), .A0(n40), .B0(Counter[1]), .B1(n40), .Y(n44)
         );
  XNOR2X1M U53 ( .A(ratio[3]), .B(Counter[2]), .Y(n43) );
  NOR2BX1M U54 ( .AN(ratio[1]), .B(Counter[0]), .Y(n41) );
  OAI2B2X1M U55 ( .A1N(Counter[1]), .A0(n41), .B0(ratio[2]), .B1(n41), .Y(n42)
         );
  NAND4BX1M U56 ( .AN(Counter[7]), .B(n44), .C(n43), .D(n42), .Y(n50) );
  XNOR2X1M U57 ( .A(ratio[7]), .B(Counter[6]), .Y(n48) );
  XNOR2X1M U58 ( .A(ratio[6]), .B(Counter[5]), .Y(n47) );
  XNOR2X1M U59 ( .A(ratio[5]), .B(Counter[4]), .Y(n46) );
  XNOR2X1M U60 ( .A(ratio[4]), .B(Counter[3]), .Y(n45) );
  NAND4X1M U61 ( .A(n48), .B(n47), .C(n46), .D(n45), .Y(n49) );
  NOR2X1M U62 ( .A(n50), .B(n49), .Y(N21) );
endmodule


module RST_SYNC_STAGES2_0 ( clk, rst, sync_rst );
  input clk, rst;
  output sync_rst;
  wire   \shift_reg[1] ;

  DFFRQX2M \shift_reg_reg[0]  ( .D(\shift_reg[1] ), .CK(clk), .RN(rst), .Q(
        sync_rst) );
  DFFRQX2M \shift_reg_reg[1]  ( .D(1'b1), .CK(clk), .RN(rst), .Q(
        \shift_reg[1] ) );
endmodule


module RST_SYNC_STAGES2_1 ( clk, rst, sync_rst );
  input clk, rst;
  output sync_rst;
  wire   \shift_reg[1] ;

  DFFRQX2M \shift_reg_reg[0]  ( .D(\shift_reg[1] ), .CK(clk), .RN(rst), .Q(
        sync_rst) );
  DFFRQX2M \shift_reg_reg[1]  ( .D(1'b1), .CK(clk), .RN(rst), .Q(
        \shift_reg[1] ) );
endmodule


module RegFile_DW8_DEPTH8_REG_FILE_ADDRW4 ( WrData, Address, WrEn, RdEn, CLK, 
        RST, RdData, REG0, REG1, REG2, REG3, RdDataValid );
  input [7:0] WrData;
  input [3:0] Address;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input WrEn, RdEn, CLK, RST;
  output RdDataValid;
  wire   N9, N10, N11, \mem[4][7] , \mem[4][6] , \mem[4][5] , \mem[4][4] ,
         \mem[4][3] , \mem[4][2] , \mem[4][1] , \mem[4][0] , \mem[5][7] ,
         \mem[5][6] , \mem[5][5] , \mem[5][4] , \mem[5][3] , \mem[5][2] ,
         \mem[5][1] , \mem[5][0] , \mem[6][7] , \mem[6][6] , \mem[6][5] ,
         \mem[6][4] , \mem[6][3] , \mem[6][2] , \mem[6][1] , \mem[6][0] ,
         \mem[7][7] , \mem[7][6] , \mem[7][5] , \mem[7][4] , \mem[7][3] ,
         \mem[7][2] , \mem[7][1] , \mem[7][0] , N15, N16, N17, N18, N19, N20,
         N21, N22, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125;
  assign N9 = Address[0];
  assign N10 = Address[1];
  assign N11 = Address[2];

  DFFRQX2M \RdData_reg[7]  ( .D(n30), .CK(CLK), .RN(n110), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n29), .CK(CLK), .RN(n110), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n28), .CK(CLK), .RN(n110), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n27), .CK(CLK), .RN(n110), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n26), .CK(CLK), .RN(n110), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n25), .CK(CLK), .RN(n111), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n24), .CK(CLK), .RN(n110), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n23), .CK(CLK), .RN(n112), .Q(RdData[0]) );
  DFFRQX2M \mem_reg[5][7]  ( .D(n55), .CK(CLK), .RN(n112), .Q(\mem[5][7] ) );
  DFFRQX2M \mem_reg[5][6]  ( .D(n54), .CK(CLK), .RN(n112), .Q(\mem[5][6] ) );
  DFFRQX2M \mem_reg[5][5]  ( .D(n53), .CK(CLK), .RN(n112), .Q(\mem[5][5] ) );
  DFFRQX2M \mem_reg[5][4]  ( .D(n52), .CK(CLK), .RN(n112), .Q(\mem[5][4] ) );
  DFFRQX2M \mem_reg[5][3]  ( .D(n51), .CK(CLK), .RN(n112), .Q(\mem[5][3] ) );
  DFFRQX2M \mem_reg[5][2]  ( .D(n50), .CK(CLK), .RN(n112), .Q(\mem[5][2] ) );
  DFFRQX2M \mem_reg[5][1]  ( .D(n49), .CK(CLK), .RN(n111), .Q(\mem[5][1] ) );
  DFFRQX2M \mem_reg[5][0]  ( .D(n48), .CK(CLK), .RN(n111), .Q(\mem[5][0] ) );
  DFFRQX2M \mem_reg[7][7]  ( .D(n39), .CK(CLK), .RN(n111), .Q(\mem[7][7] ) );
  DFFRQX2M \mem_reg[7][6]  ( .D(n38), .CK(CLK), .RN(n111), .Q(\mem[7][6] ) );
  DFFRQX2M \mem_reg[7][5]  ( .D(n37), .CK(CLK), .RN(n111), .Q(\mem[7][5] ) );
  DFFRQX2M \mem_reg[7][4]  ( .D(n36), .CK(CLK), .RN(n110), .Q(\mem[7][4] ) );
  DFFRQX2M \mem_reg[7][3]  ( .D(n35), .CK(CLK), .RN(n110), .Q(\mem[7][3] ) );
  DFFRQX2M \mem_reg[7][2]  ( .D(n34), .CK(CLK), .RN(n110), .Q(\mem[7][2] ) );
  DFFRQX2M \mem_reg[7][1]  ( .D(n33), .CK(CLK), .RN(n110), .Q(\mem[7][1] ) );
  DFFRQX2M \mem_reg[7][0]  ( .D(n32), .CK(CLK), .RN(n111), .Q(\mem[7][0] ) );
  DFFRQX2M \mem_reg[6][7]  ( .D(n47), .CK(CLK), .RN(n111), .Q(\mem[6][7] ) );
  DFFRQX2M \mem_reg[6][6]  ( .D(n46), .CK(CLK), .RN(n111), .Q(\mem[6][6] ) );
  DFFRQX2M \mem_reg[6][5]  ( .D(n45), .CK(CLK), .RN(n111), .Q(\mem[6][5] ) );
  DFFRQX2M \mem_reg[6][4]  ( .D(n44), .CK(CLK), .RN(n111), .Q(\mem[6][4] ) );
  DFFRQX2M \mem_reg[6][3]  ( .D(n43), .CK(CLK), .RN(n111), .Q(\mem[6][3] ) );
  DFFRQX2M \mem_reg[6][2]  ( .D(n42), .CK(CLK), .RN(n111), .Q(\mem[6][2] ) );
  DFFRQX2M \mem_reg[6][1]  ( .D(n41), .CK(CLK), .RN(n111), .Q(\mem[6][1] ) );
  DFFRQX2M \mem_reg[6][0]  ( .D(n40), .CK(CLK), .RN(n111), .Q(\mem[6][0] ) );
  DFFRQX2M \mem_reg[4][7]  ( .D(n63), .CK(CLK), .RN(n112), .Q(\mem[4][7] ) );
  DFFRQX2M \mem_reg[4][6]  ( .D(n62), .CK(CLK), .RN(n112), .Q(\mem[4][6] ) );
  DFFRQX2M \mem_reg[4][5]  ( .D(n61), .CK(CLK), .RN(n112), .Q(\mem[4][5] ) );
  DFFRQX2M \mem_reg[4][4]  ( .D(n60), .CK(CLK), .RN(n112), .Q(\mem[4][4] ) );
  DFFRQX2M \mem_reg[4][3]  ( .D(n59), .CK(CLK), .RN(n112), .Q(\mem[4][3] ) );
  DFFRQX2M \mem_reg[4][2]  ( .D(n58), .CK(CLK), .RN(n112), .Q(\mem[4][2] ) );
  DFFRQX2M \mem_reg[4][1]  ( .D(n57), .CK(CLK), .RN(n112), .Q(\mem[4][1] ) );
  DFFRQX2M \mem_reg[4][0]  ( .D(n56), .CK(CLK), .RN(n112), .Q(\mem[4][0] ) );
  DFFRQX2M RdDataValid_reg ( .D(n31), .CK(CLK), .RN(n110), .Q(RdDataValid) );
  DFFRQX2M \mem_reg[2][1]  ( .D(n73), .CK(CLK), .RN(n113), .Q(REG2[1]) );
  DFFSQX2M \mem_reg[2][0]  ( .D(n72), .CK(CLK), .SN(n110), .Q(REG2[0]) );
  DFFRQX2M \mem_reg[3][3]  ( .D(n67), .CK(CLK), .RN(n113), .Q(REG3[3]) );
  DFFRQX2M \mem_reg[3][0]  ( .D(n64), .CK(CLK), .RN(n113), .Q(REG3[0]) );
  DFFRQX2M \mem_reg[3][2]  ( .D(n66), .CK(CLK), .RN(n113), .Q(REG3[2]) );
  DFFSQX2M \mem_reg[3][5]  ( .D(n69), .CK(CLK), .SN(n110), .Q(REG3[5]) );
  DFFRQX2M \mem_reg[3][7]  ( .D(n71), .CK(CLK), .RN(n113), .Q(REG3[7]) );
  DFFRQX2M \mem_reg[3][4]  ( .D(n68), .CK(CLK), .RN(n113), .Q(REG3[4]) );
  DFFRQX2M \mem_reg[3][6]  ( .D(n70), .CK(CLK), .RN(n113), .Q(REG3[6]) );
  DFFRQX2M \mem_reg[2][4]  ( .D(n76), .CK(CLK), .RN(n113), .Q(REG2[4]) );
  DFFRQX2M \mem_reg[3][1]  ( .D(n65), .CK(CLK), .RN(n113), .Q(REG3[1]) );
  DFFRQX2M \mem_reg[2][2]  ( .D(n74), .CK(CLK), .RN(n113), .Q(REG2[2]) );
  DFFRQX2M \mem_reg[2][3]  ( .D(n75), .CK(CLK), .RN(n113), .Q(REG2[3]) );
  DFFSQX2M \mem_reg[2][7]  ( .D(n79), .CK(CLK), .SN(n110), .Q(REG2[7]) );
  DFFRQX2M \mem_reg[2][6]  ( .D(n78), .CK(CLK), .RN(n113), .Q(REG2[6]) );
  DFFRQX2M \mem_reg[2][5]  ( .D(n77), .CK(CLK), .RN(n113), .Q(REG2[5]) );
  DFFRQX2M \mem_reg[0][0]  ( .D(n88), .CK(CLK), .RN(n114), .Q(REG0[0]) );
  DFFRQX2M \mem_reg[0][1]  ( .D(n89), .CK(CLK), .RN(n114), .Q(REG0[1]) );
  DFFRQX2M \mem_reg[0][2]  ( .D(n90), .CK(CLK), .RN(n114), .Q(REG0[2]) );
  DFFRQX2M \mem_reg[0][3]  ( .D(n91), .CK(CLK), .RN(n114), .Q(REG0[3]) );
  DFFRQX2M \mem_reg[0][4]  ( .D(n92), .CK(CLK), .RN(n114), .Q(REG0[4]) );
  DFFRQX2M \mem_reg[0][5]  ( .D(n93), .CK(CLK), .RN(n114), .Q(REG0[5]) );
  DFFRQX2M \mem_reg[0][6]  ( .D(n94), .CK(CLK), .RN(n114), .Q(REG0[6]) );
  DFFRQX2M \mem_reg[0][7]  ( .D(n95), .CK(CLK), .RN(n110), .Q(REG0[7]) );
  DFFRQX2M \mem_reg[1][1]  ( .D(n81), .CK(CLK), .RN(n113), .Q(REG1[1]) );
  DFFRQX2M \mem_reg[1][2]  ( .D(n82), .CK(CLK), .RN(n114), .Q(REG1[2]) );
  DFFRQX2M \mem_reg[1][6]  ( .D(n86), .CK(CLK), .RN(n114), .Q(REG1[6]) );
  DFFRQX2M \mem_reg[1][5]  ( .D(n85), .CK(CLK), .RN(n114), .Q(REG1[5]) );
  DFFRQX2M \mem_reg[1][4]  ( .D(n84), .CK(CLK), .RN(n114), .Q(REG1[4]) );
  DFFRQX2M \mem_reg[1][7]  ( .D(n87), .CK(CLK), .RN(n114), .Q(REG1[7]) );
  DFFRQX2M \mem_reg[1][3]  ( .D(n83), .CK(CLK), .RN(n114), .Q(REG1[3]) );
  DFFRQX2M \mem_reg[1][0]  ( .D(n80), .CK(CLK), .RN(n113), .Q(REG1[0]) );
  NAND3X2M U3 ( .A(n123), .B(n121), .C(n13), .Y(n16) );
  NAND3X2M U4 ( .A(n123), .B(n121), .C(n19), .Y(n22) );
  INVX2M U5 ( .A(RdEn), .Y(n125) );
  BUFX2M U6 ( .A(n108), .Y(n110) );
  BUFX2M U7 ( .A(n108), .Y(n111) );
  BUFX2M U8 ( .A(n108), .Y(n112) );
  BUFX2M U9 ( .A(n109), .Y(n113) );
  BUFX2M U10 ( .A(n109), .Y(n114) );
  BUFX4M U11 ( .A(N9), .Y(n101) );
  NOR2BX2M U12 ( .AN(n17), .B(N11), .Y(n19) );
  INVX2M U13 ( .A(N10), .Y(n121) );
  INVX2M U14 ( .A(N9), .Y(n123) );
  INVX2M U15 ( .A(WrData[0]), .Y(n124) );
  INVX2M U16 ( .A(WrData[1]), .Y(n122) );
  INVX2M U17 ( .A(WrData[2]), .Y(n120) );
  INVX2M U18 ( .A(WrData[3]), .Y(n119) );
  AND2X2M U19 ( .A(N11), .B(n17), .Y(n13) );
  BUFX2M U20 ( .A(n14), .Y(n106) );
  NAND3X2M U21 ( .A(n13), .B(n123), .C(N10), .Y(n14) );
  BUFX2M U22 ( .A(n18), .Y(n104) );
  NAND3X2M U23 ( .A(N10), .B(N9), .C(n19), .Y(n18) );
  BUFX2M U24 ( .A(n20), .Y(n103) );
  NAND3X2M U25 ( .A(N10), .B(n123), .C(n19), .Y(n20) );
  BUFX2M U26 ( .A(n15), .Y(n105) );
  NAND3X2M U27 ( .A(n13), .B(n121), .C(N9), .Y(n15) );
  BUFX2M U28 ( .A(n21), .Y(n102) );
  NAND3X2M U29 ( .A(N9), .B(n121), .C(n19), .Y(n21) );
  BUFX2M U30 ( .A(n12), .Y(n107) );
  NAND3X2M U31 ( .A(N9), .B(n13), .C(N10), .Y(n12) );
  BUFX2M U32 ( .A(RST), .Y(n108) );
  BUFX2M U33 ( .A(RST), .Y(n109) );
  AO22X1M U34 ( .A0(RdData[0]), .A1(n125), .B0(RdEn), .B1(N22), .Y(n23) );
  MX2X2M U35 ( .A(n2), .B(n1), .S0(N11), .Y(N22) );
  MX4X1M U36 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n101), 
        .S1(N10), .Y(n2) );
  MX4X1M U37 ( .A(\mem[4][0] ), .B(\mem[5][0] ), .C(\mem[6][0] ), .D(
        \mem[7][0] ), .S0(n101), .S1(N10), .Y(n1) );
  NOR3BX2M U38 ( .AN(WrEn), .B(Address[3]), .C(RdEn), .Y(n17) );
  OAI2BB2X1M U39 ( .B0(n124), .B1(n22), .A0N(REG0[0]), .A1N(n22), .Y(n88) );
  OAI2BB2X1M U40 ( .B0(n122), .B1(n22), .A0N(REG0[1]), .A1N(n22), .Y(n89) );
  OAI2BB2X1M U41 ( .B0(n120), .B1(n22), .A0N(REG0[2]), .A1N(n22), .Y(n90) );
  OAI2BB2X1M U42 ( .B0(n119), .B1(n22), .A0N(REG0[3]), .A1N(n22), .Y(n91) );
  OAI2BB2X1M U43 ( .B0(n118), .B1(n22), .A0N(REG0[4]), .A1N(n22), .Y(n92) );
  OAI2BB2X1M U44 ( .B0(n117), .B1(n22), .A0N(REG0[5]), .A1N(n22), .Y(n93) );
  OAI2BB2X1M U45 ( .B0(n116), .B1(n22), .A0N(REG0[6]), .A1N(n22), .Y(n94) );
  OAI2BB2X1M U46 ( .B0(n115), .B1(n22), .A0N(REG0[7]), .A1N(n22), .Y(n95) );
  OAI2BB2X1M U47 ( .B0(n124), .B1(n16), .A0N(\mem[4][0] ), .A1N(n16), .Y(n56)
         );
  OAI2BB2X1M U48 ( .B0(n122), .B1(n16), .A0N(\mem[4][1] ), .A1N(n16), .Y(n57)
         );
  OAI2BB2X1M U49 ( .B0(n120), .B1(n16), .A0N(\mem[4][2] ), .A1N(n16), .Y(n58)
         );
  OAI2BB2X1M U50 ( .B0(n119), .B1(n16), .A0N(\mem[4][3] ), .A1N(n16), .Y(n59)
         );
  OAI2BB2X1M U51 ( .B0(n118), .B1(n16), .A0N(\mem[4][4] ), .A1N(n16), .Y(n60)
         );
  OAI2BB2X1M U52 ( .B0(n117), .B1(n16), .A0N(\mem[4][5] ), .A1N(n16), .Y(n61)
         );
  OAI2BB2X1M U53 ( .B0(n116), .B1(n16), .A0N(\mem[4][6] ), .A1N(n16), .Y(n62)
         );
  OAI2BB2X1M U54 ( .B0(n115), .B1(n16), .A0N(\mem[4][7] ), .A1N(n16), .Y(n63)
         );
  INVX2M U55 ( .A(WrData[4]), .Y(n118) );
  INVX2M U56 ( .A(WrData[5]), .Y(n117) );
  INVX2M U57 ( .A(WrData[6]), .Y(n116) );
  INVX2M U58 ( .A(WrData[7]), .Y(n115) );
  OAI2BB2X1M U59 ( .B0(n124), .B1(n106), .A0N(\mem[6][0] ), .A1N(n106), .Y(n40) );
  OAI2BB2X1M U60 ( .B0(n122), .B1(n106), .A0N(\mem[6][1] ), .A1N(n106), .Y(n41) );
  OAI2BB2X1M U61 ( .B0(n120), .B1(n106), .A0N(\mem[6][2] ), .A1N(n106), .Y(n42) );
  OAI2BB2X1M U62 ( .B0(n119), .B1(n106), .A0N(\mem[6][3] ), .A1N(n106), .Y(n43) );
  OAI2BB2X1M U63 ( .B0(n118), .B1(n106), .A0N(\mem[6][4] ), .A1N(n106), .Y(n44) );
  OAI2BB2X1M U64 ( .B0(n117), .B1(n106), .A0N(\mem[6][5] ), .A1N(n106), .Y(n45) );
  OAI2BB2X1M U65 ( .B0(n116), .B1(n106), .A0N(\mem[6][6] ), .A1N(n106), .Y(n46) );
  OAI2BB2X1M U66 ( .B0(n115), .B1(n106), .A0N(\mem[6][7] ), .A1N(n106), .Y(n47) );
  OAI2BB2X1M U67 ( .B0(n124), .B1(n105), .A0N(\mem[5][0] ), .A1N(n105), .Y(n48) );
  OAI2BB2X1M U68 ( .B0(n122), .B1(n105), .A0N(\mem[5][1] ), .A1N(n105), .Y(n49) );
  OAI2BB2X1M U69 ( .B0(n120), .B1(n105), .A0N(\mem[5][2] ), .A1N(n105), .Y(n50) );
  OAI2BB2X1M U70 ( .B0(n119), .B1(n105), .A0N(\mem[5][3] ), .A1N(n105), .Y(n51) );
  OAI2BB2X1M U71 ( .B0(n118), .B1(n105), .A0N(\mem[5][4] ), .A1N(n105), .Y(n52) );
  OAI2BB2X1M U72 ( .B0(n117), .B1(n105), .A0N(\mem[5][5] ), .A1N(n105), .Y(n53) );
  OAI2BB2X1M U73 ( .B0(n116), .B1(n105), .A0N(\mem[5][6] ), .A1N(n105), .Y(n54) );
  OAI2BB2X1M U74 ( .B0(n115), .B1(n105), .A0N(\mem[5][7] ), .A1N(n105), .Y(n55) );
  OAI2BB2X1M U75 ( .B0(n124), .B1(n104), .A0N(REG3[0]), .A1N(n104), .Y(n64) );
  OAI2BB2X1M U76 ( .B0(n122), .B1(n104), .A0N(REG3[1]), .A1N(n104), .Y(n65) );
  OAI2BB2X1M U77 ( .B0(n120), .B1(n104), .A0N(REG3[2]), .A1N(n104), .Y(n66) );
  OAI2BB2X1M U78 ( .B0(n119), .B1(n104), .A0N(REG3[3]), .A1N(n104), .Y(n67) );
  OAI2BB2X1M U79 ( .B0(n118), .B1(n104), .A0N(REG3[4]), .A1N(n104), .Y(n68) );
  OAI2BB2X1M U80 ( .B0(n116), .B1(n104), .A0N(REG3[6]), .A1N(n104), .Y(n70) );
  OAI2BB2X1M U81 ( .B0(n115), .B1(n104), .A0N(REG3[7]), .A1N(n104), .Y(n71) );
  OAI2BB2X1M U82 ( .B0(n122), .B1(n103), .A0N(REG2[1]), .A1N(n103), .Y(n73) );
  OAI2BB2X1M U83 ( .B0(n120), .B1(n103), .A0N(REG2[2]), .A1N(n103), .Y(n74) );
  OAI2BB2X1M U84 ( .B0(n119), .B1(n103), .A0N(REG2[3]), .A1N(n103), .Y(n75) );
  OAI2BB2X1M U85 ( .B0(n118), .B1(n103), .A0N(REG2[4]), .A1N(n103), .Y(n76) );
  OAI2BB2X1M U86 ( .B0(n117), .B1(n103), .A0N(REG2[5]), .A1N(n103), .Y(n77) );
  OAI2BB2X1M U87 ( .B0(n116), .B1(n103), .A0N(REG2[6]), .A1N(n103), .Y(n78) );
  OAI2BB2X1M U88 ( .B0(n124), .B1(n102), .A0N(REG1[0]), .A1N(n102), .Y(n80) );
  OAI2BB2X1M U89 ( .B0(n122), .B1(n102), .A0N(REG1[1]), .A1N(n102), .Y(n81) );
  OAI2BB2X1M U90 ( .B0(n120), .B1(n102), .A0N(REG1[2]), .A1N(n102), .Y(n82) );
  OAI2BB2X1M U91 ( .B0(n119), .B1(n102), .A0N(REG1[3]), .A1N(n102), .Y(n83) );
  OAI2BB2X1M U92 ( .B0(n118), .B1(n102), .A0N(REG1[4]), .A1N(n102), .Y(n84) );
  OAI2BB2X1M U93 ( .B0(n117), .B1(n102), .A0N(REG1[5]), .A1N(n102), .Y(n85) );
  OAI2BB2X1M U94 ( .B0(n116), .B1(n102), .A0N(REG1[6]), .A1N(n102), .Y(n86) );
  OAI2BB2X1M U95 ( .B0(n115), .B1(n102), .A0N(REG1[7]), .A1N(n102), .Y(n87) );
  OAI2BB2X1M U96 ( .B0(n107), .B1(n124), .A0N(\mem[7][0] ), .A1N(n107), .Y(n32) );
  OAI2BB2X1M U97 ( .B0(n107), .B1(n122), .A0N(\mem[7][1] ), .A1N(n107), .Y(n33) );
  OAI2BB2X1M U98 ( .B0(n107), .B1(n120), .A0N(\mem[7][2] ), .A1N(n107), .Y(n34) );
  OAI2BB2X1M U99 ( .B0(n107), .B1(n119), .A0N(\mem[7][3] ), .A1N(n107), .Y(n35) );
  OAI2BB2X1M U100 ( .B0(n107), .B1(n118), .A0N(\mem[7][4] ), .A1N(n107), .Y(
        n36) );
  OAI2BB2X1M U101 ( .B0(n107), .B1(n117), .A0N(\mem[7][5] ), .A1N(n107), .Y(
        n37) );
  OAI2BB2X1M U102 ( .B0(n107), .B1(n116), .A0N(\mem[7][6] ), .A1N(n107), .Y(
        n38) );
  OAI2BB2X1M U103 ( .B0(n107), .B1(n115), .A0N(\mem[7][7] ), .A1N(n107), .Y(
        n39) );
  OAI2BB2X1M U104 ( .B0(n117), .B1(n104), .A0N(REG3[5]), .A1N(n104), .Y(n69)
         );
  OAI2BB2X1M U105 ( .B0(n124), .B1(n103), .A0N(REG2[0]), .A1N(n103), .Y(n72)
         );
  OAI2BB2X1M U106 ( .B0(n115), .B1(n103), .A0N(REG2[7]), .A1N(n103), .Y(n79)
         );
  AO22X1M U107 ( .A0(RdData[1]), .A1(n125), .B0(N21), .B1(RdEn), .Y(n24) );
  MX2X2M U108 ( .A(n4), .B(n3), .S0(N11), .Y(N21) );
  MX4X1M U109 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n101), 
        .S1(N10), .Y(n4) );
  MX4X1M U110 ( .A(\mem[4][1] ), .B(\mem[5][1] ), .C(\mem[6][1] ), .D(
        \mem[7][1] ), .S0(n101), .S1(N10), .Y(n3) );
  AO22X1M U111 ( .A0(RdData[2]), .A1(n125), .B0(N20), .B1(RdEn), .Y(n25) );
  MX2X2M U112 ( .A(n6), .B(n5), .S0(N11), .Y(N20) );
  MX4X1M U113 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n101), 
        .S1(N10), .Y(n6) );
  MX4X1M U114 ( .A(\mem[4][2] ), .B(\mem[5][2] ), .C(\mem[6][2] ), .D(
        \mem[7][2] ), .S0(n101), .S1(N10), .Y(n5) );
  AO22X1M U115 ( .A0(RdData[3]), .A1(n125), .B0(N19), .B1(RdEn), .Y(n26) );
  MX2X2M U116 ( .A(n8), .B(n7), .S0(N11), .Y(N19) );
  MX4X1M U117 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n101), 
        .S1(N10), .Y(n8) );
  MX4X1M U118 ( .A(\mem[4][3] ), .B(\mem[5][3] ), .C(\mem[6][3] ), .D(
        \mem[7][3] ), .S0(n101), .S1(N10), .Y(n7) );
  AO22X1M U119 ( .A0(RdData[4]), .A1(n125), .B0(N18), .B1(RdEn), .Y(n27) );
  MX2X2M U120 ( .A(n10), .B(n9), .S0(N11), .Y(N18) );
  MX4X1M U121 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n101), 
        .S1(N10), .Y(n10) );
  MX4X1M U122 ( .A(\mem[4][4] ), .B(\mem[5][4] ), .C(\mem[6][4] ), .D(
        \mem[7][4] ), .S0(n101), .S1(N10), .Y(n9) );
  AO22X1M U123 ( .A0(RdData[5]), .A1(n125), .B0(N17), .B1(RdEn), .Y(n28) );
  MX2X2M U124 ( .A(n96), .B(n11), .S0(N11), .Y(N17) );
  MX4X1M U125 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n101), 
        .S1(N10), .Y(n96) );
  MX4X1M U126 ( .A(\mem[4][5] ), .B(\mem[5][5] ), .C(\mem[6][5] ), .D(
        \mem[7][5] ), .S0(n101), .S1(N10), .Y(n11) );
  AO22X1M U127 ( .A0(RdData[6]), .A1(n125), .B0(N16), .B1(RdEn), .Y(n29) );
  MX2X2M U128 ( .A(n98), .B(n97), .S0(N11), .Y(N16) );
  MX4X1M U129 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n101), 
        .S1(N10), .Y(n98) );
  MX4X1M U130 ( .A(\mem[4][6] ), .B(\mem[5][6] ), .C(\mem[6][6] ), .D(
        \mem[7][6] ), .S0(n101), .S1(N10), .Y(n97) );
  AO22X1M U131 ( .A0(RdData[7]), .A1(n125), .B0(N15), .B1(RdEn), .Y(n30) );
  MX2X2M U132 ( .A(n100), .B(n99), .S0(N11), .Y(N15) );
  MX4X1M U133 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n101), 
        .S1(N10), .Y(n100) );
  MX4X1M U134 ( .A(\mem[4][7] ), .B(\mem[5][7] ), .C(\mem[6][7] ), .D(
        \mem[7][7] ), .S0(n101), .S1(N10), .Y(n99) );
  OAI2BB1X2M U135 ( .A0N(WrEn), .A1N(RdDataValid), .B0(n125), .Y(n31) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH8_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  INVX2M U26 ( .A(b[6]), .Y(n12) );
  XNOR2X2M U27 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U28 ( .A(b[3]), .Y(n15) );
  INVX2M U29 ( .A(b[4]), .Y(n14) );
  INVX2M U30 ( .A(b[5]), .Y(n13) );
  INVX2M U31 ( .A(b[1]), .Y(n17) );
  INVX2M U32 ( .A(b[2]), .Y(n16) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [8:0] carry;

  XOR3XLM U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .Y(DIFF[7]) );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:1] carry;

  XOR3XLM U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH8_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][0] , \ab[6][1] , \ab[6][0] , \ab[5][2] , \ab[5][1] ,
         \ab[5][0] , \ab[4][3] , \ab[4][2] , \ab[4][1] , \ab[4][0] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][5] , \ab[2][4] , \ab[2][3] , \ab[2][2] , \ab[2][1] ,
         \ab[2][0] , \ab[1][6] , \ab[1][5] , \ab[1][4] , \ab[1][3] ,
         \ab[1][2] , \ab[1][1] , \ab[1][0] , \ab[0][7] , \ab[0][6] ,
         \ab[0][5] , \ab[0][4] , \ab[0][3] , \ab[0][2] , \ab[0][1] ,
         \CARRYB[6][0] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][3] , \CARRYB[3][2] ,
         \CARRYB[3][1] , \CARRYB[3][0] , \CARRYB[2][4] , \CARRYB[2][3] ,
         \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] , \SUMB[6][1] ,
         \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] , \SUMB[3][1] , \SUMB[2][5] ,
         \SUMB[2][4] , \SUMB[2][3] , \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] ,
         \SUMB[1][5] , \SUMB[1][4] , \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] ,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29;

  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  XOR3XLM S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .C(\SUMB[3][4] ), .Y(
        \SUMB[4][3] ) );
  XOR3XLM S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .C(\SUMB[4][3] ), .Y(
        \SUMB[5][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  XOR3XLM S2_2_5 ( .A(\ab[2][5] ), .B(n8), .C(\SUMB[1][6] ), .Y(\SUMB[2][5] )
         );
  XOR3XLM S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .C(\SUMB[2][5] ), .Y(
        \SUMB[3][4] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n6), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n5), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  XOR3XLM S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .C(\SUMB[5][2] ), .Y(
        \SUMB[6][1] ) );
  XOR3XLM S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .C(\SUMB[6][1] ), .Y(
        PRODUCT[7]) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(PRODUCT[6]) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(PRODUCT[5]) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(PRODUCT[4]) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(PRODUCT[3]) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n7), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(PRODUCT[2]) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n3), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  AND2X2M U2 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n7) );
  INVX2M U7 ( .A(\ab[0][6] ), .Y(n13) );
  INVX2M U8 ( .A(\ab[0][3] ), .Y(n10) );
  INVX2M U9 ( .A(\ab[0][2] ), .Y(n9) );
  INVX2M U10 ( .A(\ab[0][4] ), .Y(n11) );
  INVX2M U11 ( .A(\ab[0][5] ), .Y(n12) );
  AND2X2M U12 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  CLKXOR2X2M U13 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U14 ( .A(\ab[1][2] ), .B(n10), .Y(\SUMB[1][2] ) );
  XNOR2X2M U15 ( .A(\ab[1][1] ), .B(n9), .Y(\SUMB[1][1] ) );
  INVX2M U16 ( .A(A[7]), .Y(n14) );
  CLKXOR2X2M U17 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XNOR2X2M U18 ( .A(\ab[1][3] ), .B(n11), .Y(\SUMB[1][3] ) );
  XNOR2X2M U19 ( .A(\ab[1][5] ), .B(n13), .Y(\SUMB[1][5] ) );
  XNOR2X2M U20 ( .A(\ab[1][4] ), .B(n12), .Y(\SUMB[1][4] ) );
  INVX2M U21 ( .A(A[0]), .Y(n21) );
  INVX2M U22 ( .A(A[1]), .Y(n20) );
  INVX2M U23 ( .A(A[2]), .Y(n19) );
  INVX2M U24 ( .A(A[3]), .Y(n18) );
  INVX2M U25 ( .A(B[6]), .Y(n23) );
  INVX2M U26 ( .A(A[4]), .Y(n17) );
  INVX2M U27 ( .A(A[6]), .Y(n15) );
  INVX2M U28 ( .A(A[5]), .Y(n16) );
  INVX2M U29 ( .A(B[2]), .Y(n27) );
  INVX2M U30 ( .A(B[3]), .Y(n26) );
  INVX2M U31 ( .A(B[0]), .Y(n29) );
  INVX2M U32 ( .A(B[1]), .Y(n28) );
  INVX2M U33 ( .A(B[4]), .Y(n25) );
  INVX2M U34 ( .A(B[5]), .Y(n24) );
  INVX2M U35 ( .A(B[7]), .Y(n22) );
  NOR2X1M U36 ( .A(n14), .B(n29), .Y(\ab[7][0] ) );
  NOR2X1M U37 ( .A(n28), .B(n15), .Y(\ab[6][1] ) );
  NOR2X1M U38 ( .A(n29), .B(n15), .Y(\ab[6][0] ) );
  NOR2X1M U39 ( .A(n27), .B(n16), .Y(\ab[5][2] ) );
  NOR2X1M U40 ( .A(n28), .B(n16), .Y(\ab[5][1] ) );
  NOR2X1M U41 ( .A(n29), .B(n16), .Y(\ab[5][0] ) );
  NOR2X1M U42 ( .A(n26), .B(n17), .Y(\ab[4][3] ) );
  NOR2X1M U43 ( .A(n27), .B(n17), .Y(\ab[4][2] ) );
  NOR2X1M U44 ( .A(n28), .B(n17), .Y(\ab[4][1] ) );
  NOR2X1M U45 ( .A(n29), .B(n17), .Y(\ab[4][0] ) );
  NOR2X1M U46 ( .A(n25), .B(n18), .Y(\ab[3][4] ) );
  NOR2X1M U47 ( .A(n26), .B(n18), .Y(\ab[3][3] ) );
  NOR2X1M U48 ( .A(n27), .B(n18), .Y(\ab[3][2] ) );
  NOR2X1M U49 ( .A(n28), .B(n18), .Y(\ab[3][1] ) );
  NOR2X1M U50 ( .A(n29), .B(n18), .Y(\ab[3][0] ) );
  NOR2X1M U51 ( .A(n24), .B(n19), .Y(\ab[2][5] ) );
  NOR2X1M U52 ( .A(n25), .B(n19), .Y(\ab[2][4] ) );
  NOR2X1M U53 ( .A(n26), .B(n19), .Y(\ab[2][3] ) );
  NOR2X1M U54 ( .A(n27), .B(n19), .Y(\ab[2][2] ) );
  NOR2X1M U55 ( .A(n28), .B(n19), .Y(\ab[2][1] ) );
  NOR2X1M U56 ( .A(n29), .B(n19), .Y(\ab[2][0] ) );
  NOR2X1M U57 ( .A(n23), .B(n20), .Y(\ab[1][6] ) );
  NOR2X1M U58 ( .A(n24), .B(n20), .Y(\ab[1][5] ) );
  NOR2X1M U59 ( .A(n25), .B(n20), .Y(\ab[1][4] ) );
  NOR2X1M U60 ( .A(n26), .B(n20), .Y(\ab[1][3] ) );
  NOR2X1M U61 ( .A(n27), .B(n20), .Y(\ab[1][2] ) );
  NOR2X1M U62 ( .A(n28), .B(n20), .Y(\ab[1][1] ) );
  NOR2X1M U63 ( .A(n29), .B(n20), .Y(\ab[1][0] ) );
  NOR2X1M U64 ( .A(n22), .B(n21), .Y(\ab[0][7] ) );
  NOR2X1M U65 ( .A(n23), .B(n21), .Y(\ab[0][6] ) );
  NOR2X1M U66 ( .A(n24), .B(n21), .Y(\ab[0][5] ) );
  NOR2X1M U67 ( .A(n25), .B(n21), .Y(\ab[0][4] ) );
  NOR2X1M U68 ( .A(n26), .B(n21), .Y(\ab[0][3] ) );
  NOR2X1M U69 ( .A(n27), .B(n21), .Y(\ab[0][2] ) );
  NOR2X1M U70 ( .A(n28), .B(n21), .Y(\ab[0][1] ) );
  NOR2X1M U71 ( .A(n29), .B(n21), .Y(PRODUCT[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH8 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, 
        OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [7:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N147, N148, N149, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134;
  wire   [7:0] ALU_OUT_Comb;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7;

  ALU_OPER_WIDTH8_OUT_WIDTH8_DW_div_uns_0 div_52 ( .a({n12, n11, n10, n9, n8, 
        n7, n6, n5}), .b({B[7], n4, B[5:0]}), .quotient({N122, N121, N120, 
        N119, N118, N117, N116, N115}) );
  ALU_OPER_WIDTH8_OUT_WIDTH8_DW01_sub_0 sub_46 ( .A({n12, n11, n10, n9, n8, n7, 
        n6, n5}), .B({B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N106, N105, N104, 
        N103, N102, N101, N100, N99}) );
  ALU_OPER_WIDTH8_OUT_WIDTH8_DW01_add_0 add_43 ( .A({n12, n11, n10, n9, n8, n7, 
        n6, n5}), .B({B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  ALU_OPER_WIDTH8_OUT_WIDTH8_DW02_mult_0 mult_49 ( .A({n12, n11, n10, n9, n8, 
        n7, n6, n5}), .B({B[7], n4, B[5:0]}), .TC(1'b0), .PRODUCT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, N114, N113, N112, 
        N111, N110, N109, N108, N107}) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  BUFX2M U3 ( .A(A[6]), .Y(n11) );
  OAI21X2M U4 ( .A0(n93), .A1(n94), .B0(n95), .Y(n40) );
  OAI21X2M U7 ( .A0(n81), .A1(n99), .B0(n95), .Y(n39) );
  NOR2BX2M U8 ( .AN(n100), .B(n93), .Y(n44) );
  NOR2BX2M U9 ( .AN(n100), .B(n99), .Y(n43) );
  BUFX2M U10 ( .A(n32), .Y(n14) );
  NOR2X2M U11 ( .A(n93), .B(n81), .Y(n32) );
  BUFX2M U12 ( .A(n33), .Y(n13) );
  NOR2X2M U13 ( .A(n94), .B(n99), .Y(n33) );
  INVX2M U14 ( .A(n94), .Y(n131) );
  INVX2M U15 ( .A(n86), .Y(n130) );
  AND4X2M U16 ( .A(N149), .B(n131), .C(n3), .D(n133), .Y(n85) );
  NOR3X2M U17 ( .A(n132), .B(ALU_FUN[2]), .C(n93), .Y(n42) );
  NOR3X2M U18 ( .A(n132), .B(ALU_FUN[2]), .C(n99), .Y(n41) );
  NAND3BX2M U19 ( .AN(n81), .B(n133), .C(n3), .Y(n37) );
  NOR2X2M U20 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n100) );
  AND3X2M U21 ( .A(n100), .B(n133), .C(n3), .Y(n38) );
  NAND2X2M U22 ( .A(ALU_FUN[2]), .B(n132), .Y(n94) );
  NAND2X2M U23 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n81) );
  INVX2M U24 ( .A(ALU_FUN[1]), .Y(n132) );
  OR2X2M U25 ( .A(n3), .B(ALU_FUN[0]), .Y(n93) );
  OR2X2M U26 ( .A(n3), .B(n133), .Y(n99) );
  NAND3X2M U27 ( .A(n3), .B(ALU_FUN[0]), .C(n131), .Y(n86) );
  INVX2M U28 ( .A(ALU_FUN[0]), .Y(n133) );
  NAND3X2M U29 ( .A(n100), .B(ALU_FUN[0]), .C(n3), .Y(n95) );
  INVX2M U30 ( .A(EN), .Y(n134) );
  AOI31X2M U31 ( .A0(n87), .A1(n88), .A2(n89), .B0(n134), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U32 ( .A0(N99), .A1(n43), .B0(N91), .B1(n44), .Y(n87) );
  AOI211X2M U33 ( .A0(n14), .A1(n126), .B0(n90), .C0(n91), .Y(n89) );
  AOI222X1M U34 ( .A0(N107), .A1(n42), .B0(n5), .B1(n13), .C0(N115), .C1(n41), 
        .Y(n88) );
  AOI31X2M U35 ( .A0(n75), .A1(n76), .A2(n77), .B0(n134), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U36 ( .A0(N92), .A1(n44), .B0(N108), .B1(n42), .C0(N100), .C1(n43), 
        .Y(n75) );
  AOI211X2M U37 ( .A0(n7), .A1(n130), .B0(n78), .C0(n79), .Y(n77) );
  AOI222X1M U38 ( .A0(N116), .A1(n41), .B0(n14), .B1(n125), .C0(n6), .C1(n13), 
        .Y(n76) );
  AOI31X2M U39 ( .A0(n69), .A1(n70), .A2(n71), .B0(n134), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U40 ( .A0(N101), .A1(n43), .B0(N93), .B1(n44), .Y(n69) );
  AOI221XLM U41 ( .A0(n8), .A1(n130), .B0(n14), .B1(n124), .C0(n72), .Y(n71)
         );
  AOI222X1M U42 ( .A0(N109), .A1(n42), .B0(n7), .B1(n13), .C0(N117), .C1(n41), 
        .Y(n70) );
  AOI31X2M U43 ( .A0(n63), .A1(n64), .A2(n65), .B0(n134), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U44 ( .A0(N102), .A1(n43), .B0(N94), .B1(n44), .Y(n63) );
  AOI221XLM U45 ( .A0(n9), .A1(n130), .B0(n14), .B1(n123), .C0(n66), .Y(n65)
         );
  AOI222X1M U46 ( .A0(N110), .A1(n42), .B0(n8), .B1(n13), .C0(N118), .C1(n41), 
        .Y(n64) );
  AOI31X2M U47 ( .A0(n57), .A1(n58), .A2(n59), .B0(n134), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U48 ( .A0(N103), .A1(n43), .B0(N95), .B1(n44), .Y(n57) );
  AOI221XLM U49 ( .A0(n130), .A1(n10), .B0(n14), .B1(n122), .C0(n60), .Y(n59)
         );
  AOI222X1M U50 ( .A0(N111), .A1(n42), .B0(n9), .B1(n13), .C0(N119), .C1(n41), 
        .Y(n58) );
  AOI31X2M U51 ( .A0(n29), .A1(n30), .A2(n31), .B0(n134), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U52 ( .A0(N106), .A1(n43), .B0(N98), .B1(n44), .Y(n29) );
  AOI221XLM U53 ( .A0(n14), .A1(n119), .B0(n13), .B1(n12), .C0(n34), .Y(n31)
         );
  AOI22X1M U54 ( .A0(N122), .A1(n41), .B0(N114), .B1(n42), .Y(n30) );
  AOI31X2M U55 ( .A0(n51), .A1(n52), .A2(n53), .B0(n134), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U56 ( .A0(N104), .A1(n43), .B0(N96), .B1(n44), .Y(n51) );
  AOI221XLM U57 ( .A0(n130), .A1(n11), .B0(n14), .B1(n121), .C0(n54), .Y(n53)
         );
  AOI222X1M U58 ( .A0(N112), .A1(n42), .B0(n10), .B1(n13), .C0(N120), .C1(n41), 
        .Y(n52) );
  INVX2M U59 ( .A(n26), .Y(n118) );
  AOI31X2M U60 ( .A0(n45), .A1(n46), .A2(n47), .B0(n134), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U61 ( .A0(N105), .A1(n43), .B0(N97), .B1(n44), .Y(n45) );
  AOI221XLM U62 ( .A0(n130), .A1(n12), .B0(n14), .B1(n120), .C0(n48), .Y(n47)
         );
  AOI222X1M U63 ( .A0(N113), .A1(n42), .B0(n13), .B1(n11), .C0(N121), .C1(n41), 
        .Y(n46) );
  INVX2M U64 ( .A(n112), .Y(N148) );
  INVX2M U65 ( .A(n4), .Y(n116) );
  OAI222X1M U66 ( .A0(n49), .A1(n116), .B0(n4), .B1(n50), .C0(n37), .C1(n121), 
        .Y(n48) );
  AOI221XLM U67 ( .A0(n38), .A1(n120), .B0(n11), .B1(n40), .C0(n13), .Y(n49)
         );
  AOI221XLM U68 ( .A0(n11), .A1(n38), .B0(n39), .B1(n120), .C0(n14), .Y(n50)
         );
  BUFX2M U69 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U70 ( .A(n6), .Y(n125) );
  INVX2M U71 ( .A(n5), .Y(n126) );
  INVX2M U72 ( .A(n11), .Y(n120) );
  INVX2M U73 ( .A(n8), .Y(n123) );
  INVX2M U74 ( .A(n7), .Y(n124) );
  INVX2M U75 ( .A(n10), .Y(n121) );
  INVX2M U76 ( .A(n9), .Y(n122) );
  INVX2M U77 ( .A(n12), .Y(n119) );
  BUFX2M U78 ( .A(B[6]), .Y(n4) );
  BUFX2M U79 ( .A(A[7]), .Y(n12) );
  BUFX2M U80 ( .A(A[5]), .Y(n10) );
  BUFX2M U81 ( .A(A[4]), .Y(n9) );
  BUFX2M U82 ( .A(A[3]), .Y(n8) );
  BUFX2M U83 ( .A(A[2]), .Y(n7) );
  BUFX2M U84 ( .A(A[1]), .Y(n6) );
  INVX2M U85 ( .A(n15), .Y(n117) );
  OAI21X2M U86 ( .A0(B[0]), .A1(n96), .B0(n97), .Y(n90) );
  AOI221XLM U87 ( .A0(n5), .A1(n38), .B0(n39), .B1(n126), .C0(n14), .Y(n96) );
  AOI31X2M U88 ( .A0(N147), .A1(n3), .A2(n98), .B0(n85), .Y(n97) );
  NOR3X2M U89 ( .A(n132), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n98) );
  OAI21X2M U90 ( .A0(B[1]), .A1(n82), .B0(n83), .Y(n78) );
  AOI221XLM U91 ( .A0(n6), .A1(n38), .B0(n39), .B1(n125), .C0(n14), .Y(n82) );
  AOI31X2M U92 ( .A0(N148), .A1(n3), .A2(n84), .B0(n85), .Y(n83) );
  NOR3X2M U93 ( .A(n133), .B(ALU_FUN[2]), .C(n132), .Y(n84) );
  BUFX2M U94 ( .A(A[0]), .Y(n5) );
  INVX2M U95 ( .A(B[0]), .Y(n113) );
  INVX2M U96 ( .A(B[2]), .Y(n114) );
  OAI222X1M U97 ( .A0(n73), .A1(n114), .B0(B[2]), .B1(n74), .C0(n37), .C1(n125), .Y(n72) );
  AOI221XLM U98 ( .A0(n38), .A1(n124), .B0(n7), .B1(n40), .C0(n13), .Y(n73) );
  AOI221XLM U99 ( .A0(n7), .A1(n38), .B0(n39), .B1(n124), .C0(n14), .Y(n74) );
  OAI222X1M U100 ( .A0(n67), .A1(n115), .B0(B[3]), .B1(n68), .C0(n37), .C1(
        n124), .Y(n66) );
  AOI221XLM U101 ( .A0(n38), .A1(n123), .B0(n8), .B1(n40), .C0(n13), .Y(n67)
         );
  AOI221XLM U102 ( .A0(n8), .A1(n38), .B0(n39), .B1(n123), .C0(n14), .Y(n68)
         );
  OAI222X1M U103 ( .A0(n61), .A1(n129), .B0(B[4]), .B1(n62), .C0(n37), .C1(
        n123), .Y(n60) );
  INVX2M U104 ( .A(B[4]), .Y(n129) );
  AOI221XLM U105 ( .A0(n38), .A1(n122), .B0(n9), .B1(n40), .C0(n13), .Y(n61)
         );
  AOI221XLM U106 ( .A0(n9), .A1(n38), .B0(n39), .B1(n122), .C0(n14), .Y(n62)
         );
  OAI222X1M U107 ( .A0(n55), .A1(n128), .B0(B[5]), .B1(n56), .C0(n37), .C1(
        n122), .Y(n54) );
  INVX2M U108 ( .A(B[5]), .Y(n128) );
  AOI221XLM U109 ( .A0(n38), .A1(n121), .B0(n10), .B1(n40), .C0(n13), .Y(n55)
         );
  AOI221XLM U110 ( .A0(n10), .A1(n38), .B0(n39), .B1(n121), .C0(n14), .Y(n56)
         );
  OAI222X1M U111 ( .A0(n35), .A1(n127), .B0(B[7]), .B1(n36), .C0(n37), .C1(
        n120), .Y(n34) );
  INVX2M U112 ( .A(B[7]), .Y(n127) );
  AOI221XLM U113 ( .A0(n38), .A1(n119), .B0(n12), .B1(n40), .C0(n13), .Y(n35)
         );
  AOI221XLM U114 ( .A0(n12), .A1(n38), .B0(n39), .B1(n119), .C0(n14), .Y(n36)
         );
  OAI2B2X1M U115 ( .A1N(B[1]), .A0(n80), .B0(n37), .B1(n126), .Y(n79) );
  AOI221XLM U116 ( .A0(n38), .A1(n125), .B0(n6), .B1(n40), .C0(n13), .Y(n80)
         );
  OAI2B2X1M U117 ( .A1N(B[0]), .A0(n92), .B0(n86), .B1(n125), .Y(n91) );
  AOI221XLM U118 ( .A0(n38), .A1(n126), .B0(n5), .B1(n40), .C0(n13), .Y(n92)
         );
  INVX2M U119 ( .A(B[3]), .Y(n115) );
  NOR2X1M U120 ( .A(n119), .B(B[7]), .Y(n109) );
  NAND2BX1M U121 ( .AN(B[4]), .B(n9), .Y(n102) );
  NAND2BX1M U122 ( .AN(n9), .B(B[4]), .Y(n19) );
  CLKNAND2X2M U123 ( .A(n102), .B(n19), .Y(n104) );
  NOR2X1M U124 ( .A(n115), .B(n8), .Y(n27) );
  NOR2X1M U125 ( .A(n114), .B(n7), .Y(n18) );
  NOR2X1M U126 ( .A(n113), .B(n5), .Y(n15) );
  CLKNAND2X2M U127 ( .A(n7), .B(n114), .Y(n101) );
  NAND2BX1M U128 ( .AN(n18), .B(n101), .Y(n24) );
  AOI21X1M U129 ( .A0(n15), .A1(n125), .B0(B[1]), .Y(n16) );
  AOI211X1M U130 ( .A0(n6), .A1(n117), .B0(n24), .C0(n16), .Y(n17) );
  CLKNAND2X2M U131 ( .A(n8), .B(n115), .Y(n28) );
  OAI31X1M U132 ( .A0(n27), .A1(n18), .A2(n17), .B0(n28), .Y(n20) );
  NAND2BX1M U133 ( .AN(n10), .B(B[5]), .Y(n107) );
  OAI211X1M U134 ( .A0(n104), .A1(n20), .B0(n19), .C0(n107), .Y(n21) );
  NAND2BX1M U135 ( .AN(B[5]), .B(n10), .Y(n103) );
  XNOR2X1M U136 ( .A(n11), .B(n4), .Y(n106) );
  AOI32X1M U137 ( .A0(n21), .A1(n103), .A2(n106), .B0(n4), .B1(n120), .Y(n22)
         );
  CLKNAND2X2M U138 ( .A(B[7]), .B(n119), .Y(n110) );
  OAI21X1M U139 ( .A0(n109), .A1(n22), .B0(n110), .Y(N149) );
  CLKNAND2X2M U140 ( .A(n5), .B(n113), .Y(n25) );
  OA21X1M U141 ( .A0(n25), .A1(n125), .B0(B[1]), .Y(n23) );
  AOI211X1M U142 ( .A0(n25), .A1(n125), .B0(n24), .C0(n23), .Y(n26) );
  AOI31X1M U143 ( .A0(n118), .A1(n101), .A2(n28), .B0(n27), .Y(n105) );
  OAI2B11X1M U144 ( .A1N(n105), .A0(n104), .B0(n103), .C0(n102), .Y(n108) );
  AOI32X1M U145 ( .A0(n108), .A1(n107), .A2(n106), .B0(n11), .B1(n116), .Y(
        n111) );
  AOI2B1X1M U146 ( .A1N(n111), .A0(n110), .B0(n109), .Y(n112) );
  NOR2X1M U147 ( .A(N149), .B(N148), .Y(N147) );
endmodule


module PULSE_GEN_0 ( clk, rst, in, out );
  input clk, rst, in;
  output out;
  wire   ff_out;

  DFFRQX2M ff_out_reg ( .D(in), .CK(clk), .RN(rst), .Q(ff_out) );
  NOR2BX2M U3 ( .AN(in), .B(ff_out), .Y(out) );
endmodule


module MEM_CNTRL_ADD_W3_DATA_W8_DATA_D7 ( wr_flag, full, clk, RD_ADDR, WR_ADDR, 
        WR_DATA, RD_DATA );
  input [2:0] RD_ADDR;
  input [2:0] WR_ADDR;
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input wr_flag, full, clk;
  wire   N9, N10, N11, \MEM[0][7] , \MEM[0][6] , \MEM[0][5] , \MEM[0][4] ,
         \MEM[0][3] , \MEM[0][2] , \MEM[0][1] , \MEM[0][0] , \MEM[1][7] ,
         \MEM[1][6] , \MEM[1][5] , \MEM[1][4] , \MEM[1][3] , \MEM[1][2] ,
         \MEM[1][1] , \MEM[1][0] , \MEM[2][7] , \MEM[2][6] , \MEM[2][5] ,
         \MEM[2][4] , \MEM[2][3] , \MEM[2][2] , \MEM[2][1] , \MEM[2][0] ,
         \MEM[3][7] , \MEM[3][6] , \MEM[3][5] , \MEM[3][4] , \MEM[3][3] ,
         \MEM[3][2] , \MEM[3][1] , \MEM[3][0] , \MEM[4][7] , \MEM[4][6] ,
         \MEM[4][5] , \MEM[4][4] , \MEM[4][3] , \MEM[4][2] , \MEM[4][1] ,
         \MEM[4][0] , \MEM[5][7] , \MEM[5][6] , \MEM[5][5] , \MEM[5][4] ,
         \MEM[5][3] , \MEM[5][2] , \MEM[5][1] , \MEM[5][0] , \MEM[6][7] ,
         \MEM[6][6] , \MEM[6][5] , \MEM[6][4] , \MEM[6][3] , \MEM[6][2] ,
         \MEM[6][1] , \MEM[6][0] , \MEM[7][7] , \MEM[7][6] , \MEM[7][5] ,
         \MEM[7][4] , \MEM[7][3] , \MEM[7][2] , \MEM[7][1] , \MEM[7][0] , n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107;
  assign N9 = RD_ADDR[0];
  assign N10 = RD_ADDR[1];
  assign N11 = RD_ADDR[2];

  DFFQX2M \MEM_reg[1][7]  ( .D(n77), .CK(clk), .Q(\MEM[1][7] ) );
  DFFQX2M \MEM_reg[1][6]  ( .D(n76), .CK(clk), .Q(\MEM[1][6] ) );
  DFFQX2M \MEM_reg[1][5]  ( .D(n75), .CK(clk), .Q(\MEM[1][5] ) );
  DFFQX2M \MEM_reg[1][4]  ( .D(n74), .CK(clk), .Q(\MEM[1][4] ) );
  DFFQX2M \MEM_reg[1][3]  ( .D(n73), .CK(clk), .Q(\MEM[1][3] ) );
  DFFQX2M \MEM_reg[1][2]  ( .D(n72), .CK(clk), .Q(\MEM[1][2] ) );
  DFFQX2M \MEM_reg[1][1]  ( .D(n71), .CK(clk), .Q(\MEM[1][1] ) );
  DFFQX2M \MEM_reg[1][0]  ( .D(n70), .CK(clk), .Q(\MEM[1][0] ) );
  DFFQX2M \MEM_reg[5][7]  ( .D(n45), .CK(clk), .Q(\MEM[5][7] ) );
  DFFQX2M \MEM_reg[5][6]  ( .D(n44), .CK(clk), .Q(\MEM[5][6] ) );
  DFFQX2M \MEM_reg[5][5]  ( .D(n43), .CK(clk), .Q(\MEM[5][5] ) );
  DFFQX2M \MEM_reg[5][4]  ( .D(n42), .CK(clk), .Q(\MEM[5][4] ) );
  DFFQX2M \MEM_reg[5][3]  ( .D(n41), .CK(clk), .Q(\MEM[5][3] ) );
  DFFQX2M \MEM_reg[5][2]  ( .D(n40), .CK(clk), .Q(\MEM[5][2] ) );
  DFFQX2M \MEM_reg[5][1]  ( .D(n39), .CK(clk), .Q(\MEM[5][1] ) );
  DFFQX2M \MEM_reg[5][0]  ( .D(n38), .CK(clk), .Q(\MEM[5][0] ) );
  DFFQX2M \MEM_reg[3][7]  ( .D(n61), .CK(clk), .Q(\MEM[3][7] ) );
  DFFQX2M \MEM_reg[3][6]  ( .D(n60), .CK(clk), .Q(\MEM[3][6] ) );
  DFFQX2M \MEM_reg[3][5]  ( .D(n59), .CK(clk), .Q(\MEM[3][5] ) );
  DFFQX2M \MEM_reg[3][4]  ( .D(n58), .CK(clk), .Q(\MEM[3][4] ) );
  DFFQX2M \MEM_reg[3][3]  ( .D(n57), .CK(clk), .Q(\MEM[3][3] ) );
  DFFQX2M \MEM_reg[3][2]  ( .D(n56), .CK(clk), .Q(\MEM[3][2] ) );
  DFFQX2M \MEM_reg[3][1]  ( .D(n55), .CK(clk), .Q(\MEM[3][1] ) );
  DFFQX2M \MEM_reg[3][0]  ( .D(n54), .CK(clk), .Q(\MEM[3][0] ) );
  DFFQX2M \MEM_reg[7][7]  ( .D(n29), .CK(clk), .Q(\MEM[7][7] ) );
  DFFQX2M \MEM_reg[7][6]  ( .D(n28), .CK(clk), .Q(\MEM[7][6] ) );
  DFFQX2M \MEM_reg[7][5]  ( .D(n27), .CK(clk), .Q(\MEM[7][5] ) );
  DFFQX2M \MEM_reg[7][4]  ( .D(n26), .CK(clk), .Q(\MEM[7][4] ) );
  DFFQX2M \MEM_reg[7][3]  ( .D(n25), .CK(clk), .Q(\MEM[7][3] ) );
  DFFQX2M \MEM_reg[7][2]  ( .D(n24), .CK(clk), .Q(\MEM[7][2] ) );
  DFFQX2M \MEM_reg[7][1]  ( .D(n23), .CK(clk), .Q(\MEM[7][1] ) );
  DFFQX2M \MEM_reg[7][0]  ( .D(n22), .CK(clk), .Q(\MEM[7][0] ) );
  DFFQX2M \MEM_reg[2][7]  ( .D(n69), .CK(clk), .Q(\MEM[2][7] ) );
  DFFQX2M \MEM_reg[2][6]  ( .D(n68), .CK(clk), .Q(\MEM[2][6] ) );
  DFFQX2M \MEM_reg[2][5]  ( .D(n67), .CK(clk), .Q(\MEM[2][5] ) );
  DFFQX2M \MEM_reg[2][4]  ( .D(n66), .CK(clk), .Q(\MEM[2][4] ) );
  DFFQX2M \MEM_reg[2][3]  ( .D(n65), .CK(clk), .Q(\MEM[2][3] ) );
  DFFQX2M \MEM_reg[2][2]  ( .D(n64), .CK(clk), .Q(\MEM[2][2] ) );
  DFFQX2M \MEM_reg[2][1]  ( .D(n63), .CK(clk), .Q(\MEM[2][1] ) );
  DFFQX2M \MEM_reg[2][0]  ( .D(n62), .CK(clk), .Q(\MEM[2][0] ) );
  DFFQX2M \MEM_reg[6][7]  ( .D(n37), .CK(clk), .Q(\MEM[6][7] ) );
  DFFQX2M \MEM_reg[6][6]  ( .D(n36), .CK(clk), .Q(\MEM[6][6] ) );
  DFFQX2M \MEM_reg[6][5]  ( .D(n35), .CK(clk), .Q(\MEM[6][5] ) );
  DFFQX2M \MEM_reg[6][4]  ( .D(n34), .CK(clk), .Q(\MEM[6][4] ) );
  DFFQX2M \MEM_reg[6][3]  ( .D(n33), .CK(clk), .Q(\MEM[6][3] ) );
  DFFQX2M \MEM_reg[6][2]  ( .D(n32), .CK(clk), .Q(\MEM[6][2] ) );
  DFFQX2M \MEM_reg[6][1]  ( .D(n31), .CK(clk), .Q(\MEM[6][1] ) );
  DFFQX2M \MEM_reg[6][0]  ( .D(n30), .CK(clk), .Q(\MEM[6][0] ) );
  DFFQX2M \MEM_reg[0][7]  ( .D(n85), .CK(clk), .Q(\MEM[0][7] ) );
  DFFQX2M \MEM_reg[0][6]  ( .D(n84), .CK(clk), .Q(\MEM[0][6] ) );
  DFFQX2M \MEM_reg[0][5]  ( .D(n83), .CK(clk), .Q(\MEM[0][5] ) );
  DFFQX2M \MEM_reg[0][4]  ( .D(n82), .CK(clk), .Q(\MEM[0][4] ) );
  DFFQX2M \MEM_reg[0][3]  ( .D(n81), .CK(clk), .Q(\MEM[0][3] ) );
  DFFQX2M \MEM_reg[0][2]  ( .D(n80), .CK(clk), .Q(\MEM[0][2] ) );
  DFFQX2M \MEM_reg[0][1]  ( .D(n79), .CK(clk), .Q(\MEM[0][1] ) );
  DFFQX2M \MEM_reg[0][0]  ( .D(n78), .CK(clk), .Q(\MEM[0][0] ) );
  DFFQX2M \MEM_reg[4][7]  ( .D(n53), .CK(clk), .Q(\MEM[4][7] ) );
  DFFQX2M \MEM_reg[4][6]  ( .D(n52), .CK(clk), .Q(\MEM[4][6] ) );
  DFFQX2M \MEM_reg[4][5]  ( .D(n51), .CK(clk), .Q(\MEM[4][5] ) );
  DFFQX2M \MEM_reg[4][4]  ( .D(n50), .CK(clk), .Q(\MEM[4][4] ) );
  DFFQX2M \MEM_reg[4][3]  ( .D(n49), .CK(clk), .Q(\MEM[4][3] ) );
  DFFQX2M \MEM_reg[4][2]  ( .D(n48), .CK(clk), .Q(\MEM[4][2] ) );
  DFFQX2M \MEM_reg[4][1]  ( .D(n47), .CK(clk), .Q(\MEM[4][1] ) );
  DFFQX2M \MEM_reg[4][0]  ( .D(n46), .CK(clk), .Q(\MEM[4][0] ) );
  BUFX2M U2 ( .A(n17), .Y(n96) );
  BUFX2M U3 ( .A(n19), .Y(n95) );
  BUFX2M U4 ( .A(n13), .Y(n97) );
  BUFX2M U5 ( .A(n20), .Y(n94) );
  NOR2BX2M U6 ( .AN(wr_flag), .B(full), .Y(n16) );
  NAND3X2M U7 ( .A(n106), .B(n107), .C(n12), .Y(n15) );
  NAND3X2M U8 ( .A(n106), .B(n107), .C(n18), .Y(n21) );
  NAND3X2M U9 ( .A(n12), .B(n107), .C(WR_ADDR[0]), .Y(n14) );
  NAND3X2M U10 ( .A(WR_ADDR[0]), .B(n12), .C(WR_ADDR[1]), .Y(n11) );
  NOR2BX2M U11 ( .AN(n16), .B(WR_ADDR[2]), .Y(n18) );
  OAI2BB2X1M U12 ( .B0(n11), .B1(n98), .A0N(\MEM[7][0] ), .A1N(n11), .Y(n22)
         );
  OAI2BB2X1M U13 ( .B0(n11), .B1(n99), .A0N(\MEM[7][1] ), .A1N(n11), .Y(n23)
         );
  OAI2BB2X1M U14 ( .B0(n11), .B1(n100), .A0N(\MEM[7][2] ), .A1N(n11), .Y(n24)
         );
  OAI2BB2X1M U15 ( .B0(n11), .B1(n101), .A0N(\MEM[7][3] ), .A1N(n11), .Y(n25)
         );
  OAI2BB2X1M U16 ( .B0(n11), .B1(n102), .A0N(\MEM[7][4] ), .A1N(n11), .Y(n26)
         );
  OAI2BB2X1M U17 ( .B0(n11), .B1(n103), .A0N(\MEM[7][5] ), .A1N(n11), .Y(n27)
         );
  OAI2BB2X1M U18 ( .B0(n11), .B1(n104), .A0N(\MEM[7][6] ), .A1N(n11), .Y(n28)
         );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n105), .A0N(\MEM[7][7] ), .A1N(n11), .Y(n29)
         );
  OAI2BB2X1M U20 ( .B0(n98), .B1(n14), .A0N(\MEM[5][0] ), .A1N(n14), .Y(n38)
         );
  OAI2BB2X1M U21 ( .B0(n99), .B1(n14), .A0N(\MEM[5][1] ), .A1N(n14), .Y(n39)
         );
  OAI2BB2X1M U22 ( .B0(n100), .B1(n14), .A0N(\MEM[5][2] ), .A1N(n14), .Y(n40)
         );
  OAI2BB2X1M U23 ( .B0(n101), .B1(n14), .A0N(\MEM[5][3] ), .A1N(n14), .Y(n41)
         );
  OAI2BB2X1M U24 ( .B0(n102), .B1(n14), .A0N(\MEM[5][4] ), .A1N(n14), .Y(n42)
         );
  OAI2BB2X1M U25 ( .B0(n103), .B1(n14), .A0N(\MEM[5][5] ), .A1N(n14), .Y(n43)
         );
  OAI2BB2X1M U26 ( .B0(n104), .B1(n14), .A0N(\MEM[5][6] ), .A1N(n14), .Y(n44)
         );
  OAI2BB2X1M U27 ( .B0(n105), .B1(n14), .A0N(\MEM[5][7] ), .A1N(n14), .Y(n45)
         );
  OAI2BB2X1M U28 ( .B0(n98), .B1(n21), .A0N(\MEM[0][0] ), .A1N(n21), .Y(n78)
         );
  OAI2BB2X1M U29 ( .B0(n99), .B1(n21), .A0N(\MEM[0][1] ), .A1N(n21), .Y(n79)
         );
  OAI2BB2X1M U30 ( .B0(n100), .B1(n21), .A0N(\MEM[0][2] ), .A1N(n21), .Y(n80)
         );
  OAI2BB2X1M U31 ( .B0(n101), .B1(n21), .A0N(\MEM[0][3] ), .A1N(n21), .Y(n81)
         );
  OAI2BB2X1M U32 ( .B0(n102), .B1(n21), .A0N(\MEM[0][4] ), .A1N(n21), .Y(n82)
         );
  OAI2BB2X1M U33 ( .B0(n103), .B1(n21), .A0N(\MEM[0][5] ), .A1N(n21), .Y(n83)
         );
  OAI2BB2X1M U34 ( .B0(n104), .B1(n21), .A0N(\MEM[0][6] ), .A1N(n21), .Y(n84)
         );
  OAI2BB2X1M U35 ( .B0(n105), .B1(n21), .A0N(\MEM[0][7] ), .A1N(n21), .Y(n85)
         );
  OAI2BB2X1M U36 ( .B0(n98), .B1(n15), .A0N(\MEM[4][0] ), .A1N(n15), .Y(n46)
         );
  OAI2BB2X1M U37 ( .B0(n99), .B1(n15), .A0N(\MEM[4][1] ), .A1N(n15), .Y(n47)
         );
  OAI2BB2X1M U38 ( .B0(n100), .B1(n15), .A0N(\MEM[4][2] ), .A1N(n15), .Y(n48)
         );
  OAI2BB2X1M U39 ( .B0(n101), .B1(n15), .A0N(\MEM[4][3] ), .A1N(n15), .Y(n49)
         );
  OAI2BB2X1M U40 ( .B0(n102), .B1(n15), .A0N(\MEM[4][4] ), .A1N(n15), .Y(n50)
         );
  OAI2BB2X1M U41 ( .B0(n103), .B1(n15), .A0N(\MEM[4][5] ), .A1N(n15), .Y(n51)
         );
  OAI2BB2X1M U42 ( .B0(n104), .B1(n15), .A0N(\MEM[4][6] ), .A1N(n15), .Y(n52)
         );
  OAI2BB2X1M U43 ( .B0(n105), .B1(n15), .A0N(\MEM[4][7] ), .A1N(n15), .Y(n53)
         );
  INVX2M U44 ( .A(WR_DATA[0]), .Y(n98) );
  INVX2M U45 ( .A(WR_DATA[1]), .Y(n99) );
  INVX2M U46 ( .A(WR_DATA[2]), .Y(n100) );
  INVX2M U47 ( .A(WR_DATA[3]), .Y(n101) );
  INVX2M U48 ( .A(WR_DATA[4]), .Y(n102) );
  INVX2M U49 ( .A(WR_DATA[5]), .Y(n103) );
  INVX2M U50 ( .A(WR_DATA[6]), .Y(n104) );
  INVX2M U51 ( .A(WR_DATA[7]), .Y(n105) );
  OAI2BB2X1M U52 ( .B0(n98), .B1(n97), .A0N(\MEM[6][0] ), .A1N(n97), .Y(n30)
         );
  OAI2BB2X1M U53 ( .B0(n99), .B1(n97), .A0N(\MEM[6][1] ), .A1N(n97), .Y(n31)
         );
  OAI2BB2X1M U54 ( .B0(n100), .B1(n97), .A0N(\MEM[6][2] ), .A1N(n97), .Y(n32)
         );
  OAI2BB2X1M U55 ( .B0(n101), .B1(n97), .A0N(\MEM[6][3] ), .A1N(n97), .Y(n33)
         );
  OAI2BB2X1M U56 ( .B0(n102), .B1(n97), .A0N(\MEM[6][4] ), .A1N(n97), .Y(n34)
         );
  OAI2BB2X1M U57 ( .B0(n103), .B1(n97), .A0N(\MEM[6][5] ), .A1N(n97), .Y(n35)
         );
  OAI2BB2X1M U58 ( .B0(n104), .B1(n97), .A0N(\MEM[6][6] ), .A1N(n97), .Y(n36)
         );
  OAI2BB2X1M U59 ( .B0(n105), .B1(n97), .A0N(\MEM[6][7] ), .A1N(n97), .Y(n37)
         );
  OAI2BB2X1M U60 ( .B0(n98), .B1(n96), .A0N(\MEM[3][0] ), .A1N(n96), .Y(n54)
         );
  OAI2BB2X1M U61 ( .B0(n99), .B1(n96), .A0N(\MEM[3][1] ), .A1N(n96), .Y(n55)
         );
  OAI2BB2X1M U62 ( .B0(n100), .B1(n96), .A0N(\MEM[3][2] ), .A1N(n96), .Y(n56)
         );
  OAI2BB2X1M U63 ( .B0(n101), .B1(n96), .A0N(\MEM[3][3] ), .A1N(n96), .Y(n57)
         );
  OAI2BB2X1M U64 ( .B0(n102), .B1(n96), .A0N(\MEM[3][4] ), .A1N(n96), .Y(n58)
         );
  OAI2BB2X1M U65 ( .B0(n103), .B1(n96), .A0N(\MEM[3][5] ), .A1N(n96), .Y(n59)
         );
  OAI2BB2X1M U66 ( .B0(n104), .B1(n96), .A0N(\MEM[3][6] ), .A1N(n96), .Y(n60)
         );
  OAI2BB2X1M U67 ( .B0(n105), .B1(n96), .A0N(\MEM[3][7] ), .A1N(n96), .Y(n61)
         );
  OAI2BB2X1M U68 ( .B0(n98), .B1(n95), .A0N(\MEM[2][0] ), .A1N(n95), .Y(n62)
         );
  OAI2BB2X1M U69 ( .B0(n99), .B1(n95), .A0N(\MEM[2][1] ), .A1N(n95), .Y(n63)
         );
  OAI2BB2X1M U70 ( .B0(n100), .B1(n95), .A0N(\MEM[2][2] ), .A1N(n95), .Y(n64)
         );
  OAI2BB2X1M U71 ( .B0(n101), .B1(n95), .A0N(\MEM[2][3] ), .A1N(n95), .Y(n65)
         );
  OAI2BB2X1M U72 ( .B0(n102), .B1(n95), .A0N(\MEM[2][4] ), .A1N(n95), .Y(n66)
         );
  OAI2BB2X1M U73 ( .B0(n103), .B1(n95), .A0N(\MEM[2][5] ), .A1N(n95), .Y(n67)
         );
  OAI2BB2X1M U74 ( .B0(n104), .B1(n95), .A0N(\MEM[2][6] ), .A1N(n95), .Y(n68)
         );
  OAI2BB2X1M U75 ( .B0(n105), .B1(n95), .A0N(\MEM[2][7] ), .A1N(n95), .Y(n69)
         );
  OAI2BB2X1M U76 ( .B0(n98), .B1(n94), .A0N(\MEM[1][0] ), .A1N(n94), .Y(n70)
         );
  OAI2BB2X1M U77 ( .B0(n99), .B1(n94), .A0N(\MEM[1][1] ), .A1N(n94), .Y(n71)
         );
  OAI2BB2X1M U78 ( .B0(n100), .B1(n94), .A0N(\MEM[1][2] ), .A1N(n94), .Y(n72)
         );
  OAI2BB2X1M U79 ( .B0(n101), .B1(n94), .A0N(\MEM[1][3] ), .A1N(n94), .Y(n73)
         );
  OAI2BB2X1M U80 ( .B0(n102), .B1(n94), .A0N(\MEM[1][4] ), .A1N(n94), .Y(n74)
         );
  OAI2BB2X1M U81 ( .B0(n103), .B1(n94), .A0N(\MEM[1][5] ), .A1N(n94), .Y(n75)
         );
  OAI2BB2X1M U82 ( .B0(n104), .B1(n94), .A0N(\MEM[1][6] ), .A1N(n94), .Y(n76)
         );
  OAI2BB2X1M U83 ( .B0(n105), .B1(n94), .A0N(\MEM[1][7] ), .A1N(n94), .Y(n77)
         );
  AND2X2M U84 ( .A(WR_ADDR[2]), .B(n16), .Y(n12) );
  NAND3X2M U85 ( .A(n12), .B(n106), .C(WR_ADDR[1]), .Y(n13) );
  NAND3X2M U86 ( .A(WR_ADDR[1]), .B(WR_ADDR[0]), .C(n18), .Y(n17) );
  NAND3X2M U87 ( .A(WR_ADDR[1]), .B(n106), .C(n18), .Y(n19) );
  NAND3X2M U88 ( .A(WR_ADDR[0]), .B(n107), .C(n18), .Y(n20) );
  INVX2M U89 ( .A(WR_ADDR[1]), .Y(n107) );
  INVX2M U90 ( .A(WR_ADDR[0]), .Y(n106) );
  MX2X2M U91 ( .A(n89), .B(n88), .S0(N11), .Y(RD_DATA[6]) );
  MX4X1M U92 ( .A(\MEM[4][6] ), .B(\MEM[5][6] ), .C(\MEM[6][6] ), .D(
        \MEM[7][6] ), .S0(n92), .S1(N10), .Y(n88) );
  MX4X1M U93 ( .A(\MEM[0][6] ), .B(\MEM[1][6] ), .C(\MEM[2][6] ), .D(
        \MEM[3][6] ), .S0(n93), .S1(N10), .Y(n89) );
  MX2X2M U94 ( .A(n91), .B(n90), .S0(N11), .Y(RD_DATA[7]) );
  MX4X1M U95 ( .A(\MEM[4][7] ), .B(\MEM[5][7] ), .C(\MEM[6][7] ), .D(
        \MEM[7][7] ), .S0(n92), .S1(N10), .Y(n90) );
  MX4X1M U96 ( .A(\MEM[0][7] ), .B(\MEM[1][7] ), .C(\MEM[2][7] ), .D(
        \MEM[3][7] ), .S0(n93), .S1(N10), .Y(n91) );
  MX2X2M U97 ( .A(n10), .B(n9), .S0(N11), .Y(RD_DATA[4]) );
  MX4X1M U98 ( .A(\MEM[4][4] ), .B(\MEM[5][4] ), .C(\MEM[6][4] ), .D(
        \MEM[7][4] ), .S0(n92), .S1(N10), .Y(n9) );
  MX4X1M U99 ( .A(\MEM[0][4] ), .B(\MEM[1][4] ), .C(\MEM[2][4] ), .D(
        \MEM[3][4] ), .S0(n93), .S1(N10), .Y(n10) );
  MX2X2M U100 ( .A(n87), .B(n86), .S0(N11), .Y(RD_DATA[5]) );
  MX4X1M U101 ( .A(\MEM[4][5] ), .B(\MEM[5][5] ), .C(\MEM[6][5] ), .D(
        \MEM[7][5] ), .S0(n92), .S1(N10), .Y(n86) );
  MX4X1M U102 ( .A(\MEM[0][5] ), .B(\MEM[1][5] ), .C(\MEM[2][5] ), .D(
        \MEM[3][5] ), .S0(n93), .S1(N10), .Y(n87) );
  MX2X2M U103 ( .A(n4), .B(n3), .S0(N11), .Y(RD_DATA[1]) );
  MX4X1M U104 ( .A(\MEM[4][1] ), .B(\MEM[5][1] ), .C(\MEM[6][1] ), .D(
        \MEM[7][1] ), .S0(n92), .S1(N10), .Y(n3) );
  MX4X1M U105 ( .A(\MEM[0][1] ), .B(\MEM[1][1] ), .C(\MEM[2][1] ), .D(
        \MEM[3][1] ), .S0(n93), .S1(N10), .Y(n4) );
  BUFX2M U106 ( .A(N9), .Y(n93) );
  BUFX2M U107 ( .A(N9), .Y(n92) );
  MX2X2M U108 ( .A(n6), .B(n5), .S0(N11), .Y(RD_DATA[2]) );
  MX4X1M U109 ( .A(\MEM[4][2] ), .B(\MEM[5][2] ), .C(\MEM[6][2] ), .D(
        \MEM[7][2] ), .S0(n92), .S1(N10), .Y(n5) );
  MX4X1M U110 ( .A(\MEM[0][2] ), .B(\MEM[1][2] ), .C(\MEM[2][2] ), .D(
        \MEM[3][2] ), .S0(n93), .S1(N10), .Y(n6) );
  MX2X2M U111 ( .A(n8), .B(n7), .S0(N11), .Y(RD_DATA[3]) );
  MX4X1M U112 ( .A(\MEM[4][3] ), .B(\MEM[5][3] ), .C(\MEM[6][3] ), .D(
        \MEM[7][3] ), .S0(n92), .S1(N10), .Y(n7) );
  MX4X1M U113 ( .A(\MEM[0][3] ), .B(\MEM[1][3] ), .C(\MEM[2][3] ), .D(
        \MEM[3][3] ), .S0(n93), .S1(N10), .Y(n8) );
  MX2X2M U114 ( .A(n2), .B(n1), .S0(N11), .Y(RD_DATA[0]) );
  MX4X1M U115 ( .A(\MEM[4][0] ), .B(\MEM[5][0] ), .C(\MEM[6][0] ), .D(
        \MEM[7][0] ), .S0(n92), .S1(N10), .Y(n1) );
  MX4X1M U116 ( .A(\MEM[0][0] ), .B(\MEM[1][0] ), .C(\MEM[2][0] ), .D(
        \MEM[3][0] ), .S0(n93), .S1(N10), .Y(n2) );
endmodule


module FIFO_WR_W3 ( clk, rst, G_RD_PTR, G_WR_PTR, wr_flag, full, WR_ADDR, 
        WR_PTR );
  input [3:0] G_RD_PTR;
  input [3:0] G_WR_PTR;
  output [2:0] WR_ADDR;
  output [3:0] WR_PTR;
  input clk, rst, wr_flag;
  output full;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  assign WR_PTR[2] = WR_ADDR[2];
  assign WR_PTR[1] = WR_ADDR[1];
  assign WR_PTR[0] = WR_ADDR[0];

  DFFRQX2M \WR_PTR_reg[3]  ( .D(n10), .CK(clk), .RN(rst), .Q(WR_PTR[3]) );
  DFFRQX2M \WR_PTR_reg[2]  ( .D(n11), .CK(clk), .RN(rst), .Q(WR_ADDR[2]) );
  DFFRQX2M \WR_PTR_reg[0]  ( .D(n13), .CK(clk), .RN(rst), .Q(WR_ADDR[0]) );
  DFFRQX2M \WR_PTR_reg[1]  ( .D(n12), .CK(clk), .RN(rst), .Q(WR_ADDR[1]) );
  INVX2M U3 ( .A(n5), .Y(full) );
  NAND2X2M U4 ( .A(wr_flag), .B(n5), .Y(n4) );
  XNOR2X2M U5 ( .A(G_WR_PTR[1]), .B(G_RD_PTR[1]), .Y(n7) );
  NOR2BX2M U6 ( .AN(WR_ADDR[0]), .B(n4), .Y(n3) );
  XNOR2X2M U7 ( .A(WR_ADDR[2]), .B(n2), .Y(n11) );
  XNOR2X2M U8 ( .A(WR_ADDR[0]), .B(n4), .Y(n13) );
  NAND4X2M U9 ( .A(n6), .B(n7), .C(n8), .D(n9), .Y(n5) );
  CLKXOR2X2M U10 ( .A(G_WR_PTR[3]), .B(G_RD_PTR[3]), .Y(n9) );
  CLKXOR2X2M U11 ( .A(G_WR_PTR[2]), .B(G_RD_PTR[2]), .Y(n8) );
  XNOR2X2M U12 ( .A(G_WR_PTR[0]), .B(G_RD_PTR[0]), .Y(n6) );
  NAND2X2M U13 ( .A(WR_ADDR[1]), .B(n3), .Y(n2) );
  CLKXOR2X2M U14 ( .A(WR_ADDR[1]), .B(n3), .Y(n12) );
  CLKXOR2X2M U15 ( .A(WR_PTR[3]), .B(n1), .Y(n10) );
  NOR2BX2M U16 ( .AN(WR_ADDR[2]), .B(n2), .Y(n1) );
endmodule


module BINARY_TO_GRAY_W3_0 ( In, Out );
  input [3:0] In;
  output [3:0] Out;
  wire   \In[3] ;
  assign Out[3] = \In[3] ;
  assign \In[3]  = In[3];

  CLKXOR2X2M U1 ( .A(\In[3] ), .B(In[2]), .Y(Out[2]) );
  CLKXOR2X2M U2 ( .A(In[1]), .B(In[0]), .Y(Out[0]) );
  CLKXOR2X2M U3 ( .A(In[2]), .B(In[1]), .Y(Out[1]) );
endmodule


module D_FLOP_SYNC_W3_0 ( clk, rst, In, Out );
  input [3:0] In;
  output [3:0] Out;
  input clk, rst;

  wire   [3:0] flop1;

  DFFRQX2M \Out_reg[2]  ( .D(flop1[2]), .CK(clk), .RN(rst), .Q(Out[2]) );
  DFFRQX2M \Out_reg[1]  ( .D(flop1[1]), .CK(clk), .RN(rst), .Q(Out[1]) );
  DFFRQX2M \Out_reg[0]  ( .D(flop1[0]), .CK(clk), .RN(rst), .Q(Out[0]) );
  DFFRQX2M \Out_reg[3]  ( .D(flop1[3]), .CK(clk), .RN(rst), .Q(Out[3]) );
  DFFRQX2M \flop1_reg[2]  ( .D(In[2]), .CK(clk), .RN(rst), .Q(flop1[2]) );
  DFFRQX2M \flop1_reg[1]  ( .D(In[1]), .CK(clk), .RN(rst), .Q(flop1[1]) );
  DFFRQX2M \flop1_reg[0]  ( .D(In[0]), .CK(clk), .RN(rst), .Q(flop1[0]) );
  DFFRQX2M \flop1_reg[3]  ( .D(In[3]), .CK(clk), .RN(rst), .Q(flop1[3]) );
endmodule


module FIFO_RD_W3 ( clk, rst, G_RD_PTR, G_WR_PTR, rd_flag, empty, RD_ADDR, 
        RD_PTR );
  input [3:0] G_RD_PTR;
  input [3:0] G_WR_PTR;
  output [2:0] RD_ADDR;
  output [3:0] RD_PTR;
  input clk, rst, rd_flag;
  output empty;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15, n16, n1;
  assign RD_PTR[2] = RD_ADDR[2];
  assign RD_PTR[1] = RD_ADDR[1];
  assign RD_PTR[0] = RD_ADDR[0];

  DFFRQX2M \RD_PTR_reg[3]  ( .D(n13), .CK(clk), .RN(rst), .Q(RD_PTR[3]) );
  DFFRQX2M \RD_PTR_reg[2]  ( .D(n14), .CK(clk), .RN(rst), .Q(RD_ADDR[2]) );
  DFFRQX2M \RD_PTR_reg[0]  ( .D(n16), .CK(clk), .RN(rst), .Q(RD_ADDR[0]) );
  DFFRQX2M \RD_PTR_reg[1]  ( .D(n15), .CK(clk), .RN(rst), .Q(RD_ADDR[1]) );
  XNOR2X2M U3 ( .A(RD_ADDR[2]), .B(n5), .Y(n14) );
  NAND2X2M U4 ( .A(RD_ADDR[1]), .B(n6), .Y(n5) );
  NOR2BX2M U5 ( .AN(rd_flag), .B(empty), .Y(n7) );
  AND4X2M U6 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(empty) );
  XNOR2X2M U7 ( .A(G_WR_PTR[0]), .B(G_RD_PTR[0]), .Y(n9) );
  XNOR2X2M U8 ( .A(G_WR_PTR[2]), .B(G_RD_PTR[2]), .Y(n11) );
  XNOR2X2M U9 ( .A(G_WR_PTR[1]), .B(G_RD_PTR[1]), .Y(n8) );
  CLKXOR2X2M U10 ( .A(RD_PTR[3]), .B(n4), .Y(n13) );
  NOR2BX2M U11 ( .AN(RD_ADDR[2]), .B(n5), .Y(n4) );
  AND2X2M U12 ( .A(rst), .B(n1), .Y(n10) );
  XNOR2X2M U13 ( .A(G_WR_PTR[3]), .B(G_RD_PTR[3]), .Y(n1) );
  AND2X2M U14 ( .A(RD_ADDR[0]), .B(n7), .Y(n6) );
  CLKXOR2X2M U15 ( .A(RD_ADDR[1]), .B(n6), .Y(n15) );
  CLKXOR2X2M U16 ( .A(RD_ADDR[0]), .B(n7), .Y(n16) );
endmodule


module BINARY_TO_GRAY_W3_1 ( In, Out );
  input [3:0] In;
  output [3:0] Out;
  wire   \In[3] ;
  assign Out[3] = \In[3] ;
  assign \In[3]  = In[3];

  CLKXOR2X2M U1 ( .A(In[1]), .B(In[0]), .Y(Out[0]) );
  CLKXOR2X2M U2 ( .A(In[2]), .B(In[1]), .Y(Out[1]) );
  CLKXOR2X2M U3 ( .A(\In[3] ), .B(In[2]), .Y(Out[2]) );
endmodule


module D_FLOP_SYNC_W3_1 ( clk, rst, In, Out );
  input [3:0] In;
  output [3:0] Out;
  input clk, rst;

  wire   [3:0] flop1;

  DFFRQX2M \Out_reg[1]  ( .D(flop1[1]), .CK(clk), .RN(rst), .Q(Out[1]) );
  DFFRQX2M \Out_reg[0]  ( .D(flop1[0]), .CK(clk), .RN(rst), .Q(Out[0]) );
  DFFRQX2M \Out_reg[3]  ( .D(flop1[3]), .CK(clk), .RN(rst), .Q(Out[3]) );
  DFFRQX2M \Out_reg[2]  ( .D(flop1[2]), .CK(clk), .RN(rst), .Q(Out[2]) );
  DFFRQX2M \flop1_reg[3]  ( .D(In[3]), .CK(clk), .RN(rst), .Q(flop1[3]) );
  DFFRQX2M \flop1_reg[2]  ( .D(In[2]), .CK(clk), .RN(rst), .Q(flop1[2]) );
  DFFRQX2M \flop1_reg[1]  ( .D(In[1]), .CK(clk), .RN(rst), .Q(flop1[1]) );
  DFFRQX2M \flop1_reg[0]  ( .D(In[0]), .CK(clk), .RN(rst), .Q(flop1[0]) );
endmodule


module FIFO_DW8_DD7_ADDR_W3 ( w_clk, r_clk, w_rst, r_rst, WR_DATA, wr_flag, 
        rd_flag, RD, full, empty );
  input [7:0] WR_DATA;
  output [7:0] RD;
  input w_clk, r_clk, w_rst, r_rst, wr_flag, rd_flag;
  output full, empty;
  wire   n1, n2;
  wire   [2:0] RD_ADDR;
  wire   [2:0] WR_ADDR;
  wire   [3:0] G_RD_PTR_SYNCH;
  wire   [3:0] G_WR_PTR;
  wire   [3:0] WR_PTR;
  wire   [3:0] G_WR_PTR_SYNCH;
  wire   [3:0] G_RD_PTR;
  wire   [3:0] RD_PTR;

  MEM_CNTRL_ADD_W3_DATA_W8_DATA_D7 mem ( .wr_flag(wr_flag), .full(full), .clk(
        w_clk), .RD_ADDR(RD_ADDR), .WR_ADDR(WR_ADDR), .WR_DATA(WR_DATA), 
        .RD_DATA(RD) );
  FIFO_WR_W3 wr ( .clk(w_clk), .rst(w_rst), .G_RD_PTR(G_RD_PTR_SYNCH), 
        .G_WR_PTR(G_WR_PTR), .wr_flag(wr_flag), .full(full), .WR_ADDR(WR_ADDR), 
        .WR_PTR(WR_PTR) );
  BINARY_TO_GRAY_W3_0 B2G_WR ( .In(WR_PTR), .Out(G_WR_PTR) );
  D_FLOP_SYNC_W3_0 W2R_SYNC ( .clk(r_clk), .rst(n1), .In(G_WR_PTR), .Out(
        G_WR_PTR_SYNCH) );
  FIFO_RD_W3 rd ( .clk(r_clk), .rst(n1), .G_RD_PTR(G_RD_PTR), .G_WR_PTR(
        G_WR_PTR_SYNCH), .rd_flag(rd_flag), .empty(empty), .RD_ADDR(RD_ADDR), 
        .RD_PTR(RD_PTR) );
  BINARY_TO_GRAY_W3_1 B2G_RD ( .In(RD_PTR), .Out(G_RD_PTR) );
  D_FLOP_SYNC_W3_1 R2W_SYNC ( .clk(w_clk), .rst(w_rst), .In(G_RD_PTR), .Out(
        G_RD_PTR_SYNCH) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(r_rst), .Y(n2) );
endmodule


module TOP ( ref_clk, ref_rst, UART_CLK, RX_IN, stp_err, par_err, TX_OUT );
  input ref_clk, ref_rst, UART_CLK, RX_IN;
  output stp_err, par_err, TX_OUT;
  wire   sync_rst1, DATA_SYNC_OUT_VALID, fifo_full, alu_out_valid,
         regfile_out_valid, wr_incr, alu_en, rd_en, wr_en, gate_en, TX_clk,
         sync_rst2, RX_clk, fifo_empty, BUSY, RX_out_valid, alu_clk, rd_incr,
         n1, n2;
  wire   [7:0] DATA_SYNC_OUT;
  wire   [7:0] alu_out;
  wire   [7:0] regfile_out;
  wire   [7:0] wr_data_fifo;
  wire   [3:0] FUN;
  wire   [7:0] wr_data_regfile;
  wire   [3:0] Addr;
  wire   [7:0] RdData_fifo;
  wire   [7:0] RX_OUT;
  wire   [7:0] rx_divider_ratio;
  wire   [7:0] Div_ratio;
  wire   [7:0] A;
  wire   [7:0] B;
  wire   [7:0] REG2;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  SYS_CNTRL_DW8_FUN_W4_REGFILE_ADDR_W4 sys_cntrl ( .CLK(ref_clk), .RST(n1), 
        .sync_data(DATA_SYNC_OUT), .sync_data_valid(DATA_SYNC_OUT_VALID), 
        .fifo_full(fifo_full), .alu_out(alu_out), .alu_out_valid(alu_out_valid), .regfile_out(regfile_out), .regfile_out_valid(regfile_out_valid), 
        .wr_data_fifo(wr_data_fifo), .wr_incr(wr_incr), .alu_en(alu_en), .FUN(
        FUN), .wr_data_regfile(wr_data_regfile), .rd_en(rd_en), .wr_en(wr_en), 
        .Addr(Addr), .gate_en(gate_en) );
  UART_DW8 uart ( .TX_clk(TX_clk), .RX_clk(RX_clk), .rst(sync_rst2), .RX_IN(
        RX_IN), .P_DATA(RdData_fifo), .empty_flag(fifo_empty), .par_en(REG2[0]), .par_type(REG2[1]), .prescale(REG2[7:2]), .TX_OUT(TX_OUT), .BUSY(BUSY), 
        .RX_OUT(RX_OUT), .RX_out_valid(RX_out_valid), .stp_err(stp_err), 
        .parity_err(par_err) );
  DATA_SYNC_DATA_WIDTH8_FLOPS2 data_sync ( .unsync_data(RX_OUT), .clk(ref_clk), 
        .rst(ref_rst), .unsync_en(RX_out_valid), .sync_en(DATA_SYNC_OUT_VALID), 
        .sync_data(DATA_SYNC_OUT) );
  PRESCALE_MUX prescale_mux ( .Prescale(REG2[7:2]), .ratio({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        rx_divider_ratio[3:0]}) );
  CLK_DIV_0 RX_DIVIDER ( .ref_clk(UART_CLK), .rst(sync_rst2), .en(1'b1), 
        .ratio({1'b0, 1'b0, 1'b0, 1'b0, rx_divider_ratio[3:0]}), .o_clk(RX_clk) );
  CLK_DIV_1 TX_DIVIDER ( .ref_clk(UART_CLK), .rst(sync_rst2), .en(1'b1), 
        .ratio(Div_ratio), .o_clk(TX_clk) );
  RST_SYNC_STAGES2_0 rst_sync_1 ( .clk(ref_clk), .rst(ref_rst), .sync_rst(
        sync_rst1) );
  RST_SYNC_STAGES2_1 rst_sync_2 ( .clk(UART_CLK), .rst(ref_rst), .sync_rst(
        sync_rst2) );
  RegFile_DW8_DEPTH8_REG_FILE_ADDRW4 rf ( .WrData(wr_data_regfile), .Address(
        Addr), .WrEn(wr_en), .RdEn(rd_en), .CLK(ref_clk), .RST(n1), .RdData(
        regfile_out), .REG0(A), .REG1(B), .REG2(REG2), .REG3(Div_ratio), 
        .RdDataValid(regfile_out_valid) );
  CLK_GATE clk_gate ( .CLK_EN(gate_en), .CLK(ref_clk), .GATED_CLK(alu_clk) );
  ALU_OPER_WIDTH8_OUT_WIDTH8 alu ( .A(A), .B(B), .EN(alu_en), .ALU_FUN(FUN), 
        .CLK(alu_clk), .RST(n1), .ALU_OUT(alu_out), .OUT_VALID(alu_out_valid)
         );
  PULSE_GEN_0 pulse_gen ( .clk(TX_clk), .rst(sync_rst2), .in(BUSY), .out(
        rd_incr) );
  FIFO_DW8_DD7_ADDR_W3 fifo ( .w_clk(ref_clk), .r_clk(TX_clk), .w_rst(n1), 
        .r_rst(sync_rst2), .WR_DATA(wr_data_fifo), .wr_flag(wr_incr), 
        .rd_flag(rd_incr), .RD(RdData_fifo), .full(fifo_full), .empty(
        fifo_empty) );
  INVX4M U2 ( .A(n2), .Y(n1) );
  INVX2M U3 ( .A(sync_rst1), .Y(n2) );
endmodule

