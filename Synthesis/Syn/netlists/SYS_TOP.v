/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Sep 26 05:57:24 2025
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \RST_reg[0] ;

  DFFRQX2M \RST_reg_reg[1]  ( .D(\RST_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \RST_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\RST_reg[0] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \RST_reg[0] ;

  DFFRQX2M \RST_reg_reg[1]  ( .D(\RST_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \RST_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\RST_reg[0] )
         );
endmodule


module PULSE_GEN_1 ( CLK, RST, LVL_SIG, PULSE_SIG );
  input CLK, RST, LVL_SIG;
  output PULSE_SIG;
  wire   reg_SIG_1, reg_SIG_0;

  DFFRQX2M reg_SIG_0_reg ( .D(LVL_SIG), .CK(CLK), .RN(RST), .Q(reg_SIG_0) );
  DFFRQX2M reg_SIG_1_reg ( .D(reg_SIG_0), .CK(CLK), .RN(RST), .Q(reg_SIG_1) );
  NOR2BX2M U3 ( .AN(reg_SIG_0), .B(reg_SIG_1), .Y(PULSE_SIG) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( CLK, RST, BUS_EN, unsync_bus, 
        sync_bus, enable_pulse );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, BUS_EN;
  output enable_pulse;
  wire   Pulse_en, N5, N6, N7, N8, N9, N10, N11, N12, n1;
  wire   [1:0] en_reg;

  PULSE_GEN_1 U_PULSE_GEN ( .CLK(CLK), .RST(RST), .LVL_SIG(en_reg[1]), 
        .PULSE_SIG(Pulse_en) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(N12), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(N8), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(N5), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M enable_pulse_reg ( .D(Pulse_en), .CK(CLK), .RN(RST), .Q(
        enable_pulse) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(N11), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(N7), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(N6), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(N10), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(N9), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \en_reg_reg[0]  ( .D(BUS_EN), .CK(CLK), .RN(RST), .Q(en_reg[0]) );
  DFFRQX2M \en_reg_reg[1]  ( .D(en_reg[0]), .CK(CLK), .RN(RST), .Q(en_reg[1])
         );
  INVX2M U3 ( .A(Pulse_en), .Y(n1) );
  AO22X1M U4 ( .A0(unsync_bus[0]), .A1(Pulse_en), .B0(sync_bus[0]), .B1(n1), 
        .Y(N5) );
  AO22X1M U5 ( .A0(unsync_bus[1]), .A1(Pulse_en), .B0(sync_bus[1]), .B1(n1), 
        .Y(N6) );
  AO22X1M U6 ( .A0(unsync_bus[2]), .A1(Pulse_en), .B0(sync_bus[2]), .B1(n1), 
        .Y(N7) );
  AO22X1M U7 ( .A0(unsync_bus[3]), .A1(Pulse_en), .B0(sync_bus[3]), .B1(n1), 
        .Y(N8) );
  AO22X1M U8 ( .A0(unsync_bus[4]), .A1(Pulse_en), .B0(sync_bus[4]), .B1(n1), 
        .Y(N9) );
  AO22X1M U9 ( .A0(unsync_bus[5]), .A1(Pulse_en), .B0(sync_bus[5]), .B1(n1), 
        .Y(N10) );
  AO22X1M U10 ( .A0(unsync_bus[6]), .A1(Pulse_en), .B0(sync_bus[6]), .B1(n1), 
        .Y(N11) );
  AO22X1M U11 ( .A0(unsync_bus[7]), .A1(Pulse_en), .B0(sync_bus[7]), .B1(n1), 
        .Y(N12) );
endmodule


module ASYNC_FIFO_MEM_DATA_WIDTH8_DEPTH8 ( W_CLK, W_RST, W_INC, W_FULL, w_addr, 
        r_addr, w_data, r_data );
  input [2:0] w_addr;
  input [2:0] r_addr;
  input [7:0] w_data;
  output [7:0] r_data;
  input W_CLK, W_RST, W_INC, W_FULL;
  wire   N10, N11, N12, \FIFO_MEM[7][7] , \FIFO_MEM[7][6] , \FIFO_MEM[7][5] ,
         \FIFO_MEM[7][4] , \FIFO_MEM[7][3] , \FIFO_MEM[7][2] ,
         \FIFO_MEM[7][1] , \FIFO_MEM[7][0] , \FIFO_MEM[6][7] ,
         \FIFO_MEM[6][6] , \FIFO_MEM[6][5] , \FIFO_MEM[6][4] ,
         \FIFO_MEM[6][3] , \FIFO_MEM[6][2] , \FIFO_MEM[6][1] ,
         \FIFO_MEM[6][0] , \FIFO_MEM[5][7] , \FIFO_MEM[5][6] ,
         \FIFO_MEM[5][5] , \FIFO_MEM[5][4] , \FIFO_MEM[5][3] ,
         \FIFO_MEM[5][2] , \FIFO_MEM[5][1] , \FIFO_MEM[5][0] ,
         \FIFO_MEM[4][7] , \FIFO_MEM[4][6] , \FIFO_MEM[4][5] ,
         \FIFO_MEM[4][4] , \FIFO_MEM[4][3] , \FIFO_MEM[4][2] ,
         \FIFO_MEM[4][1] , \FIFO_MEM[4][0] , \FIFO_MEM[3][7] ,
         \FIFO_MEM[3][6] , \FIFO_MEM[3][5] , \FIFO_MEM[3][4] ,
         \FIFO_MEM[3][3] , \FIFO_MEM[3][2] , \FIFO_MEM[3][1] ,
         \FIFO_MEM[3][0] , \FIFO_MEM[2][7] , \FIFO_MEM[2][6] ,
         \FIFO_MEM[2][5] , \FIFO_MEM[2][4] , \FIFO_MEM[2][3] ,
         \FIFO_MEM[2][2] , \FIFO_MEM[2][1] , \FIFO_MEM[2][0] ,
         \FIFO_MEM[1][7] , \FIFO_MEM[1][6] , \FIFO_MEM[1][5] ,
         \FIFO_MEM[1][4] , \FIFO_MEM[1][3] , \FIFO_MEM[1][2] ,
         \FIFO_MEM[1][1] , \FIFO_MEM[1][0] , \FIFO_MEM[0][7] ,
         \FIFO_MEM[0][6] , \FIFO_MEM[0][5] , \FIFO_MEM[0][4] ,
         \FIFO_MEM[0][3] , \FIFO_MEM[0][2] , \FIFO_MEM[0][1] ,
         \FIFO_MEM[0][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115;
  assign N10 = r_addr[0];
  assign N11 = r_addr[1];
  assign N12 = r_addr[2];

  DFFRQX2M \FIFO_MEM_reg[5][7]  ( .D(n69), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[5][7] ) );
  DFFRQX2M \FIFO_MEM_reg[5][6]  ( .D(n68), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[5][6] ) );
  DFFRQX2M \FIFO_MEM_reg[5][5]  ( .D(n67), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[5][5] ) );
  DFFRQX2M \FIFO_MEM_reg[5][4]  ( .D(n66), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[5][4] ) );
  DFFRQX2M \FIFO_MEM_reg[5][3]  ( .D(n65), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[5][3] ) );
  DFFRQX2M \FIFO_MEM_reg[5][2]  ( .D(n64), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[5][2] ) );
  DFFRQX2M \FIFO_MEM_reg[5][1]  ( .D(n63), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[5][1] ) );
  DFFRQX2M \FIFO_MEM_reg[5][0]  ( .D(n62), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[5][0] ) );
  DFFRQX2M \FIFO_MEM_reg[1][7]  ( .D(n37), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[1][7] ) );
  DFFRQX2M \FIFO_MEM_reg[1][6]  ( .D(n36), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[1][6] ) );
  DFFRQX2M \FIFO_MEM_reg[1][5]  ( .D(n35), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[1][5] ) );
  DFFRQX2M \FIFO_MEM_reg[1][4]  ( .D(n34), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[1][4] ) );
  DFFRQX2M \FIFO_MEM_reg[1][3]  ( .D(n33), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[1][3] ) );
  DFFRQX2M \FIFO_MEM_reg[1][2]  ( .D(n32), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[1][2] ) );
  DFFRQX2M \FIFO_MEM_reg[1][1]  ( .D(n31), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[1][1] ) );
  DFFRQX2M \FIFO_MEM_reg[1][0]  ( .D(n30), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[1][0] ) );
  DFFRQX2M \FIFO_MEM_reg[7][7]  ( .D(n85), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[7][7] ) );
  DFFRQX2M \FIFO_MEM_reg[7][6]  ( .D(n84), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[7][6] ) );
  DFFRQX2M \FIFO_MEM_reg[7][5]  ( .D(n83), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[7][5] ) );
  DFFRQX2M \FIFO_MEM_reg[7][4]  ( .D(n82), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[7][4] ) );
  DFFRQX2M \FIFO_MEM_reg[7][3]  ( .D(n81), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[7][3] ) );
  DFFRQX2M \FIFO_MEM_reg[7][2]  ( .D(n80), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[7][2] ) );
  DFFRQX2M \FIFO_MEM_reg[7][1]  ( .D(n79), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[7][1] ) );
  DFFRQX2M \FIFO_MEM_reg[7][0]  ( .D(n78), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[7][0] ) );
  DFFRQX2M \FIFO_MEM_reg[3][7]  ( .D(n53), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[3][7] ) );
  DFFRQX2M \FIFO_MEM_reg[3][6]  ( .D(n52), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[3][6] ) );
  DFFRQX2M \FIFO_MEM_reg[3][5]  ( .D(n51), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[3][5] ) );
  DFFRQX2M \FIFO_MEM_reg[3][4]  ( .D(n50), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[3][4] ) );
  DFFRQX2M \FIFO_MEM_reg[3][3]  ( .D(n49), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[3][3] ) );
  DFFRQX2M \FIFO_MEM_reg[3][2]  ( .D(n48), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[3][2] ) );
  DFFRQX2M \FIFO_MEM_reg[3][1]  ( .D(n47), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[3][1] ) );
  DFFRQX2M \FIFO_MEM_reg[3][0]  ( .D(n46), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[3][0] ) );
  DFFRQX2M \FIFO_MEM_reg[6][7]  ( .D(n77), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[6][7] ) );
  DFFRQX2M \FIFO_MEM_reg[6][6]  ( .D(n76), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[6][6] ) );
  DFFRQX2M \FIFO_MEM_reg[6][5]  ( .D(n75), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[6][5] ) );
  DFFRQX2M \FIFO_MEM_reg[6][4]  ( .D(n74), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[6][4] ) );
  DFFRQX2M \FIFO_MEM_reg[6][3]  ( .D(n73), .CK(W_CLK), .RN(n101), .Q(
        \FIFO_MEM[6][3] ) );
  DFFRQX2M \FIFO_MEM_reg[6][2]  ( .D(n72), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[6][2] ) );
  DFFRQX2M \FIFO_MEM_reg[6][1]  ( .D(n71), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[6][1] ) );
  DFFRQX2M \FIFO_MEM_reg[6][0]  ( .D(n70), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[6][0] ) );
  DFFRQX2M \FIFO_MEM_reg[2][7]  ( .D(n45), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[2][7] ) );
  DFFRQX2M \FIFO_MEM_reg[2][6]  ( .D(n44), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[2][6] ) );
  DFFRQX2M \FIFO_MEM_reg[2][5]  ( .D(n43), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[2][5] ) );
  DFFRQX2M \FIFO_MEM_reg[2][4]  ( .D(n42), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[2][4] ) );
  DFFRQX2M \FIFO_MEM_reg[2][3]  ( .D(n41), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[2][3] ) );
  DFFRQX2M \FIFO_MEM_reg[2][2]  ( .D(n40), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[2][2] ) );
  DFFRQX2M \FIFO_MEM_reg[2][1]  ( .D(n39), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[2][1] ) );
  DFFRQX2M \FIFO_MEM_reg[2][0]  ( .D(n38), .CK(W_CLK), .RN(n104), .Q(
        \FIFO_MEM[2][0] ) );
  DFFRQX2M \FIFO_MEM_reg[4][7]  ( .D(n61), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[4][7] ) );
  DFFRQX2M \FIFO_MEM_reg[4][6]  ( .D(n60), .CK(W_CLK), .RN(n102), .Q(
        \FIFO_MEM[4][6] ) );
  DFFRQX2M \FIFO_MEM_reg[4][5]  ( .D(n59), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[4][5] ) );
  DFFRQX2M \FIFO_MEM_reg[4][4]  ( .D(n58), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[4][4] ) );
  DFFRQX2M \FIFO_MEM_reg[4][3]  ( .D(n57), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[4][3] ) );
  DFFRQX2M \FIFO_MEM_reg[4][2]  ( .D(n56), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[4][2] ) );
  DFFRQX2M \FIFO_MEM_reg[4][1]  ( .D(n55), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[4][1] ) );
  DFFRQX2M \FIFO_MEM_reg[4][0]  ( .D(n54), .CK(W_CLK), .RN(n103), .Q(
        \FIFO_MEM[4][0] ) );
  DFFRQX2M \FIFO_MEM_reg[0][7]  ( .D(n29), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[0][7] ) );
  DFFRQX2M \FIFO_MEM_reg[0][6]  ( .D(n28), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[0][6] ) );
  DFFRQX2M \FIFO_MEM_reg[0][5]  ( .D(n27), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[0][5] ) );
  DFFRQX2M \FIFO_MEM_reg[0][4]  ( .D(n26), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[0][4] ) );
  DFFRQX2M \FIFO_MEM_reg[0][3]  ( .D(n25), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[0][3] ) );
  DFFRQX2M \FIFO_MEM_reg[0][2]  ( .D(n24), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[0][2] ) );
  DFFRQX2M \FIFO_MEM_reg[0][1]  ( .D(n23), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[0][1] ) );
  DFFRQX2M \FIFO_MEM_reg[0][0]  ( .D(n22), .CK(W_CLK), .RN(n105), .Q(
        \FIFO_MEM[0][0] ) );
  BUFX2M U2 ( .A(n20), .Y(n94) );
  BUFX2M U3 ( .A(n21), .Y(n93) );
  BUFX2M U4 ( .A(n13), .Y(n98) );
  BUFX2M U5 ( .A(n14), .Y(n97) );
  BUFX2M U6 ( .A(n15), .Y(n96) );
  BUFX2M U7 ( .A(n19), .Y(n95) );
  BUFX2M U8 ( .A(n99), .Y(n103) );
  BUFX2M U9 ( .A(n99), .Y(n102) );
  BUFX2M U10 ( .A(n99), .Y(n101) );
  BUFX2M U11 ( .A(n100), .Y(n104) );
  BUFX2M U12 ( .A(n100), .Y(n105) );
  NOR2BX2M U13 ( .AN(W_INC), .B(W_FULL), .Y(n16) );
  BUFX2M U14 ( .A(W_RST), .Y(n99) );
  BUFX2M U15 ( .A(W_RST), .Y(n100) );
  NAND3X2M U16 ( .A(n106), .B(n107), .C(n18), .Y(n17) );
  NAND3X2M U17 ( .A(n106), .B(n107), .C(n12), .Y(n11) );
  NOR2BX2M U18 ( .AN(n16), .B(w_addr[2]), .Y(n12) );
  INVX2M U19 ( .A(w_data[0]), .Y(n115) );
  INVX2M U20 ( .A(w_data[1]), .Y(n114) );
  INVX2M U21 ( .A(w_data[2]), .Y(n113) );
  INVX2M U22 ( .A(w_data[3]), .Y(n112) );
  INVX2M U23 ( .A(w_data[4]), .Y(n111) );
  INVX2M U24 ( .A(w_data[5]), .Y(n110) );
  INVX2M U25 ( .A(w_data[6]), .Y(n109) );
  INVX2M U26 ( .A(w_data[7]), .Y(n108) );
  OAI2BB2X1M U27 ( .B0(n11), .B1(n115), .A0N(\FIFO_MEM[0][0] ), .A1N(n11), .Y(
        n22) );
  OAI2BB2X1M U28 ( .B0(n11), .B1(n114), .A0N(\FIFO_MEM[0][1] ), .A1N(n11), .Y(
        n23) );
  OAI2BB2X1M U29 ( .B0(n11), .B1(n113), .A0N(\FIFO_MEM[0][2] ), .A1N(n11), .Y(
        n24) );
  OAI2BB2X1M U30 ( .B0(n11), .B1(n112), .A0N(\FIFO_MEM[0][3] ), .A1N(n11), .Y(
        n25) );
  OAI2BB2X1M U31 ( .B0(n11), .B1(n111), .A0N(\FIFO_MEM[0][4] ), .A1N(n11), .Y(
        n26) );
  OAI2BB2X1M U32 ( .B0(n11), .B1(n110), .A0N(\FIFO_MEM[0][5] ), .A1N(n11), .Y(
        n27) );
  OAI2BB2X1M U33 ( .B0(n11), .B1(n109), .A0N(\FIFO_MEM[0][6] ), .A1N(n11), .Y(
        n28) );
  OAI2BB2X1M U34 ( .B0(n11), .B1(n108), .A0N(\FIFO_MEM[0][7] ), .A1N(n11), .Y(
        n29) );
  OAI2BB2X1M U35 ( .B0(n115), .B1(n17), .A0N(\FIFO_MEM[4][0] ), .A1N(n17), .Y(
        n54) );
  OAI2BB2X1M U36 ( .B0(n114), .B1(n17), .A0N(\FIFO_MEM[4][1] ), .A1N(n17), .Y(
        n55) );
  OAI2BB2X1M U37 ( .B0(n113), .B1(n17), .A0N(\FIFO_MEM[4][2] ), .A1N(n17), .Y(
        n56) );
  OAI2BB2X1M U38 ( .B0(n112), .B1(n17), .A0N(\FIFO_MEM[4][3] ), .A1N(n17), .Y(
        n57) );
  OAI2BB2X1M U39 ( .B0(n111), .B1(n17), .A0N(\FIFO_MEM[4][4] ), .A1N(n17), .Y(
        n58) );
  OAI2BB2X1M U40 ( .B0(n110), .B1(n17), .A0N(\FIFO_MEM[4][5] ), .A1N(n17), .Y(
        n59) );
  OAI2BB2X1M U41 ( .B0(n109), .B1(n17), .A0N(\FIFO_MEM[4][6] ), .A1N(n17), .Y(
        n60) );
  OAI2BB2X1M U42 ( .B0(n108), .B1(n17), .A0N(\FIFO_MEM[4][7] ), .A1N(n17), .Y(
        n61) );
  OAI2BB2X1M U43 ( .B0(n115), .B1(n98), .A0N(\FIFO_MEM[1][0] ), .A1N(n98), .Y(
        n30) );
  OAI2BB2X1M U44 ( .B0(n114), .B1(n98), .A0N(\FIFO_MEM[1][1] ), .A1N(n98), .Y(
        n31) );
  OAI2BB2X1M U45 ( .B0(n113), .B1(n98), .A0N(\FIFO_MEM[1][2] ), .A1N(n98), .Y(
        n32) );
  OAI2BB2X1M U46 ( .B0(n112), .B1(n98), .A0N(\FIFO_MEM[1][3] ), .A1N(n98), .Y(
        n33) );
  OAI2BB2X1M U47 ( .B0(n111), .B1(n98), .A0N(\FIFO_MEM[1][4] ), .A1N(n98), .Y(
        n34) );
  OAI2BB2X1M U48 ( .B0(n110), .B1(n98), .A0N(\FIFO_MEM[1][5] ), .A1N(n98), .Y(
        n35) );
  OAI2BB2X1M U49 ( .B0(n109), .B1(n98), .A0N(\FIFO_MEM[1][6] ), .A1N(n98), .Y(
        n36) );
  OAI2BB2X1M U50 ( .B0(n108), .B1(n98), .A0N(\FIFO_MEM[1][7] ), .A1N(n98), .Y(
        n37) );
  OAI2BB2X1M U51 ( .B0(n115), .B1(n97), .A0N(\FIFO_MEM[2][0] ), .A1N(n97), .Y(
        n38) );
  OAI2BB2X1M U52 ( .B0(n114), .B1(n97), .A0N(\FIFO_MEM[2][1] ), .A1N(n97), .Y(
        n39) );
  OAI2BB2X1M U53 ( .B0(n113), .B1(n97), .A0N(\FIFO_MEM[2][2] ), .A1N(n97), .Y(
        n40) );
  OAI2BB2X1M U54 ( .B0(n112), .B1(n97), .A0N(\FIFO_MEM[2][3] ), .A1N(n97), .Y(
        n41) );
  OAI2BB2X1M U55 ( .B0(n111), .B1(n97), .A0N(\FIFO_MEM[2][4] ), .A1N(n97), .Y(
        n42) );
  OAI2BB2X1M U56 ( .B0(n110), .B1(n97), .A0N(\FIFO_MEM[2][5] ), .A1N(n97), .Y(
        n43) );
  OAI2BB2X1M U57 ( .B0(n109), .B1(n97), .A0N(\FIFO_MEM[2][6] ), .A1N(n97), .Y(
        n44) );
  OAI2BB2X1M U58 ( .B0(n108), .B1(n97), .A0N(\FIFO_MEM[2][7] ), .A1N(n97), .Y(
        n45) );
  OAI2BB2X1M U59 ( .B0(n115), .B1(n96), .A0N(\FIFO_MEM[3][0] ), .A1N(n96), .Y(
        n46) );
  OAI2BB2X1M U60 ( .B0(n114), .B1(n96), .A0N(\FIFO_MEM[3][1] ), .A1N(n96), .Y(
        n47) );
  OAI2BB2X1M U61 ( .B0(n113), .B1(n96), .A0N(\FIFO_MEM[3][2] ), .A1N(n96), .Y(
        n48) );
  OAI2BB2X1M U62 ( .B0(n112), .B1(n96), .A0N(\FIFO_MEM[3][3] ), .A1N(n96), .Y(
        n49) );
  OAI2BB2X1M U63 ( .B0(n111), .B1(n96), .A0N(\FIFO_MEM[3][4] ), .A1N(n96), .Y(
        n50) );
  OAI2BB2X1M U64 ( .B0(n110), .B1(n96), .A0N(\FIFO_MEM[3][5] ), .A1N(n96), .Y(
        n51) );
  OAI2BB2X1M U65 ( .B0(n109), .B1(n96), .A0N(\FIFO_MEM[3][6] ), .A1N(n96), .Y(
        n52) );
  OAI2BB2X1M U66 ( .B0(n108), .B1(n96), .A0N(\FIFO_MEM[3][7] ), .A1N(n96), .Y(
        n53) );
  OAI2BB2X1M U67 ( .B0(n115), .B1(n95), .A0N(\FIFO_MEM[5][0] ), .A1N(n95), .Y(
        n62) );
  OAI2BB2X1M U68 ( .B0(n114), .B1(n95), .A0N(\FIFO_MEM[5][1] ), .A1N(n95), .Y(
        n63) );
  OAI2BB2X1M U69 ( .B0(n113), .B1(n95), .A0N(\FIFO_MEM[5][2] ), .A1N(n95), .Y(
        n64) );
  OAI2BB2X1M U70 ( .B0(n112), .B1(n95), .A0N(\FIFO_MEM[5][3] ), .A1N(n95), .Y(
        n65) );
  OAI2BB2X1M U71 ( .B0(n111), .B1(n95), .A0N(\FIFO_MEM[5][4] ), .A1N(n95), .Y(
        n66) );
  OAI2BB2X1M U72 ( .B0(n110), .B1(n95), .A0N(\FIFO_MEM[5][5] ), .A1N(n95), .Y(
        n67) );
  OAI2BB2X1M U73 ( .B0(n109), .B1(n95), .A0N(\FIFO_MEM[5][6] ), .A1N(n95), .Y(
        n68) );
  OAI2BB2X1M U74 ( .B0(n108), .B1(n95), .A0N(\FIFO_MEM[5][7] ), .A1N(n95), .Y(
        n69) );
  OAI2BB2X1M U75 ( .B0(n115), .B1(n94), .A0N(\FIFO_MEM[6][0] ), .A1N(n94), .Y(
        n70) );
  OAI2BB2X1M U76 ( .B0(n114), .B1(n94), .A0N(\FIFO_MEM[6][1] ), .A1N(n94), .Y(
        n71) );
  OAI2BB2X1M U77 ( .B0(n113), .B1(n94), .A0N(\FIFO_MEM[6][2] ), .A1N(n94), .Y(
        n72) );
  OAI2BB2X1M U78 ( .B0(n112), .B1(n94), .A0N(\FIFO_MEM[6][3] ), .A1N(n94), .Y(
        n73) );
  OAI2BB2X1M U79 ( .B0(n111), .B1(n94), .A0N(\FIFO_MEM[6][4] ), .A1N(n94), .Y(
        n74) );
  OAI2BB2X1M U80 ( .B0(n110), .B1(n94), .A0N(\FIFO_MEM[6][5] ), .A1N(n94), .Y(
        n75) );
  OAI2BB2X1M U81 ( .B0(n109), .B1(n94), .A0N(\FIFO_MEM[6][6] ), .A1N(n94), .Y(
        n76) );
  OAI2BB2X1M U82 ( .B0(n108), .B1(n94), .A0N(\FIFO_MEM[6][7] ), .A1N(n94), .Y(
        n77) );
  OAI2BB2X1M U83 ( .B0(n115), .B1(n93), .A0N(\FIFO_MEM[7][0] ), .A1N(n93), .Y(
        n78) );
  OAI2BB2X1M U84 ( .B0(n114), .B1(n93), .A0N(\FIFO_MEM[7][1] ), .A1N(n93), .Y(
        n79) );
  OAI2BB2X1M U85 ( .B0(n113), .B1(n93), .A0N(\FIFO_MEM[7][2] ), .A1N(n93), .Y(
        n80) );
  OAI2BB2X1M U86 ( .B0(n112), .B1(n93), .A0N(\FIFO_MEM[7][3] ), .A1N(n93), .Y(
        n81) );
  OAI2BB2X1M U87 ( .B0(n111), .B1(n93), .A0N(\FIFO_MEM[7][4] ), .A1N(n93), .Y(
        n82) );
  OAI2BB2X1M U88 ( .B0(n110), .B1(n93), .A0N(\FIFO_MEM[7][5] ), .A1N(n93), .Y(
        n83) );
  OAI2BB2X1M U89 ( .B0(n109), .B1(n93), .A0N(\FIFO_MEM[7][6] ), .A1N(n93), .Y(
        n84) );
  OAI2BB2X1M U90 ( .B0(n108), .B1(n93), .A0N(\FIFO_MEM[7][7] ), .A1N(n93), .Y(
        n85) );
  AND2X2M U91 ( .A(w_addr[2]), .B(n16), .Y(n18) );
  NAND3X2M U92 ( .A(n12), .B(n107), .C(w_addr[0]), .Y(n13) );
  NAND3X2M U93 ( .A(n12), .B(n106), .C(w_addr[1]), .Y(n14) );
  NAND3X2M U94 ( .A(w_addr[0]), .B(n12), .C(w_addr[1]), .Y(n15) );
  NAND3X2M U95 ( .A(w_addr[1]), .B(w_addr[0]), .C(n18), .Y(n21) );
  NAND3X2M U96 ( .A(w_addr[0]), .B(n107), .C(n18), .Y(n19) );
  NAND3X2M U97 ( .A(w_addr[1]), .B(n106), .C(n18), .Y(n20) );
  INVX2M U98 ( .A(w_addr[0]), .Y(n106) );
  INVX2M U99 ( .A(w_addr[1]), .Y(n107) );
  BUFX4M U100 ( .A(N10), .Y(n92) );
  MX2X2M U101 ( .A(n91), .B(n90), .S0(N12), .Y(r_data[7]) );
  MX4X1M U102 ( .A(\FIFO_MEM[4][7] ), .B(\FIFO_MEM[5][7] ), .C(
        \FIFO_MEM[6][7] ), .D(\FIFO_MEM[7][7] ), .S0(n92), .S1(N11), .Y(n90)
         );
  MX4X1M U103 ( .A(\FIFO_MEM[0][7] ), .B(\FIFO_MEM[1][7] ), .C(
        \FIFO_MEM[2][7] ), .D(\FIFO_MEM[3][7] ), .S0(n92), .S1(N11), .Y(n91)
         );
  MX2X2M U104 ( .A(n89), .B(n88), .S0(N12), .Y(r_data[6]) );
  MX4X1M U105 ( .A(\FIFO_MEM[4][6] ), .B(\FIFO_MEM[5][6] ), .C(
        \FIFO_MEM[6][6] ), .D(\FIFO_MEM[7][6] ), .S0(n92), .S1(N11), .Y(n88)
         );
  MX4X1M U106 ( .A(\FIFO_MEM[0][6] ), .B(\FIFO_MEM[1][6] ), .C(
        \FIFO_MEM[2][6] ), .D(\FIFO_MEM[3][6] ), .S0(n92), .S1(N11), .Y(n89)
         );
  MX2X2M U107 ( .A(n6), .B(n5), .S0(N12), .Y(r_data[2]) );
  MX4X1M U108 ( .A(\FIFO_MEM[4][2] ), .B(\FIFO_MEM[5][2] ), .C(
        \FIFO_MEM[6][2] ), .D(\FIFO_MEM[7][2] ), .S0(n92), .S1(N11), .Y(n5) );
  MX4X1M U109 ( .A(\FIFO_MEM[0][2] ), .B(\FIFO_MEM[1][2] ), .C(
        \FIFO_MEM[2][2] ), .D(\FIFO_MEM[3][2] ), .S0(n92), .S1(N11), .Y(n6) );
  MX2X2M U110 ( .A(n8), .B(n7), .S0(N12), .Y(r_data[3]) );
  MX4X1M U111 ( .A(\FIFO_MEM[4][3] ), .B(\FIFO_MEM[5][3] ), .C(
        \FIFO_MEM[6][3] ), .D(\FIFO_MEM[7][3] ), .S0(n92), .S1(N11), .Y(n7) );
  MX4X1M U112 ( .A(\FIFO_MEM[0][3] ), .B(\FIFO_MEM[1][3] ), .C(
        \FIFO_MEM[2][3] ), .D(\FIFO_MEM[3][3] ), .S0(n92), .S1(N11), .Y(n8) );
  MX2X2M U113 ( .A(n10), .B(n9), .S0(N12), .Y(r_data[4]) );
  MX4X1M U114 ( .A(\FIFO_MEM[4][4] ), .B(\FIFO_MEM[5][4] ), .C(
        \FIFO_MEM[6][4] ), .D(\FIFO_MEM[7][4] ), .S0(n92), .S1(N11), .Y(n9) );
  MX4X1M U115 ( .A(\FIFO_MEM[0][4] ), .B(\FIFO_MEM[1][4] ), .C(
        \FIFO_MEM[2][4] ), .D(\FIFO_MEM[3][4] ), .S0(n92), .S1(N11), .Y(n10)
         );
  MX2X2M U116 ( .A(n2), .B(n1), .S0(N12), .Y(r_data[0]) );
  MX4X1M U117 ( .A(\FIFO_MEM[4][0] ), .B(\FIFO_MEM[5][0] ), .C(
        \FIFO_MEM[6][0] ), .D(\FIFO_MEM[7][0] ), .S0(n92), .S1(N11), .Y(n1) );
  MX4X1M U118 ( .A(\FIFO_MEM[0][0] ), .B(\FIFO_MEM[1][0] ), .C(
        \FIFO_MEM[2][0] ), .D(\FIFO_MEM[3][0] ), .S0(n92), .S1(N11), .Y(n2) );
  MX2X2M U119 ( .A(n87), .B(n86), .S0(N12), .Y(r_data[5]) );
  MX4X1M U120 ( .A(\FIFO_MEM[4][5] ), .B(\FIFO_MEM[5][5] ), .C(
        \FIFO_MEM[6][5] ), .D(\FIFO_MEM[7][5] ), .S0(n92), .S1(N11), .Y(n86)
         );
  MX4X1M U121 ( .A(\FIFO_MEM[0][5] ), .B(\FIFO_MEM[1][5] ), .C(
        \FIFO_MEM[2][5] ), .D(\FIFO_MEM[3][5] ), .S0(n92), .S1(N11), .Y(n87)
         );
  MX2X2M U122 ( .A(n4), .B(n3), .S0(N12), .Y(r_data[1]) );
  MX4X1M U123 ( .A(\FIFO_MEM[4][1] ), .B(\FIFO_MEM[5][1] ), .C(
        \FIFO_MEM[6][1] ), .D(\FIFO_MEM[7][1] ), .S0(n92), .S1(N11), .Y(n3) );
  MX4X1M U124 ( .A(\FIFO_MEM[0][1] ), .B(\FIFO_MEM[1][1] ), .C(
        \FIFO_MEM[2][1] ), .D(\FIFO_MEM[3][1] ), .S0(n92), .S1(N11), .Y(n4) );
endmodule


module ASYNC_FIFO_BIT_SYNC_B_WIDTH3_STAGES2_0 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \SYNC_reg[3][0] , \SYNC_reg[2][0] , \SYNC_reg[1][0] ,
         \SYNC_reg[0][0] ;

  DFFRQX2M \SYNC_reg_reg[3][1]  ( .D(\SYNC_reg[3][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[3]) );
  DFFRQX2M \SYNC_reg_reg[2][1]  ( .D(\SYNC_reg[2][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[2]) );
  DFFRQX2M \SYNC_reg_reg[1][1]  ( .D(\SYNC_reg[1][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[1]) );
  DFFRQX2M \SYNC_reg_reg[0][1]  ( .D(\SYNC_reg[0][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[0]) );
  DFFRQX2M \SYNC_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(RST), .Q(
        \SYNC_reg[3][0] ) );
  DFFRQX2M \SYNC_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(RST), .Q(
        \SYNC_reg[2][0] ) );
  DFFRQX2M \SYNC_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(RST), .Q(
        \SYNC_reg[1][0] ) );
  DFFRQX2M \SYNC_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(RST), .Q(
        \SYNC_reg[0][0] ) );
endmodule


module ASYNC_FIFO_BIT_SYNC_B_WIDTH3_STAGES2_1 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \SYNC_reg[3][0] , \SYNC_reg[2][0] , \SYNC_reg[1][0] ,
         \SYNC_reg[0][0] ;

  DFFRQX2M \SYNC_reg_reg[1][1]  ( .D(\SYNC_reg[1][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[1]) );
  DFFRQX2M \SYNC_reg_reg[0][1]  ( .D(\SYNC_reg[0][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[0]) );
  DFFRQX2M \SYNC_reg_reg[3][1]  ( .D(\SYNC_reg[3][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[3]) );
  DFFRQX2M \SYNC_reg_reg[2][1]  ( .D(\SYNC_reg[2][0] ), .CK(CLK), .RN(RST), 
        .Q(SYNC[2]) );
  DFFRQX2M \SYNC_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(RST), .Q(
        \SYNC_reg[3][0] ) );
  DFFRQX2M \SYNC_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(RST), .Q(
        \SYNC_reg[2][0] ) );
  DFFRQX2M \SYNC_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(RST), .Q(
        \SYNC_reg[1][0] ) );
  DFFRQX2M \SYNC_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(RST), .Q(
        \SYNC_reg[0][0] ) );
endmodule


module ASYNC_FIFO_WR_B_WIDTH3 ( W_CLK, W_RST, W_INC, G_rptr, G_wptr, W_addr, 
        W_FULL );
  input [3:0] G_rptr;
  output [3:0] G_wptr;
  output [2:0] W_addr;
  input W_CLK, W_RST, W_INC;
  output W_FULL;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [3:0] COMB_G_wptr;

  DFFRQX2M \inter_addr_reg[3]  ( .D(n11), .CK(W_CLK), .RN(W_RST), .Q(
        COMB_G_wptr[3]) );
  DFFRQX2M \inter_addr_reg[2]  ( .D(n12), .CK(W_CLK), .RN(W_RST), .Q(W_addr[2]) );
  DFFRQX2M \G_wptr_reg[2]  ( .D(COMB_G_wptr[2]), .CK(W_CLK), .RN(W_RST), .Q(
        G_wptr[2]) );
  DFFRQX2M \G_wptr_reg[1]  ( .D(COMB_G_wptr[1]), .CK(W_CLK), .RN(W_RST), .Q(
        G_wptr[1]) );
  DFFRQX2M \G_wptr_reg[0]  ( .D(COMB_G_wptr[0]), .CK(W_CLK), .RN(W_RST), .Q(
        G_wptr[0]) );
  DFFRX1M \inter_addr_reg[0]  ( .D(n14), .CK(W_CLK), .RN(W_RST), .Q(W_addr[0]), 
        .QN(n1) );
  DFFRQX2M \inter_addr_reg[1]  ( .D(n13), .CK(W_CLK), .RN(W_RST), .Q(W_addr[1]) );
  DFFRQX2M \G_wptr_reg[3]  ( .D(COMB_G_wptr[3]), .CK(W_CLK), .RN(W_RST), .Q(
        G_wptr[3]) );
  INVX2M U3 ( .A(n6), .Y(W_FULL) );
  NAND2X2M U4 ( .A(W_INC), .B(n6), .Y(n5) );
  XNOR2X2M U5 ( .A(COMB_G_wptr[1]), .B(G_rptr[1]), .Y(n7) );
  XNOR2X2M U6 ( .A(n1), .B(W_addr[1]), .Y(COMB_G_wptr[0]) );
  NAND4X2M U7 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  CLKXOR2X2M U8 ( .A(G_rptr[3]), .B(COMB_G_wptr[3]), .Y(n9) );
  XNOR2X2M U9 ( .A(COMB_G_wptr[0]), .B(G_rptr[0]), .Y(n8) );
  CLKXOR2X2M U10 ( .A(G_rptr[2]), .B(COMB_G_wptr[2]), .Y(n10) );
  CLKXOR2X2M U11 ( .A(COMB_G_wptr[3]), .B(W_addr[2]), .Y(COMB_G_wptr[2]) );
  CLKXOR2X2M U12 ( .A(W_addr[1]), .B(W_addr[2]), .Y(COMB_G_wptr[1]) );
  NOR2X2M U13 ( .A(n5), .B(n1), .Y(n4) );
  XNOR2X2M U14 ( .A(W_addr[2]), .B(n3), .Y(n12) );
  XNOR2X2M U15 ( .A(COMB_G_wptr[3]), .B(n2), .Y(n11) );
  NAND2BX2M U16 ( .AN(n3), .B(W_addr[2]), .Y(n2) );
  NAND2X2M U17 ( .A(n4), .B(W_addr[1]), .Y(n3) );
  CLKXOR2X2M U18 ( .A(W_addr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
endmodule


module ASYNC_FIFO_RD_B_WIDTH3 ( R_CLK, R_RST, R_INC, G_wptr, G_rptr, R_addr, 
        R_EMPTY );
  input [3:0] G_wptr;
  output [3:0] G_rptr;
  output [2:0] R_addr;
  input R_CLK, R_RST, R_INC;
  output R_EMPTY;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [3:0] COMB_G_rptr;

  DFFRQX2M \inter_addr_reg[3]  ( .D(n11), .CK(R_CLK), .RN(R_RST), .Q(
        COMB_G_rptr[3]) );
  DFFRQX2M \inter_addr_reg[2]  ( .D(n12), .CK(R_CLK), .RN(R_RST), .Q(R_addr[2]) );
  DFFRX1M \inter_addr_reg[0]  ( .D(n14), .CK(R_CLK), .RN(R_RST), .Q(R_addr[0]), 
        .QN(n1) );
  DFFRQX2M \G_rptr_reg[3]  ( .D(COMB_G_rptr[3]), .CK(R_CLK), .RN(R_RST), .Q(
        G_rptr[3]) );
  DFFRQX2M \G_rptr_reg[2]  ( .D(COMB_G_rptr[2]), .CK(R_CLK), .RN(R_RST), .Q(
        G_rptr[2]) );
  DFFRQX2M \G_rptr_reg[1]  ( .D(COMB_G_rptr[1]), .CK(R_CLK), .RN(R_RST), .Q(
        G_rptr[1]) );
  DFFRQX2M \G_rptr_reg[0]  ( .D(COMB_G_rptr[0]), .CK(R_CLK), .RN(R_RST), .Q(
        G_rptr[0]) );
  DFFRQX2M \inter_addr_reg[1]  ( .D(n13), .CK(R_CLK), .RN(R_RST), .Q(R_addr[1]) );
  INVX2M U3 ( .A(n6), .Y(R_EMPTY) );
  XNOR2X2M U4 ( .A(COMB_G_rptr[1]), .B(G_wptr[1]), .Y(n7) );
  XNOR2X2M U5 ( .A(n1), .B(R_addr[1]), .Y(COMB_G_rptr[0]) );
  NOR2X2M U6 ( .A(n5), .B(n1), .Y(n4) );
  XNOR2X2M U7 ( .A(R_addr[2]), .B(n3), .Y(n12) );
  NAND4X2M U8 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  XNOR2X2M U9 ( .A(COMB_G_rptr[3]), .B(G_wptr[3]), .Y(n9) );
  XNOR2X2M U10 ( .A(COMB_G_rptr[2]), .B(G_wptr[2]), .Y(n10) );
  XNOR2X2M U11 ( .A(COMB_G_rptr[0]), .B(G_wptr[0]), .Y(n8) );
  NAND2X2M U12 ( .A(n4), .B(R_addr[1]), .Y(n3) );
  NAND2X2M U13 ( .A(R_INC), .B(n6), .Y(n5) );
  XNOR2X2M U14 ( .A(COMB_G_rptr[3]), .B(n2), .Y(n11) );
  NAND2BX2M U15 ( .AN(n3), .B(R_addr[2]), .Y(n2) );
  CLKXOR2X2M U16 ( .A(R_addr[1]), .B(R_addr[2]), .Y(COMB_G_rptr[1]) );
  CLKXOR2X2M U17 ( .A(COMB_G_rptr[3]), .B(R_addr[2]), .Y(COMB_G_rptr[2]) );
  CLKXOR2X2M U18 ( .A(R_addr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
endmodule


module ASYNC_FIFO_TOP_DATA_WIDTH8_DEPTH8 ( W_CLK, W_RST, W_INC, R_CLK, R_RST, 
        R_INC, WR_DATA, RD_DATA, FULL, EMPTY );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC;
  output FULL, EMPTY;
  wire   n1, n2;
  wire   [2:0] W_ADDRESS;
  wire   [2:0] R_ADDRESS;
  wire   [3:0] A_G_w_ptr;
  wire   [3:0] S_G_w_ptr;
  wire   [3:0] A_G_R_ptr;
  wire   [3:0] S_G_R_ptr;

  ASYNC_FIFO_MEM_DATA_WIDTH8_DEPTH8 U_FIFO_MEM ( .W_CLK(W_CLK), .W_RST(n1), 
        .W_INC(W_INC), .W_FULL(FULL), .w_addr(W_ADDRESS), .r_addr(R_ADDRESS), 
        .w_data(WR_DATA), .r_data(RD_DATA) );
  ASYNC_FIFO_BIT_SYNC_B_WIDTH3_STAGES2_0 U_W2R_SYNC ( .CLK(R_CLK), .RST(R_RST), 
        .ASYNC(A_G_w_ptr), .SYNC(S_G_w_ptr) );
  ASYNC_FIFO_BIT_SYNC_B_WIDTH3_STAGES2_1 U_R2W_SYNC ( .CLK(W_CLK), .RST(n1), 
        .ASYNC(A_G_R_ptr), .SYNC(S_G_R_ptr) );
  ASYNC_FIFO_WR_B_WIDTH3 U_FIFO_WR ( .W_CLK(W_CLK), .W_RST(n1), .W_INC(W_INC), 
        .G_rptr(S_G_R_ptr), .G_wptr(A_G_w_ptr), .W_addr(W_ADDRESS), .W_FULL(
        FULL) );
  ASYNC_FIFO_RD_B_WIDTH3 U_FIFO_RD ( .R_CLK(R_CLK), .R_RST(R_RST), .R_INC(
        R_INC), .G_wptr(S_G_w_ptr), .G_rptr(A_G_R_ptr), .R_addr(R_ADDRESS), 
        .R_EMPTY(EMPTY) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(W_RST), .Y(n2) );
endmodule


module PULSE_GEN_0 ( CLK, RST, LVL_SIG, PULSE_SIG );
  input CLK, RST, LVL_SIG;
  output PULSE_SIG;
  wire   reg_SIG_1, reg_SIG_0;

  DFFRQX2M reg_SIG_0_reg ( .D(LVL_SIG), .CK(CLK), .RN(RST), .Q(reg_SIG_0) );
  DFFRQX2M reg_SIG_1_reg ( .D(reg_SIG_0), .CK(CLK), .RN(RST), .Q(reg_SIG_1) );
  NOR2BX2M U3 ( .AN(reg_SIG_0), .B(reg_SIG_1), .Y(PULSE_SIG) );
endmodule


module Clk_Divider_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Clk_Divider_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N5, CLK_FLAG, div_clk, N15, N16, N17, N18, N19, N20, N21, N22, N26,
         N27, N28, N29, N30, N31, N32, N33, N53, N54, N55, N56, N57, N58, N59,
         N81, N82, N83, N84, N85, N86, N87, N88, n10, n20, n21, n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n11, n12, n13, n14, n15, n16, n17, n18, n19, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40;
  wire   [7:0] counter;
  assign N53 = i_div_ratio[1];
  assign N54 = i_div_ratio[2];
  assign N55 = i_div_ratio[3];
  assign N56 = i_div_ratio[4];
  assign N57 = i_div_ratio[5];
  assign N58 = i_div_ratio[6];
  assign N59 = i_div_ratio[7];

  Clk_Divider_0_DW01_inc_0 r72 ( .A(counter), .SUM({N33, N32, N31, N30, N29, 
        N28, N27, N26}) );
  DFFRX1M div_clk_reg ( .D(n20), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk), 
        .QN(n10) );
  DFFRQX2M \counter_reg[7]  ( .D(N88), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[7]) );
  DFFRQX2M CLK_FLAG_reg ( .D(n21), .CK(i_ref_clk), .RN(i_rst_n), .Q(CLK_FLAG)
         );
  DFFRQX2M \counter_reg[0]  ( .D(N81), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[1]  ( .D(N82), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]) );
  DFFRQX2M \counter_reg[2]  ( .D(N83), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[3]  ( .D(N84), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[4]  ( .D(N85), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[5]  ( .D(N86), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[6]  ( .D(N87), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N5), .Y(o_div_clk) );
  OR2X2M U4 ( .A(N54), .B(N53), .Y(n1) );
  CLKINVX1M U5 ( .A(N53), .Y(N15) );
  OAI2BB1X1M U6 ( .A0N(N53), .A1N(N54), .B0(n1), .Y(N16) );
  OR2X1M U7 ( .A(n1), .B(N55), .Y(n2) );
  OAI2BB1X1M U8 ( .A0N(n1), .A1N(N55), .B0(n2), .Y(N17) );
  OR2X1M U9 ( .A(n2), .B(N56), .Y(n3) );
  OAI2BB1X1M U10 ( .A0N(n2), .A1N(N56), .B0(n3), .Y(N18) );
  OR2X1M U11 ( .A(n3), .B(N57), .Y(n4) );
  OAI2BB1X1M U12 ( .A0N(n3), .A1N(N57), .B0(n4), .Y(N19) );
  XNOR2X1M U13 ( .A(N58), .B(n4), .Y(N20) );
  NOR3X1M U14 ( .A(N58), .B(N59), .C(n4), .Y(N22) );
  OAI21X1M U15 ( .A0(N58), .A1(n4), .B0(N59), .Y(n5) );
  NAND2BX1M U16 ( .AN(N22), .B(n5), .Y(N21) );
  CLKXOR2X2M U17 ( .A(CLK_FLAG), .B(n6), .Y(n21) );
  NOR2X1M U18 ( .A(n7), .B(n8), .Y(n6) );
  MXI2X1M U19 ( .A(n9), .B(n10), .S0(n11), .Y(n20) );
  AOI2BB2XLM U20 ( .B0(n12), .B1(n13), .A0N(n8), .A1N(n7), .Y(n11) );
  AOI2BB2XLM U21 ( .B0(n10), .B1(n12), .A0N(n8), .A1N(CLK_FLAG), .Y(n9) );
  NOR2BX1M U22 ( .AN(N33), .B(n14), .Y(N88) );
  NOR2BX1M U23 ( .AN(N32), .B(n14), .Y(N87) );
  NOR2BX1M U24 ( .AN(N31), .B(n14), .Y(N86) );
  NOR2BX1M U25 ( .AN(N30), .B(n14), .Y(N85) );
  NOR2BX1M U26 ( .AN(N29), .B(n14), .Y(N84) );
  NOR2BX1M U27 ( .AN(N28), .B(n14), .Y(N83) );
  NOR2BX1M U28 ( .AN(N27), .B(n14), .Y(N82) );
  NOR2BX1M U29 ( .AN(N26), .B(n14), .Y(N81) );
  AOI22X1M U30 ( .A0(n15), .A1(n12), .B0(n16), .B1(n7), .Y(n14) );
  MXI2X1M U31 ( .A(n17), .B(n13), .S0(CLK_FLAG), .Y(n7) );
  CLKINVX1M U32 ( .A(n15), .Y(n13) );
  NOR2X1M U33 ( .A(n18), .B(n19), .Y(n17) );
  NAND4X1M U34 ( .A(n22), .B(n23), .C(n24), .D(n25), .Y(n19) );
  XNOR2X1M U35 ( .A(N56), .B(counter[3]), .Y(n25) );
  XNOR2X1M U36 ( .A(N57), .B(counter[4]), .Y(n24) );
  XNOR2X1M U37 ( .A(N58), .B(counter[5]), .Y(n23) );
  XNOR2X1M U38 ( .A(N59), .B(counter[6]), .Y(n22) );
  NAND4BX1M U39 ( .AN(counter[7]), .B(n26), .C(n27), .D(n28), .Y(n18) );
  XNOR2X1M U40 ( .A(N53), .B(counter[0]), .Y(n28) );
  XNOR2X1M U41 ( .A(N54), .B(counter[1]), .Y(n27) );
  XNOR2X1M U42 ( .A(N55), .B(counter[2]), .Y(n26) );
  CLKINVX1M U43 ( .A(n8), .Y(n16) );
  CLKNAND2X2M U44 ( .A(i_div_ratio[0]), .B(N5), .Y(n8) );
  NOR2BX1M U45 ( .AN(N5), .B(i_div_ratio[0]), .Y(n12) );
  CLKNAND2X2M U46 ( .A(n29), .B(n30), .Y(n15) );
  NOR4X1M U47 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n30) );
  CLKXOR2X2M U48 ( .A(counter[7]), .B(N22), .Y(n34) );
  CLKXOR2X2M U49 ( .A(counter[2]), .B(N17), .Y(n33) );
  CLKXOR2X2M U50 ( .A(counter[1]), .B(N16), .Y(n32) );
  CLKXOR2X2M U51 ( .A(counter[0]), .B(N15), .Y(n31) );
  NOR4X1M U52 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n29) );
  CLKXOR2X2M U53 ( .A(counter[6]), .B(N21), .Y(n38) );
  CLKXOR2X2M U54 ( .A(counter[5]), .B(N20), .Y(n37) );
  CLKXOR2X2M U55 ( .A(counter[4]), .B(N19), .Y(n36) );
  CLKXOR2X2M U56 ( .A(counter[3]), .B(N18), .Y(n35) );
  OA21X1M U57 ( .A0(n39), .A1(n40), .B0(i_clk_en), .Y(N5) );
  OR3X1M U58 ( .A(N54), .B(N55), .C(N53), .Y(n40) );
  OR4X1M U59 ( .A(N56), .B(N57), .C(N58), .D(N59), .Y(n39) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [3:0] OUT;
  wire   n5, n6, n7, n8, n9, n1, n2, n3, n4;

  NAND4BX1M U3 ( .AN(IN[4]), .B(IN[3]), .C(n2), .D(n1), .Y(n6) );
  NAND4BX1M U4 ( .AN(IN[3]), .B(IN[4]), .C(n2), .D(n1), .Y(n7) );
  NOR3X2M U5 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR4X1M U6 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U7 ( .A(n4), .B(n3), .C(IN[2]), .Y(n5) );
  NOR3X2M U8 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  OAI211X2M U9 ( .A0(n8), .A1(n9), .B0(n4), .C0(n3), .Y(OUT[0]) );
  NAND2X2M U10 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U11 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n2), .Y(n8) );
  INVX2M U12 ( .A(IN[2]), .Y(n2) );
  INVX2M U13 ( .A(IN[0]), .Y(n4) );
  INVX2M U14 ( .A(IN[1]), .Y(n3) );
  INVX2M U15 ( .A(IN[5]), .Y(n1) );
endmodule


module Clk_Divider_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module Clk_Divider_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N5, CLK_FLAG, div_clk, N15, N16, N17, N18, N19, N20, N21, N22, N26,
         N27, N28, N29, N30, N31, N32, N33, N53, N54, N55, N56, N57, N58, N59,
         N81, N82, N83, N84, N85, N86, N87, N88, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n11, n12, n13, n14, n15, n16, n17, n18, n19, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43;
  wire   [7:0] counter;
  assign N53 = i_div_ratio[1];
  assign N54 = i_div_ratio[2];
  assign N55 = i_div_ratio[3];
  assign N56 = i_div_ratio[4];
  assign N57 = i_div_ratio[5];
  assign N58 = i_div_ratio[6];
  assign N59 = i_div_ratio[7];

  Clk_Divider_1_DW01_inc_0 r72 ( .A(counter), .SUM({N33, N32, N31, N30, N29, 
        N28, N27, N26}) );
  DFFRX1M div_clk_reg ( .D(n42), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk), 
        .QN(n43) );
  DFFRQX2M \counter_reg[7]  ( .D(N88), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[7]) );
  DFFRQX2M CLK_FLAG_reg ( .D(n41), .CK(i_ref_clk), .RN(i_rst_n), .Q(CLK_FLAG)
         );
  DFFRQX2M \counter_reg[0]  ( .D(N81), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[0]) );
  DFFRQX2M \counter_reg[1]  ( .D(N82), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]) );
  DFFRQX2M \counter_reg[2]  ( .D(N83), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]) );
  DFFRQX2M \counter_reg[3]  ( .D(N84), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[4]  ( .D(N85), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFRQX2M \counter_reg[5]  ( .D(N86), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[6]  ( .D(N87), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  OR2X2M U3 ( .A(N54), .B(N53), .Y(n1) );
  MX2X2M U4 ( .A(i_ref_clk), .B(div_clk), .S0(N5), .Y(o_div_clk) );
  CLKINVX1M U5 ( .A(N53), .Y(N15) );
  OAI2BB1X1M U6 ( .A0N(N53), .A1N(N54), .B0(n1), .Y(N16) );
  OR2X1M U7 ( .A(n1), .B(N55), .Y(n2) );
  OAI2BB1X1M U8 ( .A0N(n1), .A1N(N55), .B0(n2), .Y(N17) );
  OR2X1M U9 ( .A(n2), .B(N56), .Y(n3) );
  OAI2BB1X1M U10 ( .A0N(n2), .A1N(N56), .B0(n3), .Y(N18) );
  OR2X1M U11 ( .A(n3), .B(N57), .Y(n4) );
  OAI2BB1X1M U12 ( .A0N(n3), .A1N(N57), .B0(n4), .Y(N19) );
  XNOR2X1M U13 ( .A(N58), .B(n4), .Y(N20) );
  NOR3X1M U14 ( .A(N58), .B(N59), .C(n4), .Y(N22) );
  OAI21X1M U15 ( .A0(N58), .A1(n4), .B0(N59), .Y(n5) );
  NAND2BX1M U16 ( .AN(N22), .B(n5), .Y(N21) );
  CLKXOR2X2M U17 ( .A(CLK_FLAG), .B(n6), .Y(n41) );
  NOR2X1M U18 ( .A(n7), .B(n8), .Y(n6) );
  MXI2X1M U19 ( .A(n9), .B(n43), .S0(n11), .Y(n42) );
  AOI2BB2XLM U20 ( .B0(n12), .B1(n13), .A0N(n8), .A1N(n7), .Y(n11) );
  AOI2BB2XLM U21 ( .B0(n43), .B1(n12), .A0N(n8), .A1N(CLK_FLAG), .Y(n9) );
  NOR2BX1M U22 ( .AN(N33), .B(n14), .Y(N88) );
  NOR2BX1M U23 ( .AN(N32), .B(n14), .Y(N87) );
  NOR2BX1M U24 ( .AN(N31), .B(n14), .Y(N86) );
  NOR2BX1M U25 ( .AN(N30), .B(n14), .Y(N85) );
  NOR2BX1M U26 ( .AN(N29), .B(n14), .Y(N84) );
  NOR2BX1M U27 ( .AN(N28), .B(n14), .Y(N83) );
  NOR2BX1M U28 ( .AN(N27), .B(n14), .Y(N82) );
  NOR2BX1M U29 ( .AN(N26), .B(n14), .Y(N81) );
  AOI22X1M U30 ( .A0(n15), .A1(n12), .B0(n16), .B1(n7), .Y(n14) );
  MXI2X1M U31 ( .A(n17), .B(n13), .S0(CLK_FLAG), .Y(n7) );
  CLKINVX1M U32 ( .A(n15), .Y(n13) );
  NOR2X1M U33 ( .A(n18), .B(n19), .Y(n17) );
  NAND4X1M U34 ( .A(n22), .B(n23), .C(n24), .D(n25), .Y(n19) );
  XNOR2X1M U35 ( .A(N56), .B(counter[3]), .Y(n25) );
  XNOR2X1M U36 ( .A(N57), .B(counter[4]), .Y(n24) );
  XNOR2X1M U37 ( .A(N58), .B(counter[5]), .Y(n23) );
  XNOR2X1M U38 ( .A(N59), .B(counter[6]), .Y(n22) );
  NAND4BX1M U39 ( .AN(counter[7]), .B(n26), .C(n27), .D(n28), .Y(n18) );
  XNOR2X1M U40 ( .A(N53), .B(counter[0]), .Y(n28) );
  XNOR2X1M U41 ( .A(N54), .B(counter[1]), .Y(n27) );
  XNOR2X1M U42 ( .A(N55), .B(counter[2]), .Y(n26) );
  CLKINVX1M U43 ( .A(n8), .Y(n16) );
  CLKNAND2X2M U44 ( .A(i_div_ratio[0]), .B(N5), .Y(n8) );
  NOR2BX1M U45 ( .AN(N5), .B(i_div_ratio[0]), .Y(n12) );
  CLKNAND2X2M U46 ( .A(n29), .B(n30), .Y(n15) );
  NOR4X1M U47 ( .A(n31), .B(n32), .C(n33), .D(n34), .Y(n30) );
  CLKXOR2X2M U48 ( .A(counter[7]), .B(N22), .Y(n34) );
  CLKXOR2X2M U49 ( .A(counter[2]), .B(N17), .Y(n33) );
  CLKXOR2X2M U50 ( .A(counter[1]), .B(N16), .Y(n32) );
  CLKXOR2X2M U51 ( .A(counter[0]), .B(N15), .Y(n31) );
  NOR4X1M U52 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n29) );
  CLKXOR2X2M U53 ( .A(counter[6]), .B(N21), .Y(n38) );
  CLKXOR2X2M U54 ( .A(counter[5]), .B(N20), .Y(n37) );
  CLKXOR2X2M U55 ( .A(counter[4]), .B(N19), .Y(n36) );
  CLKXOR2X2M U56 ( .A(counter[3]), .B(N18), .Y(n35) );
  OA21X1M U57 ( .A0(n39), .A1(n40), .B0(i_clk_en), .Y(N5) );
  OR3X1M U58 ( .A(N54), .B(N55), .C(N53), .Y(n40) );
  OR4X1M U59 ( .A(N56), .B(N57), .C(N58), .D(N59), .Y(n39) );
endmodule


module UART_Parity ( clk, RST_n, P_DATA, LOAD, Data_Valid, PAR_TYP, Par_bit );
  input [7:0] P_DATA;
  input clk, RST_n, LOAD, Data_Valid, PAR_TYP;
  output Par_bit;
  wire   n1, n2, n3, n4, n5, n6, n7;

  DFFRQX2M Par_bit_reg ( .D(n7), .CK(clk), .RN(RST_n), .Q(Par_bit) );
  XNOR2X2M U2 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(Par_bit), .A1N(n2), .Y(n7) );
  NAND2X2M U6 ( .A(LOAD), .B(Data_Valid), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
endmodule


module UART_FSM ( clk, RST_n, ser_done, par_bit, ser_data, Data_Valid, PAR_EN, 
        ser_en, Load, TX_OUT, busy );
  input clk, RST_n, ser_done, par_bit, ser_data, Data_Valid, PAR_EN;
  output ser_en, Load, TX_OUT, busy;
  wire   n5, n6, n7, n8, n1, n2, n3, n4;
  wire   [2:0] Current_state;
  wire   [2:0] Next_state;

  DFFRQX2M \Current_state_reg[1]  ( .D(n1), .CK(clk), .RN(RST_n), .Q(
        Current_state[1]) );
  DFFRQX2M \Current_state_reg[0]  ( .D(Next_state[0]), .CK(clk), .RN(RST_n), 
        .Q(Current_state[0]) );
  DFFRQX2M \Current_state_reg[2]  ( .D(Next_state[2]), .CK(clk), .RN(RST_n), 
        .Q(Current_state[2]) );
  NOR2BX2M U3 ( .AN(Data_Valid), .B(busy), .Y(Load) );
  NAND3X2M U4 ( .A(n3), .B(n4), .C(n2), .Y(busy) );
  INVX2M U5 ( .A(n6), .Y(n1) );
  OAI2BB1X2M U6 ( .A0N(par_bit), .A1N(n2), .B0(n5), .Y(TX_OUT) );
  AOI31X2M U7 ( .A0(Current_state[1]), .A1(Current_state[0]), .A2(ser_data), 
        .B0(n6), .Y(n5) );
  NOR2X2M U8 ( .A(n2), .B(Current_state[2]), .Y(ser_en) );
  AOI21X2M U9 ( .A0(n4), .A1(Current_state[1]), .B0(ser_en), .Y(n6) );
  INVX2M U10 ( .A(Current_state[2]), .Y(n4) );
  INVX2M U11 ( .A(Current_state[0]), .Y(n2) );
  OAI2B2X1M U12 ( .A1N(ser_en), .A0(ser_done), .B0(Current_state[1]), .B1(n8), 
        .Y(Next_state[0]) );
  AOI21X2M U13 ( .A0(Data_Valid), .A1(n4), .B0(ser_en), .Y(n8) );
  INVX2M U14 ( .A(Current_state[1]), .Y(n3) );
  NOR3X2M U15 ( .A(n3), .B(Current_state[2]), .C(n7), .Y(Next_state[2]) );
  AOI2B1X1M U16 ( .A1N(PAR_EN), .A0(ser_done), .B0(n2), .Y(n7) );
endmodule


module UART_Serializer ( clk, RST_n, P_DATA, ser_en, Load, ser_done, ser_data
 );
  input [7:0] P_DATA;
  input clk, RST_n, ser_en, Load;
  output ser_done, ser_data;
  wire   N2, N3, N4, N8, N19, N20, N21, N23, n1, n2, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n3, n4, n17, n18;
  wire   [7:0] P_DATA_reg;

  DFFRQX2M \P_DATA_reg_reg[5]  ( .D(n13), .CK(clk), .RN(RST_n), .Q(
        P_DATA_reg[5]) );
  DFFRQX2M \P_DATA_reg_reg[1]  ( .D(n9), .CK(clk), .RN(RST_n), .Q(
        P_DATA_reg[1]) );
  DFFRQX2M \P_DATA_reg_reg[7]  ( .D(n15), .CK(clk), .RN(RST_n), .Q(
        P_DATA_reg[7]) );
  DFFRQX2M \P_DATA_reg_reg[3]  ( .D(n11), .CK(clk), .RN(RST_n), .Q(
        P_DATA_reg[3]) );
  DFFRQX2M \P_DATA_reg_reg[6]  ( .D(n14), .CK(clk), .RN(RST_n), .Q(
        P_DATA_reg[6]) );
  DFFRQX2M \P_DATA_reg_reg[2]  ( .D(n10), .CK(clk), .RN(RST_n), .Q(
        P_DATA_reg[2]) );
  DFFRQX2M \P_DATA_reg_reg[4]  ( .D(n12), .CK(clk), .RN(RST_n), .Q(
        P_DATA_reg[4]) );
  DFFRQX2M \P_DATA_reg_reg[0]  ( .D(n8), .CK(clk), .RN(RST_n), .Q(
        P_DATA_reg[0]) );
  DFFRQX2M ser_done_reg ( .D(N23), .CK(clk), .RN(RST_n), .Q(ser_done) );
  DFFRX1M \counter_reg[2]  ( .D(N21), .CK(clk), .RN(RST_n), .Q(N4), .QN(n1) );
  DFFRQX2M \counter_reg[0]  ( .D(N19), .CK(clk), .RN(RST_n), .Q(N2) );
  DFFRX1M \counter_reg[1]  ( .D(N20), .CK(clk), .RN(RST_n), .Q(N3), .QN(n2) );
  DFFRQX2M ser_data_reg ( .D(n16), .CK(clk), .RN(RST_n), .Q(ser_data) );
  INVX2M U3 ( .A(Load), .Y(n18) );
  OAI31X1M U4 ( .A0(n1), .A1(n17), .A2(n2), .B0(ser_en), .Y(n6) );
  OAI32X1M U5 ( .A0(n6), .A1(n17), .A2(n2), .B0(n1), .B1(n6), .Y(N21) );
  NOR2X2M U6 ( .A(N2), .B(n6), .Y(N19) );
  NOR2X2M U7 ( .A(n7), .B(n6), .Y(N20) );
  CLKXOR2X2M U8 ( .A(n2), .B(N2), .Y(n7) );
  MX4X1M U9 ( .A(P_DATA_reg[0]), .B(P_DATA_reg[1]), .C(P_DATA_reg[2]), .D(
        P_DATA_reg[3]), .S0(N2), .S1(N3), .Y(n4) );
  INVX2M U10 ( .A(N2), .Y(n17) );
  AO2B2X2M U11 ( .B0(ser_data), .B1(n5), .A0(N8), .A1N(n5), .Y(n16) );
  MX2X2M U12 ( .A(n4), .B(n3), .S0(N4), .Y(N8) );
  NAND2X2M U13 ( .A(ser_en), .B(n18), .Y(n5) );
  MX4X1M U14 ( .A(P_DATA_reg[4]), .B(P_DATA_reg[5]), .C(P_DATA_reg[6]), .D(
        P_DATA_reg[7]), .S0(N2), .S1(N3), .Y(n3) );
  AO22X1M U15 ( .A0(P_DATA[0]), .A1(Load), .B0(P_DATA_reg[0]), .B1(n18), .Y(n8) );
  AO22X1M U16 ( .A0(P_DATA[1]), .A1(Load), .B0(P_DATA_reg[1]), .B1(n18), .Y(n9) );
  AO22X1M U17 ( .A0(P_DATA[2]), .A1(Load), .B0(P_DATA_reg[2]), .B1(n18), .Y(
        n10) );
  AO22X1M U18 ( .A0(P_DATA[3]), .A1(Load), .B0(P_DATA_reg[3]), .B1(n18), .Y(
        n11) );
  AO22X1M U19 ( .A0(P_DATA[4]), .A1(Load), .B0(P_DATA_reg[4]), .B1(n18), .Y(
        n12) );
  AO22X1M U20 ( .A0(P_DATA[5]), .A1(Load), .B0(P_DATA_reg[5]), .B1(n18), .Y(
        n13) );
  AO22X1M U21 ( .A0(P_DATA[6]), .A1(Load), .B0(P_DATA_reg[6]), .B1(n18), .Y(
        n14) );
  AO22X1M U22 ( .A0(P_DATA[7]), .A1(Load), .B0(P_DATA_reg[7]), .B1(n18), .Y(
        n15) );
  NOR3X2M U23 ( .A(n1), .B(n17), .C(n2), .Y(N23) );
endmodule


module UART_TX_Top ( clk, RST, PAR_TYP, PAR_EN, P_DATA, Data_Valid, TX_OUT, 
        busy );
  input [7:0] P_DATA;
  input clk, RST, PAR_TYP, PAR_EN, Data_Valid;
  output TX_OUT, busy;
  wire   load_data, parity, serial_done, serial_data, serializer_en, n1, n2;

  UART_Parity parity_calc ( .clk(clk), .RST_n(n1), .P_DATA(P_DATA), .LOAD(
        load_data), .Data_Valid(Data_Valid), .PAR_TYP(PAR_TYP), .Par_bit(
        parity) );
  UART_FSM FSM ( .clk(clk), .RST_n(n1), .ser_done(serial_done), .par_bit(
        parity), .ser_data(serial_data), .Data_Valid(Data_Valid), .PAR_EN(
        PAR_EN), .ser_en(serializer_en), .Load(load_data), .TX_OUT(TX_OUT), 
        .busy(busy) );
  UART_Serializer SER ( .clk(clk), .RST_n(n1), .P_DATA(P_DATA), .ser_en(
        serializer_en), .Load(load_data), .ser_done(serial_done), .ser_data(
        serial_data) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_RX_deserializer ( clk, rst_n, enable, serial_data, P_DATA );
  output [7:0] P_DATA;
  input clk, rst_n, enable, serial_data;
  wire   n1, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n21, n22, n23,
         n24, n25, n26, n29, n31, n33, n34, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n2, n3, n4, n5, n6, n7, n8, n9, n20, n27, n28, n30, n32, n35, n57;
  wire   [3:0] counter;
  wire   [7:0] P_DATA_reg;

  DFFRQX2M \P_DATA_reg_reg[5]  ( .D(n47), .CK(clk), .RN(rst_n), .Q(
        P_DATA_reg[5]) );
  DFFRQX2M \P_DATA_reg_reg[4]  ( .D(n48), .CK(clk), .RN(rst_n), .Q(
        P_DATA_reg[4]) );
  DFFRQX2M \P_DATA_reg_reg[1]  ( .D(n51), .CK(clk), .RN(rst_n), .Q(
        P_DATA_reg[1]) );
  DFFRQX2M \P_DATA_reg_reg[0]  ( .D(n52), .CK(clk), .RN(rst_n), .Q(
        P_DATA_reg[0]) );
  DFFRQX2M \P_DATA_reg_reg[7]  ( .D(n45), .CK(clk), .RN(rst_n), .Q(
        P_DATA_reg[7]) );
  DFFRQX2M \P_DATA_reg_reg[6]  ( .D(n46), .CK(clk), .RN(rst_n), .Q(
        P_DATA_reg[6]) );
  DFFRQX2M \P_DATA_reg_reg[3]  ( .D(n49), .CK(clk), .RN(rst_n), .Q(
        P_DATA_reg[3]) );
  DFFRQX2M \P_DATA_reg_reg[2]  ( .D(n50), .CK(clk), .RN(rst_n), .Q(
        P_DATA_reg[2]) );
  DFFRQX2M \P_DATA_reg[5]_inst  ( .D(n44), .CK(clk), .RN(rst_n), .Q(P_DATA[5])
         );
  DFFRQX2M \P_DATA_reg[1]_inst  ( .D(n42), .CK(clk), .RN(rst_n), .Q(P_DATA[1])
         );
  DFFRQX2M \P_DATA_reg[4]_inst  ( .D(n43), .CK(clk), .RN(rst_n), .Q(P_DATA[4])
         );
  DFFRQX2M \P_DATA_reg[0]_inst  ( .D(n41), .CK(clk), .RN(rst_n), .Q(P_DATA[0])
         );
  DFFRQX2M \P_DATA_reg[7]_inst  ( .D(n40), .CK(clk), .RN(rst_n), .Q(P_DATA[7])
         );
  DFFRQX2M \P_DATA_reg[3]_inst  ( .D(n38), .CK(clk), .RN(rst_n), .Q(P_DATA[3])
         );
  DFFRQX2M \P_DATA_reg[6]_inst  ( .D(n39), .CK(clk), .RN(rst_n), .Q(P_DATA[6])
         );
  DFFRQX2M \P_DATA_reg[2]_inst  ( .D(n37), .CK(clk), .RN(rst_n), .Q(P_DATA[2])
         );
  DFFRQX2M \counter_reg[3]  ( .D(n55), .CK(clk), .RN(rst_n), .Q(counter[3]) );
  DFFRQX2M \counter_reg[1]  ( .D(n54), .CK(clk), .RN(rst_n), .Q(counter[1]) );
  DFFRQX2M \counter_reg[2]  ( .D(n53), .CK(clk), .RN(rst_n), .Q(counter[2]) );
  DFFRQX2M \counter_reg[0]  ( .D(n56), .CK(clk), .RN(rst_n), .Q(counter[0]) );
  AOI2BB1X2M U3 ( .A0N(n36), .A1N(n5), .B0(n3), .Y(n29) );
  INVX2M U4 ( .A(n31), .Y(n3) );
  NAND3X2M U5 ( .A(n8), .B(n6), .C(enable), .Y(n23) );
  OAI221X1M U6 ( .A0(n3), .A1(n16), .B0(n7), .B1(n31), .C0(n14), .Y(n54) );
  NAND2X2M U7 ( .A(enable), .B(n2), .Y(n36) );
  OAI22X1M U8 ( .A0(n14), .A1(n21), .B0(n24), .B1(n57), .Y(n50) );
  NOR2X2M U9 ( .A(n14), .B(n23), .Y(n24) );
  OAI22X1M U10 ( .A0(n10), .A1(n21), .B0(n22), .B1(n35), .Y(n49) );
  NOR2X2M U11 ( .A(n10), .B(n23), .Y(n22) );
  OAI22X1M U12 ( .A0(n11), .A1(n14), .B0(n15), .B1(n32), .Y(n46) );
  NOR2X2M U13 ( .A(n13), .B(n14), .Y(n15) );
  OAI22X1M U14 ( .A0(n10), .A1(n11), .B0(n12), .B1(n30), .Y(n45) );
  NOR2X2M U15 ( .A(n10), .B(n13), .Y(n12) );
  OAI22X1M U16 ( .A0(n18), .A1(n21), .B0(n26), .B1(n28), .Y(n52) );
  NOR2X2M U17 ( .A(n18), .B(n23), .Y(n26) );
  OAI22X1M U18 ( .A0(n16), .A1(n21), .B0(n25), .B1(n27), .Y(n51) );
  NOR2X2M U19 ( .A(n16), .B(n23), .Y(n25) );
  OAI22X1M U20 ( .A0(n18), .A1(n11), .B0(n19), .B1(n20), .Y(n48) );
  NOR2X2M U21 ( .A(n18), .B(n13), .Y(n19) );
  OAI22X1M U22 ( .A0(n11), .A1(n16), .B0(n17), .B1(n9), .Y(n47) );
  NOR2X2M U23 ( .A(n13), .B(n16), .Y(n17) );
  NAND2X2M U24 ( .A(n36), .B(n2), .Y(n31) );
  NAND2X2M U25 ( .A(n7), .B(n4), .Y(n18) );
  INVX2M U26 ( .A(n10), .Y(n5) );
  OAI32X1M U27 ( .A0(n10), .A1(counter[2]), .A2(n3), .B0(n29), .B1(n8), .Y(n53) );
  NAND3X2M U28 ( .A(counter[2]), .B(n6), .C(enable), .Y(n13) );
  OAI22X1M U29 ( .A0(counter[0]), .A1(n36), .B0(n4), .B1(n31), .Y(n56) );
  NAND2BX2M U30 ( .AN(n13), .B(serial_data), .Y(n11) );
  NAND2BX2M U31 ( .AN(n23), .B(serial_data), .Y(n21) );
  OAI21X2M U32 ( .A0(n33), .A1(n6), .B0(n34), .Y(n55) );
  NAND4X2M U33 ( .A(n5), .B(counter[2]), .C(n31), .D(n6), .Y(n34) );
  OA21X2M U34 ( .A0(n36), .A1(counter[2]), .B0(n29), .Y(n33) );
  NAND2X2M U35 ( .A(counter[1]), .B(counter[0]), .Y(n10) );
  BUFX2M U36 ( .A(n1), .Y(n2) );
  NAND3BX2M U37 ( .AN(n18), .B(n8), .C(counter[3]), .Y(n1) );
  OAI2BB2X1M U38 ( .B0(n2), .B1(n57), .A0N(P_DATA[2]), .A1N(n2), .Y(n37) );
  OAI2BB2X1M U39 ( .B0(n2), .B1(n35), .A0N(P_DATA[3]), .A1N(n2), .Y(n38) );
  OAI2BB2X1M U40 ( .B0(n2), .B1(n32), .A0N(P_DATA[6]), .A1N(n2), .Y(n39) );
  OAI2BB2X1M U41 ( .B0(n2), .B1(n30), .A0N(P_DATA[7]), .A1N(n2), .Y(n40) );
  OAI2BB2X1M U42 ( .B0(n2), .B1(n28), .A0N(P_DATA[0]), .A1N(n2), .Y(n41) );
  OAI2BB2X1M U43 ( .B0(n2), .B1(n27), .A0N(P_DATA[1]), .A1N(n2), .Y(n42) );
  OAI2BB2X1M U44 ( .B0(n2), .B1(n20), .A0N(P_DATA[4]), .A1N(n2), .Y(n43) );
  OAI2BB2X1M U45 ( .B0(n2), .B1(n9), .A0N(P_DATA[5]), .A1N(n2), .Y(n44) );
  INVX2M U46 ( .A(counter[0]), .Y(n4) );
  INVX2M U47 ( .A(counter[3]), .Y(n6) );
  INVX2M U48 ( .A(counter[1]), .Y(n7) );
  INVX2M U49 ( .A(counter[2]), .Y(n8) );
  NAND2X2M U50 ( .A(counter[0]), .B(n7), .Y(n16) );
  NAND2X2M U51 ( .A(counter[1]), .B(n4), .Y(n14) );
  INVX2M U52 ( .A(P_DATA_reg[2]), .Y(n57) );
  INVX2M U53 ( .A(P_DATA_reg[3]), .Y(n35) );
  INVX2M U54 ( .A(P_DATA_reg[6]), .Y(n32) );
  INVX2M U55 ( .A(P_DATA_reg[7]), .Y(n30) );
  INVX2M U56 ( .A(P_DATA_reg[0]), .Y(n28) );
  INVX2M U57 ( .A(P_DATA_reg[1]), .Y(n27) );
  INVX2M U58 ( .A(P_DATA_reg[4]), .Y(n20) );
  INVX2M U59 ( .A(P_DATA_reg[5]), .Y(n9) );
endmodule


module UART_RX_edge_counter ( clk, rst_n, enable, PAR_EN, Prescale, edge_cnt, 
        bit_cnt );
  input [5:0] Prescale;
  output [4:0] edge_cnt;
  output [3:0] bit_cnt;
  input clk, rst_n, enable, PAR_EN;
  wire   N5, N6, N7, N8, N9, N10, max_edge, N16, N17, N18, N20, N21, N22, N23,
         N24, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, \add_26/carry[4] , \add_26/carry[3] , \add_26/carry[2] , n1,
         n2, n3, n4, n5, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33;

  DFFRQX2M \bit_cnt_reg[3]  ( .D(n20), .CK(clk), .RN(rst_n), .Q(bit_cnt[3]) );
  DFFRQX2M \bit_cnt_reg[2]  ( .D(n18), .CK(clk), .RN(rst_n), .Q(bit_cnt[2]) );
  DFFRQX2M \bit_cnt_reg[1]  ( .D(n19), .CK(clk), .RN(rst_n), .Q(bit_cnt[1]) );
  DFFRQX2M \bit_cnt_reg[0]  ( .D(n21), .CK(clk), .RN(rst_n), .Q(bit_cnt[0]) );
  DFFRQX2M \edge_cnt_reg[4]  ( .D(N24), .CK(clk), .RN(rst_n), .Q(edge_cnt[4])
         );
  DFFRQX2M \edge_cnt_reg[0]  ( .D(N20), .CK(clk), .RN(rst_n), .Q(edge_cnt[0])
         );
  DFFRQX2M \edge_cnt_reg[3]  ( .D(N23), .CK(clk), .RN(rst_n), .Q(edge_cnt[3])
         );
  DFFRQX2M \edge_cnt_reg[2]  ( .D(N22), .CK(clk), .RN(rst_n), .Q(edge_cnt[2])
         );
  DFFRQX2M \edge_cnt_reg[1]  ( .D(N21), .CK(clk), .RN(rst_n), .Q(edge_cnt[1])
         );
  NAND3X2M U3 ( .A(max_edge), .B(n15), .C(enable), .Y(n9) );
  NAND2BX2M U4 ( .AN(max_edge), .B(enable), .Y(n17) );
  NAND3X2M U5 ( .A(n9), .B(n15), .C(enable), .Y(n14) );
  NOR2BX2M U6 ( .AN(N16), .B(n17), .Y(N21) );
  NOR2BX2M U7 ( .AN(N17), .B(n17), .Y(N22) );
  NOR2BX2M U8 ( .AN(N18), .B(n17), .Y(N23) );
  NOR2BX2M U9 ( .AN(enable), .B(n6), .Y(n18) );
  CLKXOR2X2M U10 ( .A(n7), .B(bit_cnt[2]), .Y(n6) );
  NAND3X2M U11 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .C(max_edge), .Y(n7) );
  OAI2B2X1M U12 ( .A1N(bit_cnt[0]), .A0(n14), .B0(bit_cnt[0]), .B1(n9), .Y(n21) );
  OAI21X2M U13 ( .A0(bit_cnt[0]), .A1(n9), .B0(n14), .Y(n10) );
  OAI2BB2X1M U14 ( .B0(n8), .B1(n9), .A0N(n10), .A1N(bit_cnt[1]), .Y(n19) );
  OAI32X1M U15 ( .A0(n11), .A1(n9), .A2(n12), .B0(n13), .B1(n32), .Y(n20) );
  NAND2X2M U16 ( .A(bit_cnt[0]), .B(n32), .Y(n11) );
  AOI2B1X1M U17 ( .A1N(n9), .A0(n12), .B0(n10), .Y(n13) );
  INVX2M U18 ( .A(bit_cnt[3]), .Y(n32) );
  NOR2X2M U19 ( .A(n1), .B(n17), .Y(N24) );
  XNOR2X2M U20 ( .A(\add_26/carry[4] ), .B(edge_cnt[4]), .Y(n1) );
  NOR2X2M U21 ( .A(edge_cnt[0]), .B(n17), .Y(N20) );
  NAND3BX2M U22 ( .AN(bit_cnt[2]), .B(n16), .C(bit_cnt[3]), .Y(n15) );
  OAI32X1M U23 ( .A0(n33), .A1(bit_cnt[0]), .A2(n31), .B0(PAR_EN), .B1(n8), 
        .Y(n16) );
  INVX2M U24 ( .A(PAR_EN), .Y(n33) );
  NAND2X2M U25 ( .A(bit_cnt[0]), .B(n31), .Y(n8) );
  INVX2M U26 ( .A(bit_cnt[1]), .Y(n31) );
  ADDHX1M U27 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_26/carry[2] ), .S(
        N16) );
  ADDHX1M U28 ( .A(edge_cnt[2]), .B(\add_26/carry[2] ), .CO(\add_26/carry[3] ), 
        .S(N17) );
  ADDHX1M U29 ( .A(edge_cnt[3]), .B(\add_26/carry[3] ), .CO(\add_26/carry[4] ), 
        .S(N18) );
  NAND2X2M U30 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n12) );
  OR2X2M U31 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  INVX2M U32 ( .A(Prescale[3]), .Y(n22) );
  CLKINVX1M U33 ( .A(Prescale[0]), .Y(N5) );
  OAI2BB1X1M U34 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N6) );
  NOR2X1M U35 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  AO21XLM U36 ( .A0(n2), .A1(Prescale[2]), .B0(n3), .Y(N7) );
  CLKNAND2X2M U37 ( .A(n3), .B(n22), .Y(n4) );
  OAI21X1M U38 ( .A0(n3), .A1(n22), .B0(n4), .Y(N8) );
  XNOR2X1M U39 ( .A(Prescale[4]), .B(n4), .Y(N9) );
  NOR2X1M U40 ( .A(Prescale[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U41 ( .A(Prescale[5]), .B(n5), .Y(N10) );
  NOR2BX1M U42 ( .AN(N5), .B(edge_cnt[0]), .Y(n23) );
  OAI2B2X1M U43 ( .A1N(edge_cnt[1]), .A0(n23), .B0(N6), .B1(n23), .Y(n26) );
  NOR2BX1M U44 ( .AN(edge_cnt[0]), .B(N5), .Y(n24) );
  OAI2B2X1M U45 ( .A1N(N6), .A0(n24), .B0(edge_cnt[1]), .B1(n24), .Y(n25) );
  NAND3BX1M U46 ( .AN(N10), .B(n26), .C(n25), .Y(n30) );
  CLKXOR2X2M U47 ( .A(N9), .B(edge_cnt[4]), .Y(n29) );
  CLKXOR2X2M U48 ( .A(N7), .B(edge_cnt[2]), .Y(n28) );
  CLKXOR2X2M U49 ( .A(N8), .B(edge_cnt[3]), .Y(n27) );
  NOR4X1M U50 ( .A(n30), .B(n29), .C(n28), .D(n27), .Y(max_edge) );
endmodule


module UART_RX_sampler ( clk, rst_n, RX_IN, sample_en, Prescale, edge_count, 
        sampled_bit );
  input [5:0] Prescale;
  input [4:0] edge_count;
  input clk, rst_n, RX_IN, sample_en;
  output sampled_bit;
  wire   n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12;
  wire   [1:0] counter;
  wire   [1:0] sampled_data;

  DFFRQX2M \sampled_data_reg[1]  ( .D(n34), .CK(clk), .RN(rst_n), .Q(
        sampled_data[1]) );
  DFFRQX2M \sampled_data_reg[0]  ( .D(n33), .CK(clk), .RN(rst_n), .Q(
        sampled_data[0]) );
  DFFRQX2M \counter_reg[1]  ( .D(n35), .CK(clk), .RN(rst_n), .Q(counter[1]) );
  DFFRQX2M \counter_reg[0]  ( .D(n36), .CK(clk), .RN(rst_n), .Q(counter[0]) );
  DFFRQX2M sampled_bit_reg ( .D(n32), .CK(clk), .RN(rst_n), .Q(sampled_bit) );
  INVX2M U3 ( .A(RX_IN), .Y(n12) );
  AND3X2M U4 ( .A(n16), .B(n2), .C(sample_en), .Y(n19) );
  NAND3X2M U5 ( .A(n16), .B(n15), .C(sample_en), .Y(n21) );
  NAND2X2M U6 ( .A(n21), .B(n15), .Y(n22) );
  OAI2BB2X1M U7 ( .B0(n13), .B1(n14), .A0N(sampled_bit), .A1N(n14), .Y(n32) );
  NAND3BX2M U8 ( .AN(n15), .B(n16), .C(sample_en), .Y(n14) );
  AOI21X2M U9 ( .A0(sampled_data[0]), .A1(RX_IN), .B0(n17), .Y(n13) );
  OA21X2M U10 ( .A0(sampled_data[0]), .A1(RX_IN), .B0(sampled_data[1]), .Y(n17) );
  OAI2BB2X1M U11 ( .B0(n12), .B1(n18), .A0N(n18), .A1N(sampled_data[0]), .Y(
        n33) );
  NAND2X2M U12 ( .A(n19), .B(n1), .Y(n18) );
  OAI2BB2X1M U13 ( .B0(n12), .B1(n20), .A0N(n20), .A1N(sampled_data[1]), .Y(
        n34) );
  NAND2X2M U14 ( .A(counter[0]), .B(n19), .Y(n20) );
  OAI33X2M U15 ( .A0(n10), .A1(Prescale[3]), .A2(n26), .B0(n27), .B1(n28), 
        .B2(n11), .Y(n25) );
  INVX2M U16 ( .A(Prescale[3]), .Y(n11) );
  NAND3X2M U17 ( .A(n6), .B(n5), .C(n10), .Y(n27) );
  AOI32X1M U18 ( .A0(n3), .A1(n8), .A2(edge_count[2]), .B0(edge_count[1]), 
        .B1(n7), .Y(n28) );
  OAI32X1M U19 ( .A0(n21), .A1(counter[1]), .A2(n1), .B0(n2), .B1(n22), .Y(n35) );
  NOR4X1M U20 ( .A(Prescale[0]), .B(n23), .C(Prescale[2]), .D(Prescale[1]), 
        .Y(n16) );
  AOI32X1M U21 ( .A0(Prescale[5]), .A1(n4), .A2(n24), .B0(n25), .B1(n9), .Y(
        n23) );
  INVX2M U22 ( .A(Prescale[5]), .Y(n9) );
  NOR2X2M U23 ( .A(Prescale[4]), .B(Prescale[3]), .Y(n24) );
  AOI32X1M U24 ( .A0(n29), .A1(n5), .A2(edge_count[3]), .B0(n30), .B1(n6), .Y(
        n26) );
  NOR3X2M U25 ( .A(n8), .B(edge_count[4]), .C(n7), .Y(n30) );
  NOR3X2M U26 ( .A(edge_count[1]), .B(edge_count[2]), .C(edge_count[0]), .Y(
        n29) );
  OAI22X1M U27 ( .A0(n1), .A1(n22), .B0(counter[0]), .B1(n21), .Y(n36) );
  INVX2M U28 ( .A(edge_count[1]), .Y(n8) );
  INVX2M U29 ( .A(edge_count[2]), .Y(n7) );
  INVX2M U30 ( .A(n31), .Y(n4) );
  AOI32X1M U31 ( .A0(edge_count[4]), .A1(n6), .A2(n29), .B0(n30), .B1(
        edge_count[3]), .Y(n31) );
  NAND2X2M U32 ( .A(counter[1]), .B(n1), .Y(n15) );
  INVX2M U33 ( .A(counter[0]), .Y(n1) );
  INVX2M U34 ( .A(edge_count[3]), .Y(n6) );
  INVX2M U35 ( .A(edge_count[4]), .Y(n5) );
  INVX2M U36 ( .A(edge_count[0]), .Y(n3) );
  INVX2M U37 ( .A(counter[1]), .Y(n2) );
  INVX2M U38 ( .A(Prescale[4]), .Y(n10) );
endmodule


module UART_RX_parity_check ( clk, rst_n, PAR_TYP, enable, serial_data, P_DATA, 
        parity_error );
  input [7:0] P_DATA;
  input clk, rst_n, PAR_TYP, enable, serial_data;
  output parity_error;
  wire   n1, n2, n3, n4, n5, n6, n7;

  DFFRQX2M parity_error_reg ( .D(n7), .CK(clk), .RN(rst_n), .Q(parity_error)
         );
  XNOR2X2M U3 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  XOR3XLM U4 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  XNOR2X2M U5 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  AO21XLM U6 ( .A0(enable), .A1(n1), .B0(parity_error), .Y(n7) );
  XOR3XLM U7 ( .A(n2), .B(n3), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
  CLKXOR2X2M U9 ( .A(serial_data), .B(PAR_TYP), .Y(n2) );
endmodule


module UART_RX_start_check ( clk, rst_n, enable, serial_data, start_glitch );
  input clk, rst_n, enable, serial_data;
  output start_glitch;
  wire   n1;

  DFFRQX2M start_glitch_reg ( .D(n1), .CK(clk), .RN(rst_n), .Q(start_glitch)
         );
  AO21XLM U3 ( .A0(serial_data), .A1(enable), .B0(start_glitch), .Y(n1) );
endmodule


module UART_RX_stop_check ( clk, rst_n, enable, serial_data, stop_error );
  input clk, rst_n, enable, serial_data;
  output stop_error;
  wire   n2, n1;

  DFFRQX2M stop_error_reg ( .D(n2), .CK(clk), .RN(rst_n), .Q(stop_error) );
  OAI21BX1M U3 ( .A0(serial_data), .A1(n1), .B0N(stop_error), .Y(n2) );
  INVX2M U4 ( .A(enable), .Y(n1) );
endmodule


module UART_RX_FSM ( clk, rst_n, RX_IN, PAR_EN, Prescale, edge_cnt, bit_cnt, 
        par_err, stp_err, start_glitch, dat_samp_en, edge_en, deser_en, 
        par_chk_en, strt_chk_en, stp_chk_en, data_valid, parity_error, 
        stop_error );
  input [5:0] Prescale;
  input [4:0] edge_cnt;
  input [3:0] bit_cnt;
  input clk, rst_n, RX_IN, PAR_EN, par_err, stp_err, start_glitch;
  output dat_samp_en, edge_en, deser_en, par_chk_en, strt_chk_en, stp_chk_en,
         data_valid, parity_error, stop_error;
  wire   N56, N57, N58, N59, N81, N82, N83, N84, N85, N86, \r94/carry[5] ,
         \r94/carry[4] , \r94/carry[3] , n1, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [4:0] Last_edge;
  wire   [2:0] Current_state;
  wire   [2:0] Next_state;
  assign N81 = Prescale[0];

  DFFRQX2M \Current_state_reg[0]  ( .D(Next_state[0]), .CK(clk), .RN(rst_n), 
        .Q(Current_state[0]) );
  DFFRQX2M \Current_state_reg[2]  ( .D(Next_state[2]), .CK(clk), .RN(rst_n), 
        .Q(Current_state[2]) );
  DFFRQX2M \Current_state_reg[1]  ( .D(Next_state[1]), .CK(clk), .RN(rst_n), 
        .Q(Current_state[1]) );
  OR4X1M U3 ( .A(n18), .B(n17), .C(n16), .D(n15), .Y(n1) );
  NOR2BX4M U4 ( .AN(par_err), .B(n21), .Y(parity_error) );
  NOR2BX4M U5 ( .AN(stp_err), .B(n21), .Y(stop_error) );
  NAND3XLM U6 ( .A(Current_state[1]), .B(Current_state[0]), .C(
        Current_state[2]), .Y(n21) );
  INVX2M U7 ( .A(Last_edge[2]), .Y(n10) );
  INVX2M U8 ( .A(Prescale[1]), .Y(N82) );
  INVX2M U9 ( .A(Prescale[2]), .Y(n6) );
  BUFX2M U10 ( .A(edge_en), .Y(dat_samp_en) );
  XNOR2X1M U11 ( .A(Prescale[5]), .B(\r94/carry[5] ), .Y(N86) );
  OR2X1M U12 ( .A(Prescale[4]), .B(\r94/carry[4] ), .Y(\r94/carry[5] ) );
  XNOR2X1M U13 ( .A(\r94/carry[4] ), .B(Prescale[4]), .Y(N85) );
  OR2X1M U14 ( .A(Prescale[3]), .B(\r94/carry[3] ), .Y(\r94/carry[4] ) );
  XNOR2X1M U15 ( .A(\r94/carry[3] ), .B(Prescale[3]), .Y(N84) );
  OR2X1M U16 ( .A(Prescale[2]), .B(Prescale[1]), .Y(\r94/carry[3] ) );
  XNOR2X1M U17 ( .A(Prescale[1]), .B(Prescale[2]), .Y(N83) );
  CLKINVX1M U18 ( .A(N81), .Y(Last_edge[0]) );
  NOR2X1M U19 ( .A(Prescale[1]), .B(N81), .Y(n3) );
  AO21XLM U20 ( .A0(N81), .A1(Prescale[1]), .B0(n3), .Y(Last_edge[1]) );
  CLKNAND2X2M U21 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U22 ( .A0(n3), .A1(n6), .B0(n4), .Y(Last_edge[2]) );
  XNOR2X1M U23 ( .A(Prescale[3]), .B(n4), .Y(Last_edge[3]) );
  NOR2X1M U24 ( .A(Prescale[3]), .B(n4), .Y(n5) );
  CLKXOR2X2M U25 ( .A(Prescale[4]), .B(n5), .Y(Last_edge[4]) );
  NOR2X1M U26 ( .A(Last_edge[1]), .B(Last_edge[0]), .Y(n7) );
  AO21XLM U27 ( .A0(Last_edge[0]), .A1(Last_edge[1]), .B0(n7), .Y(N56) );
  CLKNAND2X2M U28 ( .A(n7), .B(n10), .Y(n8) );
  OAI21X1M U29 ( .A0(n7), .A1(n10), .B0(n8), .Y(N57) );
  XNOR2X1M U30 ( .A(Last_edge[3]), .B(n8), .Y(N58) );
  NOR2X1M U31 ( .A(Last_edge[3]), .B(n8), .Y(n9) );
  CLKXOR2X2M U32 ( .A(Last_edge[4]), .B(n9), .Y(N59) );
  NOR2BX1M U33 ( .AN(N81), .B(edge_cnt[0]), .Y(n11) );
  OAI2B2X1M U34 ( .A1N(edge_cnt[1]), .A0(n11), .B0(N82), .B1(n11), .Y(n14) );
  NOR2BX1M U35 ( .AN(edge_cnt[0]), .B(N81), .Y(n12) );
  OAI2B2X1M U36 ( .A1N(N82), .A0(n12), .B0(edge_cnt[1]), .B1(n12), .Y(n13) );
  NAND3BX1M U37 ( .AN(N86), .B(n14), .C(n13), .Y(n18) );
  CLKXOR2X2M U38 ( .A(N85), .B(edge_cnt[4]), .Y(n17) );
  CLKXOR2X2M U39 ( .A(N83), .B(edge_cnt[2]), .Y(n16) );
  CLKXOR2X2M U40 ( .A(N84), .B(edge_cnt[3]), .Y(n15) );
  NOR3X1M U41 ( .A(n1), .B(Current_state[1]), .C(n19), .Y(strt_chk_en) );
  NOR3BX1M U42 ( .AN(Current_state[2]), .B(n1), .C(n20), .Y(stp_chk_en) );
  NOR3X1M U43 ( .A(n20), .B(Current_state[2]), .C(n1), .Y(par_chk_en) );
  CLKINVX1M U44 ( .A(n22), .Y(deser_en) );
  NOR3X1M U45 ( .A(n21), .B(stp_err), .C(par_err), .Y(data_valid) );
  CLKNAND2X2M U46 ( .A(n19), .B(n20), .Y(edge_en) );
  CLKINVX1M U47 ( .A(n23), .Y(n19) );
  OAI31X1M U48 ( .A0(n22), .A1(PAR_EN), .A2(n24), .B0(n25), .Y(Next_state[2])
         );
  OAI21X1M U49 ( .A0(n26), .A1(Current_state[2]), .B0(n27), .Y(n25) );
  NAND3X1M U50 ( .A(Current_state[1]), .B(n23), .C(n26), .Y(n22) );
  OAI2B11X1M U51 ( .A1N(Current_state[1]), .A0(Current_state[2]), .B0(n28), 
        .C0(n20), .Y(Next_state[1]) );
  NAND3X1M U52 ( .A(n23), .B(n29), .C(n26), .Y(n28) );
  NOR2X1M U53 ( .A(n30), .B(Current_state[2]), .Y(n23) );
  MXI2X1M U54 ( .A(n31), .B(n32), .S0(Current_state[2]), .Y(Next_state[0]) );
  CLKNAND2X2M U55 ( .A(Current_state[1]), .B(n33), .Y(n32) );
  MXI2X1M U56 ( .A(n34), .B(RX_IN), .S0(Current_state[0]), .Y(n33) );
  NAND4X1M U57 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n34) );
  XNOR2X1M U58 ( .A(edge_cnt[0]), .B(N81), .Y(n38) );
  NOR2X1M U59 ( .A(n39), .B(n40), .Y(n37) );
  CLKXOR2X2M U60 ( .A(edge_cnt[2]), .B(N57), .Y(n40) );
  CLKXOR2X2M U61 ( .A(edge_cnt[1]), .B(N56), .Y(n39) );
  XNOR2X1M U62 ( .A(edge_cnt[3]), .B(N58), .Y(n36) );
  XNOR2X1M U63 ( .A(edge_cnt[4]), .B(N59), .Y(n35) );
  CLKNAND2X2M U64 ( .A(n41), .B(n42), .Y(n31) );
  MXI2X1M U65 ( .A(RX_IN), .B(n43), .S0(Current_state[0]), .Y(n42) );
  NOR2X1M U66 ( .A(Current_state[1]), .B(n29), .Y(n43) );
  CLKINVX1M U67 ( .A(start_glitch), .Y(n29) );
  AOI31X1M U68 ( .A0(n26), .A1(Current_state[1]), .A2(n44), .B0(n27), .Y(n41)
         );
  CLKINVX1M U69 ( .A(n20), .Y(n27) );
  CLKNAND2X2M U70 ( .A(Current_state[1]), .B(n30), .Y(n20) );
  CLKINVX1M U71 ( .A(Current_state[0]), .Y(n30) );
  CLKINVX1M U72 ( .A(n24), .Y(n44) );
  NAND3BX1M U73 ( .AN(bit_cnt[0]), .B(bit_cnt[3]), .C(n45), .Y(n24) );
  NOR2X1M U74 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n45) );
  AND4X1M U75 ( .A(n46), .B(n47), .C(n48), .D(n49), .Y(n26) );
  XNOR2X1M U76 ( .A(edge_cnt[0]), .B(Last_edge[0]), .Y(n49) );
  NOR2X1M U77 ( .A(n50), .B(n51), .Y(n48) );
  CLKXOR2X2M U78 ( .A(edge_cnt[2]), .B(Last_edge[2]), .Y(n51) );
  CLKXOR2X2M U79 ( .A(edge_cnt[1]), .B(Last_edge[1]), .Y(n50) );
  XNOR2X1M U80 ( .A(edge_cnt[3]), .B(Last_edge[3]), .Y(n47) );
  XNOR2X1M U81 ( .A(edge_cnt[4]), .B(Last_edge[4]), .Y(n46) );
endmodule


module UART_RX_Top ( CLK, RST, PAR_TYP, PAR_EN, Prescale, RX_IN, P_DATA, 
        Data_valid, Parity_Error, Stop_Error );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, PAR_TYP, PAR_EN, RX_IN;
  output Data_valid, Parity_Error, Stop_Error;
  wire   enable_des, serial_bit, enable_edge, samp_en, enable_par, Parity_Err,
         enable_str, Start_Err, enable_stp, Stop_Err, n1, n2;
  wire   [3:0] bit_count;
  wire   [4:0] edge_count;

  UART_RX_deserializer U_desrial ( .clk(CLK), .rst_n(n1), .enable(enable_des), 
        .serial_data(serial_bit), .P_DATA(P_DATA) );
  UART_RX_edge_counter U_edge_counter ( .clk(CLK), .rst_n(n1), .enable(
        enable_edge), .PAR_EN(PAR_EN), .Prescale(Prescale), .edge_cnt(
        edge_count), .bit_cnt(bit_count) );
  UART_RX_sampler U_sampler ( .clk(CLK), .rst_n(n1), .RX_IN(RX_IN), 
        .sample_en(samp_en), .Prescale(Prescale), .edge_count(edge_count), 
        .sampled_bit(serial_bit) );
  UART_RX_parity_check U_Par_check ( .clk(CLK), .rst_n(n1), .PAR_TYP(PAR_TYP), 
        .enable(enable_par), .serial_data(serial_bit), .P_DATA(P_DATA), 
        .parity_error(Parity_Err) );
  UART_RX_start_check U_start_chk ( .clk(CLK), .rst_n(n1), .enable(enable_str), 
        .serial_data(serial_bit), .start_glitch(Start_Err) );
  UART_RX_stop_check U_stop_chk ( .clk(CLK), .rst_n(n1), .enable(enable_stp), 
        .serial_data(serial_bit), .stop_error(Stop_Err) );
  UART_RX_FSM U_FSM ( .clk(CLK), .rst_n(n1), .RX_IN(RX_IN), .PAR_EN(PAR_EN), 
        .Prescale(Prescale), .edge_cnt(edge_count), .bit_cnt(bit_count), 
        .par_err(Parity_Err), .stp_err(Stop_Err), .start_glitch(Start_Err), 
        .dat_samp_en(samp_en), .edge_en(enable_edge), .deser_en(enable_des), 
        .par_chk_en(enable_par), .strt_chk_en(enable_str), .stp_chk_en(
        enable_stp), .data_valid(Data_valid), .parity_error(Parity_Error), 
        .stop_error(Stop_Error) );
  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_TOP ( TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, Prescale, TX_IN_P, 
        TX_IN_V, RX_IN_S, TX_OUT_S, TX_OUT_V, RX_OUT_P, RX_OUT_V, parity_error, 
        stop_error );
  input [5:0] Prescale;
  input [7:0] TX_IN_P;
  output [7:0] RX_OUT_P;
  input TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, TX_IN_V, RX_IN_S;
  output TX_OUT_S, TX_OUT_V, RX_OUT_V, parity_error, stop_error;
  wire   n1, n2;

  UART_TX_Top TX_UNIT ( .clk(TX_CLK), .RST(n1), .PAR_TYP(PAR_TYP), .PAR_EN(
        PAR_EN), .P_DATA(TX_IN_P), .Data_Valid(TX_IN_V), .TX_OUT(TX_OUT_S), 
        .busy(TX_OUT_V) );
  UART_RX_Top RX_UNIT ( .CLK(RX_CLK), .RST(n1), .PAR_TYP(PAR_TYP), .PAR_EN(
        PAR_EN), .Prescale(Prescale), .RX_IN(RX_IN_S), .P_DATA(RX_OUT_P), 
        .Data_valid(RX_OUT_V), .Parity_Error(parity_error), .Stop_Error(
        stop_error) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module SYS_CTRL ( CLK, RST, ALU_Valid, Rd_Data_Valid, RX_ENABLE, FIFO_FULL, 
        Rd_Data, RX_P_DATA, ALU_OUT, clk_div_en, Wr_En, Rd_En, ALU_EN, CLK_EN, 
        TX_D_VLD, ALU_FUN, Address, Wr_Data, TX_P_DATA );
  input [7:0] Rd_Data;
  input [7:0] RX_P_DATA;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] Wr_Data;
  output [7:0] TX_P_DATA;
  input CLK, RST, ALU_Valid, Rd_Data_Valid, RX_ENABLE, FIFO_FULL;
  output clk_div_en, Wr_En, Rd_En, ALU_EN, CLK_EN, TX_D_VLD;
  wire   n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n3, n4, n5, n6, n7, n8, n9, n10, n11, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n97, n98, n99, n100;
  wire   [3:0] Current_State;
  wire   [3:0] Next_State;

  DFFRX1M \RX_P_DATA_reg_reg[7]  ( .D(n92), .CK(CLK), .RN(RST), .QN(n16) );
  DFFRX1M \RX_P_DATA_reg_reg[6]  ( .D(n91), .CK(CLK), .RN(RST), .QN(n17) );
  DFFRX1M \RX_P_DATA_reg_reg[5]  ( .D(n90), .CK(CLK), .RN(RST), .QN(n18) );
  DFFRX1M \RX_P_DATA_reg_reg[4]  ( .D(n89), .CK(CLK), .RN(RST), .QN(n19) );
  DFFRX1M \RX_P_DATA_reg_reg[3]  ( .D(n88), .CK(CLK), .RN(RST), .QN(n20) );
  DFFRX1M \RX_P_DATA_reg_reg[2]  ( .D(n87), .CK(CLK), .RN(RST), .QN(n21) );
  DFFRX1M \RX_P_DATA_reg_reg[1]  ( .D(n86), .CK(CLK), .RN(RST), .QN(n22) );
  DFFRX1M \RX_P_DATA_reg_reg[0]  ( .D(n85), .CK(CLK), .RN(RST), .QN(n23) );
  DFFRX1M \W_add_reg_reg[2]  ( .D(n95), .CK(CLK), .RN(RST), .QN(n13) );
  DFFRX1M \W_add_reg_reg[0]  ( .D(n93), .CK(CLK), .RN(RST), .QN(n15) );
  DFFRX1M \W_add_reg_reg[3]  ( .D(n96), .CK(CLK), .RN(RST), .QN(n12) );
  DFFRX1M \W_add_reg_reg[1]  ( .D(n94), .CK(CLK), .RN(RST), .QN(n14) );
  DFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .CK(CLK), .RN(RST), .Q(
        Current_State[2]) );
  DFFRQX2M \Current_State_reg[3]  ( .D(Next_State[3]), .CK(CLK), .RN(RST), .Q(
        Current_State[3]) );
  DFFRQX2M \Current_State_reg[0]  ( .D(Next_State[0]), .CK(CLK), .RN(RST), .Q(
        Current_State[0]) );
  DFFRQX2M \Current_State_reg[1]  ( .D(Next_State[1]), .CK(CLK), .RN(RST), .Q(
        Current_State[1]) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  NOR2X2M U5 ( .A(n97), .B(n61), .Y(ALU_FUN[2]) );
  NOR2X2M U6 ( .A(n99), .B(n61), .Y(ALU_FUN[0]) );
  OAI22X2M U7 ( .A0(n13), .A1(n3), .B0(n97), .B1(n62), .Y(Address[2]) );
  NOR4X1M U8 ( .A(Current_State[0]), .B(Current_State[1]), .C(Current_State[2]), .D(Current_State[3]), .Y(n54) );
  NOR4X1M U9 ( .A(n28), .B(n26), .C(Current_State[0]), .D(Current_State[1]), 
        .Y(n58) );
  INVX2M U10 ( .A(n35), .Y(n6) );
  INVX2M U11 ( .A(n64), .Y(n9) );
  INVX2M U12 ( .A(n5), .Y(n10) );
  BUFX2M U13 ( .A(n37), .Y(n3) );
  NAND2X2M U14 ( .A(n36), .B(n3), .Y(Wr_En) );
  BUFX2M U15 ( .A(n37), .Y(n4) );
  INVX2M U16 ( .A(FIFO_FULL), .Y(n7) );
  INVX2M U17 ( .A(n52), .Y(CLK_EN) );
  NOR4BX1M U18 ( .AN(Next_State[0]), .B(n27), .C(Next_State[2]), .D(
        Next_State[3]), .Y(n35) );
  NOR2X2M U19 ( .A(n63), .B(n64), .Y(n36) );
  NOR2X2M U20 ( .A(n27), .B(n10), .Y(n64) );
  NOR2X2M U21 ( .A(n98), .B(n61), .Y(ALU_FUN[1]) );
  NAND3X2M U22 ( .A(n26), .B(n28), .C(n82), .Y(n37) );
  BUFX2M U23 ( .A(n34), .Y(n5) );
  NOR3X2M U24 ( .A(n26), .B(n11), .C(n28), .Y(n34) );
  NOR2X2M U25 ( .A(n33), .B(n61), .Y(ALU_FUN[3]) );
  INVX2M U26 ( .A(n49), .Y(n8) );
  NAND2BX2M U27 ( .AN(n78), .B(n9), .Y(n83) );
  NOR3X2M U28 ( .A(ALU_EN), .B(n64), .C(n58), .Y(n52) );
  NOR3X2M U29 ( .A(n29), .B(n33), .C(n100), .Y(n69) );
  NAND4X2M U30 ( .A(n49), .B(n50), .C(n51), .D(n52), .Y(Next_State[3]) );
  NAND2X2M U31 ( .A(n53), .B(n54), .Y(n50) );
  INVX2M U32 ( .A(n61), .Y(ALU_EN) );
  INVX2M U33 ( .A(n62), .Y(Rd_En) );
  NAND2X2M U34 ( .A(n66), .B(n99), .Y(n68) );
  INVX2M U35 ( .A(n51), .Y(n25) );
  OR3X2M U36 ( .A(n40), .B(n38), .C(n25), .Y(TX_D_VLD) );
  AND2X2M U37 ( .A(n48), .B(n82), .Y(n75) );
  OAI22X4M U38 ( .A0(n12), .A1(n3), .B0(n33), .B1(n62), .Y(Address[3]) );
  NOR3BX2M U39 ( .AN(n48), .B(Current_State[0]), .C(Current_State[1]), .Y(n59)
         );
  NAND3X2M U40 ( .A(Current_State[3]), .B(Current_State[2]), .C(n82), .Y(n61)
         );
  AOI21X2M U41 ( .A0(n59), .A1(RX_ENABLE), .B0(n63), .Y(n49) );
  NOR2X2M U42 ( .A(n27), .B(Current_State[0]), .Y(n82) );
  NAND3X2M U43 ( .A(Current_State[1]), .B(Current_State[0]), .C(n48), .Y(n62)
         );
  AOI21X2M U44 ( .A0(ALU_Valid), .A1(n7), .B0(n61), .Y(n60) );
  NAND4X2M U45 ( .A(n55), .B(n56), .C(n36), .D(n57), .Y(Next_State[2]) );
  OAI21X2M U46 ( .A0(n65), .A1(n53), .B0(n54), .Y(n56) );
  NOR4X1M U47 ( .A(n58), .B(n59), .C(Rd_En), .D(n60), .Y(n57) );
  NOR4X1M U48 ( .A(n68), .B(RX_P_DATA[1]), .C(RX_P_DATA[5]), .D(RX_P_DATA[4]), 
        .Y(n65) );
  OAI22X1M U49 ( .A0(n99), .A1(n6), .B0(n35), .B1(n15), .Y(n93) );
  OAI22X1M U50 ( .A0(n98), .A1(n6), .B0(n35), .B1(n14), .Y(n94) );
  OAI22X1M U51 ( .A0(n97), .A1(n6), .B0(n35), .B1(n13), .Y(n95) );
  OAI22X1M U52 ( .A0(n33), .A1(n6), .B0(n35), .B1(n12), .Y(n96) );
  NOR2X2M U53 ( .A(n10), .B(Current_State[1]), .Y(n63) );
  NOR2X2M U54 ( .A(n26), .B(Current_State[3]), .Y(n48) );
  INVX2M U55 ( .A(Current_State[1]), .Y(n27) );
  INVX2M U56 ( .A(Current_State[2]), .Y(n26) );
  INVX2M U57 ( .A(Current_State[3]), .Y(n28) );
  INVX2M U58 ( .A(Current_State[0]), .Y(n11) );
  NAND4X2M U59 ( .A(n79), .B(n62), .C(n80), .D(n81), .Y(Next_State[0]) );
  NAND4X2M U60 ( .A(n54), .B(n99), .C(n76), .D(n84), .Y(n79) );
  AOI32X1M U61 ( .A0(ALU_Valid), .A1(n7), .A2(n25), .B0(n83), .B1(n100), .Y(
        n80) );
  AOI221XLM U62 ( .A0(n78), .A1(n27), .B0(n75), .B1(RX_ENABLE), .C0(n8), .Y(
        n81) );
  OAI221X1M U63 ( .A0(n99), .A1(n62), .B0(n15), .B1(n4), .C0(n9), .Y(
        Address[0]) );
  OAI22X1M U64 ( .A0(n14), .A1(n3), .B0(n98), .B1(n62), .Y(Address[1]) );
  NOR4X1M U65 ( .A(n27), .B(n28), .C(n11), .D(Current_State[2]), .Y(n40) );
  NOR3X2M U66 ( .A(Current_State[2]), .B(Current_State[3]), .C(n11), .Y(n78)
         );
  OAI22X1M U67 ( .A0(n99), .A1(n3), .B0(n36), .B1(n23), .Y(Wr_Data[0]) );
  OAI22X1M U68 ( .A0(n98), .A1(n3), .B0(n36), .B1(n22), .Y(Wr_Data[1]) );
  OAI22X1M U69 ( .A0(n97), .A1(n4), .B0(n36), .B1(n21), .Y(Wr_Data[2]) );
  OAI22X1M U70 ( .A0(n33), .A1(n4), .B0(n36), .B1(n20), .Y(Wr_Data[3]) );
  OAI22X1M U71 ( .A0(n32), .A1(n4), .B0(n36), .B1(n19), .Y(Wr_Data[4]) );
  OAI22X1M U72 ( .A0(n31), .A1(n4), .B0(n36), .B1(n18), .Y(Wr_Data[5]) );
  OAI22X1M U73 ( .A0(n30), .A1(n4), .B0(n36), .B1(n17), .Y(Wr_Data[6]) );
  OAI22X1M U74 ( .A0(n29), .A1(n4), .B0(n36), .B1(n16), .Y(Wr_Data[7]) );
  AOI21X2M U75 ( .A0(Rd_Data_Valid), .A1(n7), .B0(n62), .Y(n73) );
  NOR3X2M U76 ( .A(RX_P_DATA[2]), .B(RX_P_DATA[6]), .C(RX_P_DATA[4]), .Y(n84)
         );
  NAND4X2M U77 ( .A(n70), .B(n71), .C(n55), .D(n72), .Y(Next_State[1]) );
  NAND2X2M U78 ( .A(n78), .B(Current_State[1]), .Y(n70) );
  OAI31X1M U79 ( .A0(n63), .A1(n78), .A2(n58), .B0(RX_ENABLE), .Y(n71) );
  NOR4X1M U80 ( .A(n64), .B(ALU_EN), .C(n25), .D(n73), .Y(n72) );
  OAI2BB1X2M U81 ( .A0N(Rd_Data[0]), .A1N(n38), .B0(n47), .Y(TX_P_DATA[0]) );
  AOI22X1M U82 ( .A0(ALU_OUT[0]), .A1(n25), .B0(ALU_OUT[8]), .B1(n40), .Y(n47)
         );
  OAI2BB1X2M U83 ( .A0N(Rd_Data[1]), .A1N(n38), .B0(n46), .Y(TX_P_DATA[1]) );
  AOI22X1M U84 ( .A0(ALU_OUT[1]), .A1(n25), .B0(ALU_OUT[9]), .B1(n40), .Y(n46)
         );
  OAI2BB1X2M U85 ( .A0N(Rd_Data[2]), .A1N(n38), .B0(n45), .Y(TX_P_DATA[2]) );
  AOI22X1M U86 ( .A0(ALU_OUT[2]), .A1(n25), .B0(ALU_OUT[10]), .B1(n40), .Y(n45) );
  OAI2BB1X2M U87 ( .A0N(Rd_Data[3]), .A1N(n38), .B0(n44), .Y(TX_P_DATA[3]) );
  AOI22X1M U88 ( .A0(ALU_OUT[3]), .A1(n25), .B0(ALU_OUT[11]), .B1(n40), .Y(n44) );
  OAI2BB1X2M U89 ( .A0N(Rd_Data[4]), .A1N(n38), .B0(n43), .Y(TX_P_DATA[4]) );
  AOI22X1M U90 ( .A0(ALU_OUT[4]), .A1(n25), .B0(ALU_OUT[12]), .B1(n40), .Y(n43) );
  OAI2BB1X2M U91 ( .A0N(Rd_Data[5]), .A1N(n38), .B0(n42), .Y(TX_P_DATA[5]) );
  AOI22X1M U92 ( .A0(ALU_OUT[5]), .A1(n25), .B0(ALU_OUT[13]), .B1(n40), .Y(n42) );
  OAI2BB1X2M U93 ( .A0N(Rd_Data[6]), .A1N(n38), .B0(n41), .Y(TX_P_DATA[6]) );
  AOI22X1M U94 ( .A0(ALU_OUT[6]), .A1(n25), .B0(ALU_OUT[14]), .B1(n40), .Y(n41) );
  OAI2BB1X2M U95 ( .A0N(Rd_Data[7]), .A1N(n38), .B0(n39), .Y(TX_P_DATA[7]) );
  AOI22X1M U96 ( .A0(ALU_OUT[7]), .A1(n25), .B0(ALU_OUT[15]), .B1(n40), .Y(n39) );
  NOR2BX2M U97 ( .AN(n74), .B(n75), .Y(n55) );
  NAND4X2M U98 ( .A(n54), .B(RX_P_DATA[4]), .C(n76), .D(n77), .Y(n74) );
  NOR3X2M U99 ( .A(n99), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n77) );
  NAND3X2M U100 ( .A(Current_State[3]), .B(n26), .C(n82), .Y(n51) );
  INVX2M U101 ( .A(RX_P_DATA[0]), .Y(n99) );
  AND3X2M U102 ( .A(n69), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n76) );
  AND3X2M U103 ( .A(n66), .B(RX_P_DATA[4]), .C(n67), .Y(n53) );
  NOR3X2M U104 ( .A(n99), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n67) );
  INVX2M U105 ( .A(RX_P_DATA[1]), .Y(n98) );
  INVX2M U106 ( .A(RX_P_DATA[3]), .Y(n33) );
  INVX2M U107 ( .A(RX_P_DATA[2]), .Y(n97) );
  AND3X2M U108 ( .A(n69), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n66) );
  AND3X2M U109 ( .A(n48), .B(Current_State[0]), .C(n27), .Y(n38) );
  INVX2M U110 ( .A(RX_P_DATA[7]), .Y(n29) );
  INVX2M U111 ( .A(RX_ENABLE), .Y(n100) );
  OAI22X1M U112 ( .A0(n10), .A1(n99), .B0(n5), .B1(n23), .Y(n85) );
  OAI22X1M U113 ( .A0(n10), .A1(n98), .B0(n5), .B1(n22), .Y(n86) );
  OAI22X1M U114 ( .A0(n10), .A1(n97), .B0(n5), .B1(n21), .Y(n87) );
  OAI22X1M U115 ( .A0(n10), .A1(n33), .B0(n5), .B1(n20), .Y(n88) );
  OAI22X1M U116 ( .A0(n10), .A1(n32), .B0(n5), .B1(n19), .Y(n89) );
  OAI22X1M U117 ( .A0(n10), .A1(n31), .B0(n5), .B1(n18), .Y(n90) );
  OAI22X1M U118 ( .A0(n10), .A1(n30), .B0(n5), .B1(n17), .Y(n91) );
  OAI22X1M U119 ( .A0(n10), .A1(n29), .B0(n5), .B1(n16), .Y(n92) );
  INVX2M U120 ( .A(RX_P_DATA[4]), .Y(n32) );
  INVX2M U121 ( .A(RX_P_DATA[5]), .Y(n31) );
  INVX2M U122 ( .A(RX_P_DATA[6]), .Y(n30) );
endmodule


module RegFile_DEPTH16_WIDTH8 ( CLK, RST, Address, WrEn, RdEn, WrData, RdData, 
        RdValid, REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdValid;
  wire   N11, N12, N13, N14, \REG_FILE[15][7] , \REG_FILE[15][6] ,
         \REG_FILE[15][5] , \REG_FILE[15][4] , \REG_FILE[15][3] ,
         \REG_FILE[15][2] , \REG_FILE[15][1] , \REG_FILE[15][0] ,
         \REG_FILE[14][7] , \REG_FILE[14][6] , \REG_FILE[14][5] ,
         \REG_FILE[14][4] , \REG_FILE[14][3] , \REG_FILE[14][2] ,
         \REG_FILE[14][1] , \REG_FILE[14][0] , \REG_FILE[13][7] ,
         \REG_FILE[13][6] , \REG_FILE[13][5] , \REG_FILE[13][4] ,
         \REG_FILE[13][3] , \REG_FILE[13][2] , \REG_FILE[13][1] ,
         \REG_FILE[13][0] , \REG_FILE[12][7] , \REG_FILE[12][6] ,
         \REG_FILE[12][5] , \REG_FILE[12][4] , \REG_FILE[12][3] ,
         \REG_FILE[12][2] , \REG_FILE[12][1] , \REG_FILE[12][0] ,
         \REG_FILE[11][7] , \REG_FILE[11][6] , \REG_FILE[11][5] ,
         \REG_FILE[11][4] , \REG_FILE[11][3] , \REG_FILE[11][2] ,
         \REG_FILE[11][1] , \REG_FILE[11][0] , \REG_FILE[10][7] ,
         \REG_FILE[10][6] , \REG_FILE[10][5] , \REG_FILE[10][4] ,
         \REG_FILE[10][3] , \REG_FILE[10][2] , \REG_FILE[10][1] ,
         \REG_FILE[10][0] , \REG_FILE[9][7] , \REG_FILE[9][6] ,
         \REG_FILE[9][5] , \REG_FILE[9][4] , \REG_FILE[9][3] ,
         \REG_FILE[9][2] , \REG_FILE[9][1] , \REG_FILE[9][0] ,
         \REG_FILE[8][7] , \REG_FILE[8][6] , \REG_FILE[8][5] ,
         \REG_FILE[8][4] , \REG_FILE[8][3] , \REG_FILE[8][2] ,
         \REG_FILE[8][1] , \REG_FILE[8][0] , \REG_FILE[7][7] ,
         \REG_FILE[7][6] , \REG_FILE[7][5] , \REG_FILE[7][4] ,
         \REG_FILE[7][3] , \REG_FILE[7][2] , \REG_FILE[7][1] ,
         \REG_FILE[7][0] , \REG_FILE[6][7] , \REG_FILE[6][6] ,
         \REG_FILE[6][5] , \REG_FILE[6][4] , \REG_FILE[6][3] ,
         \REG_FILE[6][2] , \REG_FILE[6][1] , \REG_FILE[6][0] ,
         \REG_FILE[5][7] , \REG_FILE[5][6] , \REG_FILE[5][5] ,
         \REG_FILE[5][4] , \REG_FILE[5][3] , \REG_FILE[5][2] ,
         \REG_FILE[5][1] , \REG_FILE[5][0] , \REG_FILE[4][7] ,
         \REG_FILE[4][6] , \REG_FILE[4][5] , \REG_FILE[4][4] ,
         \REG_FILE[4][3] , \REG_FILE[4][2] , \REG_FILE[4][1] ,
         \REG_FILE[4][0] , N35, N36, N37, N38, N39, N40, N41, N42, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFSQX2M \REG_FILE_reg[3][5]  ( .D(n70), .CK(CLK), .SN(n204), .Q(REG3[5]) );
  DFFRQX2M \RdData_reg[7]  ( .D(n176), .CK(CLK), .RN(n204), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n175), .CK(CLK), .RN(n213), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n174), .CK(CLK), .RN(n213), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n173), .CK(CLK), .RN(n212), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n172), .CK(CLK), .RN(n212), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n171), .CK(CLK), .RN(n212), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n170), .CK(CLK), .RN(n212), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n169), .CK(CLK), .RN(n212), .Q(RdData[0]) );
  DFFRQX2M \REG_FILE_reg[13][7]  ( .D(n152), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[13][7] ) );
  DFFRQX2M \REG_FILE_reg[13][6]  ( .D(n151), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[13][6] ) );
  DFFRQX2M \REG_FILE_reg[13][5]  ( .D(n150), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[13][5] ) );
  DFFRQX2M \REG_FILE_reg[13][4]  ( .D(n149), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[13][4] ) );
  DFFRQX2M \REG_FILE_reg[13][3]  ( .D(n148), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[13][3] ) );
  DFFRQX2M \REG_FILE_reg[13][2]  ( .D(n147), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[13][2] ) );
  DFFRQX2M \REG_FILE_reg[13][1]  ( .D(n146), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[13][1] ) );
  DFFRQX2M \REG_FILE_reg[13][0]  ( .D(n145), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[13][0] ) );
  DFFRQX2M \REG_FILE_reg[9][7]  ( .D(n120), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[9][7] ) );
  DFFRQX2M \REG_FILE_reg[9][6]  ( .D(n119), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[9][6] ) );
  DFFRQX2M \REG_FILE_reg[9][5]  ( .D(n118), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[9][5] ) );
  DFFRQX2M \REG_FILE_reg[9][4]  ( .D(n117), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[9][4] ) );
  DFFRQX2M \REG_FILE_reg[9][3]  ( .D(n116), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[9][3] ) );
  DFFRQX2M \REG_FILE_reg[9][2]  ( .D(n115), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[9][2] ) );
  DFFRQX2M \REG_FILE_reg[9][1]  ( .D(n114), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[9][1] ) );
  DFFRQX2M \REG_FILE_reg[9][0]  ( .D(n113), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[9][0] ) );
  DFFRQX2M \REG_FILE_reg[5][7]  ( .D(n88), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[5][7] ) );
  DFFRQX2M \REG_FILE_reg[5][6]  ( .D(n87), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[5][6] ) );
  DFFRQX2M \REG_FILE_reg[5][5]  ( .D(n86), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[5][5] ) );
  DFFRQX2M \REG_FILE_reg[5][4]  ( .D(n85), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[5][4] ) );
  DFFRQX2M \REG_FILE_reg[5][3]  ( .D(n84), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[5][3] ) );
  DFFRQX2M \REG_FILE_reg[5][2]  ( .D(n83), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[5][2] ) );
  DFFRQX2M \REG_FILE_reg[5][1]  ( .D(n82), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[5][1] ) );
  DFFRQX2M \REG_FILE_reg[5][0]  ( .D(n81), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[5][0] ) );
  DFFRQX2M \REG_FILE_reg[15][7]  ( .D(n168), .CK(CLK), .RN(n212), .Q(
        \REG_FILE[15][7] ) );
  DFFRQX2M \REG_FILE_reg[15][6]  ( .D(n167), .CK(CLK), .RN(n212), .Q(
        \REG_FILE[15][6] ) );
  DFFRQX2M \REG_FILE_reg[15][5]  ( .D(n166), .CK(CLK), .RN(n212), .Q(
        \REG_FILE[15][5] ) );
  DFFRQX2M \REG_FILE_reg[15][4]  ( .D(n165), .CK(CLK), .RN(n212), .Q(
        \REG_FILE[15][4] ) );
  DFFRQX2M \REG_FILE_reg[15][3]  ( .D(n164), .CK(CLK), .RN(n212), .Q(
        \REG_FILE[15][3] ) );
  DFFRQX2M \REG_FILE_reg[15][2]  ( .D(n163), .CK(CLK), .RN(n212), .Q(
        \REG_FILE[15][2] ) );
  DFFRQX2M \REG_FILE_reg[15][1]  ( .D(n162), .CK(CLK), .RN(n212), .Q(
        \REG_FILE[15][1] ) );
  DFFRQX2M \REG_FILE_reg[15][0]  ( .D(n161), .CK(CLK), .RN(n212), .Q(
        \REG_FILE[15][0] ) );
  DFFRQX2M \REG_FILE_reg[11][7]  ( .D(n136), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[11][7] ) );
  DFFRQX2M \REG_FILE_reg[11][6]  ( .D(n135), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[11][6] ) );
  DFFRQX2M \REG_FILE_reg[11][5]  ( .D(n134), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[11][5] ) );
  DFFRQX2M \REG_FILE_reg[11][4]  ( .D(n133), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[11][4] ) );
  DFFRQX2M \REG_FILE_reg[11][3]  ( .D(n132), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[11][3] ) );
  DFFRQX2M \REG_FILE_reg[11][2]  ( .D(n131), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[11][2] ) );
  DFFRQX2M \REG_FILE_reg[11][1]  ( .D(n130), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[11][1] ) );
  DFFRQX2M \REG_FILE_reg[11][0]  ( .D(n129), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[11][0] ) );
  DFFRQX2M \REG_FILE_reg[7][7]  ( .D(n104), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[7][7] ) );
  DFFRQX2M \REG_FILE_reg[7][6]  ( .D(n103), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[7][6] ) );
  DFFRQX2M \REG_FILE_reg[7][5]  ( .D(n102), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[7][5] ) );
  DFFRQX2M \REG_FILE_reg[7][4]  ( .D(n101), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[7][4] ) );
  DFFRQX2M \REG_FILE_reg[7][3]  ( .D(n100), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[7][3] ) );
  DFFRQX2M \REG_FILE_reg[7][2]  ( .D(n99), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[7][2] ) );
  DFFRQX2M \REG_FILE_reg[7][1]  ( .D(n98), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[7][1] ) );
  DFFRQX2M \REG_FILE_reg[7][0]  ( .D(n97), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[7][0] ) );
  DFFRQX2M \REG_FILE_reg[14][7]  ( .D(n160), .CK(CLK), .RN(n212), .Q(
        \REG_FILE[14][7] ) );
  DFFRQX2M \REG_FILE_reg[14][6]  ( .D(n159), .CK(CLK), .RN(n212), .Q(
        \REG_FILE[14][6] ) );
  DFFRQX2M \REG_FILE_reg[14][5]  ( .D(n158), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[14][5] ) );
  DFFRQX2M \REG_FILE_reg[14][4]  ( .D(n157), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[14][4] ) );
  DFFRQX2M \REG_FILE_reg[14][3]  ( .D(n156), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[14][3] ) );
  DFFRQX2M \REG_FILE_reg[14][2]  ( .D(n155), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[14][2] ) );
  DFFRQX2M \REG_FILE_reg[14][1]  ( .D(n154), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[14][1] ) );
  DFFRQX2M \REG_FILE_reg[14][0]  ( .D(n153), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[14][0] ) );
  DFFRQX2M \REG_FILE_reg[10][7]  ( .D(n128), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[10][7] ) );
  DFFRQX2M \REG_FILE_reg[10][6]  ( .D(n127), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[10][6] ) );
  DFFRQX2M \REG_FILE_reg[10][5]  ( .D(n126), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[10][5] ) );
  DFFRQX2M \REG_FILE_reg[10][4]  ( .D(n125), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[10][4] ) );
  DFFRQX2M \REG_FILE_reg[10][3]  ( .D(n124), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[10][3] ) );
  DFFRQX2M \REG_FILE_reg[10][2]  ( .D(n123), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[10][2] ) );
  DFFRQX2M \REG_FILE_reg[10][1]  ( .D(n122), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[10][1] ) );
  DFFRQX2M \REG_FILE_reg[10][0]  ( .D(n121), .CK(CLK), .RN(n209), .Q(
        \REG_FILE[10][0] ) );
  DFFRQX2M \REG_FILE_reg[6][7]  ( .D(n96), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[6][7] ) );
  DFFRQX2M \REG_FILE_reg[6][6]  ( .D(n95), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[6][6] ) );
  DFFRQX2M \REG_FILE_reg[6][5]  ( .D(n94), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[6][5] ) );
  DFFRQX2M \REG_FILE_reg[6][4]  ( .D(n93), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[6][4] ) );
  DFFRQX2M \REG_FILE_reg[6][3]  ( .D(n92), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[6][3] ) );
  DFFRQX2M \REG_FILE_reg[6][2]  ( .D(n91), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[6][2] ) );
  DFFRQX2M \REG_FILE_reg[6][1]  ( .D(n90), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[6][1] ) );
  DFFRQX2M \REG_FILE_reg[6][0]  ( .D(n89), .CK(CLK), .RN(n207), .Q(
        \REG_FILE[6][0] ) );
  DFFRQX2M \REG_FILE_reg[12][7]  ( .D(n144), .CK(CLK), .RN(n211), .Q(
        \REG_FILE[12][7] ) );
  DFFRQX2M \REG_FILE_reg[12][6]  ( .D(n143), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[12][6] ) );
  DFFRQX2M \REG_FILE_reg[12][5]  ( .D(n142), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[12][5] ) );
  DFFRQX2M \REG_FILE_reg[12][4]  ( .D(n141), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[12][4] ) );
  DFFRQX2M \REG_FILE_reg[12][3]  ( .D(n140), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[12][3] ) );
  DFFRQX2M \REG_FILE_reg[12][2]  ( .D(n139), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[12][2] ) );
  DFFRQX2M \REG_FILE_reg[12][1]  ( .D(n138), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[12][1] ) );
  DFFRQX2M \REG_FILE_reg[12][0]  ( .D(n137), .CK(CLK), .RN(n210), .Q(
        \REG_FILE[12][0] ) );
  DFFRQX2M \REG_FILE_reg[8][7]  ( .D(n112), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[8][7] ) );
  DFFRQX2M \REG_FILE_reg[8][6]  ( .D(n111), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[8][6] ) );
  DFFRQX2M \REG_FILE_reg[8][5]  ( .D(n110), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[8][5] ) );
  DFFRQX2M \REG_FILE_reg[8][4]  ( .D(n109), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[8][4] ) );
  DFFRQX2M \REG_FILE_reg[8][3]  ( .D(n108), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[8][3] ) );
  DFFRQX2M \REG_FILE_reg[8][2]  ( .D(n107), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[8][2] ) );
  DFFRQX2M \REG_FILE_reg[8][1]  ( .D(n106), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[8][1] ) );
  DFFRQX2M \REG_FILE_reg[8][0]  ( .D(n105), .CK(CLK), .RN(n208), .Q(
        \REG_FILE[8][0] ) );
  DFFRQX2M \REG_FILE_reg[4][7]  ( .D(n80), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[4][7] ) );
  DFFRQX2M \REG_FILE_reg[4][6]  ( .D(n79), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[4][6] ) );
  DFFRQX2M \REG_FILE_reg[4][5]  ( .D(n78), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[4][5] ) );
  DFFRQX2M \REG_FILE_reg[4][4]  ( .D(n77), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[4][4] ) );
  DFFRQX2M \REG_FILE_reg[4][3]  ( .D(n76), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[4][3] ) );
  DFFRQX2M \REG_FILE_reg[4][2]  ( .D(n75), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[4][2] ) );
  DFFRQX2M \REG_FILE_reg[4][1]  ( .D(n74), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[4][1] ) );
  DFFRQX2M \REG_FILE_reg[4][0]  ( .D(n73), .CK(CLK), .RN(n206), .Q(
        \REG_FILE[4][0] ) );
  DFFRQX2M RdValid_reg ( .D(n227), .CK(CLK), .RN(n208), .Q(RdValid) );
  DFFRQX2M \REG_FILE_reg[3][0]  ( .D(n65), .CK(CLK), .RN(n205), .Q(REG3[0]) );
  DFFRQX2M \REG_FILE_reg[3][2]  ( .D(n67), .CK(CLK), .RN(n205), .Q(REG3[2]) );
  DFFRQX2M \REG_FILE_reg[3][3]  ( .D(n68), .CK(CLK), .RN(n205), .Q(REG3[3]) );
  DFFRQX2M \REG_FILE_reg[3][4]  ( .D(n69), .CK(CLK), .RN(n206), .Q(REG3[4]) );
  DFFRQX2M \REG_FILE_reg[3][7]  ( .D(n72), .CK(CLK), .RN(n206), .Q(REG3[7]) );
  DFFRQX2M \REG_FILE_reg[3][6]  ( .D(n71), .CK(CLK), .RN(n206), .Q(REG3[6]) );
  DFFSQX2M \REG_FILE_reg[2][0]  ( .D(n57), .CK(CLK), .SN(n204), .Q(REG2[0]) );
  DFFRQX2M \REG_FILE_reg[2][1]  ( .D(n58), .CK(CLK), .RN(n205), .Q(REG2[1]) );
  DFFRQX2M \REG_FILE_reg[3][1]  ( .D(n66), .CK(CLK), .RN(n205), .Q(REG3[1]) );
  DFFRQX2M \REG_FILE_reg[2][4]  ( .D(n61), .CK(CLK), .RN(n205), .Q(REG2[4]) );
  DFFSQX2M \REG_FILE_reg[2][7]  ( .D(n64), .CK(CLK), .SN(n204), .Q(REG2[7]) );
  DFFRQX2M \REG_FILE_reg[2][2]  ( .D(n59), .CK(CLK), .RN(n205), .Q(REG2[2]) );
  DFFRQX2M \REG_FILE_reg[2][3]  ( .D(n60), .CK(CLK), .RN(n205), .Q(REG2[3]) );
  DFFRQX2M \REG_FILE_reg[2][6]  ( .D(n63), .CK(CLK), .RN(n205), .Q(REG2[6]) );
  DFFRQX2M \REG_FILE_reg[0][1]  ( .D(n42), .CK(CLK), .RN(n204), .Q(REG0[1]) );
  DFFRQX2M \REG_FILE_reg[0][0]  ( .D(n41), .CK(CLK), .RN(n204), .Q(REG0[0]) );
  DFFRQX2M \REG_FILE_reg[0][2]  ( .D(n43), .CK(CLK), .RN(n204), .Q(REG0[2]) );
  DFFRQX2M \REG_FILE_reg[0][3]  ( .D(n44), .CK(CLK), .RN(n204), .Q(REG0[3]) );
  DFFRQX2M \REG_FILE_reg[0][4]  ( .D(n45), .CK(CLK), .RN(n204), .Q(REG0[4]) );
  DFFRQX2M \REG_FILE_reg[0][5]  ( .D(n46), .CK(CLK), .RN(n204), .Q(REG0[5]) );
  DFFRQX2M \REG_FILE_reg[0][7]  ( .D(n48), .CK(CLK), .RN(n204), .Q(REG0[7]) );
  DFFRQX2M \REG_FILE_reg[0][6]  ( .D(n47), .CK(CLK), .RN(n204), .Q(REG0[6]) );
  DFFRQX2M \REG_FILE_reg[1][7]  ( .D(n56), .CK(CLK), .RN(n205), .Q(REG1[7]) );
  DFFRQX2M \REG_FILE_reg[1][6]  ( .D(n55), .CK(CLK), .RN(n205), .Q(REG1[6]) );
  DFFRQX2M \REG_FILE_reg[1][5]  ( .D(n54), .CK(CLK), .RN(n205), .Q(REG1[5]) );
  DFFRQX2M \REG_FILE_reg[1][4]  ( .D(n53), .CK(CLK), .RN(n205), .Q(REG1[4]) );
  DFFRQX2M \REG_FILE_reg[1][1]  ( .D(n50), .CK(CLK), .RN(n204), .Q(REG1[1]) );
  DFFRQX2M \REG_FILE_reg[1][3]  ( .D(n52), .CK(CLK), .RN(n205), .Q(REG1[3]) );
  DFFRQX2M \REG_FILE_reg[1][2]  ( .D(n51), .CK(CLK), .RN(n204), .Q(REG1[2]) );
  DFFRQX2M \REG_FILE_reg[2][5]  ( .D(n62), .CK(CLK), .RN(n205), .Q(REG2[5]) );
  DFFRQX2M \REG_FILE_reg[1][0]  ( .D(n49), .CK(CLK), .RN(n204), .Q(REG1[0]) );
  NOR2X2M U3 ( .A(n203), .B(N13), .Y(n19) );
  NOR2X2M U4 ( .A(n198), .B(N13), .Y(n14) );
  INVX2M U5 ( .A(WrData[0]), .Y(n219) );
  INVX2M U6 ( .A(WrData[1]), .Y(n220) );
  INVX2M U7 ( .A(WrData[2]), .Y(n221) );
  INVX2M U8 ( .A(WrData[3]), .Y(n222) );
  INVX2M U9 ( .A(WrData[4]), .Y(n223) );
  INVX2M U10 ( .A(WrData[5]), .Y(n224) );
  INVX2M U11 ( .A(WrData[6]), .Y(n225) );
  INVX2M U12 ( .A(WrData[7]), .Y(n226) );
  INVX2M U13 ( .A(n199), .Y(n200) );
  INVX2M U14 ( .A(n197), .Y(n198) );
  INVX2M U15 ( .A(n199), .Y(n201) );
  BUFX2M U16 ( .A(n202), .Y(n199) );
  BUFX2M U17 ( .A(n203), .Y(n197) );
  INVX2M U18 ( .A(n40), .Y(n227) );
  NAND2X2M U19 ( .A(n17), .B(n14), .Y(n16) );
  NAND2X2M U20 ( .A(n30), .B(n14), .Y(n29) );
  NAND2X2M U21 ( .A(n32), .B(n14), .Y(n31) );
  NAND2X2M U22 ( .A(n30), .B(n19), .Y(n33) );
  NAND2X2M U23 ( .A(n32), .B(n19), .Y(n34) );
  NAND2X2M U24 ( .A(n19), .B(n15), .Y(n18) );
  NAND2X2M U25 ( .A(n19), .B(n17), .Y(n20) );
  NAND2X2M U26 ( .A(n22), .B(n15), .Y(n21) );
  NAND2X2M U27 ( .A(n22), .B(n17), .Y(n23) );
  NAND2X2M U28 ( .A(n25), .B(n15), .Y(n24) );
  NAND2X2M U29 ( .A(n25), .B(n17), .Y(n27) );
  NAND2X2M U30 ( .A(n30), .B(n22), .Y(n35) );
  NAND2X2M U31 ( .A(n32), .B(n22), .Y(n36) );
  NAND2X2M U32 ( .A(n30), .B(n25), .Y(n37) );
  NAND2X2M U33 ( .A(n32), .B(n25), .Y(n39) );
  NAND2X2M U34 ( .A(n14), .B(n15), .Y(n13) );
  AND2X2M U35 ( .A(n26), .B(N11), .Y(n17) );
  AND2X2M U36 ( .A(n38), .B(N11), .Y(n32) );
  NOR2X2M U37 ( .A(n228), .B(RdEn), .Y(n28) );
  INVX2M U38 ( .A(WrEn), .Y(n228) );
  NAND2X2M U39 ( .A(RdEn), .B(n228), .Y(n40) );
  BUFX2M U40 ( .A(n218), .Y(n204) );
  BUFX2M U41 ( .A(n218), .Y(n205) );
  BUFX2M U42 ( .A(n217), .Y(n206) );
  BUFX2M U43 ( .A(n217), .Y(n207) );
  BUFX2M U44 ( .A(n216), .Y(n208) );
  BUFX2M U45 ( .A(n216), .Y(n209) );
  BUFX2M U46 ( .A(n215), .Y(n210) );
  BUFX2M U47 ( .A(n215), .Y(n211) );
  BUFX2M U48 ( .A(n214), .Y(n212) );
  BUFX2M U49 ( .A(n214), .Y(n213) );
  NOR2BX2M U50 ( .AN(n28), .B(N14), .Y(n26) );
  AND2X2M U51 ( .A(n26), .B(n202), .Y(n15) );
  AND2X2M U52 ( .A(n38), .B(n202), .Y(n30) );
  AND2X2M U53 ( .A(N14), .B(n28), .Y(n38) );
  AND2X2M U54 ( .A(N13), .B(n203), .Y(n22) );
  AND2X2M U55 ( .A(N13), .B(n198), .Y(n25) );
  BUFX2M U56 ( .A(RST), .Y(n217) );
  BUFX2M U57 ( .A(RST), .Y(n216) );
  BUFX2M U58 ( .A(RST), .Y(n215) );
  BUFX2M U59 ( .A(RST), .Y(n214) );
  BUFX2M U60 ( .A(RST), .Y(n218) );
  OAI2BB2X1M U61 ( .B0(n13), .B1(n219), .A0N(REG0[0]), .A1N(n13), .Y(n41) );
  OAI2BB2X1M U62 ( .B0(n13), .B1(n220), .A0N(REG0[1]), .A1N(n13), .Y(n42) );
  OAI2BB2X1M U63 ( .B0(n13), .B1(n221), .A0N(REG0[2]), .A1N(n13), .Y(n43) );
  OAI2BB2X1M U64 ( .B0(n13), .B1(n222), .A0N(REG0[3]), .A1N(n13), .Y(n44) );
  OAI2BB2X1M U65 ( .B0(n13), .B1(n223), .A0N(REG0[4]), .A1N(n13), .Y(n45) );
  OAI2BB2X1M U66 ( .B0(n13), .B1(n224), .A0N(REG0[5]), .A1N(n13), .Y(n46) );
  OAI2BB2X1M U67 ( .B0(n13), .B1(n225), .A0N(REG0[6]), .A1N(n13), .Y(n47) );
  OAI2BB2X1M U68 ( .B0(n13), .B1(n226), .A0N(REG0[7]), .A1N(n13), .Y(n48) );
  OAI2BB2X1M U69 ( .B0(n220), .B1(n18), .A0N(REG2[1]), .A1N(n18), .Y(n58) );
  OAI2BB2X1M U70 ( .B0(n221), .B1(n18), .A0N(REG2[2]), .A1N(n18), .Y(n59) );
  OAI2BB2X1M U71 ( .B0(n222), .B1(n18), .A0N(REG2[3]), .A1N(n18), .Y(n60) );
  OAI2BB2X1M U72 ( .B0(n223), .B1(n18), .A0N(REG2[4]), .A1N(n18), .Y(n61) );
  OAI2BB2X1M U73 ( .B0(n224), .B1(n18), .A0N(REG2[5]), .A1N(n18), .Y(n62) );
  OAI2BB2X1M U74 ( .B0(n225), .B1(n18), .A0N(REG2[6]), .A1N(n18), .Y(n63) );
  OAI2BB2X1M U75 ( .B0(n219), .B1(n20), .A0N(REG3[0]), .A1N(n20), .Y(n65) );
  OAI2BB2X1M U76 ( .B0(n220), .B1(n20), .A0N(REG3[1]), .A1N(n20), .Y(n66) );
  OAI2BB2X1M U77 ( .B0(n221), .B1(n20), .A0N(REG3[2]), .A1N(n20), .Y(n67) );
  OAI2BB2X1M U78 ( .B0(n222), .B1(n20), .A0N(REG3[3]), .A1N(n20), .Y(n68) );
  OAI2BB2X1M U79 ( .B0(n223), .B1(n20), .A0N(REG3[4]), .A1N(n20), .Y(n69) );
  OAI2BB2X1M U80 ( .B0(n225), .B1(n20), .A0N(REG3[6]), .A1N(n20), .Y(n71) );
  OAI2BB2X1M U81 ( .B0(n226), .B1(n20), .A0N(REG3[7]), .A1N(n20), .Y(n72) );
  OAI2BB2X1M U82 ( .B0(n219), .B1(n16), .A0N(REG1[0]), .A1N(n16), .Y(n49) );
  OAI2BB2X1M U83 ( .B0(n220), .B1(n16), .A0N(REG1[1]), .A1N(n16), .Y(n50) );
  OAI2BB2X1M U84 ( .B0(n221), .B1(n16), .A0N(REG1[2]), .A1N(n16), .Y(n51) );
  OAI2BB2X1M U85 ( .B0(n222), .B1(n16), .A0N(REG1[3]), .A1N(n16), .Y(n52) );
  OAI2BB2X1M U86 ( .B0(n223), .B1(n16), .A0N(REG1[4]), .A1N(n16), .Y(n53) );
  OAI2BB2X1M U87 ( .B0(n224), .B1(n16), .A0N(REG1[5]), .A1N(n16), .Y(n54) );
  OAI2BB2X1M U88 ( .B0(n225), .B1(n16), .A0N(REG1[6]), .A1N(n16), .Y(n55) );
  OAI2BB2X1M U89 ( .B0(n226), .B1(n16), .A0N(REG1[7]), .A1N(n16), .Y(n56) );
  OAI2BB2X1M U90 ( .B0(n219), .B1(n29), .A0N(\REG_FILE[8][0] ), .A1N(n29), .Y(
        n105) );
  OAI2BB2X1M U91 ( .B0(n220), .B1(n29), .A0N(\REG_FILE[8][1] ), .A1N(n29), .Y(
        n106) );
  OAI2BB2X1M U92 ( .B0(n221), .B1(n29), .A0N(\REG_FILE[8][2] ), .A1N(n29), .Y(
        n107) );
  OAI2BB2X1M U93 ( .B0(n222), .B1(n29), .A0N(\REG_FILE[8][3] ), .A1N(n29), .Y(
        n108) );
  OAI2BB2X1M U94 ( .B0(n223), .B1(n29), .A0N(\REG_FILE[8][4] ), .A1N(n29), .Y(
        n109) );
  OAI2BB2X1M U95 ( .B0(n224), .B1(n29), .A0N(\REG_FILE[8][5] ), .A1N(n29), .Y(
        n110) );
  OAI2BB2X1M U96 ( .B0(n225), .B1(n29), .A0N(\REG_FILE[8][6] ), .A1N(n29), .Y(
        n111) );
  OAI2BB2X1M U97 ( .B0(n226), .B1(n29), .A0N(\REG_FILE[8][7] ), .A1N(n29), .Y(
        n112) );
  OAI2BB2X1M U98 ( .B0(n219), .B1(n31), .A0N(\REG_FILE[9][0] ), .A1N(n31), .Y(
        n113) );
  OAI2BB2X1M U99 ( .B0(n220), .B1(n31), .A0N(\REG_FILE[9][1] ), .A1N(n31), .Y(
        n114) );
  OAI2BB2X1M U100 ( .B0(n221), .B1(n31), .A0N(\REG_FILE[9][2] ), .A1N(n31), 
        .Y(n115) );
  OAI2BB2X1M U101 ( .B0(n222), .B1(n31), .A0N(\REG_FILE[9][3] ), .A1N(n31), 
        .Y(n116) );
  OAI2BB2X1M U102 ( .B0(n223), .B1(n31), .A0N(\REG_FILE[9][4] ), .A1N(n31), 
        .Y(n117) );
  OAI2BB2X1M U103 ( .B0(n224), .B1(n31), .A0N(\REG_FILE[9][5] ), .A1N(n31), 
        .Y(n118) );
  OAI2BB2X1M U104 ( .B0(n225), .B1(n31), .A0N(\REG_FILE[9][6] ), .A1N(n31), 
        .Y(n119) );
  OAI2BB2X1M U105 ( .B0(n226), .B1(n31), .A0N(\REG_FILE[9][7] ), .A1N(n31), 
        .Y(n120) );
  OAI2BB2X1M U106 ( .B0(n219), .B1(n33), .A0N(\REG_FILE[10][0] ), .A1N(n33), 
        .Y(n121) );
  OAI2BB2X1M U107 ( .B0(n220), .B1(n33), .A0N(\REG_FILE[10][1] ), .A1N(n33), 
        .Y(n122) );
  OAI2BB2X1M U108 ( .B0(n221), .B1(n33), .A0N(\REG_FILE[10][2] ), .A1N(n33), 
        .Y(n123) );
  OAI2BB2X1M U109 ( .B0(n222), .B1(n33), .A0N(\REG_FILE[10][3] ), .A1N(n33), 
        .Y(n124) );
  OAI2BB2X1M U110 ( .B0(n223), .B1(n33), .A0N(\REG_FILE[10][4] ), .A1N(n33), 
        .Y(n125) );
  OAI2BB2X1M U111 ( .B0(n224), .B1(n33), .A0N(\REG_FILE[10][5] ), .A1N(n33), 
        .Y(n126) );
  OAI2BB2X1M U112 ( .B0(n225), .B1(n33), .A0N(\REG_FILE[10][6] ), .A1N(n33), 
        .Y(n127) );
  OAI2BB2X1M U113 ( .B0(n226), .B1(n33), .A0N(\REG_FILE[10][7] ), .A1N(n33), 
        .Y(n128) );
  OAI2BB2X1M U114 ( .B0(n219), .B1(n34), .A0N(\REG_FILE[11][0] ), .A1N(n34), 
        .Y(n129) );
  OAI2BB2X1M U115 ( .B0(n220), .B1(n34), .A0N(\REG_FILE[11][1] ), .A1N(n34), 
        .Y(n130) );
  OAI2BB2X1M U116 ( .B0(n221), .B1(n34), .A0N(\REG_FILE[11][2] ), .A1N(n34), 
        .Y(n131) );
  OAI2BB2X1M U117 ( .B0(n222), .B1(n34), .A0N(\REG_FILE[11][3] ), .A1N(n34), 
        .Y(n132) );
  OAI2BB2X1M U118 ( .B0(n223), .B1(n34), .A0N(\REG_FILE[11][4] ), .A1N(n34), 
        .Y(n133) );
  OAI2BB2X1M U119 ( .B0(n224), .B1(n34), .A0N(\REG_FILE[11][5] ), .A1N(n34), 
        .Y(n134) );
  OAI2BB2X1M U120 ( .B0(n225), .B1(n34), .A0N(\REG_FILE[11][6] ), .A1N(n34), 
        .Y(n135) );
  OAI2BB2X1M U121 ( .B0(n226), .B1(n34), .A0N(\REG_FILE[11][7] ), .A1N(n34), 
        .Y(n136) );
  OAI2BB2X1M U122 ( .B0(n219), .B1(n35), .A0N(\REG_FILE[12][0] ), .A1N(n35), 
        .Y(n137) );
  OAI2BB2X1M U123 ( .B0(n220), .B1(n35), .A0N(\REG_FILE[12][1] ), .A1N(n35), 
        .Y(n138) );
  OAI2BB2X1M U124 ( .B0(n221), .B1(n35), .A0N(\REG_FILE[12][2] ), .A1N(n35), 
        .Y(n139) );
  OAI2BB2X1M U125 ( .B0(n222), .B1(n35), .A0N(\REG_FILE[12][3] ), .A1N(n35), 
        .Y(n140) );
  OAI2BB2X1M U126 ( .B0(n223), .B1(n35), .A0N(\REG_FILE[12][4] ), .A1N(n35), 
        .Y(n141) );
  OAI2BB2X1M U127 ( .B0(n224), .B1(n35), .A0N(\REG_FILE[12][5] ), .A1N(n35), 
        .Y(n142) );
  OAI2BB2X1M U128 ( .B0(n225), .B1(n35), .A0N(\REG_FILE[12][6] ), .A1N(n35), 
        .Y(n143) );
  OAI2BB2X1M U129 ( .B0(n226), .B1(n35), .A0N(\REG_FILE[12][7] ), .A1N(n35), 
        .Y(n144) );
  OAI2BB2X1M U130 ( .B0(n219), .B1(n36), .A0N(\REG_FILE[13][0] ), .A1N(n36), 
        .Y(n145) );
  OAI2BB2X1M U131 ( .B0(n220), .B1(n36), .A0N(\REG_FILE[13][1] ), .A1N(n36), 
        .Y(n146) );
  OAI2BB2X1M U132 ( .B0(n221), .B1(n36), .A0N(\REG_FILE[13][2] ), .A1N(n36), 
        .Y(n147) );
  OAI2BB2X1M U133 ( .B0(n222), .B1(n36), .A0N(\REG_FILE[13][3] ), .A1N(n36), 
        .Y(n148) );
  OAI2BB2X1M U134 ( .B0(n223), .B1(n36), .A0N(\REG_FILE[13][4] ), .A1N(n36), 
        .Y(n149) );
  OAI2BB2X1M U135 ( .B0(n224), .B1(n36), .A0N(\REG_FILE[13][5] ), .A1N(n36), 
        .Y(n150) );
  OAI2BB2X1M U136 ( .B0(n225), .B1(n36), .A0N(\REG_FILE[13][6] ), .A1N(n36), 
        .Y(n151) );
  OAI2BB2X1M U137 ( .B0(n226), .B1(n36), .A0N(\REG_FILE[13][7] ), .A1N(n36), 
        .Y(n152) );
  OAI2BB2X1M U138 ( .B0(n219), .B1(n37), .A0N(\REG_FILE[14][0] ), .A1N(n37), 
        .Y(n153) );
  OAI2BB2X1M U139 ( .B0(n220), .B1(n37), .A0N(\REG_FILE[14][1] ), .A1N(n37), 
        .Y(n154) );
  OAI2BB2X1M U140 ( .B0(n221), .B1(n37), .A0N(\REG_FILE[14][2] ), .A1N(n37), 
        .Y(n155) );
  OAI2BB2X1M U141 ( .B0(n222), .B1(n37), .A0N(\REG_FILE[14][3] ), .A1N(n37), 
        .Y(n156) );
  OAI2BB2X1M U142 ( .B0(n223), .B1(n37), .A0N(\REG_FILE[14][4] ), .A1N(n37), 
        .Y(n157) );
  OAI2BB2X1M U143 ( .B0(n224), .B1(n37), .A0N(\REG_FILE[14][5] ), .A1N(n37), 
        .Y(n158) );
  OAI2BB2X1M U144 ( .B0(n225), .B1(n37), .A0N(\REG_FILE[14][6] ), .A1N(n37), 
        .Y(n159) );
  OAI2BB2X1M U145 ( .B0(n226), .B1(n37), .A0N(\REG_FILE[14][7] ), .A1N(n37), 
        .Y(n160) );
  OAI2BB2X1M U146 ( .B0(n219), .B1(n39), .A0N(\REG_FILE[15][0] ), .A1N(n39), 
        .Y(n161) );
  OAI2BB2X1M U147 ( .B0(n220), .B1(n39), .A0N(\REG_FILE[15][1] ), .A1N(n39), 
        .Y(n162) );
  OAI2BB2X1M U148 ( .B0(n221), .B1(n39), .A0N(\REG_FILE[15][2] ), .A1N(n39), 
        .Y(n163) );
  OAI2BB2X1M U149 ( .B0(n222), .B1(n39), .A0N(\REG_FILE[15][3] ), .A1N(n39), 
        .Y(n164) );
  OAI2BB2X1M U150 ( .B0(n223), .B1(n39), .A0N(\REG_FILE[15][4] ), .A1N(n39), 
        .Y(n165) );
  OAI2BB2X1M U151 ( .B0(n224), .B1(n39), .A0N(\REG_FILE[15][5] ), .A1N(n39), 
        .Y(n166) );
  OAI2BB2X1M U152 ( .B0(n225), .B1(n39), .A0N(\REG_FILE[15][6] ), .A1N(n39), 
        .Y(n167) );
  OAI2BB2X1M U153 ( .B0(n226), .B1(n39), .A0N(\REG_FILE[15][7] ), .A1N(n39), 
        .Y(n168) );
  OAI2BB2X1M U154 ( .B0(n219), .B1(n21), .A0N(\REG_FILE[4][0] ), .A1N(n21), 
        .Y(n73) );
  OAI2BB2X1M U155 ( .B0(n220), .B1(n21), .A0N(\REG_FILE[4][1] ), .A1N(n21), 
        .Y(n74) );
  OAI2BB2X1M U156 ( .B0(n221), .B1(n21), .A0N(\REG_FILE[4][2] ), .A1N(n21), 
        .Y(n75) );
  OAI2BB2X1M U157 ( .B0(n222), .B1(n21), .A0N(\REG_FILE[4][3] ), .A1N(n21), 
        .Y(n76) );
  OAI2BB2X1M U158 ( .B0(n223), .B1(n21), .A0N(\REG_FILE[4][4] ), .A1N(n21), 
        .Y(n77) );
  OAI2BB2X1M U159 ( .B0(n224), .B1(n21), .A0N(\REG_FILE[4][5] ), .A1N(n21), 
        .Y(n78) );
  OAI2BB2X1M U160 ( .B0(n225), .B1(n21), .A0N(\REG_FILE[4][6] ), .A1N(n21), 
        .Y(n79) );
  OAI2BB2X1M U161 ( .B0(n226), .B1(n21), .A0N(\REG_FILE[4][7] ), .A1N(n21), 
        .Y(n80) );
  OAI2BB2X1M U162 ( .B0(n219), .B1(n23), .A0N(\REG_FILE[5][0] ), .A1N(n23), 
        .Y(n81) );
  OAI2BB2X1M U163 ( .B0(n220), .B1(n23), .A0N(\REG_FILE[5][1] ), .A1N(n23), 
        .Y(n82) );
  OAI2BB2X1M U164 ( .B0(n221), .B1(n23), .A0N(\REG_FILE[5][2] ), .A1N(n23), 
        .Y(n83) );
  OAI2BB2X1M U165 ( .B0(n222), .B1(n23), .A0N(\REG_FILE[5][3] ), .A1N(n23), 
        .Y(n84) );
  OAI2BB2X1M U166 ( .B0(n223), .B1(n23), .A0N(\REG_FILE[5][4] ), .A1N(n23), 
        .Y(n85) );
  OAI2BB2X1M U167 ( .B0(n224), .B1(n23), .A0N(\REG_FILE[5][5] ), .A1N(n23), 
        .Y(n86) );
  OAI2BB2X1M U168 ( .B0(n225), .B1(n23), .A0N(\REG_FILE[5][6] ), .A1N(n23), 
        .Y(n87) );
  OAI2BB2X1M U169 ( .B0(n226), .B1(n23), .A0N(\REG_FILE[5][7] ), .A1N(n23), 
        .Y(n88) );
  OAI2BB2X1M U170 ( .B0(n219), .B1(n24), .A0N(\REG_FILE[6][0] ), .A1N(n24), 
        .Y(n89) );
  OAI2BB2X1M U171 ( .B0(n220), .B1(n24), .A0N(\REG_FILE[6][1] ), .A1N(n24), 
        .Y(n90) );
  OAI2BB2X1M U172 ( .B0(n221), .B1(n24), .A0N(\REG_FILE[6][2] ), .A1N(n24), 
        .Y(n91) );
  OAI2BB2X1M U173 ( .B0(n222), .B1(n24), .A0N(\REG_FILE[6][3] ), .A1N(n24), 
        .Y(n92) );
  OAI2BB2X1M U174 ( .B0(n223), .B1(n24), .A0N(\REG_FILE[6][4] ), .A1N(n24), 
        .Y(n93) );
  OAI2BB2X1M U175 ( .B0(n224), .B1(n24), .A0N(\REG_FILE[6][5] ), .A1N(n24), 
        .Y(n94) );
  OAI2BB2X1M U176 ( .B0(n225), .B1(n24), .A0N(\REG_FILE[6][6] ), .A1N(n24), 
        .Y(n95) );
  OAI2BB2X1M U177 ( .B0(n226), .B1(n24), .A0N(\REG_FILE[6][7] ), .A1N(n24), 
        .Y(n96) );
  OAI2BB2X1M U178 ( .B0(n219), .B1(n27), .A0N(\REG_FILE[7][0] ), .A1N(n27), 
        .Y(n97) );
  OAI2BB2X1M U179 ( .B0(n220), .B1(n27), .A0N(\REG_FILE[7][1] ), .A1N(n27), 
        .Y(n98) );
  OAI2BB2X1M U180 ( .B0(n221), .B1(n27), .A0N(\REG_FILE[7][2] ), .A1N(n27), 
        .Y(n99) );
  OAI2BB2X1M U181 ( .B0(n222), .B1(n27), .A0N(\REG_FILE[7][3] ), .A1N(n27), 
        .Y(n100) );
  OAI2BB2X1M U182 ( .B0(n223), .B1(n27), .A0N(\REG_FILE[7][4] ), .A1N(n27), 
        .Y(n101) );
  OAI2BB2X1M U183 ( .B0(n224), .B1(n27), .A0N(\REG_FILE[7][5] ), .A1N(n27), 
        .Y(n102) );
  OAI2BB2X1M U184 ( .B0(n225), .B1(n27), .A0N(\REG_FILE[7][6] ), .A1N(n27), 
        .Y(n103) );
  OAI2BB2X1M U185 ( .B0(n226), .B1(n27), .A0N(\REG_FILE[7][7] ), .A1N(n27), 
        .Y(n104) );
  OAI2BB2X1M U186 ( .B0(n219), .B1(n18), .A0N(REG2[0]), .A1N(n18), .Y(n57) );
  OAI2BB2X1M U187 ( .B0(n226), .B1(n18), .A0N(REG2[7]), .A1N(n18), .Y(n64) );
  OAI2BB2X1M U188 ( .B0(n224), .B1(n20), .A0N(REG3[5]), .A1N(n20), .Y(n70) );
  AO22X1M U189 ( .A0(N42), .A1(n227), .B0(RdData[0]), .B1(n40), .Y(n169) );
  MX4X1M U190 ( .A(n4), .B(n2), .C(n3), .D(n1), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U191 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(n198), .Y(n4) );
  MX4X1M U192 ( .A(\REG_FILE[8][0] ), .B(\REG_FILE[9][0] ), .C(
        \REG_FILE[10][0] ), .D(\REG_FILE[11][0] ), .S0(N11), .S1(n198), .Y(n2)
         );
  AO22X1M U193 ( .A0(N41), .A1(n227), .B0(RdData[1]), .B1(n40), .Y(n170) );
  MX4X1M U194 ( .A(n8), .B(n6), .C(n7), .D(n5), .S0(N14), .S1(N13), .Y(N41) );
  MX4X1M U195 ( .A(\REG_FILE[8][1] ), .B(\REG_FILE[9][1] ), .C(
        \REG_FILE[10][1] ), .D(\REG_FILE[11][1] ), .S0(N11), .S1(n198), .Y(n6)
         );
  MX4X1M U196 ( .A(\REG_FILE[12][1] ), .B(\REG_FILE[13][1] ), .C(
        \REG_FILE[14][1] ), .D(\REG_FILE[15][1] ), .S0(n200), .S1(n198), .Y(n5) );
  AO22X1M U197 ( .A0(N40), .A1(n227), .B0(RdData[2]), .B1(n40), .Y(n171) );
  MX4X1M U198 ( .A(n12), .B(n10), .C(n11), .D(n9), .S0(N14), .S1(N13), .Y(N40)
         );
  MX4X1M U199 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n200), 
        .S1(N12), .Y(n12) );
  MX4X1M U200 ( .A(\REG_FILE[8][2] ), .B(\REG_FILE[9][2] ), .C(
        \REG_FILE[10][2] ), .D(\REG_FILE[11][2] ), .S0(n200), .S1(N12), .Y(n10) );
  AO22X1M U201 ( .A0(N39), .A1(n227), .B0(RdData[3]), .B1(n40), .Y(n172) );
  MX4X1M U202 ( .A(n180), .B(n178), .C(n179), .D(n177), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U203 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n200), 
        .S1(N12), .Y(n180) );
  MX4X1M U204 ( .A(\REG_FILE[8][3] ), .B(\REG_FILE[9][3] ), .C(
        \REG_FILE[10][3] ), .D(\REG_FILE[11][3] ), .S0(n200), .S1(N12), .Y(
        n178) );
  AO22X1M U205 ( .A0(N38), .A1(n227), .B0(RdData[4]), .B1(n40), .Y(n173) );
  MX4X1M U206 ( .A(n184), .B(n182), .C(n183), .D(n181), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U207 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n201), 
        .S1(N12), .Y(n184) );
  MX4X1M U208 ( .A(\REG_FILE[8][4] ), .B(\REG_FILE[9][4] ), .C(
        \REG_FILE[10][4] ), .D(\REG_FILE[11][4] ), .S0(n200), .S1(N12), .Y(
        n182) );
  AO22X1M U209 ( .A0(N37), .A1(n227), .B0(RdData[5]), .B1(n40), .Y(n174) );
  MX4X1M U210 ( .A(n188), .B(n186), .C(n187), .D(n185), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U211 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n201), 
        .S1(N12), .Y(n188) );
  MX4X1M U212 ( .A(\REG_FILE[8][5] ), .B(\REG_FILE[9][5] ), .C(
        \REG_FILE[10][5] ), .D(\REG_FILE[11][5] ), .S0(n201), .S1(N12), .Y(
        n186) );
  AO22X1M U213 ( .A0(N36), .A1(n227), .B0(RdData[6]), .B1(n40), .Y(n175) );
  MX4X1M U214 ( .A(n192), .B(n190), .C(n191), .D(n189), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U215 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n201), 
        .S1(N12), .Y(n192) );
  MX4X1M U216 ( .A(\REG_FILE[8][6] ), .B(\REG_FILE[9][6] ), .C(
        \REG_FILE[10][6] ), .D(\REG_FILE[11][6] ), .S0(n201), .S1(N12), .Y(
        n190) );
  AO22X1M U217 ( .A0(N35), .A1(n227), .B0(RdData[7]), .B1(n40), .Y(n176) );
  MX4X1M U218 ( .A(n196), .B(n194), .C(n195), .D(n193), .S0(N14), .S1(N13), 
        .Y(N35) );
  MX4X1M U219 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n201), 
        .S1(N12), .Y(n196) );
  MX4X1M U220 ( .A(\REG_FILE[8][7] ), .B(\REG_FILE[9][7] ), .C(
        \REG_FILE[10][7] ), .D(\REG_FILE[11][7] ), .S0(n201), .S1(N12), .Y(
        n194) );
  MX4X1M U221 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n200), 
        .S1(n198), .Y(n8) );
  MX4X1M U222 ( .A(\REG_FILE[4][0] ), .B(\REG_FILE[5][0] ), .C(
        \REG_FILE[6][0] ), .D(\REG_FILE[7][0] ), .S0(N11), .S1(n198), .Y(n3)
         );
  MX4X1M U223 ( .A(\REG_FILE[4][1] ), .B(\REG_FILE[5][1] ), .C(
        \REG_FILE[6][1] ), .D(\REG_FILE[7][1] ), .S0(n200), .S1(n198), .Y(n7)
         );
  MX4X1M U224 ( .A(\REG_FILE[4][2] ), .B(\REG_FILE[5][2] ), .C(
        \REG_FILE[6][2] ), .D(\REG_FILE[7][2] ), .S0(n200), .S1(N12), .Y(n11)
         );
  MX4X1M U225 ( .A(\REG_FILE[4][3] ), .B(\REG_FILE[5][3] ), .C(
        \REG_FILE[6][3] ), .D(\REG_FILE[7][3] ), .S0(n200), .S1(N12), .Y(n179)
         );
  MX4X1M U226 ( .A(\REG_FILE[4][4] ), .B(\REG_FILE[5][4] ), .C(
        \REG_FILE[6][4] ), .D(\REG_FILE[7][4] ), .S0(n200), .S1(N12), .Y(n183)
         );
  MX4X1M U227 ( .A(\REG_FILE[4][5] ), .B(\REG_FILE[5][5] ), .C(
        \REG_FILE[6][5] ), .D(\REG_FILE[7][5] ), .S0(n201), .S1(N12), .Y(n187)
         );
  MX4X1M U228 ( .A(\REG_FILE[4][6] ), .B(\REG_FILE[5][6] ), .C(
        \REG_FILE[6][6] ), .D(\REG_FILE[7][6] ), .S0(n201), .S1(N12), .Y(n191)
         );
  MX4X1M U229 ( .A(\REG_FILE[4][7] ), .B(\REG_FILE[5][7] ), .C(
        \REG_FILE[6][7] ), .D(\REG_FILE[7][7] ), .S0(n201), .S1(N12), .Y(n195)
         );
  MX4X1M U230 ( .A(\REG_FILE[12][0] ), .B(\REG_FILE[13][0] ), .C(
        \REG_FILE[14][0] ), .D(\REG_FILE[15][0] ), .S0(n201), .S1(n198), .Y(n1) );
  MX4X1M U231 ( .A(\REG_FILE[12][2] ), .B(\REG_FILE[13][2] ), .C(
        \REG_FILE[14][2] ), .D(\REG_FILE[15][2] ), .S0(n200), .S1(n198), .Y(n9) );
  MX4X1M U232 ( .A(\REG_FILE[12][3] ), .B(\REG_FILE[13][3] ), .C(
        \REG_FILE[14][3] ), .D(\REG_FILE[15][3] ), .S0(n200), .S1(n198), .Y(
        n177) );
  MX4X1M U233 ( .A(\REG_FILE[12][4] ), .B(\REG_FILE[13][4] ), .C(
        \REG_FILE[14][4] ), .D(\REG_FILE[15][4] ), .S0(n200), .S1(N12), .Y(
        n181) );
  MX4X1M U234 ( .A(\REG_FILE[12][5] ), .B(\REG_FILE[13][5] ), .C(
        \REG_FILE[14][5] ), .D(\REG_FILE[15][5] ), .S0(n201), .S1(n198), .Y(
        n185) );
  MX4X1M U235 ( .A(\REG_FILE[12][6] ), .B(\REG_FILE[13][6] ), .C(
        \REG_FILE[14][6] ), .D(\REG_FILE[15][6] ), .S0(n201), .S1(n198), .Y(
        n189) );
  MX4X1M U236 ( .A(\REG_FILE[12][7] ), .B(\REG_FILE[13][7] ), .C(
        \REG_FILE[14][7] ), .D(\REG_FILE[15][7] ), .S0(n201), .S1(n198), .Y(
        n193) );
  INVX2M U237 ( .A(N11), .Y(n202) );
  INVX2M U238 ( .A(N12), .Y(n203) );
endmodule


module ALU_WIDTH8_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
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
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;

  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n16), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n17), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n18), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n15), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n18), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n18), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n18), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n18), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n18), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n18), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n15), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n14), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n15), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n17), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n16), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n15), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n16), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n16), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n17), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n16), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n17), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n17), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n17), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n13), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n14), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n13), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n12), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n14), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  INVX2M U1 ( .A(b[0]), .Y(n19) );
  XNOR2X2M U2 ( .A(n19), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n19), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n19), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n19), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n19), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n19), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n19), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n19), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n19), .Y(n5) );
  NAND2X2M U15 ( .A(n7), .B(n8), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n8) );
  INVX2M U17 ( .A(n19), .Y(n7) );
  NAND2X2M U18 ( .A(n7), .B(n9), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U19 ( .A(a[2]), .Y(n9) );
  NAND2X2M U20 ( .A(n7), .B(n10), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U21 ( .A(a[1]), .Y(n10) );
  NAND2X2M U22 ( .A(n7), .B(n11), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U23 ( .A(a[0]), .Y(n11) );
  INVX2M U24 ( .A(b[5]), .Y(n14) );
  NAND2X2M U25 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U26 ( .A(a[6]), .Y(n2) );
  INVX2M U27 ( .A(n19), .Y(n1) );
  INVX2M U28 ( .A(b[6]), .Y(n13) );
  XNOR2X2M U29 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U30 ( .A(b[7]), .Y(n12) );
  INVX2M U31 ( .A(b[1]), .Y(n18) );
  INVX2M U32 ( .A(b[2]), .Y(n17) );
  INVX2M U33 ( .A(b[3]), .Y(n16) );
  INVX2M U34 ( .A(b[4]), .Y(n15) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U40 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U41 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U46 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U47 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U51 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U52 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U55 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U56 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U58 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U59 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U60 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U61 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U62 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U63 ( .A(\u_div/CryTmp[7][1] ), .B(n20), .C(n18), .D(n17), .Y(
        quotient[7]) );
  AND3X1M U64 ( .A(n20), .B(n17), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U65 ( .A(\u_div/CryTmp[5][3] ), .B(n20), .Y(quotient[5]) );
  AND2X1M U66 ( .A(n21), .B(n16), .Y(n20) );
  AND2X1M U67 ( .A(\u_div/CryTmp[4][4] ), .B(n21), .Y(quotient[4]) );
  AND3X1M U68 ( .A(n22), .B(n15), .C(n14), .Y(n21) );
  AND3X1M U69 ( .A(n22), .B(n14), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U70 ( .A(\u_div/CryTmp[2][6] ), .B(n22), .Y(quotient[2]) );
  NOR2X1M U71 ( .A(b[6]), .B(b[7]), .Y(n22) );
  AND2X1M U72 ( .A(\u_div/CryTmp[1][7] ), .B(n12), .Y(quotient[1]) );
endmodule


module ALU_WIDTH8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  INVX2M U1 ( .A(B[5]), .Y(n4) );
  INVX2M U2 ( .A(B[6]), .Y(n3) );
  INVX2M U3 ( .A(B[7]), .Y(n2) );
  XNOR2X2M U4 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U5 ( .A(B[0]), .Y(n9) );
  INVX2M U6 ( .A(B[2]), .Y(n7) );
  INVX2M U7 ( .A(B[3]), .Y(n6) );
  INVX2M U8 ( .A(B[4]), .Y(n5) );
  INVX2M U9 ( .A(B[1]), .Y(n8) );
  NAND2X2M U10 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U11 ( .A(A[0]), .Y(n1) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_WIDTH8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_WIDTH8_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  XNOR2X2M U3 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  NAND2X2M U4 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_WIDTH8_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_WIDTH8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n11, n15, n16, n14, n12, n13, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n6), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n5), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n4), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n3), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n9), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n7), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  AND2X2M U2 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U11 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U12 ( .A(\ab[0][5] ), .Y(n21) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U15 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n11) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U18 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U19 ( .A(\ab[0][3] ), .Y(n19) );
  XNOR2X2M U20 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  AND2X2M U21 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U22 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n13) );
  CLKXOR2X2M U23 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  INVX2M U24 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n14) );
  AND2X2M U26 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U27 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U28 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n16) );
  XNOR2X2M U29 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U30 ( .A(\SUMB[7][1] ), .Y(n17) );
  CLKXOR2X2M U31 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(B[6]), .Y(n25) );
  INVX2M U38 ( .A(A[0]), .Y(n39) );
  INVX2M U39 ( .A(B[7]), .Y(n24) );
  INVX2M U40 ( .A(B[5]), .Y(n26) );
  XNOR2X2M U41 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U42 ( .A(A[2]), .Y(n37) );
  INVX2M U43 ( .A(A[3]), .Y(n36) );
  INVX2M U44 ( .A(A[4]), .Y(n35) );
  INVX2M U45 ( .A(A[7]), .Y(n32) );
  INVX2M U46 ( .A(A[6]), .Y(n33) );
  INVX2M U47 ( .A(A[5]), .Y(n34) );
  INVX2M U48 ( .A(B[3]), .Y(n28) );
  INVX2M U49 ( .A(B[4]), .Y(n27) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU_WIDTH8 ( CLK, RST, EN, ALU_FUN, A, B, ALU_OUT, OUT_VALID );
  input [3:0] ALU_FUN;
  input [7:0] A;
  input [7:0] B;
  output [15:0] ALU_OUT;
  input CLK, RST, EN;
  output OUT_VALID;
  wire   N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104, N105,
         N106, N107, N108, N109, N110, N111, N112, N113, N114, N115, N116,
         N117, N118, N119, N120, N121, N122, N123, N124, N125, N126, N130,
         N131, N132, N133, N134, N135, N136, N137, N171, N172, N173, N190,
         N191, N192, N193, N194, N195, N196, N197, N198, N199, N200, N201,
         N202, N203, N204, N205, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151;

  ALU_WIDTH8_DW_div_uns_0 div_46 ( .a({n13, n12, n11, n10, n9, n8, n7, n6}), 
        .b({n5, n4, n3, B[4:0]}), .quotient({N137, N136, N135, N134, N133, 
        N132, N131, N130}) );
  ALU_WIDTH8_DW01_sub_0 sub_44 ( .A({1'b0, n13, n12, n11, n10, n9, n8, n7, n6}), .B({1'b0, n5, n4, n3, B[4:0]}), .CI(1'b0), .DIFF({N110, N109, N108, N107, 
        N106, N105, N104, N103, N102}) );
  ALU_WIDTH8_DW01_add_0 add_43 ( .A({1'b0, n13, n12, n11, n10, n9, n8, n7, n6}), .B({1'b0, n5, n4, n3, B[4:0]}), .CI(1'b0), .SUM({N101, N100, N99, N98, N97, 
        N96, N95, N94, N93}) );
  ALU_WIDTH8_DW02_mult_0 mult_45 ( .A({n13, n12, n11, n10, n9, n8, n7, n6}), 
        .B({n5, n4, n3, B[4:0]}), .TC(1'b0), .PRODUCT({N126, N125, N124, N123, 
        N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111}) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(N205), .CK(CLK), .RN(RST), .Q(ALU_OUT[15])
         );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(N204), .CK(CLK), .RN(RST), .Q(ALU_OUT[14])
         );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(N203), .CK(CLK), .RN(RST), .Q(ALU_OUT[13])
         );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(N202), .CK(CLK), .RN(RST), .Q(ALU_OUT[12])
         );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(N201), .CK(CLK), .RN(RST), .Q(ALU_OUT[11])
         );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(N200), .CK(CLK), .RN(RST), .Q(ALU_OUT[10])
         );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(N199), .CK(CLK), .RN(RST), .Q(ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(N198), .CK(CLK), .RN(RST), .Q(ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(N197), .CK(CLK), .RN(RST), .Q(ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(N196), .CK(CLK), .RN(RST), .Q(ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(N195), .CK(CLK), .RN(RST), .Q(ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(N194), .CK(CLK), .RN(RST), .Q(ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(N193), .CK(CLK), .RN(RST), .Q(ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(N192), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(N191), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(N190), .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  BUFX2M U3 ( .A(A[7]), .Y(n13) );
  BUFX2M U4 ( .A(A[6]), .Y(n12) );
  OAI2BB1X2M U5 ( .A0N(N126), .A1N(n33), .B0(n34), .Y(N205) );
  OAI2BB1X2M U8 ( .A0N(N125), .A1N(n33), .B0(n34), .Y(N204) );
  OAI2BB1X2M U9 ( .A0N(N123), .A1N(n33), .B0(n34), .Y(N202) );
  OAI2BB1X2M U10 ( .A0N(N124), .A1N(n33), .B0(n34), .Y(N203) );
  OAI2BB1X2M U11 ( .A0N(N121), .A1N(n33), .B0(n34), .Y(N200) );
  OAI2BB1X2M U12 ( .A0N(N122), .A1N(n33), .B0(n34), .Y(N201) );
  OAI2BB1X2M U13 ( .A0N(N120), .A1N(n33), .B0(n34), .Y(N199) );
  OAI21X2M U14 ( .A0(n113), .A1(n99), .B0(n114), .Y(n43) );
  OAI21X2M U15 ( .A0(n115), .A1(n112), .B0(n114), .Y(n52) );
  NOR2BX2M U16 ( .AN(n116), .B(n113), .Y(n42) );
  INVX2M U17 ( .A(n54), .Y(n148) );
  OR2X2M U18 ( .A(n35), .B(n147), .Y(n34) );
  BUFX2M U19 ( .A(n41), .Y(n15) );
  NOR2X2M U20 ( .A(n99), .B(n115), .Y(n41) );
  BUFX2M U21 ( .A(n53), .Y(n16) );
  NOR2X2M U22 ( .A(n112), .B(n113), .Y(n53) );
  INVX2M U23 ( .A(n112), .Y(n150) );
  NOR2BX2M U24 ( .AN(n116), .B(n115), .Y(n39) );
  NOR2BX2M U25 ( .AN(n36), .B(n147), .Y(n33) );
  NOR4X1M U26 ( .A(n109), .B(n151), .C(ALU_FUN[2]), .D(ALU_FUN[0]), .Y(n106)
         );
  NAND2X2M U27 ( .A(N171), .B(n14), .Y(n109) );
  NAND3BX2M U28 ( .AN(n99), .B(n14), .C(n149), .Y(n54) );
  NOR3X2M U29 ( .A(n151), .B(ALU_FUN[2]), .C(n113), .Y(n55) );
  NOR3BX2M U30 ( .AN(n40), .B(n15), .C(n134), .Y(n35) );
  AOI21X2M U31 ( .A0(N110), .A1(n42), .B0(n43), .Y(n40) );
  OAI22X1M U32 ( .A0(n61), .A1(n142), .B0(n54), .B1(n145), .Y(n89) );
  OAI22X1M U33 ( .A0(n61), .A1(n141), .B0(n54), .B1(n143), .Y(n82) );
  OAI22X1M U34 ( .A0(n140), .A1(n61), .B0(n54), .B1(n142), .Y(n75) );
  OAI22X1M U35 ( .A0(n139), .A1(n61), .B0(n54), .B1(n141), .Y(n68) );
  OAI22X1M U36 ( .A0(n138), .A1(n61), .B0(n54), .B1(n140), .Y(n60) );
  NOR2X2M U37 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n116) );
  NAND3X2M U38 ( .A(n14), .B(ALU_FUN[0]), .C(n150), .Y(n61) );
  NAND2X2M U39 ( .A(ALU_FUN[2]), .B(n151), .Y(n112) );
  AND3X2M U40 ( .A(n116), .B(n149), .C(n14), .Y(n51) );
  NAND2X2M U41 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n99) );
  INVX2M U42 ( .A(ALU_FUN[1]), .Y(n151) );
  AND4X2M U43 ( .A(N173), .B(n150), .C(n14), .D(n149), .Y(n97) );
  OR2X2M U44 ( .A(n14), .B(n149), .Y(n113) );
  OR2X2M U45 ( .A(n14), .B(ALU_FUN[0]), .Y(n115) );
  INVX2M U46 ( .A(ALU_FUN[0]), .Y(n149) );
  NAND3X2M U47 ( .A(n116), .B(ALU_FUN[0]), .C(n14), .Y(n114) );
  NOR3X2M U48 ( .A(n115), .B(ALU_FUN[2]), .C(n151), .Y(n36) );
  INVX2M U49 ( .A(EN), .Y(n147) );
  AOI31X2M U50 ( .A0(n102), .A1(n103), .A2(n104), .B0(n147), .Y(N190) );
  AOI222X1M U51 ( .A0(N93), .A1(n39), .B0(N111), .B1(n36), .C0(N102), .C1(n42), 
        .Y(n102) );
  NOR4X1M U52 ( .A(n105), .B(n106), .C(n134), .D(n97), .Y(n104) );
  AOI222X1M U53 ( .A0(N130), .A1(n55), .B0(n15), .B1(n146), .C0(n6), .C1(n16), 
        .Y(n103) );
  AOI31X2M U54 ( .A0(n92), .A1(n93), .A2(n94), .B0(n147), .Y(N191) );
  AOI222X1M U55 ( .A0(N94), .A1(n39), .B0(N112), .B1(n36), .C0(N103), .C1(n42), 
        .Y(n92) );
  NOR4BX1M U56 ( .AN(n95), .B(n96), .C(n134), .D(n97), .Y(n94) );
  AOI222X1M U57 ( .A0(N131), .A1(n55), .B0(n15), .B1(n145), .C0(n7), .C1(n16), 
        .Y(n93) );
  AOI31X2M U58 ( .A0(n85), .A1(n86), .A2(n87), .B0(n147), .Y(N192) );
  AOI22X1M U59 ( .A0(N104), .A1(n42), .B0(N95), .B1(n39), .Y(n85) );
  AOI211X2M U60 ( .A0(n15), .A1(n143), .B0(n88), .C0(n89), .Y(n87) );
  AOI222X1M U61 ( .A0(N113), .A1(n36), .B0(n8), .B1(n16), .C0(N132), .C1(n55), 
        .Y(n86) );
  AOI31X2M U62 ( .A0(n78), .A1(n79), .A2(n80), .B0(n147), .Y(N193) );
  AOI22X1M U63 ( .A0(N105), .A1(n42), .B0(N96), .B1(n39), .Y(n78) );
  AOI211X2M U64 ( .A0(n15), .A1(n142), .B0(n81), .C0(n82), .Y(n80) );
  AOI222X1M U65 ( .A0(N114), .A1(n36), .B0(n9), .B1(n16), .C0(N133), .C1(n55), 
        .Y(n79) );
  AOI31X2M U66 ( .A0(n71), .A1(n72), .A2(n73), .B0(n147), .Y(N194) );
  AOI22X1M U67 ( .A0(N106), .A1(n42), .B0(N97), .B1(n39), .Y(n71) );
  AOI211X2M U68 ( .A0(n15), .A1(n141), .B0(n74), .C0(n75), .Y(n73) );
  AOI222X1M U69 ( .A0(N115), .A1(n36), .B0(n10), .B1(n16), .C0(N134), .C1(n55), 
        .Y(n72) );
  AOI31X2M U70 ( .A0(n35), .A1(n37), .A2(n38), .B0(n147), .Y(N198) );
  NAND2X2M U71 ( .A(N101), .B(n39), .Y(n37) );
  AOI22X1M U72 ( .A0(n13), .A1(n148), .B0(N119), .B1(n36), .Y(n38) );
  AOI31X2M U73 ( .A0(n64), .A1(n65), .A2(n66), .B0(n147), .Y(N195) );
  AOI22X1M U74 ( .A0(N107), .A1(n42), .B0(N98), .B1(n39), .Y(n64) );
  AOI211X2M U75 ( .A0(n15), .A1(n140), .B0(n67), .C0(n68), .Y(n66) );
  AOI222X1M U76 ( .A0(N116), .A1(n36), .B0(n11), .B1(n16), .C0(N135), .C1(n55), 
        .Y(n65) );
  AOI31X2M U77 ( .A0(n56), .A1(n57), .A2(n58), .B0(n147), .Y(N196) );
  AOI22X1M U78 ( .A0(N108), .A1(n42), .B0(N99), .B1(n39), .Y(n56) );
  AOI211X2M U79 ( .A0(n15), .A1(n139), .B0(n59), .C0(n60), .Y(n58) );
  AOI222X1M U80 ( .A0(N117), .A1(n36), .B0(n16), .B1(n12), .C0(N136), .C1(n55), 
        .Y(n57) );
  AOI31X2M U81 ( .A0(n44), .A1(n45), .A2(n46), .B0(n147), .Y(N197) );
  AOI22X1M U82 ( .A0(N109), .A1(n42), .B0(N100), .B1(n39), .Y(n44) );
  AOI221XLM U83 ( .A0(n12), .A1(n148), .B0(n15), .B1(n138), .C0(n47), .Y(n46)
         );
  AOI222X1M U84 ( .A0(N118), .A1(n36), .B0(n16), .B1(n13), .C0(N137), .C1(n55), 
        .Y(n45) );
  INVX2M U85 ( .A(n4), .Y(n132) );
  AOI221XLM U86 ( .A0(n145), .A1(n43), .B0(n51), .B1(n7), .C0(n15), .Y(n101)
         );
  OAI222X1M U87 ( .A0(n54), .A1(n146), .B0(n98), .B1(n137), .C0(n61), .C1(n143), .Y(n96) );
  AOI221XLM U88 ( .A0(n51), .A1(n145), .B0(n7), .B1(n52), .C0(n16), .Y(n98) );
  OAI221X1M U89 ( .A0(n5), .A1(n48), .B0(n49), .B1(n133), .C0(n50), .Y(n47) );
  INVX2M U90 ( .A(n5), .Y(n133) );
  AOI221XLM U91 ( .A0(n51), .A1(n13), .B0(n43), .B1(n138), .C0(n15), .Y(n48)
         );
  AOI221XLM U92 ( .A0(n51), .A1(n138), .B0(n13), .B1(n52), .C0(n16), .Y(n49)
         );
  OAI221X1M U93 ( .A0(n3), .A1(n69), .B0(n70), .B1(n135), .C0(n50), .Y(n67) );
  INVX2M U94 ( .A(n3), .Y(n135) );
  AOI221XLM U95 ( .A0(n11), .A1(n51), .B0(n43), .B1(n140), .C0(n15), .Y(n69)
         );
  AOI221XLM U96 ( .A0(n51), .A1(n140), .B0(n11), .B1(n52), .C0(n16), .Y(n70)
         );
  OAI221X1M U97 ( .A0(n4), .A1(n62), .B0(n63), .B1(n132), .C0(n50), .Y(n59) );
  AOI221XLM U98 ( .A0(n12), .A1(n51), .B0(n43), .B1(n139), .C0(n15), .Y(n62)
         );
  AOI221XLM U99 ( .A0(n51), .A1(n139), .B0(n12), .B1(n52), .C0(n16), .Y(n63)
         );
  AOI32X1M U100 ( .A0(N172), .A1(n14), .A2(n100), .B0(n144), .B1(n137), .Y(n95) );
  NOR3X2M U101 ( .A(n149), .B(ALU_FUN[2]), .C(n151), .Y(n100) );
  INVX2M U102 ( .A(n101), .Y(n144) );
  INVX2M U103 ( .A(n50), .Y(n134) );
  BUFX2M U104 ( .A(ALU_FUN[3]), .Y(n14) );
  INVX2M U105 ( .A(n11), .Y(n140) );
  INVX2M U106 ( .A(n9), .Y(n142) );
  INVX2M U107 ( .A(n10), .Y(n141) );
  INVX2M U108 ( .A(n7), .Y(n145) );
  INVX2M U109 ( .A(n8), .Y(n143) );
  INVX2M U110 ( .A(n12), .Y(n139) );
  INVX2M U111 ( .A(n13), .Y(n138) );
  INVX2M U112 ( .A(n6), .Y(n146) );
  BUFX2M U113 ( .A(B[6]), .Y(n4) );
  BUFX2M U114 ( .A(B[7]), .Y(n5) );
  BUFX2M U115 ( .A(B[5]), .Y(n3) );
  BUFX2M U116 ( .A(A[5]), .Y(n11) );
  BUFX2M U117 ( .A(A[4]), .Y(n10) );
  BUFX2M U118 ( .A(A[3]), .Y(n9) );
  BUFX2M U119 ( .A(A[2]), .Y(n8) );
  BUFX2M U120 ( .A(A[1]), .Y(n7) );
  BUFX2M U121 ( .A(A[0]), .Y(n6) );
  OAI222X1M U122 ( .A0(n110), .A1(n127), .B0(B[0]), .B1(n111), .C0(n61), .C1(
        n145), .Y(n105) );
  AOI221XLM U123 ( .A0(n51), .A1(n146), .B0(n6), .B1(n52), .C0(n16), .Y(n110)
         );
  AOI221XLM U124 ( .A0(n6), .A1(n51), .B0(n43), .B1(n146), .C0(n15), .Y(n111)
         );
  OAI221X1M U125 ( .A0(B[2]), .A1(n90), .B0(n91), .B1(n129), .C0(n50), .Y(n88)
         );
  AOI221XLM U126 ( .A0(n8), .A1(n51), .B0(n43), .B1(n143), .C0(n15), .Y(n90)
         );
  AOI221XLM U127 ( .A0(n51), .A1(n143), .B0(n8), .B1(n52), .C0(n16), .Y(n91)
         );
  OAI221X1M U128 ( .A0(B[3]), .A1(n83), .B0(n84), .B1(n131), .C0(n50), .Y(n81)
         );
  AOI221XLM U129 ( .A0(n9), .A1(n51), .B0(n43), .B1(n142), .C0(n15), .Y(n83)
         );
  AOI221XLM U130 ( .A0(n51), .A1(n142), .B0(n9), .B1(n52), .C0(n16), .Y(n84)
         );
  OAI221X1M U131 ( .A0(B[4]), .A1(n76), .B0(n77), .B1(n136), .C0(n50), .Y(n74)
         );
  AOI221XLM U132 ( .A0(n10), .A1(n51), .B0(n43), .B1(n141), .C0(n15), .Y(n76)
         );
  AOI221XLM U133 ( .A0(n51), .A1(n141), .B0(n10), .B1(n52), .C0(n16), .Y(n77)
         );
  INVX2M U134 ( .A(n17), .Y(n128) );
  NAND4X2M U135 ( .A(n131), .B(n136), .C(n107), .D(n108), .Y(n50) );
  NOR3X2M U136 ( .A(n3), .B(n5), .C(n4), .Y(n107) );
  NOR4BX1M U137 ( .AN(n55), .B(B[2]), .C(B[1]), .D(B[0]), .Y(n108) );
  INVX2M U138 ( .A(n28), .Y(n130) );
  INVX2M U139 ( .A(B[0]), .Y(n127) );
  INVX2M U140 ( .A(B[2]), .Y(n129) );
  INVX2M U141 ( .A(B[3]), .Y(n131) );
  INVX2M U142 ( .A(B[4]), .Y(n136) );
  INVX2M U143 ( .A(B[1]), .Y(n137) );
  NOR2X1M U144 ( .A(n138), .B(n5), .Y(n123) );
  NAND2BX1M U145 ( .AN(B[4]), .B(n10), .Y(n32) );
  NAND2BX1M U146 ( .AN(n10), .B(B[4]), .Y(n21) );
  CLKNAND2X2M U147 ( .A(n32), .B(n21), .Y(n118) );
  NOR2X1M U148 ( .A(n131), .B(n9), .Y(n29) );
  NOR2X1M U149 ( .A(n129), .B(n8), .Y(n20) );
  NOR2X1M U150 ( .A(n127), .B(n6), .Y(n17) );
  CLKNAND2X2M U151 ( .A(n8), .B(n129), .Y(n31) );
  NAND2BX1M U152 ( .AN(n20), .B(n31), .Y(n26) );
  AOI21X1M U153 ( .A0(n17), .A1(n145), .B0(B[1]), .Y(n18) );
  AOI211X1M U154 ( .A0(n7), .A1(n128), .B0(n26), .C0(n18), .Y(n19) );
  CLKNAND2X2M U155 ( .A(n9), .B(n131), .Y(n30) );
  OAI31X1M U156 ( .A0(n29), .A1(n20), .A2(n19), .B0(n30), .Y(n22) );
  NAND2BX1M U157 ( .AN(n11), .B(n3), .Y(n121) );
  OAI211X1M U158 ( .A0(n118), .A1(n22), .B0(n21), .C0(n121), .Y(n23) );
  NAND2BX1M U159 ( .AN(n3), .B(n11), .Y(n117) );
  XNOR2X1M U160 ( .A(n12), .B(n4), .Y(n120) );
  AOI32X1M U161 ( .A0(n23), .A1(n117), .A2(n120), .B0(n4), .B1(n139), .Y(n24)
         );
  CLKNAND2X2M U162 ( .A(n5), .B(n138), .Y(n124) );
  OAI21X1M U163 ( .A0(n123), .A1(n24), .B0(n124), .Y(N173) );
  CLKNAND2X2M U164 ( .A(n6), .B(n127), .Y(n27) );
  OA21X1M U165 ( .A0(n27), .A1(n145), .B0(B[1]), .Y(n25) );
  AOI211X1M U166 ( .A0(n27), .A1(n145), .B0(n26), .C0(n25), .Y(n28) );
  AOI31X1M U167 ( .A0(n130), .A1(n31), .A2(n30), .B0(n29), .Y(n119) );
  OAI2B11X1M U168 ( .A1N(n119), .A0(n118), .B0(n117), .C0(n32), .Y(n122) );
  AOI32X1M U169 ( .A0(n122), .A1(n121), .A2(n120), .B0(n12), .B1(n132), .Y(
        n125) );
  AOI2B1X1M U170 ( .A1N(n125), .A0(n124), .B0(n123), .Y(n126) );
  CLKINVX1M U171 ( .A(n126), .Y(N172) );
  NOR2X1M U172 ( .A(N173), .B(N172), .Y(N171) );
endmodule


module CLK_GATE ( CLK, CLK_EN, GATED_CLK );
  input CLK, CLK_EN;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, REF_CLK, UART_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, REF_CLK, UART_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_UART_RST, SYNC_REF_RST, UART_RX_V_OUT, UART_RX_V_SYNC,
         UART_TX_VLD, UART_TX_CLK, UART_TX_Busy_PULSE, FIFO_FULL,
         UART_TX_V_SYNC, UART_TX_Busy, UART_RX_CLK, ALU_OUT_VLD, RF_RdData_VLD,
         RF_WrEn, RF_RdEn, ALU_EN, CLKG_EN, ALU_CLK, n1, n2, n3, n4, n5, n6,
         n7, n8;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_SYNC;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_Config;
  wire   [3:0] DIV_RATIO_RX;
  wire   [7:0] RF_RdData;
  wire   [15:0] ALU_OUT;
  wire   [3:0] ALU_FUN;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;

  RST_SYNC_NUM_STAGES2_0 U0_RST_SYNC ( .CLK(UART_CLK), .RST(RST_N), .SYNC_RST(
        SYNC_UART_RST) );
  RST_SYNC_NUM_STAGES2_1 U1_RST_SYNC ( .CLK(REF_CLK), .RST(RST_N), .SYNC_RST(
        SYNC_REF_RST) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 U0_ref_Data_sync ( .CLK(REF_CLK), .RST(n5), 
        .BUS_EN(UART_RX_V_OUT), .unsync_bus(UART_RX_OUT), .sync_bus(
        UART_RX_SYNC), .enable_pulse(UART_RX_V_SYNC) );
  ASYNC_FIFO_TOP_DATA_WIDTH8_DEPTH8 U0_ASYNC_FIFO ( .W_CLK(REF_CLK), .W_RST(n5), .W_INC(UART_TX_VLD), .R_CLK(UART_TX_CLK), .R_RST(n7), .R_INC(
        UART_TX_Busy_PULSE), .WR_DATA(UART_TX_IN), .RD_DATA(UART_TX_SYNC), 
        .FULL(FIFO_FULL), .EMPTY(UART_TX_V_SYNC) );
  PULSE_GEN_0 U0_PULSE_GEN ( .CLK(UART_TX_CLK), .RST(n7), .LVL_SIG(
        UART_TX_Busy), .PULSE_SIG(UART_TX_Busy_PULSE) );
  Clk_Divider_0 U0_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(n7), .i_clk_en(1'b1), .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT(DIV_RATIO_RX) );
  Clk_Divider_1 U1_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(n7), .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX}), .o_div_clk(UART_RX_CLK) );
  UART_TOP U0_UART ( .TX_CLK(UART_TX_CLK), .RX_CLK(UART_RX_CLK), .RST(n7), 
        .PAR_TYP(UART_Config[1]), .PAR_EN(UART_Config[0]), .Prescale(
        UART_Config[7:2]), .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n1), .RX_IN_S(n2), 
        .TX_OUT_S(UART_TX_O), .TX_OUT_V(UART_TX_Busy), .RX_OUT_P(UART_RX_OUT), 
        .RX_OUT_V(UART_RX_V_OUT), .parity_error(parity_error), .stop_error(
        framing_error) );
  SYS_CTRL U0_SYS_CTRL ( .CLK(REF_CLK), .RST(n5), .ALU_Valid(ALU_OUT_VLD), 
        .Rd_Data_Valid(RF_RdData_VLD), .RX_ENABLE(UART_RX_V_SYNC), .FIFO_FULL(
        FIFO_FULL), .Rd_Data(RF_RdData), .RX_P_DATA(UART_RX_SYNC), .ALU_OUT(
        ALU_OUT), .Wr_En(RF_WrEn), .Rd_En(RF_RdEn), .ALU_EN(ALU_EN), .CLK_EN(
        CLKG_EN), .TX_D_VLD(UART_TX_VLD), .ALU_FUN(ALU_FUN), .Address(
        RF_Address), .Wr_Data(RF_WrData), .TX_P_DATA(UART_TX_IN) );
  RegFile_DEPTH16_WIDTH8 U0_RegFile ( .CLK(REF_CLK), .RST(n5), .Address({
        RF_Address[3:2], n4, n3}), .WrEn(RF_WrEn), .RdEn(RF_RdEn), .WrData(
        RF_WrData), .RdData(RF_RdData), .RdValid(RF_RdData_VLD), .REG0(
        Operand_A), .REG1(Operand_B), .REG2(UART_Config), .REG3(DIV_RATIO) );
  ALU_WIDTH8 U0_ALU ( .CLK(ALU_CLK), .RST(n5), .EN(ALU_EN), .ALU_FUN(ALU_FUN), 
        .A(Operand_A), .B(Operand_B), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VLD) );
  CLK_GATE U0_CLK_GATE ( .CLK(REF_CLK), .CLK_EN(CLKG_EN), .GATED_CLK(ALU_CLK)
         );
  INVX2M U3 ( .A(UART_TX_V_SYNC), .Y(n1) );
  BUFX2M U4 ( .A(RF_Address[0]), .Y(n3) );
  BUFX2M U5 ( .A(RF_Address[1]), .Y(n4) );
  BUFX2M U6 ( .A(UART_RX_IN), .Y(n2) );
  INVX4M U7 ( .A(n6), .Y(n5) );
  INVX2M U8 ( .A(SYNC_REF_RST), .Y(n6) );
  INVX4M U9 ( .A(n8), .Y(n7) );
  INVX2M U10 ( .A(SYNC_UART_RST), .Y(n8) );
endmodule

