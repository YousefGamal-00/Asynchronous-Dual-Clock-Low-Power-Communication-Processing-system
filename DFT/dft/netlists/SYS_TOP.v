/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Sun Sep 28 23:57:13 2025
/////////////////////////////////////////////////////////////


module MUX_2X1_1 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X6M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module MUX_2X1_4 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module MUX_2X1_3 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module MUX_2X1_2 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module MUX_2X1_0 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module MUX_2X1_6 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0, n1, n2;
  assign N0 = SEL;

  MX2X2M U1 ( .A(n2), .B(IN_1), .S0(N0), .Y(OUT) );
  INVXLM U2 ( .A(IN_0), .Y(n1) );
  INVXLM U3 ( .A(n1), .Y(n2) );
endmodule


module MUX_2X1_5 ( IN_0, IN_1, SEL, OUT );
  input IN_0, IN_1, SEL;
  output OUT;
  wire   N0;
  assign N0 = SEL;

  MX2X2M U1 ( .A(IN_0), .B(IN_1), .S0(N0), .Y(OUT) );
endmodule


module RST_SYNC_NUM_STAGES2_test_0 ( CLK, RST, SYNC_RST, test_si, test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST;
  wire   \RST_reg[0] ;

  SDFFRQX2M \RST_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\RST_reg[0] ) );
  SDFFRQX1M \RST_reg_reg[1]  ( .D(\RST_reg[0] ), .SI(\RST_reg[0] ), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module RST_SYNC_NUM_STAGES2_test_1 ( CLK, RST, SYNC_RST, test_si, test_se );
  input CLK, RST, test_si, test_se;
  output SYNC_RST;
  wire   \RST_reg[0] ;

  SDFFRQX2M \RST_reg_reg[0]  ( .D(1'b1), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(\RST_reg[0] ) );
  SDFFRQX1M \RST_reg_reg[1]  ( .D(\RST_reg[0] ), .SI(\RST_reg[0] ), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module PULSE_GEN_test_1 ( CLK, RST, LVL_SIG, PULSE_SIG, test_si, test_so, 
        test_se );
  input CLK, RST, LVL_SIG, test_si, test_se;
  output PULSE_SIG, test_so;
  wire   reg_SIG_1, reg_SIG_0;
  assign test_so = reg_SIG_1;

  SDFFRQX2M reg_SIG_0_reg ( .D(LVL_SIG), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(reg_SIG_0) );
  SDFFRQX2M reg_SIG_1_reg ( .D(reg_SIG_0), .SI(reg_SIG_0), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(reg_SIG_1) );
  NOR2BX2M U5 ( .AN(reg_SIG_0), .B(reg_SIG_1), .Y(PULSE_SIG) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8_test_1 ( CLK, RST, BUS_EN, unsync_bus, 
        sync_bus, enable_pulse, test_si, test_se );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, BUS_EN, test_si, test_se;
  output enable_pulse;
  wire   Pulse_en, N5, N6, N7, N8, N9, N10, N11, N12, n13, n14;
  wire   [1:0] en_reg;

  SDFFRQX2M \sync_bus_reg[7]  ( .D(N12), .SI(sync_bus[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[7]) );
  SDFFRQX2M \sync_bus_reg[3]  ( .D(N8), .SI(sync_bus[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[3]) );
  SDFFRQX2M \sync_bus_reg[0]  ( .D(N5), .SI(enable_pulse), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[0]) );
  SDFFRQX2M enable_pulse_reg ( .D(Pulse_en), .SI(en_reg[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(enable_pulse) );
  SDFFRQX2M \sync_bus_reg[6]  ( .D(N11), .SI(sync_bus[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[6]) );
  SDFFRQX2M \sync_bus_reg[2]  ( .D(N7), .SI(sync_bus[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[2]) );
  SDFFRQX2M \sync_bus_reg[1]  ( .D(N6), .SI(sync_bus[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[1]) );
  SDFFRQX2M \sync_bus_reg[5]  ( .D(N10), .SI(sync_bus[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[5]) );
  SDFFRQX2M \sync_bus_reg[4]  ( .D(N9), .SI(sync_bus[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[4]) );
  SDFFRQX2M \en_reg_reg[0]  ( .D(BUS_EN), .SI(n14), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(en_reg[0]) );
  SDFFRQX1M \en_reg_reg[1]  ( .D(en_reg[0]), .SI(en_reg[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(en_reg[1]) );
  INVX2M U15 ( .A(Pulse_en), .Y(n13) );
  AO22X1M U16 ( .A0(unsync_bus[0]), .A1(Pulse_en), .B0(sync_bus[0]), .B1(n13), 
        .Y(N5) );
  AO22X1M U17 ( .A0(unsync_bus[1]), .A1(Pulse_en), .B0(sync_bus[1]), .B1(n13), 
        .Y(N6) );
  AO22X1M U18 ( .A0(unsync_bus[2]), .A1(Pulse_en), .B0(sync_bus[2]), .B1(n13), 
        .Y(N7) );
  AO22X1M U19 ( .A0(unsync_bus[3]), .A1(Pulse_en), .B0(sync_bus[3]), .B1(n13), 
        .Y(N8) );
  AO22X1M U20 ( .A0(unsync_bus[4]), .A1(Pulse_en), .B0(sync_bus[4]), .B1(n13), 
        .Y(N9) );
  AO22X1M U21 ( .A0(unsync_bus[5]), .A1(Pulse_en), .B0(sync_bus[5]), .B1(n13), 
        .Y(N10) );
  AO22X1M U22 ( .A0(unsync_bus[6]), .A1(Pulse_en), .B0(sync_bus[6]), .B1(n13), 
        .Y(N11) );
  AO22X1M U23 ( .A0(unsync_bus[7]), .A1(Pulse_en), .B0(sync_bus[7]), .B1(n13), 
        .Y(N12) );
  PULSE_GEN_test_1 U_PULSE_GEN ( .CLK(CLK), .RST(RST), .LVL_SIG(en_reg[1]), 
        .PULSE_SIG(Pulse_en), .test_si(test_si), .test_so(n14), .test_se(
        test_se) );
endmodule


module ASYNC_FIFO_MEM_DATA_WIDTH8_DEPTH8_test_1 ( W_CLK, W_RST, W_INC, W_FULL, 
        w_addr, r_addr, w_data, r_data, test_si, test_so, test_se );
  input [2:0] w_addr;
  input [2:0] r_addr;
  input [7:0] w_data;
  output [7:0] r_data;
  input W_CLK, W_RST, W_INC, W_FULL, test_si, test_se;
  output test_so;
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
         \FIFO_MEM[0][0] , n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n183, n184, n185, n186, n187;
  assign N10 = r_addr[0];
  assign N11 = r_addr[1];
  assign N12 = r_addr[2];
  assign test_so = \FIFO_MEM[7][7] ;

  SDFFRQX2M \FIFO_MEM_reg[5][7]  ( .D(n133), .SI(\FIFO_MEM[5][6] ), .SE(n187), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[5][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][6]  ( .D(n132), .SI(\FIFO_MEM[5][5] ), .SE(n186), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[5][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][5]  ( .D(n131), .SI(\FIFO_MEM[5][4] ), .SE(n185), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[5][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][4]  ( .D(n130), .SI(\FIFO_MEM[5][3] ), .SE(n184), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[5][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][3]  ( .D(n129), .SI(\FIFO_MEM[5][2] ), .SE(n187), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[5][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][2]  ( .D(n128), .SI(\FIFO_MEM[5][1] ), .SE(n186), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[5][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][1]  ( .D(n127), .SI(\FIFO_MEM[5][0] ), .SE(n185), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[5][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[5][0]  ( .D(n126), .SI(\FIFO_MEM[4][7] ), .SE(n184), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[5][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][7]  ( .D(n101), .SI(\FIFO_MEM[1][6] ), .SE(n187), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[1][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][6]  ( .D(n100), .SI(\FIFO_MEM[1][5] ), .SE(n186), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[1][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][5]  ( .D(n99), .SI(\FIFO_MEM[1][4] ), .SE(n185), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[1][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][4]  ( .D(n98), .SI(\FIFO_MEM[1][3] ), .SE(n184), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[1][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][3]  ( .D(n97), .SI(\FIFO_MEM[1][2] ), .SE(n187), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[1][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][2]  ( .D(n96), .SI(\FIFO_MEM[1][1] ), .SE(n186), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[1][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][1]  ( .D(n95), .SI(\FIFO_MEM[1][0] ), .SE(n185), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[1][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[1][0]  ( .D(n94), .SI(\FIFO_MEM[0][7] ), .SE(n184), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[1][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][7]  ( .D(n149), .SI(\FIFO_MEM[7][6] ), .SE(n187), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[7][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][6]  ( .D(n148), .SI(\FIFO_MEM[7][5] ), .SE(n186), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[7][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][5]  ( .D(n147), .SI(\FIFO_MEM[7][4] ), .SE(n185), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[7][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][4]  ( .D(n146), .SI(\FIFO_MEM[7][3] ), .SE(n184), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[7][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][3]  ( .D(n145), .SI(\FIFO_MEM[7][2] ), .SE(n187), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[7][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][2]  ( .D(n144), .SI(\FIFO_MEM[7][1] ), .SE(n186), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[7][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][1]  ( .D(n143), .SI(\FIFO_MEM[7][0] ), .SE(n185), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[7][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[7][0]  ( .D(n142), .SI(\FIFO_MEM[6][7] ), .SE(n184), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[7][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][7]  ( .D(n117), .SI(\FIFO_MEM[3][6] ), .SE(n187), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[3][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][6]  ( .D(n116), .SI(\FIFO_MEM[3][5] ), .SE(n186), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[3][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][5]  ( .D(n115), .SI(\FIFO_MEM[3][4] ), .SE(n185), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[3][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][4]  ( .D(n114), .SI(\FIFO_MEM[3][3] ), .SE(n184), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[3][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][3]  ( .D(n113), .SI(\FIFO_MEM[3][2] ), .SE(n187), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[3][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][2]  ( .D(n112), .SI(\FIFO_MEM[3][1] ), .SE(n186), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[3][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][1]  ( .D(n111), .SI(\FIFO_MEM[3][0] ), .SE(n185), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[3][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[3][0]  ( .D(n110), .SI(\FIFO_MEM[2][7] ), .SE(n184), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[3][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][7]  ( .D(n141), .SI(\FIFO_MEM[6][6] ), .SE(n187), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[6][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][6]  ( .D(n140), .SI(\FIFO_MEM[6][5] ), .SE(n186), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[6][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][5]  ( .D(n139), .SI(\FIFO_MEM[6][4] ), .SE(n185), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[6][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][4]  ( .D(n138), .SI(\FIFO_MEM[6][3] ), .SE(n184), 
        .CK(W_CLK), .RN(n165), .Q(\FIFO_MEM[6][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][3]  ( .D(n137), .SI(\FIFO_MEM[6][2] ), .SE(n187), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[6][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][2]  ( .D(n136), .SI(\FIFO_MEM[6][1] ), .SE(n186), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[6][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][1]  ( .D(n135), .SI(\FIFO_MEM[6][0] ), .SE(n185), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[6][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[6][0]  ( .D(n134), .SI(\FIFO_MEM[5][7] ), .SE(n184), 
        .CK(W_CLK), .RN(n166), .Q(\FIFO_MEM[6][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][7]  ( .D(n109), .SI(\FIFO_MEM[2][6] ), .SE(n187), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[2][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][6]  ( .D(n108), .SI(\FIFO_MEM[2][5] ), .SE(n186), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[2][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][5]  ( .D(n107), .SI(\FIFO_MEM[2][4] ), .SE(n185), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[2][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][4]  ( .D(n106), .SI(\FIFO_MEM[2][3] ), .SE(n184), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[2][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][3]  ( .D(n105), .SI(\FIFO_MEM[2][2] ), .SE(n187), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[2][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][2]  ( .D(n104), .SI(\FIFO_MEM[2][1] ), .SE(n186), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[2][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][1]  ( .D(n103), .SI(\FIFO_MEM[2][0] ), .SE(n185), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[2][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[2][0]  ( .D(n102), .SI(\FIFO_MEM[1][7] ), .SE(n184), 
        .CK(W_CLK), .RN(n168), .Q(\FIFO_MEM[2][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][7]  ( .D(n125), .SI(\FIFO_MEM[4][6] ), .SE(n187), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[4][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][6]  ( .D(n124), .SI(\FIFO_MEM[4][5] ), .SE(n186), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[4][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][5]  ( .D(n123), .SI(\FIFO_MEM[4][4] ), .SE(n185), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[4][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][4]  ( .D(n122), .SI(\FIFO_MEM[4][3] ), .SE(n184), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[4][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][3]  ( .D(n121), .SI(\FIFO_MEM[4][2] ), .SE(n187), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[4][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][2]  ( .D(n120), .SI(\FIFO_MEM[4][1] ), .SE(n186), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[4][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][1]  ( .D(n119), .SI(\FIFO_MEM[4][0] ), .SE(n185), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[4][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[4][0]  ( .D(n118), .SI(\FIFO_MEM[3][7] ), .SE(n184), 
        .CK(W_CLK), .RN(n167), .Q(\FIFO_MEM[4][0] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][7]  ( .D(n93), .SI(\FIFO_MEM[0][6] ), .SE(n187), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[0][7] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][6]  ( .D(n92), .SI(\FIFO_MEM[0][5] ), .SE(n186), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[0][6] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][5]  ( .D(n91), .SI(\FIFO_MEM[0][4] ), .SE(n185), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[0][5] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][4]  ( .D(n90), .SI(\FIFO_MEM[0][3] ), .SE(n184), 
        .CK(W_CLK), .RN(n169), .Q(\FIFO_MEM[0][4] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][3]  ( .D(n89), .SI(\FIFO_MEM[0][2] ), .SE(n187), 
        .CK(W_CLK), .RN(n170), .Q(\FIFO_MEM[0][3] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][2]  ( .D(n88), .SI(\FIFO_MEM[0][1] ), .SE(n186), 
        .CK(W_CLK), .RN(n170), .Q(\FIFO_MEM[0][2] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][1]  ( .D(n87), .SI(\FIFO_MEM[0][0] ), .SE(n185), 
        .CK(W_CLK), .RN(n170), .Q(\FIFO_MEM[0][1] ) );
  SDFFRQX2M \FIFO_MEM_reg[0][0]  ( .D(n86), .SI(test_si), .SE(n184), .CK(W_CLK), .RN(n170), .Q(\FIFO_MEM[0][0] ) );
  BUFX2M U66 ( .A(n77), .Y(n162) );
  BUFX2M U67 ( .A(n78), .Y(n161) );
  BUFX2M U68 ( .A(n84), .Y(n158) );
  BUFX2M U69 ( .A(n85), .Y(n157) );
  BUFX2M U70 ( .A(n83), .Y(n159) );
  BUFX2M U71 ( .A(n164), .Y(n169) );
  BUFX2M U72 ( .A(n164), .Y(n168) );
  BUFX2M U73 ( .A(n163), .Y(n167) );
  BUFX2M U74 ( .A(n163), .Y(n166) );
  BUFX2M U75 ( .A(n163), .Y(n165) );
  BUFX2M U76 ( .A(n164), .Y(n170) );
  NOR2BX2M U77 ( .AN(W_INC), .B(W_FULL), .Y(n80) );
  BUFX2M U78 ( .A(W_RST), .Y(n164) );
  BUFX2M U79 ( .A(W_RST), .Y(n163) );
  NAND3X2M U80 ( .A(n171), .B(n172), .C(n82), .Y(n81) );
  NAND3X2M U81 ( .A(n171), .B(n172), .C(n76), .Y(n75) );
  NOR2BX2M U82 ( .AN(n80), .B(w_addr[2]), .Y(n76) );
  OAI2BB2X1M U83 ( .B0(n75), .B1(n180), .A0N(\FIFO_MEM[0][0] ), .A1N(n75), .Y(
        n86) );
  OAI2BB2X1M U84 ( .B0(n75), .B1(n179), .A0N(\FIFO_MEM[0][1] ), .A1N(n75), .Y(
        n87) );
  OAI2BB2X1M U85 ( .B0(n75), .B1(n178), .A0N(\FIFO_MEM[0][2] ), .A1N(n75), .Y(
        n88) );
  OAI2BB2X1M U86 ( .B0(n75), .B1(n177), .A0N(\FIFO_MEM[0][3] ), .A1N(n75), .Y(
        n89) );
  OAI2BB2X1M U87 ( .B0(n75), .B1(n176), .A0N(\FIFO_MEM[0][4] ), .A1N(n75), .Y(
        n90) );
  OAI2BB2X1M U88 ( .B0(n75), .B1(n175), .A0N(\FIFO_MEM[0][5] ), .A1N(n75), .Y(
        n91) );
  OAI2BB2X1M U89 ( .B0(n75), .B1(n174), .A0N(\FIFO_MEM[0][6] ), .A1N(n75), .Y(
        n92) );
  OAI2BB2X1M U90 ( .B0(n75), .B1(n173), .A0N(\FIFO_MEM[0][7] ), .A1N(n75), .Y(
        n93) );
  OAI2BB2X1M U91 ( .B0(n180), .B1(n81), .A0N(\FIFO_MEM[4][0] ), .A1N(n81), .Y(
        n118) );
  OAI2BB2X1M U92 ( .B0(n179), .B1(n81), .A0N(\FIFO_MEM[4][1] ), .A1N(n81), .Y(
        n119) );
  OAI2BB2X1M U93 ( .B0(n178), .B1(n81), .A0N(\FIFO_MEM[4][2] ), .A1N(n81), .Y(
        n120) );
  OAI2BB2X1M U94 ( .B0(n177), .B1(n81), .A0N(\FIFO_MEM[4][3] ), .A1N(n81), .Y(
        n121) );
  OAI2BB2X1M U95 ( .B0(n176), .B1(n81), .A0N(\FIFO_MEM[4][4] ), .A1N(n81), .Y(
        n122) );
  OAI2BB2X1M U96 ( .B0(n175), .B1(n81), .A0N(\FIFO_MEM[4][5] ), .A1N(n81), .Y(
        n123) );
  OAI2BB2X1M U97 ( .B0(n174), .B1(n81), .A0N(\FIFO_MEM[4][6] ), .A1N(n81), .Y(
        n124) );
  OAI2BB2X1M U98 ( .B0(n173), .B1(n81), .A0N(\FIFO_MEM[4][7] ), .A1N(n81), .Y(
        n125) );
  INVX2M U99 ( .A(w_data[0]), .Y(n180) );
  INVX2M U100 ( .A(w_data[1]), .Y(n179) );
  INVX2M U101 ( .A(w_data[2]), .Y(n178) );
  INVX2M U102 ( .A(w_data[3]), .Y(n177) );
  INVX2M U103 ( .A(w_data[4]), .Y(n176) );
  INVX2M U104 ( .A(w_data[5]), .Y(n175) );
  INVX2M U105 ( .A(w_data[6]), .Y(n174) );
  INVX2M U106 ( .A(w_data[7]), .Y(n173) );
  BUFX2M U107 ( .A(n79), .Y(n160) );
  NAND3X2M U108 ( .A(w_addr[0]), .B(n76), .C(w_addr[1]), .Y(n79) );
  OAI2BB2X1M U109 ( .B0(n180), .B1(n162), .A0N(\FIFO_MEM[1][0] ), .A1N(n162), 
        .Y(n94) );
  OAI2BB2X1M U110 ( .B0(n179), .B1(n162), .A0N(\FIFO_MEM[1][1] ), .A1N(n162), 
        .Y(n95) );
  OAI2BB2X1M U111 ( .B0(n178), .B1(n162), .A0N(\FIFO_MEM[1][2] ), .A1N(n162), 
        .Y(n96) );
  OAI2BB2X1M U112 ( .B0(n177), .B1(n162), .A0N(\FIFO_MEM[1][3] ), .A1N(n162), 
        .Y(n97) );
  OAI2BB2X1M U113 ( .B0(n176), .B1(n162), .A0N(\FIFO_MEM[1][4] ), .A1N(n162), 
        .Y(n98) );
  OAI2BB2X1M U114 ( .B0(n175), .B1(n162), .A0N(\FIFO_MEM[1][5] ), .A1N(n162), 
        .Y(n99) );
  OAI2BB2X1M U115 ( .B0(n174), .B1(n162), .A0N(\FIFO_MEM[1][6] ), .A1N(n162), 
        .Y(n100) );
  OAI2BB2X1M U116 ( .B0(n173), .B1(n162), .A0N(\FIFO_MEM[1][7] ), .A1N(n162), 
        .Y(n101) );
  OAI2BB2X1M U117 ( .B0(n180), .B1(n161), .A0N(\FIFO_MEM[2][0] ), .A1N(n161), 
        .Y(n102) );
  OAI2BB2X1M U118 ( .B0(n179), .B1(n161), .A0N(\FIFO_MEM[2][1] ), .A1N(n161), 
        .Y(n103) );
  OAI2BB2X1M U119 ( .B0(n178), .B1(n161), .A0N(\FIFO_MEM[2][2] ), .A1N(n161), 
        .Y(n104) );
  OAI2BB2X1M U120 ( .B0(n177), .B1(n161), .A0N(\FIFO_MEM[2][3] ), .A1N(n161), 
        .Y(n105) );
  OAI2BB2X1M U121 ( .B0(n176), .B1(n161), .A0N(\FIFO_MEM[2][4] ), .A1N(n161), 
        .Y(n106) );
  OAI2BB2X1M U122 ( .B0(n175), .B1(n161), .A0N(\FIFO_MEM[2][5] ), .A1N(n161), 
        .Y(n107) );
  OAI2BB2X1M U123 ( .B0(n174), .B1(n161), .A0N(\FIFO_MEM[2][6] ), .A1N(n161), 
        .Y(n108) );
  OAI2BB2X1M U124 ( .B0(n173), .B1(n161), .A0N(\FIFO_MEM[2][7] ), .A1N(n161), 
        .Y(n109) );
  OAI2BB2X1M U125 ( .B0(n180), .B1(n160), .A0N(\FIFO_MEM[3][0] ), .A1N(n160), 
        .Y(n110) );
  OAI2BB2X1M U126 ( .B0(n179), .B1(n160), .A0N(\FIFO_MEM[3][1] ), .A1N(n160), 
        .Y(n111) );
  OAI2BB2X1M U127 ( .B0(n178), .B1(n160), .A0N(\FIFO_MEM[3][2] ), .A1N(n160), 
        .Y(n112) );
  OAI2BB2X1M U128 ( .B0(n177), .B1(n160), .A0N(\FIFO_MEM[3][3] ), .A1N(n160), 
        .Y(n113) );
  OAI2BB2X1M U129 ( .B0(n176), .B1(n160), .A0N(\FIFO_MEM[3][4] ), .A1N(n160), 
        .Y(n114) );
  OAI2BB2X1M U130 ( .B0(n175), .B1(n160), .A0N(\FIFO_MEM[3][5] ), .A1N(n160), 
        .Y(n115) );
  OAI2BB2X1M U131 ( .B0(n174), .B1(n160), .A0N(\FIFO_MEM[3][6] ), .A1N(n160), 
        .Y(n116) );
  OAI2BB2X1M U132 ( .B0(n173), .B1(n160), .A0N(\FIFO_MEM[3][7] ), .A1N(n160), 
        .Y(n117) );
  OAI2BB2X1M U133 ( .B0(n180), .B1(n159), .A0N(\FIFO_MEM[5][0] ), .A1N(n159), 
        .Y(n126) );
  OAI2BB2X1M U134 ( .B0(n179), .B1(n159), .A0N(\FIFO_MEM[5][1] ), .A1N(n159), 
        .Y(n127) );
  OAI2BB2X1M U135 ( .B0(n178), .B1(n159), .A0N(\FIFO_MEM[5][2] ), .A1N(n159), 
        .Y(n128) );
  OAI2BB2X1M U136 ( .B0(n177), .B1(n159), .A0N(\FIFO_MEM[5][3] ), .A1N(n159), 
        .Y(n129) );
  OAI2BB2X1M U137 ( .B0(n176), .B1(n159), .A0N(\FIFO_MEM[5][4] ), .A1N(n159), 
        .Y(n130) );
  OAI2BB2X1M U138 ( .B0(n175), .B1(n159), .A0N(\FIFO_MEM[5][5] ), .A1N(n159), 
        .Y(n131) );
  OAI2BB2X1M U139 ( .B0(n174), .B1(n159), .A0N(\FIFO_MEM[5][6] ), .A1N(n159), 
        .Y(n132) );
  OAI2BB2X1M U140 ( .B0(n173), .B1(n159), .A0N(\FIFO_MEM[5][7] ), .A1N(n159), 
        .Y(n133) );
  OAI2BB2X1M U141 ( .B0(n180), .B1(n158), .A0N(\FIFO_MEM[6][0] ), .A1N(n158), 
        .Y(n134) );
  OAI2BB2X1M U142 ( .B0(n179), .B1(n158), .A0N(\FIFO_MEM[6][1] ), .A1N(n158), 
        .Y(n135) );
  OAI2BB2X1M U143 ( .B0(n178), .B1(n158), .A0N(\FIFO_MEM[6][2] ), .A1N(n158), 
        .Y(n136) );
  OAI2BB2X1M U144 ( .B0(n177), .B1(n158), .A0N(\FIFO_MEM[6][3] ), .A1N(n158), 
        .Y(n137) );
  OAI2BB2X1M U145 ( .B0(n176), .B1(n158), .A0N(\FIFO_MEM[6][4] ), .A1N(n158), 
        .Y(n138) );
  OAI2BB2X1M U146 ( .B0(n175), .B1(n158), .A0N(\FIFO_MEM[6][5] ), .A1N(n158), 
        .Y(n139) );
  OAI2BB2X1M U147 ( .B0(n174), .B1(n158), .A0N(\FIFO_MEM[6][6] ), .A1N(n158), 
        .Y(n140) );
  OAI2BB2X1M U148 ( .B0(n173), .B1(n158), .A0N(\FIFO_MEM[6][7] ), .A1N(n158), 
        .Y(n141) );
  OAI2BB2X1M U149 ( .B0(n180), .B1(n157), .A0N(\FIFO_MEM[7][0] ), .A1N(n157), 
        .Y(n142) );
  OAI2BB2X1M U150 ( .B0(n179), .B1(n157), .A0N(\FIFO_MEM[7][1] ), .A1N(n157), 
        .Y(n143) );
  OAI2BB2X1M U151 ( .B0(n178), .B1(n157), .A0N(\FIFO_MEM[7][2] ), .A1N(n157), 
        .Y(n144) );
  OAI2BB2X1M U152 ( .B0(n177), .B1(n157), .A0N(\FIFO_MEM[7][3] ), .A1N(n157), 
        .Y(n145) );
  OAI2BB2X1M U153 ( .B0(n176), .B1(n157), .A0N(\FIFO_MEM[7][4] ), .A1N(n157), 
        .Y(n146) );
  OAI2BB2X1M U154 ( .B0(n175), .B1(n157), .A0N(\FIFO_MEM[7][5] ), .A1N(n157), 
        .Y(n147) );
  OAI2BB2X1M U155 ( .B0(n174), .B1(n157), .A0N(\FIFO_MEM[7][6] ), .A1N(n157), 
        .Y(n148) );
  OAI2BB2X1M U156 ( .B0(n173), .B1(n157), .A0N(\FIFO_MEM[7][7] ), .A1N(n157), 
        .Y(n149) );
  AND2X2M U157 ( .A(w_addr[2]), .B(n80), .Y(n82) );
  NAND3X2M U158 ( .A(n76), .B(n172), .C(w_addr[0]), .Y(n77) );
  NAND3X2M U159 ( .A(n76), .B(n171), .C(w_addr[1]), .Y(n78) );
  NAND3X2M U160 ( .A(w_addr[1]), .B(w_addr[0]), .C(n82), .Y(n85) );
  NAND3X2M U161 ( .A(w_addr[0]), .B(n172), .C(n82), .Y(n83) );
  NAND3X2M U162 ( .A(w_addr[1]), .B(n171), .C(n82), .Y(n84) );
  INVX2M U163 ( .A(w_addr[0]), .Y(n171) );
  INVX2M U164 ( .A(w_addr[1]), .Y(n172) );
  BUFX4M U165 ( .A(N10), .Y(n156) );
  MX2X2M U166 ( .A(n153), .B(n152), .S0(N12), .Y(r_data[6]) );
  MX4X1M U167 ( .A(\FIFO_MEM[4][6] ), .B(\FIFO_MEM[5][6] ), .C(
        \FIFO_MEM[6][6] ), .D(\FIFO_MEM[7][6] ), .S0(n156), .S1(N11), .Y(n152)
         );
  MX4X1M U168 ( .A(\FIFO_MEM[0][6] ), .B(\FIFO_MEM[1][6] ), .C(
        \FIFO_MEM[2][6] ), .D(\FIFO_MEM[3][6] ), .S0(n156), .S1(N11), .Y(n153)
         );
  MX2X2M U169 ( .A(n74), .B(n73), .S0(N12), .Y(r_data[4]) );
  MX4X1M U170 ( .A(\FIFO_MEM[4][4] ), .B(\FIFO_MEM[5][4] ), .C(
        \FIFO_MEM[6][4] ), .D(\FIFO_MEM[7][4] ), .S0(n156), .S1(N11), .Y(n73)
         );
  MX4X1M U171 ( .A(\FIFO_MEM[0][4] ), .B(\FIFO_MEM[1][4] ), .C(
        \FIFO_MEM[2][4] ), .D(\FIFO_MEM[3][4] ), .S0(n156), .S1(N11), .Y(n74)
         );
  MX2X2M U172 ( .A(n66), .B(n65), .S0(N12), .Y(r_data[0]) );
  MX4X1M U173 ( .A(\FIFO_MEM[4][0] ), .B(\FIFO_MEM[5][0] ), .C(
        \FIFO_MEM[6][0] ), .D(\FIFO_MEM[7][0] ), .S0(n156), .S1(N11), .Y(n65)
         );
  MX4X1M U174 ( .A(\FIFO_MEM[0][0] ), .B(\FIFO_MEM[1][0] ), .C(
        \FIFO_MEM[2][0] ), .D(\FIFO_MEM[3][0] ), .S0(n156), .S1(N11), .Y(n66)
         );
  MX2X2M U175 ( .A(n155), .B(n154), .S0(N12), .Y(r_data[7]) );
  MX4X1M U176 ( .A(\FIFO_MEM[4][7] ), .B(\FIFO_MEM[5][7] ), .C(
        \FIFO_MEM[6][7] ), .D(\FIFO_MEM[7][7] ), .S0(n156), .S1(N11), .Y(n154)
         );
  MX4X1M U177 ( .A(\FIFO_MEM[0][7] ), .B(\FIFO_MEM[1][7] ), .C(
        \FIFO_MEM[2][7] ), .D(\FIFO_MEM[3][7] ), .S0(n156), .S1(N11), .Y(n155)
         );
  MX2X2M U178 ( .A(n151), .B(n150), .S0(N12), .Y(r_data[5]) );
  MX4X1M U179 ( .A(\FIFO_MEM[4][5] ), .B(\FIFO_MEM[5][5] ), .C(
        \FIFO_MEM[6][5] ), .D(\FIFO_MEM[7][5] ), .S0(n156), .S1(N11), .Y(n150)
         );
  MX4X1M U180 ( .A(\FIFO_MEM[0][5] ), .B(\FIFO_MEM[1][5] ), .C(
        \FIFO_MEM[2][5] ), .D(\FIFO_MEM[3][5] ), .S0(n156), .S1(N11), .Y(n151)
         );
  MX2X2M U181 ( .A(n68), .B(n67), .S0(N12), .Y(r_data[1]) );
  MX4X1M U182 ( .A(\FIFO_MEM[4][1] ), .B(\FIFO_MEM[5][1] ), .C(
        \FIFO_MEM[6][1] ), .D(\FIFO_MEM[7][1] ), .S0(n156), .S1(N11), .Y(n67)
         );
  MX4X1M U183 ( .A(\FIFO_MEM[0][1] ), .B(\FIFO_MEM[1][1] ), .C(
        \FIFO_MEM[2][1] ), .D(\FIFO_MEM[3][1] ), .S0(n156), .S1(N11), .Y(n68)
         );
  MX2X2M U184 ( .A(n70), .B(n69), .S0(N12), .Y(r_data[2]) );
  MX4X1M U185 ( .A(\FIFO_MEM[4][2] ), .B(\FIFO_MEM[5][2] ), .C(
        \FIFO_MEM[6][2] ), .D(\FIFO_MEM[7][2] ), .S0(n156), .S1(N11), .Y(n69)
         );
  MX4X1M U186 ( .A(\FIFO_MEM[0][2] ), .B(\FIFO_MEM[1][2] ), .C(
        \FIFO_MEM[2][2] ), .D(\FIFO_MEM[3][2] ), .S0(n156), .S1(N11), .Y(n70)
         );
  MX2X2M U187 ( .A(n72), .B(n71), .S0(N12), .Y(r_data[3]) );
  MX4X1M U188 ( .A(\FIFO_MEM[4][3] ), .B(\FIFO_MEM[5][3] ), .C(
        \FIFO_MEM[6][3] ), .D(\FIFO_MEM[7][3] ), .S0(n156), .S1(N11), .Y(n71)
         );
  MX4X1M U189 ( .A(\FIFO_MEM[0][3] ), .B(\FIFO_MEM[1][3] ), .C(
        \FIFO_MEM[2][3] ), .D(\FIFO_MEM[3][3] ), .S0(n156), .S1(N11), .Y(n72)
         );
  INVXLM U190 ( .A(test_se), .Y(n183) );
  INVXLM U191 ( .A(n183), .Y(n184) );
  INVXLM U192 ( .A(n183), .Y(n185) );
  INVXLM U193 ( .A(n183), .Y(n186) );
  INVXLM U194 ( .A(n183), .Y(n187) );
endmodule


module ASYNC_FIFO_BIT_SYNC_B_WIDTH3_STAGES2_test_1 ( CLK, RST, ASYNC, SYNC, 
        test_si, test_se );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST, test_si, test_se;
  wire   \SYNC_reg[3][0] , \SYNC_reg[2][0] , \SYNC_reg[1][0] ,
         \SYNC_reg[0][0] ;

  SDFFRQX2M \SYNC_reg_reg[2][1]  ( .D(\SYNC_reg[2][0] ), .SI(\SYNC_reg[2][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[2]) );
  SDFFRQX2M \SYNC_reg_reg[1][1]  ( .D(\SYNC_reg[1][0] ), .SI(\SYNC_reg[1][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[1]) );
  SDFFRQX2M \SYNC_reg_reg[0][1]  ( .D(\SYNC_reg[0][0] ), .SI(\SYNC_reg[0][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[0]) );
  SDFFRQX2M \SYNC_reg_reg[3][0]  ( .D(ASYNC[3]), .SI(SYNC[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\SYNC_reg[3][0] ) );
  SDFFRQX2M \SYNC_reg_reg[2][0]  ( .D(ASYNC[2]), .SI(SYNC[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\SYNC_reg[2][0] ) );
  SDFFRQX2M \SYNC_reg_reg[1][0]  ( .D(ASYNC[1]), .SI(SYNC[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\SYNC_reg[1][0] ) );
  SDFFRQX2M \SYNC_reg_reg[0][0]  ( .D(ASYNC[0]), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\SYNC_reg[0][0] ) );
  SDFFRQX1M \SYNC_reg_reg[3][1]  ( .D(\SYNC_reg[3][0] ), .SI(\SYNC_reg[3][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[3]) );
endmodule


module ASYNC_FIFO_BIT_SYNC_B_WIDTH3_STAGES2_test_0 ( CLK, RST, ASYNC, SYNC, 
        test_si, test_se );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST, test_si, test_se;
  wire   \SYNC_reg[3][0] , \SYNC_reg[2][0] , \SYNC_reg[1][0] ,
         \SYNC_reg[0][0] ;

  SDFFRQX2M \SYNC_reg_reg[1][1]  ( .D(\SYNC_reg[1][0] ), .SI(\SYNC_reg[1][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[1]) );
  SDFFRQX2M \SYNC_reg_reg[0][1]  ( .D(\SYNC_reg[0][0] ), .SI(\SYNC_reg[0][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[0]) );
  SDFFRQX2M \SYNC_reg_reg[3][1]  ( .D(\SYNC_reg[3][0] ), .SI(\SYNC_reg[3][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[3]) );
  SDFFRQX2M \SYNC_reg_reg[2][1]  ( .D(\SYNC_reg[2][0] ), .SI(\SYNC_reg[2][0] ), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(SYNC[2]) );
  SDFFRQX2M \SYNC_reg_reg[3][0]  ( .D(ASYNC[3]), .SI(SYNC[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\SYNC_reg[3][0] ) );
  SDFFRQX2M \SYNC_reg_reg[2][0]  ( .D(ASYNC[2]), .SI(SYNC[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\SYNC_reg[2][0] ) );
  SDFFRQX2M \SYNC_reg_reg[1][0]  ( .D(ASYNC[1]), .SI(SYNC[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\SYNC_reg[1][0] ) );
  SDFFRQX2M \SYNC_reg_reg[0][0]  ( .D(ASYNC[0]), .SI(test_si), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\SYNC_reg[0][0] ) );
endmodule


module ASYNC_FIFO_WR_B_WIDTH3_test_1 ( W_CLK, W_RST, W_INC, G_rptr, G_wptr, 
        W_addr, W_FULL, test_si2, test_si1, test_so1, test_se );
  input [3:0] G_rptr;
  output [3:0] G_wptr;
  output [2:0] W_addr;
  input W_CLK, W_RST, W_INC, test_si2, test_si1, test_se;
  output W_FULL, test_so1;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;
  wire   [3:0] COMB_G_wptr;
  assign test_so1 = COMB_G_wptr[3];

  SDFFRQX2M \inter_addr_reg[3]  ( .D(n19), .SI(W_addr[2]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(COMB_G_wptr[3]) );
  SDFFRQX2M \inter_addr_reg[2]  ( .D(n20), .SI(W_addr[1]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_addr[2]) );
  SDFFRQX2M \G_wptr_reg[3]  ( .D(COMB_G_wptr[3]), .SI(G_wptr[2]), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(G_wptr[3]) );
  SDFFRQX2M \G_wptr_reg[2]  ( .D(COMB_G_wptr[2]), .SI(test_si2), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(G_wptr[2]) );
  SDFFRQX2M \G_wptr_reg[1]  ( .D(COMB_G_wptr[1]), .SI(G_wptr[0]), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(G_wptr[1]) );
  SDFFRQX2M \G_wptr_reg[0]  ( .D(COMB_G_wptr[0]), .SI(test_si1), .SE(test_se), 
        .CK(W_CLK), .RN(W_RST), .Q(G_wptr[0]) );
  SDFFRQX2M \inter_addr_reg[1]  ( .D(n21), .SI(W_addr[0]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_addr[1]) );
  SDFFRX1M \inter_addr_reg[0]  ( .D(n22), .SI(G_wptr[3]), .SE(test_se), .CK(
        W_CLK), .RN(W_RST), .Q(W_addr[0]), .QN(n9) );
  INVX2M U12 ( .A(n14), .Y(W_FULL) );
  NAND2X2M U13 ( .A(W_INC), .B(n14), .Y(n13) );
  XNOR2X2M U14 ( .A(COMB_G_wptr[1]), .B(G_rptr[1]), .Y(n15) );
  XNOR2X2M U15 ( .A(n9), .B(W_addr[1]), .Y(COMB_G_wptr[0]) );
  NAND4X2M U16 ( .A(n15), .B(n16), .C(n17), .D(n18), .Y(n14) );
  CLKXOR2X2M U17 ( .A(G_rptr[3]), .B(COMB_G_wptr[3]), .Y(n17) );
  XNOR2X2M U18 ( .A(COMB_G_wptr[0]), .B(G_rptr[0]), .Y(n16) );
  CLKXOR2X2M U19 ( .A(G_rptr[2]), .B(COMB_G_wptr[2]), .Y(n18) );
  CLKXOR2X2M U20 ( .A(COMB_G_wptr[3]), .B(W_addr[2]), .Y(COMB_G_wptr[2]) );
  CLKXOR2X2M U21 ( .A(W_addr[1]), .B(W_addr[2]), .Y(COMB_G_wptr[1]) );
  NOR2X2M U22 ( .A(n13), .B(n9), .Y(n12) );
  XNOR2X2M U23 ( .A(W_addr[2]), .B(n11), .Y(n20) );
  XNOR2X2M U24 ( .A(COMB_G_wptr[3]), .B(n10), .Y(n19) );
  NAND2BX2M U25 ( .AN(n11), .B(W_addr[2]), .Y(n10) );
  NAND2X2M U26 ( .A(n12), .B(W_addr[1]), .Y(n11) );
  CLKXOR2X2M U27 ( .A(W_addr[1]), .B(n12), .Y(n21) );
  CLKXOR2X2M U28 ( .A(n9), .B(n13), .Y(n22) );
endmodule


module ASYNC_FIFO_RD_B_WIDTH3_test_1 ( R_CLK, R_RST, R_INC, G_wptr, G_rptr, 
        R_addr, R_EMPTY, test_si, test_so, test_se );
  input [3:0] G_wptr;
  output [3:0] G_rptr;
  output [2:0] R_addr;
  input R_CLK, R_RST, R_INC, test_si, test_se;
  output R_EMPTY, test_so;
  wire   n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22;
  wire   [3:0] COMB_G_rptr;
  assign test_so = COMB_G_rptr[3];

  SDFFRQX2M \inter_addr_reg[3]  ( .D(n19), .SI(R_addr[2]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(COMB_G_rptr[3]) );
  SDFFRQX2M \inter_addr_reg[2]  ( .D(n20), .SI(R_addr[1]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(R_addr[2]) );
  SDFFRX1M \inter_addr_reg[0]  ( .D(n22), .SI(G_rptr[3]), .SE(test_se), .CK(
        R_CLK), .RN(R_RST), .Q(R_addr[0]), .QN(n9) );
  SDFFRQX2M \G_rptr_reg[3]  ( .D(COMB_G_rptr[3]), .SI(G_rptr[2]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(G_rptr[3]) );
  SDFFRQX2M \G_rptr_reg[2]  ( .D(COMB_G_rptr[2]), .SI(G_rptr[1]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(G_rptr[2]) );
  SDFFRQX2M \G_rptr_reg[1]  ( .D(COMB_G_rptr[1]), .SI(G_rptr[0]), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(G_rptr[1]) );
  SDFFRQX2M \G_rptr_reg[0]  ( .D(COMB_G_rptr[0]), .SI(test_si), .SE(test_se), 
        .CK(R_CLK), .RN(R_RST), .Q(G_rptr[0]) );
  SDFFRQX2M \inter_addr_reg[1]  ( .D(n21), .SI(n9), .SE(test_se), .CK(R_CLK), 
        .RN(R_RST), .Q(R_addr[1]) );
  INVX2M U11 ( .A(n14), .Y(R_EMPTY) );
  XNOR2X2M U12 ( .A(COMB_G_rptr[1]), .B(G_wptr[1]), .Y(n15) );
  XNOR2X2M U13 ( .A(n9), .B(R_addr[1]), .Y(COMB_G_rptr[0]) );
  NOR2X2M U14 ( .A(n13), .B(n9), .Y(n12) );
  XNOR2X2M U15 ( .A(R_addr[2]), .B(n11), .Y(n20) );
  XNOR2X2M U16 ( .A(COMB_G_rptr[3]), .B(n10), .Y(n19) );
  NAND2BX2M U17 ( .AN(n11), .B(R_addr[2]), .Y(n10) );
  NAND4X2M U18 ( .A(n15), .B(n16), .C(n17), .D(n18), .Y(n14) );
  XNOR2X2M U19 ( .A(COMB_G_rptr[3]), .B(G_wptr[3]), .Y(n17) );
  XNOR2X2M U20 ( .A(COMB_G_rptr[2]), .B(G_wptr[2]), .Y(n18) );
  XNOR2X2M U21 ( .A(COMB_G_rptr[0]), .B(G_wptr[0]), .Y(n16) );
  NAND2X2M U22 ( .A(n12), .B(R_addr[1]), .Y(n11) );
  NAND2X2M U23 ( .A(R_INC), .B(n14), .Y(n13) );
  CLKXOR2X2M U24 ( .A(R_addr[1]), .B(R_addr[2]), .Y(COMB_G_rptr[1]) );
  CLKXOR2X2M U25 ( .A(COMB_G_rptr[3]), .B(R_addr[2]), .Y(COMB_G_rptr[2]) );
  CLKXOR2X2M U26 ( .A(R_addr[1]), .B(n12), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n9), .B(n13), .Y(n22) );
endmodule


module ASYNC_FIFO_TOP_DATA_WIDTH8_DEPTH8_test_1 ( W_CLK, W_RST, W_INC, R_CLK, 
        R_RST, R_INC, WR_DATA, RD_DATA, FULL, EMPTY, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC, test_si2, test_si1, test_se;
  output FULL, EMPTY, test_so2, test_so1;
  wire   n1, n2, n3, n4, n5, n6, n7;
  wire   [2:0] W_ADDRESS;
  wire   [2:0] R_ADDRESS;
  wire   [3:0] A_G_w_ptr;
  wire   [3:0] S_G_w_ptr;
  wire   [3:0] A_G_R_ptr;
  wire   [3:0] S_G_R_ptr;
  assign test_so1 = A_G_w_ptr[1];
  assign test_so2 = S_G_w_ptr[3];

  INVX2M U1 ( .A(n4), .Y(n3) );
  INVX2M U2 ( .A(W_RST), .Y(n4) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(R_RST), .Y(n2) );
  ASYNC_FIFO_MEM_DATA_WIDTH8_DEPTH8_test_1 U_FIFO_MEM ( .W_CLK(W_CLK), .W_RST(
        n3), .W_INC(W_INC), .W_FULL(FULL), .w_addr(W_ADDRESS), .r_addr(
        R_ADDRESS), .w_data(WR_DATA), .r_data(RD_DATA), .test_si(test_si1), 
        .test_so(n7), .test_se(test_se) );
  ASYNC_FIFO_BIT_SYNC_B_WIDTH3_STAGES2_test_1 U_W2R_SYNC ( .CLK(R_CLK), .RST(
        n1), .ASYNC(A_G_w_ptr), .SYNC(S_G_w_ptr), .test_si(S_G_R_ptr[3]), 
        .test_se(test_se) );
  ASYNC_FIFO_BIT_SYNC_B_WIDTH3_STAGES2_test_0 U_R2W_SYNC ( .CLK(W_CLK), .RST(
        n3), .ASYNC(A_G_R_ptr), .SYNC(S_G_R_ptr), .test_si(n5), .test_se(
        test_se) );
  ASYNC_FIFO_WR_B_WIDTH3_test_1 U_FIFO_WR ( .W_CLK(W_CLK), .W_RST(n3), .W_INC(
        W_INC), .G_rptr(S_G_R_ptr), .G_wptr(A_G_w_ptr), .W_addr(W_ADDRESS), 
        .W_FULL(FULL), .test_si2(test_si2), .test_si1(n6), .test_so1(n5), 
        .test_se(test_se) );
  ASYNC_FIFO_RD_B_WIDTH3_test_1 U_FIFO_RD ( .R_CLK(R_CLK), .R_RST(n1), .R_INC(
        R_INC), .G_wptr(S_G_w_ptr), .G_rptr(A_G_R_ptr), .R_addr(R_ADDRESS), 
        .R_EMPTY(EMPTY), .test_si(n7), .test_so(n6), .test_se(test_se) );
endmodule


module PULSE_GEN_test_0 ( CLK, RST, LVL_SIG, PULSE_SIG, test_si, test_so, 
        test_se );
  input CLK, RST, LVL_SIG, test_si, test_se;
  output PULSE_SIG, test_so;
  wire   reg_SIG_1, reg_SIG_0;
  assign test_so = reg_SIG_1;

  SDFFRQX2M reg_SIG_0_reg ( .D(LVL_SIG), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(reg_SIG_0) );
  SDFFRQX2M reg_SIG_1_reg ( .D(reg_SIG_0), .SI(reg_SIG_0), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(reg_SIG_1) );
  NOR2BX2M U5 ( .AN(reg_SIG_0), .B(reg_SIG_1), .Y(PULSE_SIG) );
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


module Clk_Divider_test_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk, test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N5, CLK_FLAG, div_clk, N15, N16, N17, N18, N19, N20, N21, N22, N26,
         N27, N28, N29, N30, N31, N32, N33, N53, N54, N55, N56, N57, N58, N59,
         N81, N82, N83, N84, N85, N86, N87, N88, n20, n30, n31, n2, n3, n4, n5,
         n6, n7, n8, n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51;
  wire   [7:0] counter;
  assign test_so = div_clk;
  assign N53 = i_div_ratio[1];
  assign N54 = i_div_ratio[2];
  assign N55 = i_div_ratio[3];
  assign N56 = i_div_ratio[4];
  assign N57 = i_div_ratio[5];
  assign N58 = i_div_ratio[6];
  assign N59 = i_div_ratio[7];

  SDFFRQX2M \counter_reg[7]  ( .D(N88), .SI(counter[6]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[7]) );
  SDFFRQX2M CLK_FLAG_reg ( .D(n31), .SI(test_si), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(CLK_FLAG) );
  SDFFRQX2M \counter_reg[0]  ( .D(N81), .SI(CLK_FLAG), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[1]  ( .D(N82), .SI(counter[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[2]  ( .D(N83), .SI(counter[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[3]  ( .D(N84), .SI(counter[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[4]  ( .D(N85), .SI(counter[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[5]  ( .D(N86), .SI(counter[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[6]  ( .D(N87), .SI(counter[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[6]) );
  SDFFRX1M div_clk_reg ( .D(n30), .SI(counter[7]), .SE(test_se), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk), .QN(n20) );
  OR2X2M U8 ( .A(N54), .B(N53), .Y(n2) );
  MX2X2M U9 ( .A(i_ref_clk), .B(div_clk), .S0(N5), .Y(o_div_clk) );
  CLKINVX1M U14 ( .A(N53), .Y(N15) );
  OAI2BB1X1M U17 ( .A0N(N53), .A1N(N54), .B0(n2), .Y(N16) );
  OR2X1M U18 ( .A(n2), .B(N55), .Y(n3) );
  OAI2BB1X1M U19 ( .A0N(n2), .A1N(N55), .B0(n3), .Y(N17) );
  OR2X1M U20 ( .A(n3), .B(N56), .Y(n4) );
  OAI2BB1X1M U21 ( .A0N(n3), .A1N(N56), .B0(n4), .Y(N18) );
  OR2X1M U22 ( .A(n4), .B(N57), .Y(n5) );
  OAI2BB1X1M U23 ( .A0N(n4), .A1N(N57), .B0(n5), .Y(N19) );
  XNOR2X1M U24 ( .A(N58), .B(n5), .Y(N20) );
  NOR3X1M U25 ( .A(N58), .B(N59), .C(n5), .Y(N22) );
  OAI21X1M U26 ( .A0(N58), .A1(n5), .B0(N59), .Y(n6) );
  NAND2BX1M U27 ( .AN(N22), .B(n6), .Y(N21) );
  CLKXOR2X2M U28 ( .A(CLK_FLAG), .B(n7), .Y(n31) );
  NOR2X1M U29 ( .A(n8), .B(n19), .Y(n7) );
  MXI2X1M U30 ( .A(n21), .B(n20), .S0(n22), .Y(n30) );
  AOI2BB2XLM U31 ( .B0(n23), .B1(n24), .A0N(n19), .A1N(n8), .Y(n22) );
  AOI2BB2XLM U32 ( .B0(n20), .B1(n23), .A0N(n19), .A1N(CLK_FLAG), .Y(n21) );
  NOR2BX1M U33 ( .AN(N33), .B(n25), .Y(N88) );
  NOR2BX1M U34 ( .AN(N32), .B(n25), .Y(N87) );
  NOR2BX1M U35 ( .AN(N31), .B(n25), .Y(N86) );
  NOR2BX1M U36 ( .AN(N30), .B(n25), .Y(N85) );
  NOR2BX1M U37 ( .AN(N29), .B(n25), .Y(N84) );
  NOR2BX1M U38 ( .AN(N28), .B(n25), .Y(N83) );
  NOR2BX1M U39 ( .AN(N27), .B(n25), .Y(N82) );
  NOR2BX1M U40 ( .AN(N26), .B(n25), .Y(N81) );
  AOI22X1M U41 ( .A0(n26), .A1(n23), .B0(n27), .B1(n8), .Y(n25) );
  MXI2X1M U42 ( .A(n28), .B(n24), .S0(CLK_FLAG), .Y(n8) );
  CLKINVX1M U43 ( .A(n26), .Y(n24) );
  NOR2X1M U44 ( .A(n29), .B(n32), .Y(n28) );
  NAND4X1M U45 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n32) );
  XNOR2X1M U46 ( .A(N56), .B(counter[3]), .Y(n36) );
  XNOR2X1M U47 ( .A(N57), .B(counter[4]), .Y(n35) );
  XNOR2X1M U48 ( .A(N58), .B(counter[5]), .Y(n34) );
  XNOR2X1M U49 ( .A(N59), .B(counter[6]), .Y(n33) );
  NAND4BX1M U50 ( .AN(counter[7]), .B(n37), .C(n38), .D(n39), .Y(n29) );
  XNOR2X1M U51 ( .A(N53), .B(counter[0]), .Y(n39) );
  XNOR2X1M U52 ( .A(N54), .B(counter[1]), .Y(n38) );
  XNOR2X1M U53 ( .A(N55), .B(counter[2]), .Y(n37) );
  CLKINVX1M U54 ( .A(n19), .Y(n27) );
  CLKNAND2X2M U55 ( .A(i_div_ratio[0]), .B(N5), .Y(n19) );
  NOR2BX1M U56 ( .AN(N5), .B(i_div_ratio[0]), .Y(n23) );
  CLKNAND2X2M U57 ( .A(n40), .B(n41), .Y(n26) );
  NOR4X1M U58 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n41) );
  CLKXOR2X2M U59 ( .A(counter[7]), .B(N22), .Y(n45) );
  CLKXOR2X2M U60 ( .A(counter[2]), .B(N17), .Y(n44) );
  CLKXOR2X2M U61 ( .A(counter[1]), .B(N16), .Y(n43) );
  CLKXOR2X2M U62 ( .A(counter[0]), .B(N15), .Y(n42) );
  NOR4X1M U63 ( .A(n46), .B(n47), .C(n48), .D(n49), .Y(n40) );
  CLKXOR2X2M U64 ( .A(counter[6]), .B(N21), .Y(n49) );
  CLKXOR2X2M U65 ( .A(counter[5]), .B(N20), .Y(n48) );
  CLKXOR2X2M U66 ( .A(counter[4]), .B(N19), .Y(n47) );
  CLKXOR2X2M U67 ( .A(counter[3]), .B(N18), .Y(n46) );
  OA21X1M U68 ( .A0(n50), .A1(n51), .B0(i_clk_en), .Y(N5) );
  OR3X1M U69 ( .A(N54), .B(N55), .C(N53), .Y(n51) );
  OR4X1M U70 ( .A(N56), .B(N57), .C(N58), .D(N59), .Y(n50) );
  Clk_Divider_0_DW01_inc_0 r72 ( .A(counter), .SUM({N33, N32, N31, N30, N29, 
        N28, N27, N26}) );
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


module Clk_Divider_test_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, 
        o_div_clk, test_si, test_so, test_se );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en, test_si, test_se;
  output o_div_clk, test_so;
  wire   N5, CLK_FLAG, div_clk, N15, N16, N17, N18, N19, N20, N21, N22, N26,
         N27, N28, N29, N30, N31, N32, N33, N53, N54, N55, N56, N57, N58, N59,
         N81, N82, N83, N84, N85, N86, N87, N88, n3, n4, n5, n6, n7, n8, n19,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55;
  wire   [7:0] counter;
  assign test_so = div_clk;
  assign N53 = i_div_ratio[1];
  assign N54 = i_div_ratio[2];
  assign N55 = i_div_ratio[3];
  assign N56 = i_div_ratio[4];
  assign N57 = i_div_ratio[5];
  assign N58 = i_div_ratio[6];
  assign N59 = i_div_ratio[7];

  SDFFRQX2M \counter_reg[7]  ( .D(N88), .SI(counter[6]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[7]) );
  SDFFRQX2M \counter_reg[0]  ( .D(N81), .SI(CLK_FLAG), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[1]  ( .D(N82), .SI(counter[0]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[2]  ( .D(N83), .SI(counter[1]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[3]  ( .D(N84), .SI(counter[2]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[4]  ( .D(N85), .SI(counter[3]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[5]  ( .D(N86), .SI(counter[4]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[5]) );
  SDFFRQX2M \counter_reg[6]  ( .D(N87), .SI(counter[5]), .SE(test_se), .CK(
        i_ref_clk), .RN(i_rst_n), .Q(counter[6]) );
  SDFFRX1M div_clk_reg ( .D(n54), .SI(counter[7]), .SE(test_se), .CK(i_ref_clk), .RN(i_rst_n), .Q(div_clk), .QN(n55) );
  SDFFRQX1M CLK_FLAG_reg ( .D(n53), .SI(test_si), .SE(test_se), .CK(i_ref_clk), 
        .RN(i_rst_n), .Q(CLK_FLAG) );
  OR2X2M U9 ( .A(N54), .B(N53), .Y(n3) );
  MX2X2M U14 ( .A(i_ref_clk), .B(div_clk), .S0(N5), .Y(o_div_clk) );
  CLKINVX1M U17 ( .A(N53), .Y(N15) );
  OAI2BB1X1M U18 ( .A0N(N53), .A1N(N54), .B0(n3), .Y(N16) );
  OR2X1M U19 ( .A(n3), .B(N55), .Y(n4) );
  OAI2BB1X1M U20 ( .A0N(n3), .A1N(N55), .B0(n4), .Y(N17) );
  OR2X1M U21 ( .A(n4), .B(N56), .Y(n5) );
  OAI2BB1X1M U22 ( .A0N(n4), .A1N(N56), .B0(n5), .Y(N18) );
  OR2X1M U23 ( .A(n5), .B(N57), .Y(n6) );
  OAI2BB1X1M U24 ( .A0N(n5), .A1N(N57), .B0(n6), .Y(N19) );
  XNOR2X1M U25 ( .A(N58), .B(n6), .Y(N20) );
  NOR3X1M U26 ( .A(N58), .B(N59), .C(n6), .Y(N22) );
  OAI21X1M U27 ( .A0(N58), .A1(n6), .B0(N59), .Y(n7) );
  NAND2BX1M U28 ( .AN(N22), .B(n7), .Y(N21) );
  CLKXOR2X2M U29 ( .A(CLK_FLAG), .B(n8), .Y(n53) );
  NOR2X1M U30 ( .A(n19), .B(n21), .Y(n8) );
  MXI2X1M U31 ( .A(n22), .B(n55), .S0(n23), .Y(n54) );
  AOI2BB2XLM U32 ( .B0(n24), .B1(n25), .A0N(n21), .A1N(n19), .Y(n23) );
  AOI2BB2XLM U33 ( .B0(n55), .B1(n24), .A0N(n21), .A1N(CLK_FLAG), .Y(n22) );
  NOR2BX1M U34 ( .AN(N33), .B(n26), .Y(N88) );
  NOR2BX1M U35 ( .AN(N32), .B(n26), .Y(N87) );
  NOR2BX1M U36 ( .AN(N31), .B(n26), .Y(N86) );
  NOR2BX1M U37 ( .AN(N30), .B(n26), .Y(N85) );
  NOR2BX1M U38 ( .AN(N29), .B(n26), .Y(N84) );
  NOR2BX1M U39 ( .AN(N28), .B(n26), .Y(N83) );
  NOR2BX1M U40 ( .AN(N27), .B(n26), .Y(N82) );
  NOR2BX1M U41 ( .AN(N26), .B(n26), .Y(N81) );
  AOI22X1M U42 ( .A0(n27), .A1(n24), .B0(n28), .B1(n19), .Y(n26) );
  MXI2X1M U43 ( .A(n29), .B(n25), .S0(CLK_FLAG), .Y(n19) );
  CLKINVX1M U44 ( .A(n27), .Y(n25) );
  NOR2X1M U45 ( .A(n32), .B(n33), .Y(n29) );
  NAND4X1M U46 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n33) );
  XNOR2X1M U47 ( .A(N56), .B(counter[3]), .Y(n37) );
  XNOR2X1M U48 ( .A(N57), .B(counter[4]), .Y(n36) );
  XNOR2X1M U49 ( .A(N58), .B(counter[5]), .Y(n35) );
  XNOR2X1M U50 ( .A(N59), .B(counter[6]), .Y(n34) );
  NAND4BX1M U51 ( .AN(counter[7]), .B(n38), .C(n39), .D(n40), .Y(n32) );
  XNOR2X1M U52 ( .A(N53), .B(counter[0]), .Y(n40) );
  XNOR2X1M U53 ( .A(N54), .B(counter[1]), .Y(n39) );
  XNOR2X1M U54 ( .A(N55), .B(counter[2]), .Y(n38) );
  CLKINVX1M U55 ( .A(n21), .Y(n28) );
  CLKNAND2X2M U56 ( .A(i_div_ratio[0]), .B(N5), .Y(n21) );
  NOR2BX1M U57 ( .AN(N5), .B(i_div_ratio[0]), .Y(n24) );
  CLKNAND2X2M U58 ( .A(n41), .B(n42), .Y(n27) );
  NOR4X1M U59 ( .A(n43), .B(n44), .C(n45), .D(n46), .Y(n42) );
  CLKXOR2X2M U60 ( .A(counter[7]), .B(N22), .Y(n46) );
  CLKXOR2X2M U61 ( .A(counter[2]), .B(N17), .Y(n45) );
  CLKXOR2X2M U62 ( .A(counter[1]), .B(N16), .Y(n44) );
  CLKXOR2X2M U63 ( .A(counter[0]), .B(N15), .Y(n43) );
  NOR4X1M U64 ( .A(n47), .B(n48), .C(n49), .D(n50), .Y(n41) );
  CLKXOR2X2M U65 ( .A(counter[6]), .B(N21), .Y(n50) );
  CLKXOR2X2M U66 ( .A(counter[5]), .B(N20), .Y(n49) );
  CLKXOR2X2M U67 ( .A(counter[4]), .B(N19), .Y(n48) );
  CLKXOR2X2M U68 ( .A(counter[3]), .B(N18), .Y(n47) );
  OA21X1M U69 ( .A0(n51), .A1(n52), .B0(i_clk_en), .Y(N5) );
  OR3X1M U70 ( .A(N54), .B(N55), .C(N53), .Y(n52) );
  OR4X1M U71 ( .A(N56), .B(N57), .C(N58), .D(N59), .Y(n51) );
  Clk_Divider_1_DW01_inc_0 r72 ( .A(counter), .SUM({N33, N32, N31, N30, N29, 
        N28, N27, N26}) );
endmodule


module UART_Parity_test_1 ( clk, RST_n, P_DATA, LOAD, Data_Valid, PAR_TYP, 
        Par_bit, test_si, test_se );
  input [7:0] P_DATA;
  input clk, RST_n, LOAD, Data_Valid, PAR_TYP, test_si, test_se;
  output Par_bit;
  wire   n2, n3, n4, n5, n6, n7, n8;

  SDFFRQX2M Par_bit_reg ( .D(n8), .SI(test_si), .SE(test_se), .CK(clk), .RN(
        RST_n), .Q(Par_bit) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n7), .Y(n4) );
  CLKXOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n7) );
  XNOR2X2M U5 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n6) );
  OAI2BB2X1M U6 ( .B0(n2), .B1(n3), .A0N(Par_bit), .A1N(n3), .Y(n8) );
  NAND2X2M U7 ( .A(LOAD), .B(Data_Valid), .Y(n3) );
  XOR3XLM U8 ( .A(n4), .B(PAR_TYP), .C(n5), .Y(n2) );
  XOR3XLM U9 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n6), .Y(n5) );
endmodule


module UART_FSM_test_1 ( clk, RST_n, ser_done, par_bit, ser_data, Data_Valid, 
        PAR_EN, ser_en, Load, TX_OUT, busy, test_si, test_so, test_se );
  input clk, RST_n, ser_done, par_bit, ser_data, Data_Valid, PAR_EN, test_si,
         test_se;
  output ser_en, Load, TX_OUT, busy, test_so;
  wire   n8, n9, n10, n11, n4, n5, n6, n7;
  wire   [2:0] Current_state;
  wire   [2:0] Next_state;
  assign test_so = n7;

  SDFFRQX2M \Current_state_reg[1]  ( .D(n4), .SI(n5), .SE(test_se), .CK(clk), 
        .RN(RST_n), .Q(Current_state[1]) );
  SDFFRQX2M \Current_state_reg[0]  ( .D(Next_state[0]), .SI(test_si), .SE(
        test_se), .CK(clk), .RN(RST_n), .Q(Current_state[0]) );
  SDFFRQX2M \Current_state_reg[2]  ( .D(Next_state[2]), .SI(n6), .SE(test_se), 
        .CK(clk), .RN(RST_n), .Q(Current_state[2]) );
  NOR2BX2M U6 ( .AN(Data_Valid), .B(busy), .Y(Load) );
  NAND3X2M U7 ( .A(n6), .B(n7), .C(n5), .Y(busy) );
  INVX2M U8 ( .A(n9), .Y(n4) );
  OAI2BB1X2M U9 ( .A0N(par_bit), .A1N(n5), .B0(n8), .Y(TX_OUT) );
  AOI31X2M U10 ( .A0(Current_state[1]), .A1(Current_state[0]), .A2(ser_data), 
        .B0(n9), .Y(n8) );
  NOR2X2M U11 ( .A(n5), .B(Current_state[2]), .Y(ser_en) );
  AOI21X2M U12 ( .A0(n7), .A1(Current_state[1]), .B0(ser_en), .Y(n9) );
  INVX2M U13 ( .A(Current_state[2]), .Y(n7) );
  INVX2M U14 ( .A(Current_state[0]), .Y(n5) );
  OAI2B2X1M U15 ( .A1N(ser_en), .A0(ser_done), .B0(Current_state[1]), .B1(n11), 
        .Y(Next_state[0]) );
  AOI21X2M U16 ( .A0(Data_Valid), .A1(n7), .B0(ser_en), .Y(n11) );
  INVX2M U17 ( .A(Current_state[1]), .Y(n6) );
  NOR3X2M U18 ( .A(n6), .B(Current_state[2]), .C(n10), .Y(Next_state[2]) );
  AOI2B1X1M U19 ( .A1N(PAR_EN), .A0(ser_done), .B0(n5), .Y(n10) );
endmodule


module UART_Serializer_test_1 ( clk, RST_n, P_DATA, ser_en, Load, ser_done, 
        ser_data, test_si, test_se );
  input [7:0] P_DATA;
  input clk, RST_n, ser_en, Load, test_si, test_se;
  output ser_done, ser_data;
  wire   N2, N3, N4, N8, N19, N20, N21, N23, n14, n15, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n17, n30, n31, n32, n35, n36;
  wire   [7:0] P_DATA_reg;

  SDFFRQX2M ser_done_reg ( .D(N23), .SI(ser_data), .SE(n36), .CK(clk), .RN(
        RST_n), .Q(ser_done) );
  SDFFRQX2M \P_DATA_reg_reg[5]  ( .D(n26), .SI(P_DATA_reg[4]), .SE(n36), .CK(
        clk), .RN(RST_n), .Q(P_DATA_reg[5]) );
  SDFFRQX2M \P_DATA_reg_reg[1]  ( .D(n22), .SI(P_DATA_reg[0]), .SE(n36), .CK(
        clk), .RN(RST_n), .Q(P_DATA_reg[1]) );
  SDFFRQX2M \P_DATA_reg_reg[7]  ( .D(n28), .SI(P_DATA_reg[6]), .SE(n36), .CK(
        clk), .RN(RST_n), .Q(P_DATA_reg[7]) );
  SDFFRQX2M \P_DATA_reg_reg[3]  ( .D(n24), .SI(P_DATA_reg[2]), .SE(n36), .CK(
        clk), .RN(RST_n), .Q(P_DATA_reg[3]) );
  SDFFRQX2M \P_DATA_reg_reg[6]  ( .D(n27), .SI(P_DATA_reg[5]), .SE(n36), .CK(
        clk), .RN(RST_n), .Q(P_DATA_reg[6]) );
  SDFFRQX2M \P_DATA_reg_reg[2]  ( .D(n23), .SI(P_DATA_reg[1]), .SE(n36), .CK(
        clk), .RN(RST_n), .Q(P_DATA_reg[2]) );
  SDFFRQX2M \P_DATA_reg_reg[4]  ( .D(n25), .SI(P_DATA_reg[3]), .SE(n36), .CK(
        clk), .RN(RST_n), .Q(P_DATA_reg[4]) );
  SDFFRQX2M \P_DATA_reg_reg[0]  ( .D(n21), .SI(test_si), .SE(n36), .CK(clk), 
        .RN(RST_n), .Q(P_DATA_reg[0]) );
  SDFFRX1M \counter_reg[2]  ( .D(N21), .SI(n15), .SE(n36), .CK(clk), .RN(RST_n), .Q(N4), .QN(n14) );
  SDFFRQX2M \counter_reg[0]  ( .D(N19), .SI(P_DATA_reg[7]), .SE(n36), .CK(clk), 
        .RN(RST_n), .Q(N2) );
  SDFFRQX2M ser_data_reg ( .D(n29), .SI(n14), .SE(n36), .CK(clk), .RN(RST_n), 
        .Q(ser_data) );
  SDFFRX1M \counter_reg[1]  ( .D(N20), .SI(N2), .SE(n36), .CK(clk), .RN(RST_n), 
        .Q(N3), .QN(n15) );
  INVX2M U17 ( .A(Load), .Y(n32) );
  OAI31X1M U18 ( .A0(n14), .A1(n31), .A2(n15), .B0(ser_en), .Y(n19) );
  OAI32X1M U19 ( .A0(n19), .A1(n31), .A2(n15), .B0(n14), .B1(n19), .Y(N21) );
  NOR2X2M U20 ( .A(N2), .B(n19), .Y(N19) );
  NOR2X2M U21 ( .A(n20), .B(n19), .Y(N20) );
  CLKXOR2X2M U22 ( .A(n15), .B(N2), .Y(n20) );
  MX4X1M U23 ( .A(P_DATA_reg[0]), .B(P_DATA_reg[1]), .C(P_DATA_reg[2]), .D(
        P_DATA_reg[3]), .S0(N2), .S1(N3), .Y(n30) );
  INVX2M U24 ( .A(N2), .Y(n31) );
  AO2B2X2M U25 ( .B0(ser_data), .B1(n18), .A0(N8), .A1N(n18), .Y(n29) );
  MX2X2M U26 ( .A(n30), .B(n17), .S0(N4), .Y(N8) );
  NAND2X2M U27 ( .A(ser_en), .B(n32), .Y(n18) );
  MX4X1M U28 ( .A(P_DATA_reg[4]), .B(P_DATA_reg[5]), .C(P_DATA_reg[6]), .D(
        P_DATA_reg[7]), .S0(N2), .S1(N3), .Y(n17) );
  AO22X1M U29 ( .A0(P_DATA[0]), .A1(Load), .B0(P_DATA_reg[0]), .B1(n32), .Y(
        n21) );
  AO22X1M U30 ( .A0(P_DATA[1]), .A1(Load), .B0(P_DATA_reg[1]), .B1(n32), .Y(
        n22) );
  AO22X1M U31 ( .A0(P_DATA[2]), .A1(Load), .B0(P_DATA_reg[2]), .B1(n32), .Y(
        n23) );
  AO22X1M U32 ( .A0(P_DATA[3]), .A1(Load), .B0(P_DATA_reg[3]), .B1(n32), .Y(
        n24) );
  AO22X1M U33 ( .A0(P_DATA[4]), .A1(Load), .B0(P_DATA_reg[4]), .B1(n32), .Y(
        n25) );
  AO22X1M U34 ( .A0(P_DATA[5]), .A1(Load), .B0(P_DATA_reg[5]), .B1(n32), .Y(
        n26) );
  AO22X1M U35 ( .A0(P_DATA[6]), .A1(Load), .B0(P_DATA_reg[6]), .B1(n32), .Y(
        n27) );
  AO22X1M U36 ( .A0(P_DATA[7]), .A1(Load), .B0(P_DATA_reg[7]), .B1(n32), .Y(
        n28) );
  NOR3X2M U37 ( .A(n14), .B(n31), .C(n15), .Y(N23) );
  INVXLM U38 ( .A(test_se), .Y(n35) );
  INVXLM U39 ( .A(n35), .Y(n36) );
endmodule


module UART_TX_Top_test_1 ( clk, RST, PAR_TYP, PAR_EN, P_DATA, Data_Valid, 
        TX_OUT, busy, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input clk, RST, PAR_TYP, PAR_EN, Data_Valid, test_si, test_se;
  output TX_OUT, busy, test_so;
  wire   load_data, parity, serial_done, serial_data, serializer_en, n1, n2,
         n3;
  assign test_so = parity;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  UART_Parity_test_1 parity_calc ( .clk(clk), .RST_n(n1), .P_DATA(P_DATA), 
        .LOAD(load_data), .Data_Valid(Data_Valid), .PAR_TYP(PAR_TYP), 
        .Par_bit(parity), .test_si(serial_done), .test_se(test_se) );
  UART_FSM_test_1 FSM ( .clk(clk), .RST_n(n1), .ser_done(serial_done), 
        .par_bit(parity), .ser_data(serial_data), .Data_Valid(Data_Valid), 
        .PAR_EN(PAR_EN), .ser_en(serializer_en), .Load(load_data), .TX_OUT(
        TX_OUT), .busy(busy), .test_si(test_si), .test_so(n3), .test_se(
        test_se) );
  UART_Serializer_test_1 SER ( .clk(clk), .RST_n(n1), .P_DATA(P_DATA), 
        .ser_en(serializer_en), .Load(load_data), .ser_done(serial_done), 
        .ser_data(serial_data), .test_si(n3), .test_se(test_se) );
endmodule


module UART_RX_deserializer_test_1 ( clk, rst_n, enable, serial_data, P_DATA, 
        test_si, test_so, test_se );
  output [7:0] P_DATA;
  input clk, rst_n, enable, serial_data, test_si, test_se;
  output test_so;
  wire   n1, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n21, n22, n23,
         n24, n25, n26, n29, n31, n33, n34, n36, n38, n41, n44, n47, n50, n53,
         n56, n59, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n2, n3, n4, n5, n6, n7, n8, n9, n20, n27, n28, n30, n32, n35, n77,
         n80, n81, n82;
  wire   [3:0] counter;
  wire   [7:0] P_DATA_reg;
  assign test_so = n6;

  SDFFRQX2M \P_DATA_reg_reg[5]  ( .D(n67), .SI(P_DATA_reg[4]), .SE(n82), .CK(
        clk), .RN(rst_n), .Q(P_DATA_reg[5]) );
  SDFFRQX2M \P_DATA_reg_reg[4]  ( .D(n68), .SI(P_DATA_reg[3]), .SE(n81), .CK(
        clk), .RN(rst_n), .Q(P_DATA_reg[4]) );
  SDFFRQX2M \P_DATA_reg_reg[1]  ( .D(n71), .SI(P_DATA_reg[0]), .SE(n82), .CK(
        clk), .RN(rst_n), .Q(P_DATA_reg[1]) );
  SDFFRQX2M \P_DATA_reg_reg[0]  ( .D(n72), .SI(P_DATA[7]), .SE(n81), .CK(clk), 
        .RN(rst_n), .Q(P_DATA_reg[0]) );
  SDFFRQX2M \P_DATA_reg_reg[7]  ( .D(n65), .SI(P_DATA_reg[6]), .SE(n82), .CK(
        clk), .RN(rst_n), .Q(P_DATA_reg[7]) );
  SDFFRQX2M \P_DATA_reg_reg[6]  ( .D(n66), .SI(P_DATA_reg[5]), .SE(n81), .CK(
        clk), .RN(rst_n), .Q(P_DATA_reg[6]) );
  SDFFRQX2M \P_DATA_reg_reg[3]  ( .D(n69), .SI(P_DATA_reg[2]), .SE(n82), .CK(
        clk), .RN(rst_n), .Q(P_DATA_reg[3]) );
  SDFFRQX2M \P_DATA_reg_reg[2]  ( .D(n70), .SI(P_DATA_reg[1]), .SE(n81), .CK(
        clk), .RN(rst_n), .Q(P_DATA_reg[2]) );
  SDFFRQX2M \P_DATA_reg[5]_inst  ( .D(n59), .SI(P_DATA[4]), .SE(n82), .CK(clk), 
        .RN(rst_n), .Q(P_DATA[5]) );
  SDFFRQX2M \P_DATA_reg[1]_inst  ( .D(n53), .SI(P_DATA[0]), .SE(n81), .CK(clk), 
        .RN(rst_n), .Q(P_DATA[1]) );
  SDFFRQX2M \P_DATA_reg[4]_inst  ( .D(n56), .SI(P_DATA[3]), .SE(n82), .CK(clk), 
        .RN(rst_n), .Q(P_DATA[4]) );
  SDFFRQX2M \P_DATA_reg[0]_inst  ( .D(n50), .SI(test_si), .SE(n81), .CK(clk), 
        .RN(rst_n), .Q(P_DATA[0]) );
  SDFFRQX2M \P_DATA_reg[7]_inst  ( .D(n47), .SI(P_DATA[6]), .SE(n82), .CK(clk), 
        .RN(rst_n), .Q(P_DATA[7]) );
  SDFFRQX2M \P_DATA_reg[3]_inst  ( .D(n41), .SI(P_DATA[2]), .SE(n81), .CK(clk), 
        .RN(rst_n), .Q(P_DATA[3]) );
  SDFFRQX2M \P_DATA_reg[6]_inst  ( .D(n44), .SI(P_DATA[5]), .SE(n82), .CK(clk), 
        .RN(rst_n), .Q(P_DATA[6]) );
  SDFFRQX2M \P_DATA_reg[2]_inst  ( .D(n38), .SI(P_DATA[1]), .SE(n81), .CK(clk), 
        .RN(rst_n), .Q(P_DATA[2]) );
  SDFFRQX2M \counter_reg[3]  ( .D(n75), .SI(counter[2]), .SE(n82), .CK(clk), 
        .RN(rst_n), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n74), .SI(counter[0]), .SE(n81), .CK(clk), 
        .RN(rst_n), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[2]  ( .D(n73), .SI(counter[1]), .SE(n82), .CK(clk), 
        .RN(rst_n), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n76), .SI(P_DATA_reg[7]), .SE(n81), .CK(clk), 
        .RN(rst_n), .Q(counter[0]) );
  AOI2BB1X2M U3 ( .A0N(n36), .A1N(n5), .B0(n3), .Y(n29) );
  INVX2M U4 ( .A(n31), .Y(n3) );
  NAND3X2M U5 ( .A(n8), .B(n6), .C(enable), .Y(n23) );
  OAI221X1M U6 ( .A0(n3), .A1(n16), .B0(n7), .B1(n31), .C0(n14), .Y(n74) );
  NAND2X2M U7 ( .A(enable), .B(n2), .Y(n36) );
  OAI22X1M U8 ( .A0(n14), .A1(n21), .B0(n24), .B1(n77), .Y(n70) );
  NOR2X2M U9 ( .A(n14), .B(n23), .Y(n24) );
  OAI22X1M U10 ( .A0(n10), .A1(n21), .B0(n22), .B1(n35), .Y(n69) );
  NOR2X2M U11 ( .A(n10), .B(n23), .Y(n22) );
  OAI22X1M U12 ( .A0(n11), .A1(n14), .B0(n15), .B1(n32), .Y(n66) );
  NOR2X2M U13 ( .A(n13), .B(n14), .Y(n15) );
  OAI22X1M U14 ( .A0(n10), .A1(n11), .B0(n12), .B1(n30), .Y(n65) );
  NOR2X2M U15 ( .A(n10), .B(n13), .Y(n12) );
  OAI22X1M U16 ( .A0(n18), .A1(n21), .B0(n26), .B1(n28), .Y(n72) );
  NOR2X2M U17 ( .A(n18), .B(n23), .Y(n26) );
  OAI22X1M U18 ( .A0(n16), .A1(n21), .B0(n25), .B1(n27), .Y(n71) );
  NOR2X2M U19 ( .A(n16), .B(n23), .Y(n25) );
  OAI22X1M U20 ( .A0(n18), .A1(n11), .B0(n19), .B1(n20), .Y(n68) );
  NOR2X2M U21 ( .A(n18), .B(n13), .Y(n19) );
  OAI22X1M U22 ( .A0(n11), .A1(n16), .B0(n17), .B1(n9), .Y(n67) );
  NOR2X2M U23 ( .A(n13), .B(n16), .Y(n17) );
  NAND2X2M U24 ( .A(n36), .B(n2), .Y(n31) );
  NAND2X2M U25 ( .A(n7), .B(n4), .Y(n18) );
  INVX2M U26 ( .A(n10), .Y(n5) );
  OAI32X1M U27 ( .A0(n10), .A1(counter[2]), .A2(n3), .B0(n29), .B1(n8), .Y(n73) );
  NAND3X2M U28 ( .A(counter[2]), .B(n6), .C(enable), .Y(n13) );
  OAI22X1M U29 ( .A0(counter[0]), .A1(n36), .B0(n4), .B1(n31), .Y(n76) );
  NAND2BX2M U30 ( .AN(n13), .B(serial_data), .Y(n11) );
  NAND2BX2M U31 ( .AN(n23), .B(serial_data), .Y(n21) );
  OAI21X2M U32 ( .A0(n33), .A1(n6), .B0(n34), .Y(n75) );
  NAND4X2M U33 ( .A(n5), .B(counter[2]), .C(n31), .D(n6), .Y(n34) );
  OA21X2M U34 ( .A0(n36), .A1(counter[2]), .B0(n29), .Y(n33) );
  NAND2X2M U35 ( .A(counter[1]), .B(counter[0]), .Y(n10) );
  NAND2X2M U36 ( .A(counter[1]), .B(n4), .Y(n14) );
  BUFX2M U37 ( .A(n1), .Y(n2) );
  NAND3BX2M U38 ( .AN(n18), .B(n8), .C(counter[3]), .Y(n1) );
  OAI2BB2X1M U39 ( .B0(n2), .B1(n77), .A0N(P_DATA[2]), .A1N(n2), .Y(n38) );
  OAI2BB2X1M U40 ( .B0(n2), .B1(n35), .A0N(P_DATA[3]), .A1N(n2), .Y(n41) );
  OAI2BB2X1M U41 ( .B0(n2), .B1(n32), .A0N(P_DATA[6]), .A1N(n2), .Y(n44) );
  OAI2BB2X1M U42 ( .B0(n2), .B1(n30), .A0N(P_DATA[7]), .A1N(n2), .Y(n47) );
  OAI2BB2X1M U43 ( .B0(n2), .B1(n28), .A0N(P_DATA[0]), .A1N(n2), .Y(n50) );
  OAI2BB2X1M U44 ( .B0(n2), .B1(n27), .A0N(P_DATA[1]), .A1N(n2), .Y(n53) );
  OAI2BB2X1M U45 ( .B0(n2), .B1(n20), .A0N(P_DATA[4]), .A1N(n2), .Y(n56) );
  OAI2BB2X1M U46 ( .B0(n2), .B1(n9), .A0N(P_DATA[5]), .A1N(n2), .Y(n59) );
  INVX2M U47 ( .A(counter[0]), .Y(n4) );
  INVX2M U48 ( .A(counter[3]), .Y(n6) );
  INVX2M U49 ( .A(counter[1]), .Y(n7) );
  INVX2M U50 ( .A(counter[2]), .Y(n8) );
  NAND2X2M U51 ( .A(counter[0]), .B(n7), .Y(n16) );
  INVX2M U52 ( .A(P_DATA_reg[2]), .Y(n77) );
  INVX2M U53 ( .A(P_DATA_reg[3]), .Y(n35) );
  INVX2M U54 ( .A(P_DATA_reg[6]), .Y(n32) );
  INVX2M U55 ( .A(P_DATA_reg[7]), .Y(n30) );
  INVX2M U56 ( .A(P_DATA_reg[0]), .Y(n28) );
  INVX2M U57 ( .A(P_DATA_reg[1]), .Y(n27) );
  INVX2M U58 ( .A(P_DATA_reg[4]), .Y(n20) );
  INVX2M U79 ( .A(P_DATA_reg[5]), .Y(n9) );
  INVXLM U80 ( .A(test_se), .Y(n80) );
  INVXLM U81 ( .A(n80), .Y(n81) );
  INVXLM U82 ( .A(n80), .Y(n82) );
endmodule


module UART_RX_edge_counter_test_1 ( clk, rst_n, enable, PAR_EN, Prescale, 
        edge_cnt, bit_cnt, test_si, test_se );
  input [5:0] Prescale;
  output [4:0] edge_cnt;
  output [3:0] bit_cnt;
  input clk, rst_n, enable, PAR_EN, test_si, test_se;
  wire   N5, N6, N7, N8, N9, N10, max_edge, N16, N17, N18, N20, N21, N22, N23,
         N24, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, \add_26/carry[4] , \add_26/carry[3] ,
         \add_26/carry[2] , n1, n2, n12, n13, n14, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42;

  SDFFRQX2M \bit_cnt_reg[3]  ( .D(n29), .SI(bit_cnt[2]), .SE(test_se), .CK(clk), .RN(rst_n), .Q(bit_cnt[3]) );
  SDFFRQX2M \bit_cnt_reg[2]  ( .D(n27), .SI(bit_cnt[1]), .SE(test_se), .CK(clk), .RN(rst_n), .Q(bit_cnt[2]) );
  SDFFRQX2M \bit_cnt_reg[1]  ( .D(n28), .SI(bit_cnt[0]), .SE(test_se), .CK(clk), .RN(rst_n), .Q(bit_cnt[1]) );
  SDFFRQX2M \bit_cnt_reg[0]  ( .D(n30), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst_n), .Q(bit_cnt[0]) );
  SDFFRQX2M \edge_cnt_reg[4]  ( .D(N24), .SI(edge_cnt[3]), .SE(test_se), .CK(
        clk), .RN(rst_n), .Q(edge_cnt[4]) );
  SDFFRQX2M \edge_cnt_reg[1]  ( .D(N21), .SI(edge_cnt[0]), .SE(test_se), .CK(
        clk), .RN(rst_n), .Q(edge_cnt[1]) );
  SDFFRQX2M \edge_cnt_reg[0]  ( .D(N20), .SI(n41), .SE(test_se), .CK(clk), 
        .RN(rst_n), .Q(edge_cnt[0]) );
  SDFFRQX2M \edge_cnt_reg[3]  ( .D(N23), .SI(edge_cnt[2]), .SE(test_se), .CK(
        clk), .RN(rst_n), .Q(edge_cnt[3]) );
  SDFFRQX2M \edge_cnt_reg[2]  ( .D(N22), .SI(edge_cnt[1]), .SE(test_se), .CK(
        clk), .RN(rst_n), .Q(edge_cnt[2]) );
  NAND3X2M U6 ( .A(max_edge), .B(n24), .C(enable), .Y(n18) );
  NAND3X2M U13 ( .A(n18), .B(n24), .C(enable), .Y(n23) );
  NAND2BX2M U14 ( .AN(max_edge), .B(enable), .Y(n26) );
  NOR2BX2M U15 ( .AN(N16), .B(n26), .Y(N21) );
  NOR2BX2M U16 ( .AN(N17), .B(n26), .Y(N22) );
  NOR2BX2M U17 ( .AN(N18), .B(n26), .Y(N23) );
  OAI21X2M U18 ( .A0(bit_cnt[0]), .A1(n18), .B0(n23), .Y(n19) );
  OAI2BB2X1M U19 ( .B0(n17), .B1(n18), .A0N(n19), .A1N(bit_cnt[1]), .Y(n28) );
  OAI32X1M U20 ( .A0(n20), .A1(n18), .A2(n21), .B0(n22), .B1(n41), .Y(n29) );
  NAND2X2M U21 ( .A(bit_cnt[0]), .B(n41), .Y(n20) );
  AOI2B1X1M U22 ( .A1N(n18), .A0(n21), .B0(n19), .Y(n22) );
  INVX2M U23 ( .A(bit_cnt[3]), .Y(n41) );
  OAI2B2X1M U24 ( .A1N(bit_cnt[0]), .A0(n23), .B0(bit_cnt[0]), .B1(n18), .Y(
        n30) );
  NOR2X2M U25 ( .A(n1), .B(n26), .Y(N24) );
  XNOR2X2M U26 ( .A(\add_26/carry[4] ), .B(edge_cnt[4]), .Y(n1) );
  NOR2X2M U27 ( .A(edge_cnt[0]), .B(n26), .Y(N20) );
  NOR2BX2M U28 ( .AN(enable), .B(n15), .Y(n27) );
  CLKXOR2X2M U29 ( .A(n16), .B(bit_cnt[2]), .Y(n15) );
  NAND3X2M U30 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .C(max_edge), .Y(n16) );
  NAND3BX2M U31 ( .AN(bit_cnt[2]), .B(n25), .C(bit_cnt[3]), .Y(n24) );
  OAI32X1M U32 ( .A0(n42), .A1(bit_cnt[0]), .A2(n40), .B0(PAR_EN), .B1(n17), 
        .Y(n25) );
  INVX2M U33 ( .A(PAR_EN), .Y(n42) );
  NAND2X2M U34 ( .A(bit_cnt[0]), .B(n40), .Y(n17) );
  NAND2X2M U35 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n21) );
  INVX2M U36 ( .A(bit_cnt[1]), .Y(n40) );
  ADDHX1M U37 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_26/carry[2] ), .S(
        N16) );
  ADDHX1M U38 ( .A(edge_cnt[2]), .B(\add_26/carry[2] ), .CO(\add_26/carry[3] ), 
        .S(N17) );
  ADDHX1M U39 ( .A(edge_cnt[3]), .B(\add_26/carry[3] ), .CO(\add_26/carry[4] ), 
        .S(N18) );
  OR2X2M U40 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  INVX2M U41 ( .A(Prescale[3]), .Y(n31) );
  CLKINVX1M U42 ( .A(Prescale[0]), .Y(N5) );
  OAI2BB1X1M U43 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N6) );
  NOR2X1M U44 ( .A(n2), .B(Prescale[2]), .Y(n12) );
  AO21XLM U45 ( .A0(n2), .A1(Prescale[2]), .B0(n12), .Y(N7) );
  CLKNAND2X2M U46 ( .A(n12), .B(n31), .Y(n13) );
  OAI21X1M U47 ( .A0(n12), .A1(n31), .B0(n13), .Y(N8) );
  XNOR2X1M U48 ( .A(Prescale[4]), .B(n13), .Y(N9) );
  NOR2X1M U49 ( .A(Prescale[4]), .B(n13), .Y(n14) );
  CLKXOR2X2M U50 ( .A(Prescale[5]), .B(n14), .Y(N10) );
  NOR2BX1M U51 ( .AN(N5), .B(edge_cnt[0]), .Y(n32) );
  OAI2B2X1M U52 ( .A1N(edge_cnt[1]), .A0(n32), .B0(N6), .B1(n32), .Y(n35) );
  NOR2BX1M U53 ( .AN(edge_cnt[0]), .B(N5), .Y(n33) );
  OAI2B2X1M U54 ( .A1N(N6), .A0(n33), .B0(edge_cnt[1]), .B1(n33), .Y(n34) );
  NAND3BX1M U55 ( .AN(N10), .B(n35), .C(n34), .Y(n39) );
  CLKXOR2X2M U56 ( .A(N9), .B(edge_cnt[4]), .Y(n38) );
  CLKXOR2X2M U57 ( .A(N7), .B(edge_cnt[2]), .Y(n37) );
  CLKXOR2X2M U58 ( .A(N8), .B(edge_cnt[3]), .Y(n36) );
  NOR4X1M U59 ( .A(n39), .B(n38), .C(n37), .D(n36), .Y(max_edge) );
endmodule


module UART_RX_sampler_test_1 ( clk, rst_n, RX_IN, sample_en, Prescale, 
        edge_count, sampled_bit, test_so, test_se );
  input [5:0] Prescale;
  input [4:0] edge_count;
  input clk, rst_n, RX_IN, sample_en, test_se;
  output sampled_bit, test_so;
  wire   n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17;
  wire   [1:0] counter;
  wire   [1:0] sampled_data;
  assign test_so = sampled_data[1];

  SDFFRQX2M \sampled_data_reg[1]  ( .D(n39), .SI(sampled_data[0]), .SE(test_se), .CK(clk), .RN(rst_n), .Q(sampled_data[1]) );
  SDFFRQX2M \sampled_data_reg[0]  ( .D(n38), .SI(sampled_bit), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(sampled_data[0]) );
  SDFFRQX2M \counter_reg[1]  ( .D(n40), .SI(n6), .SE(test_se), .CK(clk), .RN(
        rst_n), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n41), .SI(edge_count[4]), .SE(test_se), .CK(
        clk), .RN(rst_n), .Q(counter[0]) );
  SDFFRQX2M sampled_bit_reg ( .D(n37), .SI(counter[1]), .SE(test_se), .CK(clk), 
        .RN(rst_n), .Q(sampled_bit) );
  INVX2M U8 ( .A(RX_IN), .Y(n17) );
  AND3X2M U9 ( .A(n21), .B(n7), .C(sample_en), .Y(n24) );
  NAND3X2M U10 ( .A(n21), .B(n20), .C(sample_en), .Y(n26) );
  NAND2X2M U11 ( .A(n26), .B(n20), .Y(n27) );
  OAI2BB2X1M U12 ( .B0(n18), .B1(n19), .A0N(sampled_bit), .A1N(n19), .Y(n37)
         );
  NAND3BX2M U13 ( .AN(n20), .B(n21), .C(sample_en), .Y(n19) );
  AOI21X2M U14 ( .A0(sampled_data[0]), .A1(RX_IN), .B0(n22), .Y(n18) );
  OA21X2M U15 ( .A0(sampled_data[0]), .A1(RX_IN), .B0(sampled_data[1]), .Y(n22) );
  OAI2BB2X1M U16 ( .B0(n17), .B1(n23), .A0N(n23), .A1N(sampled_data[0]), .Y(
        n38) );
  NAND2X2M U17 ( .A(n24), .B(n6), .Y(n23) );
  OAI2BB2X1M U18 ( .B0(n17), .B1(n25), .A0N(n25), .A1N(sampled_data[1]), .Y(
        n39) );
  NAND2X2M U19 ( .A(counter[0]), .B(n24), .Y(n25) );
  OAI33X2M U20 ( .A0(n15), .A1(Prescale[3]), .A2(n31), .B0(n32), .B1(n33), 
        .B2(n16), .Y(n30) );
  INVX2M U21 ( .A(Prescale[3]), .Y(n16) );
  NAND3X2M U22 ( .A(n11), .B(n10), .C(n15), .Y(n32) );
  AOI32X1M U23 ( .A0(n8), .A1(n13), .A2(edge_count[2]), .B0(edge_count[1]), 
        .B1(n12), .Y(n33) );
  OAI32X1M U24 ( .A0(n26), .A1(counter[1]), .A2(n6), .B0(n7), .B1(n27), .Y(n40) );
  NOR4X1M U25 ( .A(Prescale[0]), .B(n28), .C(Prescale[2]), .D(Prescale[1]), 
        .Y(n21) );
  AOI32X1M U26 ( .A0(Prescale[5]), .A1(n9), .A2(n29), .B0(n30), .B1(n14), .Y(
        n28) );
  INVX2M U27 ( .A(Prescale[5]), .Y(n14) );
  NOR2X2M U28 ( .A(Prescale[4]), .B(Prescale[3]), .Y(n29) );
  AOI32X1M U29 ( .A0(n34), .A1(n10), .A2(edge_count[3]), .B0(n35), .B1(n11), 
        .Y(n31) );
  NOR3X2M U30 ( .A(n13), .B(edge_count[4]), .C(n12), .Y(n35) );
  NOR3X2M U31 ( .A(edge_count[1]), .B(edge_count[2]), .C(edge_count[0]), .Y(
        n34) );
  OAI22X1M U32 ( .A0(n6), .A1(n27), .B0(counter[0]), .B1(n26), .Y(n41) );
  INVX2M U33 ( .A(edge_count[1]), .Y(n13) );
  INVX2M U34 ( .A(edge_count[2]), .Y(n12) );
  INVX2M U35 ( .A(n36), .Y(n9) );
  AOI32X1M U36 ( .A0(edge_count[4]), .A1(n11), .A2(n34), .B0(n35), .B1(
        edge_count[3]), .Y(n36) );
  INVX2M U37 ( .A(edge_count[0]), .Y(n8) );
  NAND2X2M U38 ( .A(counter[1]), .B(n6), .Y(n20) );
  INVX2M U39 ( .A(counter[0]), .Y(n6) );
  INVX2M U40 ( .A(edge_count[3]), .Y(n11) );
  INVX2M U41 ( .A(edge_count[4]), .Y(n10) );
  INVX2M U42 ( .A(counter[1]), .Y(n7) );
  INVX2M U43 ( .A(Prescale[4]), .Y(n15) );
endmodule


module UART_RX_parity_check_test_1 ( clk, rst_n, PAR_TYP, enable, serial_data, 
        P_DATA, parity_error, test_si, test_se );
  input [7:0] P_DATA;
  input clk, rst_n, PAR_TYP, enable, serial_data, test_si, test_se;
  output parity_error;
  wire   n1, n2, n3, n4, n5, n6, n8;

  SDFFRQX2M parity_error_reg ( .D(n8), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst_n), .Q(parity_error) );
  XNOR2X2M U3 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  XOR3XLM U4 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  XNOR2X2M U5 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  AO21XLM U6 ( .A0(enable), .A1(n1), .B0(parity_error), .Y(n8) );
  XOR3XLM U7 ( .A(n2), .B(n3), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
  CLKXOR2X2M U9 ( .A(serial_data), .B(PAR_TYP), .Y(n2) );
endmodule


module UART_RX_start_check_test_1 ( clk, rst_n, enable, serial_data, 
        start_glitch, test_si, test_se );
  input clk, rst_n, enable, serial_data, test_si, test_se;
  output start_glitch;
  wire   n2;

  SDFFRQX2M start_glitch_reg ( .D(n2), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst_n), .Q(start_glitch) );
  AO21XLM U3 ( .A0(serial_data), .A1(enable), .B0(start_glitch), .Y(n2) );
endmodule


module UART_RX_stop_check_test_1 ( clk, rst_n, enable, serial_data, stop_error, 
        test_si, test_se );
  input clk, rst_n, enable, serial_data, test_si, test_se;
  output stop_error;
  wire   n3, n1;

  SDFFRQX2M stop_error_reg ( .D(n3), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst_n), .Q(stop_error) );
  OAI21BX1M U3 ( .A0(serial_data), .A1(n1), .B0N(stop_error), .Y(n3) );
  INVX2M U4 ( .A(enable), .Y(n1) );
endmodule


module UART_RX_FSM_test_1 ( clk, rst_n, RX_IN, PAR_EN, Prescale, edge_cnt, 
        bit_cnt, par_err, stp_err, start_glitch, dat_samp_en, edge_en, 
        deser_en, par_chk_en, strt_chk_en, stp_chk_en, data_valid, 
        parity_error, stop_error, test_si, test_so, test_se );
  input [5:0] Prescale;
  input [4:0] edge_cnt;
  input [3:0] bit_cnt;
  input clk, rst_n, RX_IN, PAR_EN, par_err, stp_err, start_glitch, test_si,
         test_se;
  output dat_samp_en, edge_en, deser_en, par_chk_en, strt_chk_en, stp_chk_en,
         data_valid, parity_error, stop_error, test_so;
  wire   N56, N57, N58, N59, N81, N82, N83, N84, N85, N86, \r94/carry[5] ,
         \r94/carry[4] , \r94/carry[3] , n1, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55;
  wire   [4:0] Last_edge;
  wire   [2:0] Current_state;
  wire   [2:0] Next_state;
  assign test_so = Current_state[2];
  assign N81 = Prescale[0];

  SDFFRQX2M \Current_state_reg[0]  ( .D(Next_state[0]), .SI(test_si), .SE(
        test_se), .CK(clk), .RN(rst_n), .Q(Current_state[0]) );
  SDFFRQX2M \Current_state_reg[2]  ( .D(Next_state[2]), .SI(Current_state[1]), 
        .SE(test_se), .CK(clk), .RN(rst_n), .Q(Current_state[2]) );
  SDFFRQX1M \Current_state_reg[1]  ( .D(Next_state[1]), .SI(n34), .SE(test_se), 
        .CK(clk), .RN(rst_n), .Q(Current_state[1]) );
  OR4X1M U6 ( .A(n22), .B(n21), .C(n20), .D(n16), .Y(n1) );
  NOR2BX4M U8 ( .AN(par_err), .B(n25), .Y(parity_error) );
  NOR2BX4M U9 ( .AN(stp_err), .B(n25), .Y(stop_error) );
  INVX2M U10 ( .A(Last_edge[2]), .Y(n11) );
  INVX2M U11 ( .A(Prescale[1]), .Y(N82) );
  INVX2M U12 ( .A(Prescale[2]), .Y(n7) );
  BUFX2M U13 ( .A(edge_en), .Y(dat_samp_en) );
  XNOR2X1M U14 ( .A(Prescale[5]), .B(\r94/carry[5] ), .Y(N86) );
  OR2X1M U15 ( .A(Prescale[4]), .B(\r94/carry[4] ), .Y(\r94/carry[5] ) );
  XNOR2X1M U16 ( .A(\r94/carry[4] ), .B(Prescale[4]), .Y(N85) );
  OR2X1M U17 ( .A(Prescale[3]), .B(\r94/carry[3] ), .Y(\r94/carry[4] ) );
  XNOR2X1M U18 ( .A(\r94/carry[3] ), .B(Prescale[3]), .Y(N84) );
  OR2X1M U19 ( .A(Prescale[2]), .B(Prescale[1]), .Y(\r94/carry[3] ) );
  XNOR2X1M U20 ( .A(Prescale[1]), .B(Prescale[2]), .Y(N83) );
  CLKINVX1M U21 ( .A(N81), .Y(Last_edge[0]) );
  NOR2X1M U22 ( .A(Prescale[1]), .B(N81), .Y(n4) );
  AO21XLM U23 ( .A0(N81), .A1(Prescale[1]), .B0(n4), .Y(Last_edge[1]) );
  CLKNAND2X2M U24 ( .A(n4), .B(n7), .Y(n5) );
  OAI21X1M U25 ( .A0(n4), .A1(n7), .B0(n5), .Y(Last_edge[2]) );
  XNOR2X1M U26 ( .A(Prescale[3]), .B(n5), .Y(Last_edge[3]) );
  NOR2X1M U27 ( .A(Prescale[3]), .B(n5), .Y(n6) );
  CLKXOR2X2M U28 ( .A(Prescale[4]), .B(n6), .Y(Last_edge[4]) );
  NOR2X1M U29 ( .A(Last_edge[1]), .B(Last_edge[0]), .Y(n8) );
  AO21XLM U30 ( .A0(Last_edge[0]), .A1(Last_edge[1]), .B0(n8), .Y(N56) );
  CLKNAND2X2M U31 ( .A(n8), .B(n11), .Y(n9) );
  OAI21X1M U32 ( .A0(n8), .A1(n11), .B0(n9), .Y(N57) );
  XNOR2X1M U33 ( .A(Last_edge[3]), .B(n9), .Y(N58) );
  NOR2X1M U34 ( .A(Last_edge[3]), .B(n9), .Y(n10) );
  CLKXOR2X2M U35 ( .A(Last_edge[4]), .B(n10), .Y(N59) );
  NOR2BX1M U36 ( .AN(N81), .B(edge_cnt[0]), .Y(n12) );
  OAI2B2X1M U37 ( .A1N(edge_cnt[1]), .A0(n12), .B0(N82), .B1(n12), .Y(n15) );
  NOR2BX1M U38 ( .AN(edge_cnt[0]), .B(N81), .Y(n13) );
  OAI2B2X1M U39 ( .A1N(N82), .A0(n13), .B0(edge_cnt[1]), .B1(n13), .Y(n14) );
  NAND3BX1M U40 ( .AN(N86), .B(n15), .C(n14), .Y(n22) );
  CLKXOR2X2M U41 ( .A(N85), .B(edge_cnt[4]), .Y(n21) );
  CLKXOR2X2M U42 ( .A(N83), .B(edge_cnt[2]), .Y(n20) );
  CLKXOR2X2M U43 ( .A(N84), .B(edge_cnt[3]), .Y(n16) );
  NOR3X1M U44 ( .A(n1), .B(Current_state[1]), .C(n23), .Y(strt_chk_en) );
  NOR3BX1M U45 ( .AN(Current_state[2]), .B(n1), .C(n24), .Y(stp_chk_en) );
  NOR3X1M U46 ( .A(n24), .B(Current_state[2]), .C(n1), .Y(par_chk_en) );
  CLKINVX1M U47 ( .A(n26), .Y(deser_en) );
  NOR3X1M U48 ( .A(n25), .B(stp_err), .C(par_err), .Y(data_valid) );
  NAND3X1M U49 ( .A(Current_state[1]), .B(Current_state[0]), .C(
        Current_state[2]), .Y(n25) );
  CLKNAND2X2M U50 ( .A(n23), .B(n24), .Y(edge_en) );
  CLKINVX1M U51 ( .A(n27), .Y(n23) );
  OAI31X1M U52 ( .A0(n26), .A1(PAR_EN), .A2(n28), .B0(n29), .Y(Next_state[2])
         );
  OAI21X1M U53 ( .A0(n30), .A1(Current_state[2]), .B0(n31), .Y(n29) );
  NAND3X1M U54 ( .A(Current_state[1]), .B(n27), .C(n30), .Y(n26) );
  OAI2B11X1M U55 ( .A1N(Current_state[1]), .A0(Current_state[2]), .B0(n32), 
        .C0(n24), .Y(Next_state[1]) );
  NAND3X1M U56 ( .A(n27), .B(n33), .C(n30), .Y(n32) );
  NOR2X1M U57 ( .A(n34), .B(Current_state[2]), .Y(n27) );
  MXI2X1M U58 ( .A(n35), .B(n36), .S0(Current_state[2]), .Y(Next_state[0]) );
  CLKNAND2X2M U59 ( .A(Current_state[1]), .B(n37), .Y(n36) );
  MXI2X1M U60 ( .A(n38), .B(RX_IN), .S0(Current_state[0]), .Y(n37) );
  NAND4X1M U61 ( .A(n39), .B(n40), .C(n41), .D(n42), .Y(n38) );
  XNOR2X1M U62 ( .A(edge_cnt[0]), .B(N81), .Y(n42) );
  NOR2X1M U63 ( .A(n43), .B(n44), .Y(n41) );
  CLKXOR2X2M U64 ( .A(edge_cnt[2]), .B(N57), .Y(n44) );
  CLKXOR2X2M U65 ( .A(edge_cnt[1]), .B(N56), .Y(n43) );
  XNOR2X1M U66 ( .A(edge_cnt[3]), .B(N58), .Y(n40) );
  XNOR2X1M U67 ( .A(edge_cnt[4]), .B(N59), .Y(n39) );
  CLKNAND2X2M U68 ( .A(n45), .B(n46), .Y(n35) );
  MXI2X1M U69 ( .A(RX_IN), .B(n47), .S0(Current_state[0]), .Y(n46) );
  NOR2X1M U70 ( .A(Current_state[1]), .B(n33), .Y(n47) );
  CLKINVX1M U71 ( .A(start_glitch), .Y(n33) );
  AOI31X1M U72 ( .A0(n30), .A1(Current_state[1]), .A2(n48), .B0(n31), .Y(n45)
         );
  CLKINVX1M U73 ( .A(n24), .Y(n31) );
  CLKNAND2X2M U74 ( .A(Current_state[1]), .B(n34), .Y(n24) );
  CLKINVX1M U75 ( .A(Current_state[0]), .Y(n34) );
  CLKINVX1M U76 ( .A(n28), .Y(n48) );
  NAND3BX1M U77 ( .AN(bit_cnt[0]), .B(bit_cnt[3]), .C(n49), .Y(n28) );
  NOR2X1M U78 ( .A(bit_cnt[2]), .B(bit_cnt[1]), .Y(n49) );
  AND4X1M U79 ( .A(n50), .B(n51), .C(n52), .D(n53), .Y(n30) );
  XNOR2X1M U80 ( .A(edge_cnt[0]), .B(Last_edge[0]), .Y(n53) );
  NOR2X1M U81 ( .A(n54), .B(n55), .Y(n52) );
  CLKXOR2X2M U82 ( .A(edge_cnt[2]), .B(Last_edge[2]), .Y(n55) );
  CLKXOR2X2M U83 ( .A(edge_cnt[1]), .B(Last_edge[1]), .Y(n54) );
  XNOR2X1M U84 ( .A(edge_cnt[3]), .B(Last_edge[3]), .Y(n51) );
  XNOR2X1M U85 ( .A(edge_cnt[4]), .B(Last_edge[4]), .Y(n50) );
endmodule


module UART_RX_Top_test_1 ( CLK, RST, PAR_TYP, PAR_EN, Prescale, RX_IN, P_DATA, 
        Data_valid, Parity_Error, Stop_Error, test_si, test_so, test_se );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, PAR_TYP, PAR_EN, RX_IN, test_si, test_se;
  output Data_valid, Parity_Error, Stop_Error, test_so;
  wire   enable_des, serial_bit, enable_edge, samp_en, enable_par, Parity_Err,
         enable_str, Start_Err, enable_stp, Stop_Err, n1, n2, n3, n4, n5;
  wire   [3:0] bit_count;
  wire   [4:0] edge_count;
  assign test_so = Stop_Err;

  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  UART_RX_deserializer_test_1 U_desrial ( .clk(CLK), .rst_n(n1), .enable(
        enable_des), .serial_data(serial_bit), .P_DATA(P_DATA), .test_si(
        Parity_Err), .test_so(n4), .test_se(test_se) );
  UART_RX_edge_counter_test_1 U_edge_counter ( .clk(CLK), .rst_n(n1), .enable(
        enable_edge), .PAR_EN(PAR_EN), .Prescale(Prescale), .edge_cnt(
        edge_count), .bit_cnt(bit_count), .test_si(n4), .test_se(test_se) );
  UART_RX_sampler_test_1 U_sampler ( .clk(CLK), .rst_n(n1), .RX_IN(RX_IN), 
        .sample_en(samp_en), .Prescale(Prescale), .edge_count(edge_count), 
        .sampled_bit(serial_bit), .test_so(n3), .test_se(test_se) );
  UART_RX_parity_check_test_1 U_Par_check ( .clk(CLK), .rst_n(n1), .PAR_TYP(
        PAR_TYP), .enable(enable_par), .serial_data(serial_bit), .P_DATA(
        P_DATA), .parity_error(Parity_Err), .test_si(n5), .test_se(test_se) );
  UART_RX_start_check_test_1 U_start_chk ( .clk(CLK), .rst_n(n1), .enable(
        enable_str), .serial_data(serial_bit), .start_glitch(Start_Err), 
        .test_si(n3), .test_se(test_se) );
  UART_RX_stop_check_test_1 U_stop_chk ( .clk(CLK), .rst_n(n1), .enable(
        enable_stp), .serial_data(serial_bit), .stop_error(Stop_Err), 
        .test_si(Start_Err), .test_se(test_se) );
  UART_RX_FSM_test_1 U_FSM ( .clk(CLK), .rst_n(n1), .RX_IN(RX_IN), .PAR_EN(
        PAR_EN), .Prescale(Prescale), .edge_cnt(edge_count), .bit_cnt(
        bit_count), .par_err(Parity_Err), .stp_err(Stop_Err), .start_glitch(
        Start_Err), .dat_samp_en(samp_en), .edge_en(enable_edge), .deser_en(
        enable_des), .par_chk_en(enable_par), .strt_chk_en(enable_str), 
        .stp_chk_en(enable_stp), .data_valid(Data_valid), .parity_error(
        Parity_Error), .stop_error(Stop_Error), .test_si(test_si), .test_so(n5), .test_se(test_se) );
endmodule


module UART_TOP_test_1 ( TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, Prescale, 
        TX_IN_P, TX_IN_V, RX_IN_S, TX_OUT_S, TX_OUT_V, RX_OUT_P, RX_OUT_V, 
        parity_error, stop_error, test_si, test_so, test_se );
  input [5:0] Prescale;
  input [7:0] TX_IN_P;
  output [7:0] RX_OUT_P;
  input TX_CLK, RX_CLK, RST, PAR_TYP, PAR_EN, TX_IN_V, RX_IN_S, test_si,
         test_se;
  output TX_OUT_S, TX_OUT_V, RX_OUT_V, parity_error, stop_error, test_so;
  wire   n1, n2, n4;

  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
  UART_TX_Top_test_1 TX_UNIT ( .clk(TX_CLK), .RST(n1), .PAR_TYP(PAR_TYP), 
        .PAR_EN(PAR_EN), .P_DATA(TX_IN_P), .Data_Valid(TX_IN_V), .TX_OUT(
        TX_OUT_S), .busy(TX_OUT_V), .test_si(n4), .test_so(test_so), .test_se(
        test_se) );
  UART_RX_Top_test_1 RX_UNIT ( .CLK(RX_CLK), .RST(n1), .PAR_TYP(PAR_TYP), 
        .PAR_EN(PAR_EN), .Prescale(Prescale), .RX_IN(RX_IN_S), .P_DATA(
        RX_OUT_P), .Data_valid(RX_OUT_V), .Parity_Error(parity_error), 
        .Stop_Error(stop_error), .test_si(test_si), .test_so(n4), .test_se(
        test_se) );
endmodule


module SYS_CTRL_test_1 ( CLK, RST, ALU_Valid, Rd_Data_Valid, RX_ENABLE, 
        FIFO_FULL, Rd_Data, RX_P_DATA, ALU_OUT, clk_div_en, Wr_En, Rd_En, 
        ALU_EN, CLK_EN, TX_D_VLD, ALU_FUN, Address, Wr_Data, TX_P_DATA, 
        test_si1, test_so2, test_so1, test_se );
  input [7:0] Rd_Data;
  input [7:0] RX_P_DATA;
  input [15:0] ALU_OUT;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] Wr_Data;
  output [7:0] TX_P_DATA;
  input CLK, RST, ALU_Valid, Rd_Data_Valid, RX_ENABLE, FIFO_FULL, test_si1,
         test_se;
  output clk_div_en, Wr_En, Rd_En, ALU_EN, CLK_EN, TX_D_VLD, test_so2,
         test_so1;
  wire   n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n20, n21, n22, n23, n24,
         n25, n26, n27, n40, n42, n43, n44, n45, n46, n47, n48, n49, n113,
         n114, n115, n116, n117, n119, n120, n121, n122, n123, n124, n125,
         n127, n128, n129;
  wire   [3:0] Current_State;
  wire   [3:0] Next_State;

  SDFFRX1M \RX_P_DATA_reg_reg[6]  ( .D(n107), .SI(n124), .SE(test_se), .CK(CLK), .RN(RST), .Q(n123), .QN(n33) );
  SDFFRX1M \RX_P_DATA_reg_reg[5]  ( .D(n106), .SI(n125), .SE(test_se), .CK(CLK), .RN(RST), .Q(n124), .QN(n34) );
  SDFFRX1M \RX_P_DATA_reg_reg[4]  ( .D(n105), .SI(test_si1), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(n125), .QN(n35) );
  SDFFRX1M \RX_P_DATA_reg_reg[2]  ( .D(n103), .SI(n128), .SE(test_se), .CK(CLK), .RN(RST), .Q(n127), .QN(n37) );
  SDFFRX1M \RX_P_DATA_reg_reg[1]  ( .D(n102), .SI(n129), .SE(test_se), .CK(CLK), .RN(RST), .Q(n128), .QN(n38) );
  SDFFRX1M \RX_P_DATA_reg_reg[0]  ( .D(n101), .SI(Current_State[3]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(n129), .QN(n39) );
  SDFFRX1M \W_add_reg_reg[2]  ( .D(n111), .SI(n120), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n119), .QN(n29) );
  SDFFRX1M \W_add_reg_reg[0]  ( .D(n109), .SI(n122), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n121), .QN(n31) );
  SDFFRX1M \W_add_reg_reg[3]  ( .D(n112), .SI(n119), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(test_so2), .QN(n28) );
  SDFFRX1M \W_add_reg_reg[1]  ( .D(n110), .SI(n121), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n120), .QN(n30) );
  SDFFRQX2M \Current_State_reg[2]  ( .D(Next_State[2]), .SI(n44), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Current_State[2]) );
  SDFFRQX2M \Current_State_reg[3]  ( .D(Next_State[3]), .SI(n43), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Current_State[3]) );
  SDFFRQX2M \Current_State_reg[0]  ( .D(Next_State[0]), .SI(Rd_Data_Valid), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(Current_State[0]) );
  SDFFRQX2M \Current_State_reg[1]  ( .D(Next_State[1]), .SI(Current_State[0]), 
        .SE(test_se), .CK(CLK), .RN(RST), .Q(Current_State[1]) );
  SDFFRX1M \RX_P_DATA_reg_reg[7]  ( .D(n108), .SI(n123), .SE(test_se), .CK(CLK), .RN(RST), .Q(n122), .QN(n32) );
  NOR2X2M U22 ( .A(n114), .B(n77), .Y(ALU_FUN[2]) );
  NOR2X2M U23 ( .A(n116), .B(n77), .Y(ALU_FUN[0]) );
  OAI22X2M U24 ( .A0(n29), .A1(n20), .B0(n114), .B1(n78), .Y(Address[2]) );
  NOR4X1M U25 ( .A(Current_State[0]), .B(Current_State[1]), .C(
        Current_State[2]), .D(Current_State[3]), .Y(n70) );
  NOR4X1M U26 ( .A(n45), .B(n43), .C(Current_State[0]), .D(Current_State[1]), 
        .Y(n74) );
  INVX2M U27 ( .A(n51), .Y(n23) );
  INVX2M U28 ( .A(n80), .Y(n26) );
  INVX2M U29 ( .A(n22), .Y(n27) );
  BUFX2M U30 ( .A(n53), .Y(n20) );
  NAND2X2M U31 ( .A(n52), .B(n20), .Y(Wr_En) );
  BUFX2M U32 ( .A(n53), .Y(n21) );
  INVX2M U33 ( .A(FIFO_FULL), .Y(n24) );
  NOR4BX1M U34 ( .AN(Next_State[0]), .B(n44), .C(Next_State[2]), .D(
        Next_State[3]), .Y(n51) );
  NOR2X2M U35 ( .A(n79), .B(n80), .Y(n52) );
  NOR2X2M U36 ( .A(n44), .B(n27), .Y(n80) );
  NOR2X2M U37 ( .A(n115), .B(n77), .Y(ALU_FUN[1]) );
  NAND3X2M U38 ( .A(n43), .B(n45), .C(n98), .Y(n53) );
  BUFX2M U39 ( .A(n50), .Y(n22) );
  NOR3X2M U40 ( .A(n43), .B(n40), .C(n45), .Y(n50) );
  NOR2X2M U41 ( .A(n113), .B(n77), .Y(ALU_FUN[3]) );
  INVX2M U42 ( .A(n65), .Y(n25) );
  NAND2BX2M U43 ( .AN(n94), .B(n26), .Y(n99) );
  NOR3X2M U44 ( .A(ALU_EN), .B(n80), .C(n74), .Y(n68) );
  NOR3X2M U45 ( .A(n46), .B(n113), .C(n117), .Y(n85) );
  NAND4X2M U46 ( .A(n65), .B(n66), .C(n67), .D(n68), .Y(Next_State[3]) );
  NAND2X2M U47 ( .A(n69), .B(n70), .Y(n66) );
  INVX2M U48 ( .A(n77), .Y(ALU_EN) );
  INVX2M U49 ( .A(n78), .Y(Rd_En) );
  NAND2X2M U50 ( .A(n82), .B(n116), .Y(n84) );
  INVX2M U51 ( .A(n67), .Y(n42) );
  OR3X2M U52 ( .A(n56), .B(n54), .C(n42), .Y(TX_D_VLD) );
  AND2X2M U53 ( .A(n64), .B(n98), .Y(n91) );
  OAI22X4M U54 ( .A0(n28), .A1(n20), .B0(n113), .B1(n78), .Y(Address[3]) );
  NOR3BX2M U55 ( .AN(n64), .B(Current_State[0]), .C(Current_State[1]), .Y(n75)
         );
  NAND3X2M U56 ( .A(Current_State[3]), .B(Current_State[2]), .C(n98), .Y(n77)
         );
  AOI21X2M U57 ( .A0(n75), .A1(RX_ENABLE), .B0(n79), .Y(n65) );
  NOR2X2M U58 ( .A(n44), .B(Current_State[0]), .Y(n98) );
  NAND3X2M U59 ( .A(Current_State[1]), .B(Current_State[0]), .C(n64), .Y(n78)
         );
  AOI21X2M U60 ( .A0(ALU_Valid), .A1(n24), .B0(n77), .Y(n76) );
  NAND4X2M U61 ( .A(n71), .B(n72), .C(n52), .D(n73), .Y(Next_State[2]) );
  OAI21X2M U62 ( .A0(n81), .A1(n69), .B0(n70), .Y(n72) );
  NOR4X1M U63 ( .A(n74), .B(n75), .C(Rd_En), .D(n76), .Y(n73) );
  NOR4X1M U64 ( .A(n84), .B(RX_P_DATA[1]), .C(RX_P_DATA[5]), .D(RX_P_DATA[4]), 
        .Y(n81) );
  OAI22X1M U65 ( .A0(n116), .A1(n23), .B0(n51), .B1(n31), .Y(n109) );
  OAI22X1M U66 ( .A0(n115), .A1(n23), .B0(n51), .B1(n30), .Y(n110) );
  OAI22X1M U67 ( .A0(n114), .A1(n23), .B0(n51), .B1(n29), .Y(n111) );
  OAI22X1M U68 ( .A0(n113), .A1(n23), .B0(n51), .B1(n28), .Y(n112) );
  NOR2X2M U69 ( .A(n27), .B(Current_State[1]), .Y(n79) );
  NOR2X2M U70 ( .A(n43), .B(Current_State[3]), .Y(n64) );
  INVX2M U71 ( .A(Current_State[1]), .Y(n44) );
  INVX2M U72 ( .A(Current_State[2]), .Y(n43) );
  INVX2M U73 ( .A(Current_State[3]), .Y(n45) );
  INVX2M U74 ( .A(Current_State[0]), .Y(n40) );
  NAND4X2M U75 ( .A(n95), .B(n78), .C(n96), .D(n97), .Y(Next_State[0]) );
  NAND4X2M U76 ( .A(n70), .B(n116), .C(n92), .D(n100), .Y(n95) );
  AOI32X1M U77 ( .A0(ALU_Valid), .A1(n24), .A2(n42), .B0(n99), .B1(n117), .Y(
        n96) );
  AOI221XLM U78 ( .A0(n94), .A1(n44), .B0(n91), .B1(RX_ENABLE), .C0(n25), .Y(
        n97) );
  OAI221X1M U79 ( .A0(n116), .A1(n78), .B0(n31), .B1(n21), .C0(n26), .Y(
        Address[0]) );
  OAI22X1M U80 ( .A0(n30), .A1(n20), .B0(n115), .B1(n78), .Y(Address[1]) );
  NOR4X1M U81 ( .A(n44), .B(n45), .C(n40), .D(Current_State[2]), .Y(n56) );
  NOR3X2M U82 ( .A(Current_State[2]), .B(Current_State[3]), .C(n40), .Y(n94)
         );
  OAI22X1M U83 ( .A0(n116), .A1(n20), .B0(n52), .B1(n39), .Y(Wr_Data[0]) );
  OAI22X1M U84 ( .A0(n115), .A1(n20), .B0(n52), .B1(n38), .Y(Wr_Data[1]) );
  OAI22X1M U85 ( .A0(n114), .A1(n21), .B0(n52), .B1(n37), .Y(Wr_Data[2]) );
  OAI22X1M U86 ( .A0(n113), .A1(n21), .B0(n52), .B1(n36), .Y(Wr_Data[3]) );
  OAI22X1M U87 ( .A0(n49), .A1(n21), .B0(n52), .B1(n35), .Y(Wr_Data[4]) );
  OAI22X1M U88 ( .A0(n48), .A1(n21), .B0(n52), .B1(n34), .Y(Wr_Data[5]) );
  OAI22X1M U89 ( .A0(n47), .A1(n21), .B0(n52), .B1(n33), .Y(Wr_Data[6]) );
  OAI22X1M U90 ( .A0(n46), .A1(n21), .B0(n52), .B1(n32), .Y(Wr_Data[7]) );
  AOI21X2M U91 ( .A0(Rd_Data_Valid), .A1(n24), .B0(n78), .Y(n89) );
  NOR3X2M U92 ( .A(RX_P_DATA[2]), .B(RX_P_DATA[6]), .C(RX_P_DATA[4]), .Y(n100)
         );
  NAND4X2M U93 ( .A(n86), .B(n87), .C(n71), .D(n88), .Y(Next_State[1]) );
  NAND2X2M U94 ( .A(n94), .B(Current_State[1]), .Y(n86) );
  OAI31X1M U95 ( .A0(n79), .A1(n94), .A2(n74), .B0(RX_ENABLE), .Y(n87) );
  NOR4X1M U96 ( .A(n80), .B(ALU_EN), .C(n42), .D(n89), .Y(n88) );
  NOR2BX2M U97 ( .AN(n90), .B(n91), .Y(n71) );
  NAND4X2M U98 ( .A(n70), .B(RX_P_DATA[4]), .C(n92), .D(n93), .Y(n90) );
  NOR3X2M U99 ( .A(n116), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n93) );
  NAND3X2M U100 ( .A(Current_State[3]), .B(n43), .C(n98), .Y(n67) );
  INVX2M U101 ( .A(RX_P_DATA[0]), .Y(n116) );
  AND3X2M U102 ( .A(n85), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n92) );
  OAI2BB1X2M U103 ( .A0N(Rd_Data[0]), .A1N(n54), .B0(n63), .Y(TX_P_DATA[0]) );
  AOI22X1M U104 ( .A0(ALU_OUT[0]), .A1(n42), .B0(ALU_OUT[8]), .B1(n56), .Y(n63) );
  OAI2BB1X2M U105 ( .A0N(Rd_Data[1]), .A1N(n54), .B0(n62), .Y(TX_P_DATA[1]) );
  AOI22X1M U106 ( .A0(ALU_OUT[1]), .A1(n42), .B0(ALU_OUT[9]), .B1(n56), .Y(n62) );
  OAI2BB1X2M U107 ( .A0N(Rd_Data[2]), .A1N(n54), .B0(n61), .Y(TX_P_DATA[2]) );
  AOI22X1M U108 ( .A0(ALU_OUT[2]), .A1(n42), .B0(ALU_OUT[10]), .B1(n56), .Y(
        n61) );
  OAI2BB1X2M U109 ( .A0N(Rd_Data[3]), .A1N(n54), .B0(n60), .Y(TX_P_DATA[3]) );
  AOI22X1M U110 ( .A0(ALU_OUT[3]), .A1(n42), .B0(ALU_OUT[11]), .B1(n56), .Y(
        n60) );
  OAI2BB1X2M U111 ( .A0N(Rd_Data[4]), .A1N(n54), .B0(n59), .Y(TX_P_DATA[4]) );
  AOI22X1M U112 ( .A0(ALU_OUT[4]), .A1(n42), .B0(ALU_OUT[12]), .B1(n56), .Y(
        n59) );
  OAI2BB1X2M U113 ( .A0N(Rd_Data[5]), .A1N(n54), .B0(n58), .Y(TX_P_DATA[5]) );
  AOI22X1M U114 ( .A0(ALU_OUT[5]), .A1(n42), .B0(ALU_OUT[13]), .B1(n56), .Y(
        n58) );
  OAI2BB1X2M U115 ( .A0N(Rd_Data[6]), .A1N(n54), .B0(n57), .Y(TX_P_DATA[6]) );
  AOI22X1M U116 ( .A0(ALU_OUT[6]), .A1(n42), .B0(ALU_OUT[14]), .B1(n56), .Y(
        n57) );
  OAI2BB1X2M U117 ( .A0N(Rd_Data[7]), .A1N(n54), .B0(n55), .Y(TX_P_DATA[7]) );
  AOI22X1M U118 ( .A0(ALU_OUT[7]), .A1(n42), .B0(ALU_OUT[15]), .B1(n56), .Y(
        n55) );
  AND3X2M U119 ( .A(n82), .B(RX_P_DATA[4]), .C(n83), .Y(n69) );
  NOR3X2M U120 ( .A(n116), .B(RX_P_DATA[5]), .C(RX_P_DATA[1]), .Y(n83) );
  INVX2M U121 ( .A(RX_P_DATA[1]), .Y(n115) );
  INVX2M U122 ( .A(RX_P_DATA[3]), .Y(n113) );
  INVX2M U123 ( .A(RX_P_DATA[2]), .Y(n114) );
  AND3X2M U124 ( .A(n85), .B(RX_P_DATA[6]), .C(RX_P_DATA[2]), .Y(n82) );
  AND3X2M U125 ( .A(n64), .B(Current_State[0]), .C(n44), .Y(n54) );
  INVX2M U126 ( .A(RX_P_DATA[7]), .Y(n46) );
  INVX2M U127 ( .A(RX_ENABLE), .Y(n117) );
  INVX2M U128 ( .A(n68), .Y(CLK_EN) );
  OAI22X1M U129 ( .A0(n27), .A1(n116), .B0(n22), .B1(n39), .Y(n101) );
  OAI22X1M U130 ( .A0(n27), .A1(n115), .B0(n22), .B1(n38), .Y(n102) );
  OAI22X1M U131 ( .A0(n27), .A1(n114), .B0(n22), .B1(n37), .Y(n103) );
  OAI22X1M U132 ( .A0(n27), .A1(n113), .B0(n22), .B1(n36), .Y(n104) );
  OAI22X1M U133 ( .A0(n27), .A1(n49), .B0(n22), .B1(n35), .Y(n105) );
  OAI22X1M U134 ( .A0(n27), .A1(n48), .B0(n22), .B1(n34), .Y(n106) );
  OAI22X1M U135 ( .A0(n27), .A1(n47), .B0(n22), .B1(n33), .Y(n107) );
  OAI22X1M U136 ( .A0(n27), .A1(n46), .B0(n22), .B1(n32), .Y(n108) );
  INVX2M U137 ( .A(RX_P_DATA[4]), .Y(n49) );
  INVX2M U138 ( .A(RX_P_DATA[5]), .Y(n48) );
  INVX2M U139 ( .A(RX_P_DATA[6]), .Y(n47) );
  SDFFRX2M \RX_P_DATA_reg_reg[3]  ( .D(n104), .SI(n127), .SE(test_se), .CK(CLK), .RN(RST), .Q(test_so1), .QN(n36) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
endmodule


module RegFile_DEPTH16_WIDTH8_test_1 ( CLK, RST, Address, WrEn, RdEn, WrData, 
        RdData, RdValid, REG0, REG1, REG2, REG3, test_si2, test_si1, test_so1, 
        test_se );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn, test_si2, test_si1, test_se;
  output RdValid, test_so1;
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
         \REG_FILE[4][0] , N35, N36, N37, N38, N39, N40, N41, N42, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305,
         n306, n307, n308, n309, n310, n311, n312, n313, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n314, n315, n316,
         n317, n318, n319, n320, n321, n322, n323, n324, n325, n326, n327,
         n328, n329, n330, n331, n332, n333, n334, n335, n336, n337, n338,
         n339, n340, n341, n342, n343, n344, n345, n346, n347, n348, n349,
         n350, n351, n352, n353, n354, n355, n356, n357, n358, n359, n360,
         n361, n362, n363, n364, n365, n366, n370, n371, n372, n373;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];
  assign test_so1 = \REG_FILE[6][6] ;

  SDFFSQX2M \REG_FILE_reg[3][5]  ( .D(n207), .SI(REG3[4]), .SE(n373), .CK(CLK), 
        .SN(n342), .Q(REG3[5]) );
  SDFFRQX2M \RdData_reg[7]  ( .D(n313), .SI(RdData[6]), .SE(n370), .CK(CLK), 
        .RN(n342), .Q(RdData[7]) );
  SDFFRQX2M \RdData_reg[6]  ( .D(n312), .SI(RdData[5]), .SE(n373), .CK(CLK), 
        .RN(n351), .Q(RdData[6]) );
  SDFFRQX2M \RdData_reg[5]  ( .D(n311), .SI(RdData[4]), .SE(n372), .CK(CLK), 
        .RN(n351), .Q(RdData[5]) );
  SDFFRQX2M \RdData_reg[4]  ( .D(n310), .SI(RdData[3]), .SE(n371), .CK(CLK), 
        .RN(n351), .Q(RdData[4]) );
  SDFFRQX2M \RdData_reg[3]  ( .D(n309), .SI(RdData[2]), .SE(n370), .CK(CLK), 
        .RN(n351), .Q(RdData[3]) );
  SDFFRQX2M \RdData_reg[2]  ( .D(n308), .SI(RdData[1]), .SE(n373), .CK(CLK), 
        .RN(n351), .Q(RdData[2]) );
  SDFFRQX2M \RdData_reg[1]  ( .D(n307), .SI(RdData[0]), .SE(n372), .CK(CLK), 
        .RN(n351), .Q(RdData[1]) );
  SDFFRQX2M \RdData_reg[0]  ( .D(n306), .SI(\REG_FILE[15][7] ), .SE(n371), 
        .CK(CLK), .RN(n351), .Q(RdData[0]) );
  SDFFRQX2M \REG_FILE_reg[13][7]  ( .D(n289), .SI(\REG_FILE[13][6] ), .SE(n370), .CK(CLK), .RN(n350), .Q(\REG_FILE[13][7] ) );
  SDFFRQX2M \REG_FILE_reg[13][6]  ( .D(n288), .SI(\REG_FILE[13][5] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\REG_FILE[13][6] ) );
  SDFFRQX2M \REG_FILE_reg[13][5]  ( .D(n287), .SI(\REG_FILE[13][4] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\REG_FILE[13][5] ) );
  SDFFRQX2M \REG_FILE_reg[13][4]  ( .D(n286), .SI(\REG_FILE[13][3] ), .SE(n371), .CK(CLK), .RN(n349), .Q(\REG_FILE[13][4] ) );
  SDFFRQX2M \REG_FILE_reg[13][3]  ( .D(n285), .SI(\REG_FILE[13][2] ), .SE(n370), .CK(CLK), .RN(n349), .Q(\REG_FILE[13][3] ) );
  SDFFRQX2M \REG_FILE_reg[13][2]  ( .D(n284), .SI(\REG_FILE[13][1] ), .SE(n373), .CK(CLK), .RN(n349), .Q(\REG_FILE[13][2] ) );
  SDFFRQX2M \REG_FILE_reg[13][1]  ( .D(n283), .SI(\REG_FILE[13][0] ), .SE(n372), .CK(CLK), .RN(n349), .Q(\REG_FILE[13][1] ) );
  SDFFRQX2M \REG_FILE_reg[13][0]  ( .D(n282), .SI(\REG_FILE[12][7] ), .SE(n371), .CK(CLK), .RN(n349), .Q(\REG_FILE[13][0] ) );
  SDFFRQX2M \REG_FILE_reg[9][7]  ( .D(n257), .SI(\REG_FILE[9][6] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[9][7] ) );
  SDFFRQX2M \REG_FILE_reg[9][6]  ( .D(n256), .SI(\REG_FILE[9][5] ), .SE(n373), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[9][6] ) );
  SDFFRQX2M \REG_FILE_reg[9][5]  ( .D(n255), .SI(\REG_FILE[9][4] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[9][5] ) );
  SDFFRQX2M \REG_FILE_reg[9][4]  ( .D(n254), .SI(\REG_FILE[9][3] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[9][4] ) );
  SDFFRQX2M \REG_FILE_reg[9][3]  ( .D(n253), .SI(\REG_FILE[9][2] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[9][3] ) );
  SDFFRQX2M \REG_FILE_reg[9][2]  ( .D(n252), .SI(\REG_FILE[9][1] ), .SE(n373), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[9][2] ) );
  SDFFRQX2M \REG_FILE_reg[9][1]  ( .D(n251), .SI(\REG_FILE[9][0] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[9][1] ) );
  SDFFRQX2M \REG_FILE_reg[9][0]  ( .D(n250), .SI(\REG_FILE[8][7] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[9][0] ) );
  SDFFRQX2M \REG_FILE_reg[5][7]  ( .D(n225), .SI(\REG_FILE[5][6] ), .SE(n370), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[5][7] ) );
  SDFFRQX2M \REG_FILE_reg[5][6]  ( .D(n224), .SI(\REG_FILE[5][5] ), .SE(n373), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[5][6] ) );
  SDFFRQX2M \REG_FILE_reg[5][5]  ( .D(n223), .SI(\REG_FILE[5][4] ), .SE(n372), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[5][5] ) );
  SDFFRQX2M \REG_FILE_reg[5][4]  ( .D(n222), .SI(\REG_FILE[5][3] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[5][4] ) );
  SDFFRQX2M \REG_FILE_reg[5][3]  ( .D(n221), .SI(\REG_FILE[5][2] ), .SE(n370), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[5][3] ) );
  SDFFRQX2M \REG_FILE_reg[5][2]  ( .D(n220), .SI(\REG_FILE[5][1] ), .SE(n373), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[5][2] ) );
  SDFFRQX2M \REG_FILE_reg[5][1]  ( .D(n219), .SI(\REG_FILE[5][0] ), .SE(n372), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[5][1] ) );
  SDFFRQX2M \REG_FILE_reg[5][0]  ( .D(n218), .SI(\REG_FILE[4][7] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[5][0] ) );
  SDFFRQX2M \REG_FILE_reg[15][7]  ( .D(n305), .SI(\REG_FILE[15][6] ), .SE(n370), .CK(CLK), .RN(n351), .Q(\REG_FILE[15][7] ) );
  SDFFRQX2M \REG_FILE_reg[15][6]  ( .D(n304), .SI(\REG_FILE[15][5] ), .SE(n373), .CK(CLK), .RN(n351), .Q(\REG_FILE[15][6] ) );
  SDFFRQX2M \REG_FILE_reg[15][5]  ( .D(n303), .SI(\REG_FILE[15][4] ), .SE(n372), .CK(CLK), .RN(n351), .Q(\REG_FILE[15][5] ) );
  SDFFRQX2M \REG_FILE_reg[15][4]  ( .D(n302), .SI(\REG_FILE[15][3] ), .SE(n371), .CK(CLK), .RN(n351), .Q(\REG_FILE[15][4] ) );
  SDFFRQX2M \REG_FILE_reg[15][3]  ( .D(n301), .SI(\REG_FILE[15][2] ), .SE(n370), .CK(CLK), .RN(n351), .Q(\REG_FILE[15][3] ) );
  SDFFRQX2M \REG_FILE_reg[15][2]  ( .D(n300), .SI(\REG_FILE[15][1] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\REG_FILE[15][2] ) );
  SDFFRQX2M \REG_FILE_reg[15][1]  ( .D(n299), .SI(\REG_FILE[15][0] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\REG_FILE[15][1] ) );
  SDFFRQX2M \REG_FILE_reg[15][0]  ( .D(n298), .SI(\REG_FILE[14][7] ), .SE(n371), .CK(CLK), .RN(n350), .Q(\REG_FILE[15][0] ) );
  SDFFRQX2M \REG_FILE_reg[11][7]  ( .D(n273), .SI(\REG_FILE[11][6] ), .SE(n370), .CK(CLK), .RN(n349), .Q(\REG_FILE[11][7] ) );
  SDFFRQX2M \REG_FILE_reg[11][6]  ( .D(n272), .SI(\REG_FILE[11][5] ), .SE(n373), .CK(CLK), .RN(n348), .Q(\REG_FILE[11][6] ) );
  SDFFRQX2M \REG_FILE_reg[11][5]  ( .D(n271), .SI(\REG_FILE[11][4] ), .SE(n372), .CK(CLK), .RN(n348), .Q(\REG_FILE[11][5] ) );
  SDFFRQX2M \REG_FILE_reg[11][4]  ( .D(n270), .SI(\REG_FILE[11][3] ), .SE(n371), .CK(CLK), .RN(n348), .Q(\REG_FILE[11][4] ) );
  SDFFRQX2M \REG_FILE_reg[11][3]  ( .D(n269), .SI(\REG_FILE[11][2] ), .SE(n370), .CK(CLK), .RN(n348), .Q(\REG_FILE[11][3] ) );
  SDFFRQX2M \REG_FILE_reg[11][2]  ( .D(n268), .SI(\REG_FILE[11][1] ), .SE(n373), .CK(CLK), .RN(n348), .Q(\REG_FILE[11][2] ) );
  SDFFRQX2M \REG_FILE_reg[11][1]  ( .D(n267), .SI(\REG_FILE[11][0] ), .SE(n372), .CK(CLK), .RN(n348), .Q(\REG_FILE[11][1] ) );
  SDFFRQX2M \REG_FILE_reg[11][0]  ( .D(n266), .SI(\REG_FILE[10][7] ), .SE(n371), .CK(CLK), .RN(n348), .Q(\REG_FILE[11][0] ) );
  SDFFRQX2M \REG_FILE_reg[7][7]  ( .D(n241), .SI(\REG_FILE[7][6] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[7][7] ) );
  SDFFRQX2M \REG_FILE_reg[7][6]  ( .D(n240), .SI(\REG_FILE[7][5] ), .SE(n373), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[7][6] ) );
  SDFFRQX2M \REG_FILE_reg[7][5]  ( .D(n239), .SI(\REG_FILE[7][4] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[7][5] ) );
  SDFFRQX2M \REG_FILE_reg[7][4]  ( .D(n238), .SI(\REG_FILE[7][3] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[7][4] ) );
  SDFFRQX2M \REG_FILE_reg[7][3]  ( .D(n237), .SI(\REG_FILE[7][2] ), .SE(n370), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[7][3] ) );
  SDFFRQX2M \REG_FILE_reg[7][2]  ( .D(n236), .SI(\REG_FILE[7][1] ), .SE(n373), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[7][2] ) );
  SDFFRQX2M \REG_FILE_reg[7][1]  ( .D(n235), .SI(\REG_FILE[7][0] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[7][1] ) );
  SDFFRQX2M \REG_FILE_reg[7][0]  ( .D(n234), .SI(\REG_FILE[6][7] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[7][0] ) );
  SDFFRQX2M \REG_FILE_reg[14][7]  ( .D(n297), .SI(\REG_FILE[14][6] ), .SE(n370), .CK(CLK), .RN(n350), .Q(\REG_FILE[14][7] ) );
  SDFFRQX2M \REG_FILE_reg[14][6]  ( .D(n296), .SI(\REG_FILE[14][5] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\REG_FILE[14][6] ) );
  SDFFRQX2M \REG_FILE_reg[14][5]  ( .D(n295), .SI(\REG_FILE[14][4] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\REG_FILE[14][5] ) );
  SDFFRQX2M \REG_FILE_reg[14][4]  ( .D(n294), .SI(\REG_FILE[14][3] ), .SE(n371), .CK(CLK), .RN(n350), .Q(\REG_FILE[14][4] ) );
  SDFFRQX2M \REG_FILE_reg[14][3]  ( .D(n293), .SI(\REG_FILE[14][2] ), .SE(n370), .CK(CLK), .RN(n350), .Q(\REG_FILE[14][3] ) );
  SDFFRQX2M \REG_FILE_reg[14][2]  ( .D(n292), .SI(\REG_FILE[14][1] ), .SE(n373), .CK(CLK), .RN(n350), .Q(\REG_FILE[14][2] ) );
  SDFFRQX2M \REG_FILE_reg[14][1]  ( .D(n291), .SI(\REG_FILE[14][0] ), .SE(n372), .CK(CLK), .RN(n350), .Q(\REG_FILE[14][1] ) );
  SDFFRQX2M \REG_FILE_reg[14][0]  ( .D(n290), .SI(\REG_FILE[13][7] ), .SE(n371), .CK(CLK), .RN(n350), .Q(\REG_FILE[14][0] ) );
  SDFFRQX2M \REG_FILE_reg[10][7]  ( .D(n265), .SI(\REG_FILE[10][6] ), .SE(n370), .CK(CLK), .RN(n348), .Q(\REG_FILE[10][7] ) );
  SDFFRQX2M \REG_FILE_reg[10][6]  ( .D(n264), .SI(\REG_FILE[10][5] ), .SE(n373), .CK(CLK), .RN(n348), .Q(\REG_FILE[10][6] ) );
  SDFFRQX2M \REG_FILE_reg[10][5]  ( .D(n263), .SI(\REG_FILE[10][4] ), .SE(n372), .CK(CLK), .RN(n348), .Q(\REG_FILE[10][5] ) );
  SDFFRQX2M \REG_FILE_reg[10][4]  ( .D(n262), .SI(\REG_FILE[10][3] ), .SE(n371), .CK(CLK), .RN(n348), .Q(\REG_FILE[10][4] ) );
  SDFFRQX2M \REG_FILE_reg[10][3]  ( .D(n261), .SI(\REG_FILE[10][2] ), .SE(n370), .CK(CLK), .RN(n348), .Q(\REG_FILE[10][3] ) );
  SDFFRQX2M \REG_FILE_reg[10][2]  ( .D(n260), .SI(\REG_FILE[10][1] ), .SE(n373), .CK(CLK), .RN(n348), .Q(\REG_FILE[10][2] ) );
  SDFFRQX2M \REG_FILE_reg[10][1]  ( .D(n259), .SI(\REG_FILE[10][0] ), .SE(n372), .CK(CLK), .RN(n348), .Q(\REG_FILE[10][1] ) );
  SDFFRQX2M \REG_FILE_reg[10][0]  ( .D(n258), .SI(\REG_FILE[9][7] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[10][0] ) );
  SDFFRQX2M \REG_FILE_reg[6][7]  ( .D(n233), .SI(test_si2), .SE(n370), .CK(CLK), .RN(n346), .Q(\REG_FILE[6][7] ) );
  SDFFRQX2M \REG_FILE_reg[6][6]  ( .D(n232), .SI(\REG_FILE[6][5] ), .SE(n373), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[6][6] ) );
  SDFFRQX2M \REG_FILE_reg[6][5]  ( .D(n231), .SI(\REG_FILE[6][4] ), .SE(n372), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[6][5] ) );
  SDFFRQX2M \REG_FILE_reg[6][4]  ( .D(n230), .SI(\REG_FILE[6][3] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[6][4] ) );
  SDFFRQX2M \REG_FILE_reg[6][3]  ( .D(n229), .SI(\REG_FILE[6][2] ), .SE(n370), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[6][3] ) );
  SDFFRQX2M \REG_FILE_reg[6][2]  ( .D(n228), .SI(\REG_FILE[6][1] ), .SE(n373), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[6][2] ) );
  SDFFRQX2M \REG_FILE_reg[6][1]  ( .D(n227), .SI(\REG_FILE[6][0] ), .SE(n372), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[6][1] ) );
  SDFFRQX2M \REG_FILE_reg[6][0]  ( .D(n226), .SI(\REG_FILE[5][7] ), .SE(n371), 
        .CK(CLK), .RN(n345), .Q(\REG_FILE[6][0] ) );
  SDFFRQX2M \REG_FILE_reg[12][7]  ( .D(n281), .SI(\REG_FILE[12][6] ), .SE(n370), .CK(CLK), .RN(n349), .Q(\REG_FILE[12][7] ) );
  SDFFRQX2M \REG_FILE_reg[12][6]  ( .D(n280), .SI(\REG_FILE[12][5] ), .SE(n373), .CK(CLK), .RN(n349), .Q(\REG_FILE[12][6] ) );
  SDFFRQX2M \REG_FILE_reg[12][5]  ( .D(n279), .SI(\REG_FILE[12][4] ), .SE(n372), .CK(CLK), .RN(n349), .Q(\REG_FILE[12][5] ) );
  SDFFRQX2M \REG_FILE_reg[12][4]  ( .D(n278), .SI(\REG_FILE[12][3] ), .SE(n371), .CK(CLK), .RN(n349), .Q(\REG_FILE[12][4] ) );
  SDFFRQX2M \REG_FILE_reg[12][3]  ( .D(n277), .SI(\REG_FILE[12][2] ), .SE(n370), .CK(CLK), .RN(n349), .Q(\REG_FILE[12][3] ) );
  SDFFRQX2M \REG_FILE_reg[12][2]  ( .D(n276), .SI(\REG_FILE[12][1] ), .SE(n373), .CK(CLK), .RN(n349), .Q(\REG_FILE[12][2] ) );
  SDFFRQX2M \REG_FILE_reg[12][1]  ( .D(n275), .SI(\REG_FILE[12][0] ), .SE(n372), .CK(CLK), .RN(n349), .Q(\REG_FILE[12][1] ) );
  SDFFRQX2M \REG_FILE_reg[12][0]  ( .D(n274), .SI(\REG_FILE[11][7] ), .SE(n371), .CK(CLK), .RN(n349), .Q(\REG_FILE[12][0] ) );
  SDFFRQX2M \REG_FILE_reg[8][7]  ( .D(n249), .SI(\REG_FILE[8][6] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[8][7] ) );
  SDFFRQX2M \REG_FILE_reg[8][6]  ( .D(n248), .SI(\REG_FILE[8][5] ), .SE(n373), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[8][6] ) );
  SDFFRQX2M \REG_FILE_reg[8][5]  ( .D(n247), .SI(\REG_FILE[8][4] ), .SE(n372), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[8][5] ) );
  SDFFRQX2M \REG_FILE_reg[8][4]  ( .D(n246), .SI(\REG_FILE[8][3] ), .SE(n371), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[8][4] ) );
  SDFFRQX2M \REG_FILE_reg[8][3]  ( .D(n245), .SI(\REG_FILE[8][2] ), .SE(n370), 
        .CK(CLK), .RN(n347), .Q(\REG_FILE[8][3] ) );
  SDFFRQX2M \REG_FILE_reg[8][2]  ( .D(n244), .SI(\REG_FILE[8][1] ), .SE(n373), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[8][2] ) );
  SDFFRQX2M \REG_FILE_reg[8][1]  ( .D(n243), .SI(\REG_FILE[8][0] ), .SE(n372), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[8][1] ) );
  SDFFRQX2M \REG_FILE_reg[8][0]  ( .D(n242), .SI(\REG_FILE[7][7] ), .SE(n371), 
        .CK(CLK), .RN(n346), .Q(\REG_FILE[8][0] ) );
  SDFFRQX2M \REG_FILE_reg[4][7]  ( .D(n217), .SI(\REG_FILE[4][6] ), .SE(n370), 
        .CK(CLK), .RN(n344), .Q(\REG_FILE[4][7] ) );
  SDFFRQX2M \REG_FILE_reg[4][6]  ( .D(n216), .SI(\REG_FILE[4][5] ), .SE(n373), 
        .CK(CLK), .RN(n344), .Q(\REG_FILE[4][6] ) );
  SDFFRQX2M \REG_FILE_reg[4][5]  ( .D(n215), .SI(\REG_FILE[4][4] ), .SE(n372), 
        .CK(CLK), .RN(n344), .Q(\REG_FILE[4][5] ) );
  SDFFRQX2M \REG_FILE_reg[4][4]  ( .D(n214), .SI(\REG_FILE[4][3] ), .SE(n371), 
        .CK(CLK), .RN(n344), .Q(\REG_FILE[4][4] ) );
  SDFFRQX2M \REG_FILE_reg[4][3]  ( .D(n213), .SI(\REG_FILE[4][2] ), .SE(n370), 
        .CK(CLK), .RN(n344), .Q(\REG_FILE[4][3] ) );
  SDFFRQX2M \REG_FILE_reg[4][2]  ( .D(n212), .SI(\REG_FILE[4][1] ), .SE(n373), 
        .CK(CLK), .RN(n344), .Q(\REG_FILE[4][2] ) );
  SDFFRQX2M \REG_FILE_reg[4][1]  ( .D(n211), .SI(\REG_FILE[4][0] ), .SE(n372), 
        .CK(CLK), .RN(n344), .Q(\REG_FILE[4][1] ) );
  SDFFRQX2M \REG_FILE_reg[4][0]  ( .D(n210), .SI(REG3[7]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(\REG_FILE[4][0] ) );
  SDFFRQX2M RdValid_reg ( .D(n365), .SI(RdData[7]), .SE(n370), .CK(CLK), .RN(
        n346), .Q(RdValid) );
  SDFFRQX2M \REG_FILE_reg[3][0]  ( .D(n202), .SI(REG2[7]), .SE(n373), .CK(CLK), 
        .RN(n343), .Q(REG3[0]) );
  SDFFRQX2M \REG_FILE_reg[3][2]  ( .D(n204), .SI(REG3[1]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG3[2]) );
  SDFFRQX2M \REG_FILE_reg[3][3]  ( .D(n205), .SI(REG3[2]), .SE(n371), .CK(CLK), 
        .RN(n344), .Q(REG3[3]) );
  SDFFRQX2M \REG_FILE_reg[3][4]  ( .D(n206), .SI(REG3[3]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG3[4]) );
  SDFFRQX2M \REG_FILE_reg[3][7]  ( .D(n209), .SI(REG3[6]), .SE(n373), .CK(CLK), 
        .RN(n344), .Q(REG3[7]) );
  SDFFRQX2M \REG_FILE_reg[3][6]  ( .D(n208), .SI(REG3[5]), .SE(n372), .CK(CLK), 
        .RN(n344), .Q(REG3[6]) );
  SDFFSQX2M \REG_FILE_reg[2][0]  ( .D(n194), .SI(REG1[7]), .SE(n372), .CK(CLK), 
        .SN(n342), .Q(REG2[0]) );
  SDFFRQX2M \REG_FILE_reg[2][1]  ( .D(n195), .SI(REG2[0]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG2[1]) );
  SDFFRQX2M \REG_FILE_reg[3][1]  ( .D(n203), .SI(REG3[0]), .SE(n370), .CK(CLK), 
        .RN(n344), .Q(REG3[1]) );
  SDFFRQX2M \REG_FILE_reg[2][4]  ( .D(n198), .SI(REG2[3]), .SE(n373), .CK(CLK), 
        .RN(n343), .Q(REG2[4]) );
  SDFFRQX2M \REG_FILE_reg[2][2]  ( .D(n196), .SI(REG2[1]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG2[2]) );
  SDFFRQX2M \REG_FILE_reg[2][3]  ( .D(n197), .SI(REG2[2]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG2[3]) );
  SDFFRQX2M \REG_FILE_reg[2][6]  ( .D(n200), .SI(REG2[5]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG2[6]) );
  SDFFRQX2M \REG_FILE_reg[0][1]  ( .D(n179), .SI(REG0[0]), .SE(n373), .CK(CLK), 
        .RN(n342), .Q(REG0[1]) );
  SDFFRQX2M \REG_FILE_reg[0][0]  ( .D(n178), .SI(test_si1), .SE(n372), .CK(CLK), .RN(n342), .Q(REG0[0]) );
  SDFFRQX2M \REG_FILE_reg[0][2]  ( .D(n180), .SI(REG0[1]), .SE(n371), .CK(CLK), 
        .RN(n342), .Q(REG0[2]) );
  SDFFRQX2M \REG_FILE_reg[0][3]  ( .D(n181), .SI(REG0[2]), .SE(n370), .CK(CLK), 
        .RN(n342), .Q(REG0[3]) );
  SDFFRQX2M \REG_FILE_reg[0][4]  ( .D(n182), .SI(REG0[3]), .SE(n373), .CK(CLK), 
        .RN(n342), .Q(REG0[4]) );
  SDFFRQX2M \REG_FILE_reg[0][5]  ( .D(n183), .SI(REG0[4]), .SE(n372), .CK(CLK), 
        .RN(n342), .Q(REG0[5]) );
  SDFFRQX2M \REG_FILE_reg[0][7]  ( .D(n185), .SI(REG0[6]), .SE(n371), .CK(CLK), 
        .RN(n342), .Q(REG0[7]) );
  SDFFRQX2M \REG_FILE_reg[0][6]  ( .D(n184), .SI(REG0[5]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG0[6]) );
  SDFFRQX2M \REG_FILE_reg[1][7]  ( .D(n193), .SI(REG1[6]), .SE(n373), .CK(CLK), 
        .RN(n343), .Q(REG1[7]) );
  SDFFRQX2M \REG_FILE_reg[1][6]  ( .D(n192), .SI(REG1[5]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG1[6]) );
  SDFFRQX2M \REG_FILE_reg[1][5]  ( .D(n191), .SI(REG1[4]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG1[5]) );
  SDFFRQX2M \REG_FILE_reg[1][4]  ( .D(n190), .SI(REG1[3]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG1[4]) );
  SDFFRQX2M \REG_FILE_reg[1][1]  ( .D(n187), .SI(REG1[0]), .SE(n373), .CK(CLK), 
        .RN(n342), .Q(REG1[1]) );
  SDFFRQX2M \REG_FILE_reg[1][3]  ( .D(n189), .SI(REG1[2]), .SE(n372), .CK(CLK), 
        .RN(n343), .Q(REG1[3]) );
  SDFFRQX2M \REG_FILE_reg[1][2]  ( .D(n188), .SI(REG1[1]), .SE(n371), .CK(CLK), 
        .RN(n343), .Q(REG1[2]) );
  SDFFRQX2M \REG_FILE_reg[2][5]  ( .D(n199), .SI(REG2[4]), .SE(n370), .CK(CLK), 
        .RN(n343), .Q(REG2[5]) );
  SDFFRQX2M \REG_FILE_reg[1][0]  ( .D(n186), .SI(REG0[7]), .SE(test_se), .CK(
        CLK), .RN(n342), .Q(REG1[0]) );
  SDFFSQX1M \REG_FILE_reg[2][7]  ( .D(n201), .SI(REG2[6]), .SE(n371), .CK(CLK), 
        .SN(RST), .Q(REG2[7]) );
  NOR2X2M U141 ( .A(n341), .B(N13), .Y(n156) );
  NOR2X2M U142 ( .A(N12), .B(N13), .Y(n151) );
  INVX2M U143 ( .A(WrData[0]), .Y(n357) );
  INVX2M U144 ( .A(WrData[1]), .Y(n358) );
  INVX2M U145 ( .A(WrData[2]), .Y(n359) );
  INVX2M U146 ( .A(WrData[3]), .Y(n360) );
  INVX2M U147 ( .A(WrData[4]), .Y(n361) );
  INVX2M U148 ( .A(WrData[5]), .Y(n362) );
  INVX2M U149 ( .A(WrData[6]), .Y(n363) );
  INVX2M U150 ( .A(WrData[7]), .Y(n364) );
  INVX2M U151 ( .A(n337), .Y(n339) );
  INVX2M U152 ( .A(n337), .Y(n338) );
  INVX2M U153 ( .A(n335), .Y(n336) );
  BUFX2M U154 ( .A(n340), .Y(n337) );
  BUFX2M U155 ( .A(n341), .Y(n335) );
  INVX2M U156 ( .A(n177), .Y(n365) );
  NAND2X2M U157 ( .A(n154), .B(n151), .Y(n153) );
  NAND2X2M U158 ( .A(n167), .B(n151), .Y(n166) );
  NAND2X2M U159 ( .A(n169), .B(n151), .Y(n168) );
  NAND2X2M U160 ( .A(n167), .B(n156), .Y(n170) );
  NAND2X2M U161 ( .A(n169), .B(n156), .Y(n171) );
  NAND2X2M U162 ( .A(n156), .B(n152), .Y(n155) );
  NAND2X2M U163 ( .A(n156), .B(n154), .Y(n157) );
  NAND2X2M U164 ( .A(n159), .B(n152), .Y(n158) );
  NAND2X2M U165 ( .A(n159), .B(n154), .Y(n160) );
  NAND2X2M U166 ( .A(n162), .B(n152), .Y(n161) );
  NAND2X2M U167 ( .A(n162), .B(n154), .Y(n164) );
  NAND2X2M U168 ( .A(n167), .B(n159), .Y(n172) );
  NAND2X2M U169 ( .A(n169), .B(n159), .Y(n173) );
  NAND2X2M U170 ( .A(n167), .B(n162), .Y(n174) );
  NAND2X2M U171 ( .A(n169), .B(n162), .Y(n176) );
  NAND2X2M U172 ( .A(n151), .B(n152), .Y(n150) );
  AND2X2M U173 ( .A(n163), .B(n338), .Y(n154) );
  AND2X2M U174 ( .A(n175), .B(n338), .Y(n169) );
  NOR2X2M U175 ( .A(n366), .B(RdEn), .Y(n165) );
  INVX2M U176 ( .A(WrEn), .Y(n366) );
  NAND2X2M U177 ( .A(RdEn), .B(n366), .Y(n177) );
  BUFX2M U178 ( .A(n356), .Y(n343) );
  BUFX2M U179 ( .A(n355), .Y(n344) );
  BUFX2M U180 ( .A(n355), .Y(n345) );
  BUFX2M U181 ( .A(n354), .Y(n346) );
  BUFX2M U182 ( .A(n354), .Y(n347) );
  BUFX2M U183 ( .A(n353), .Y(n348) );
  BUFX2M U184 ( .A(n353), .Y(n349) );
  BUFX2M U185 ( .A(n352), .Y(n350) );
  BUFX2M U186 ( .A(n356), .Y(n342) );
  BUFX2M U187 ( .A(n352), .Y(n351) );
  NOR2BX2M U188 ( .AN(n165), .B(N14), .Y(n163) );
  AND2X2M U189 ( .A(n163), .B(n340), .Y(n152) );
  AND2X2M U190 ( .A(n175), .B(n340), .Y(n167) );
  AND2X2M U191 ( .A(N14), .B(n165), .Y(n175) );
  AND2X2M U192 ( .A(N13), .B(n341), .Y(n159) );
  AND2X2M U193 ( .A(N13), .B(N12), .Y(n162) );
  BUFX2M U194 ( .A(RST), .Y(n355) );
  BUFX2M U195 ( .A(RST), .Y(n354) );
  BUFX2M U196 ( .A(RST), .Y(n353) );
  BUFX2M U197 ( .A(RST), .Y(n352) );
  BUFX2M U198 ( .A(RST), .Y(n356) );
  OAI2BB2X1M U199 ( .B0(n150), .B1(n357), .A0N(REG0[0]), .A1N(n150), .Y(n178)
         );
  OAI2BB2X1M U200 ( .B0(n150), .B1(n358), .A0N(REG0[1]), .A1N(n150), .Y(n179)
         );
  OAI2BB2X1M U201 ( .B0(n150), .B1(n359), .A0N(REG0[2]), .A1N(n150), .Y(n180)
         );
  OAI2BB2X1M U202 ( .B0(n150), .B1(n360), .A0N(REG0[3]), .A1N(n150), .Y(n181)
         );
  OAI2BB2X1M U203 ( .B0(n150), .B1(n361), .A0N(REG0[4]), .A1N(n150), .Y(n182)
         );
  OAI2BB2X1M U204 ( .B0(n150), .B1(n362), .A0N(REG0[5]), .A1N(n150), .Y(n183)
         );
  OAI2BB2X1M U205 ( .B0(n150), .B1(n363), .A0N(REG0[6]), .A1N(n150), .Y(n184)
         );
  OAI2BB2X1M U206 ( .B0(n150), .B1(n364), .A0N(REG0[7]), .A1N(n150), .Y(n185)
         );
  OAI2BB2X1M U207 ( .B0(n358), .B1(n155), .A0N(REG2[1]), .A1N(n155), .Y(n195)
         );
  OAI2BB2X1M U208 ( .B0(n359), .B1(n155), .A0N(REG2[2]), .A1N(n155), .Y(n196)
         );
  OAI2BB2X1M U209 ( .B0(n360), .B1(n155), .A0N(REG2[3]), .A1N(n155), .Y(n197)
         );
  OAI2BB2X1M U210 ( .B0(n361), .B1(n155), .A0N(REG2[4]), .A1N(n155), .Y(n198)
         );
  OAI2BB2X1M U211 ( .B0(n362), .B1(n155), .A0N(REG2[5]), .A1N(n155), .Y(n199)
         );
  OAI2BB2X1M U212 ( .B0(n363), .B1(n155), .A0N(REG2[6]), .A1N(n155), .Y(n200)
         );
  OAI2BB2X1M U213 ( .B0(n357), .B1(n157), .A0N(REG3[0]), .A1N(n157), .Y(n202)
         );
  OAI2BB2X1M U214 ( .B0(n358), .B1(n157), .A0N(REG3[1]), .A1N(n157), .Y(n203)
         );
  OAI2BB2X1M U215 ( .B0(n359), .B1(n157), .A0N(REG3[2]), .A1N(n157), .Y(n204)
         );
  OAI2BB2X1M U216 ( .B0(n360), .B1(n157), .A0N(REG3[3]), .A1N(n157), .Y(n205)
         );
  OAI2BB2X1M U217 ( .B0(n361), .B1(n157), .A0N(REG3[4]), .A1N(n157), .Y(n206)
         );
  OAI2BB2X1M U218 ( .B0(n363), .B1(n157), .A0N(REG3[6]), .A1N(n157), .Y(n208)
         );
  OAI2BB2X1M U219 ( .B0(n364), .B1(n157), .A0N(REG3[7]), .A1N(n157), .Y(n209)
         );
  OAI2BB2X1M U220 ( .B0(n357), .B1(n153), .A0N(REG1[0]), .A1N(n153), .Y(n186)
         );
  OAI2BB2X1M U221 ( .B0(n358), .B1(n153), .A0N(REG1[1]), .A1N(n153), .Y(n187)
         );
  OAI2BB2X1M U222 ( .B0(n359), .B1(n153), .A0N(REG1[2]), .A1N(n153), .Y(n188)
         );
  OAI2BB2X1M U223 ( .B0(n360), .B1(n153), .A0N(REG1[3]), .A1N(n153), .Y(n189)
         );
  OAI2BB2X1M U224 ( .B0(n361), .B1(n153), .A0N(REG1[4]), .A1N(n153), .Y(n190)
         );
  OAI2BB2X1M U225 ( .B0(n362), .B1(n153), .A0N(REG1[5]), .A1N(n153), .Y(n191)
         );
  OAI2BB2X1M U226 ( .B0(n363), .B1(n153), .A0N(REG1[6]), .A1N(n153), .Y(n192)
         );
  OAI2BB2X1M U227 ( .B0(n364), .B1(n153), .A0N(REG1[7]), .A1N(n153), .Y(n193)
         );
  OAI2BB2X1M U228 ( .B0(n357), .B1(n166), .A0N(\REG_FILE[8][0] ), .A1N(n166), 
        .Y(n242) );
  OAI2BB2X1M U229 ( .B0(n358), .B1(n166), .A0N(\REG_FILE[8][1] ), .A1N(n166), 
        .Y(n243) );
  OAI2BB2X1M U230 ( .B0(n359), .B1(n166), .A0N(\REG_FILE[8][2] ), .A1N(n166), 
        .Y(n244) );
  OAI2BB2X1M U231 ( .B0(n360), .B1(n166), .A0N(\REG_FILE[8][3] ), .A1N(n166), 
        .Y(n245) );
  OAI2BB2X1M U232 ( .B0(n361), .B1(n166), .A0N(\REG_FILE[8][4] ), .A1N(n166), 
        .Y(n246) );
  OAI2BB2X1M U233 ( .B0(n362), .B1(n166), .A0N(\REG_FILE[8][5] ), .A1N(n166), 
        .Y(n247) );
  OAI2BB2X1M U234 ( .B0(n363), .B1(n166), .A0N(\REG_FILE[8][6] ), .A1N(n166), 
        .Y(n248) );
  OAI2BB2X1M U235 ( .B0(n364), .B1(n166), .A0N(\REG_FILE[8][7] ), .A1N(n166), 
        .Y(n249) );
  OAI2BB2X1M U236 ( .B0(n357), .B1(n168), .A0N(\REG_FILE[9][0] ), .A1N(n168), 
        .Y(n250) );
  OAI2BB2X1M U237 ( .B0(n358), .B1(n168), .A0N(\REG_FILE[9][1] ), .A1N(n168), 
        .Y(n251) );
  OAI2BB2X1M U238 ( .B0(n359), .B1(n168), .A0N(\REG_FILE[9][2] ), .A1N(n168), 
        .Y(n252) );
  OAI2BB2X1M U239 ( .B0(n360), .B1(n168), .A0N(\REG_FILE[9][3] ), .A1N(n168), 
        .Y(n253) );
  OAI2BB2X1M U240 ( .B0(n361), .B1(n168), .A0N(\REG_FILE[9][4] ), .A1N(n168), 
        .Y(n254) );
  OAI2BB2X1M U241 ( .B0(n362), .B1(n168), .A0N(\REG_FILE[9][5] ), .A1N(n168), 
        .Y(n255) );
  OAI2BB2X1M U242 ( .B0(n363), .B1(n168), .A0N(\REG_FILE[9][6] ), .A1N(n168), 
        .Y(n256) );
  OAI2BB2X1M U243 ( .B0(n364), .B1(n168), .A0N(\REG_FILE[9][7] ), .A1N(n168), 
        .Y(n257) );
  OAI2BB2X1M U244 ( .B0(n357), .B1(n170), .A0N(\REG_FILE[10][0] ), .A1N(n170), 
        .Y(n258) );
  OAI2BB2X1M U245 ( .B0(n358), .B1(n170), .A0N(\REG_FILE[10][1] ), .A1N(n170), 
        .Y(n259) );
  OAI2BB2X1M U246 ( .B0(n359), .B1(n170), .A0N(\REG_FILE[10][2] ), .A1N(n170), 
        .Y(n260) );
  OAI2BB2X1M U247 ( .B0(n360), .B1(n170), .A0N(\REG_FILE[10][3] ), .A1N(n170), 
        .Y(n261) );
  OAI2BB2X1M U248 ( .B0(n361), .B1(n170), .A0N(\REG_FILE[10][4] ), .A1N(n170), 
        .Y(n262) );
  OAI2BB2X1M U249 ( .B0(n362), .B1(n170), .A0N(\REG_FILE[10][5] ), .A1N(n170), 
        .Y(n263) );
  OAI2BB2X1M U250 ( .B0(n363), .B1(n170), .A0N(\REG_FILE[10][6] ), .A1N(n170), 
        .Y(n264) );
  OAI2BB2X1M U251 ( .B0(n364), .B1(n170), .A0N(\REG_FILE[10][7] ), .A1N(n170), 
        .Y(n265) );
  OAI2BB2X1M U252 ( .B0(n357), .B1(n171), .A0N(\REG_FILE[11][0] ), .A1N(n171), 
        .Y(n266) );
  OAI2BB2X1M U253 ( .B0(n358), .B1(n171), .A0N(\REG_FILE[11][1] ), .A1N(n171), 
        .Y(n267) );
  OAI2BB2X1M U254 ( .B0(n359), .B1(n171), .A0N(\REG_FILE[11][2] ), .A1N(n171), 
        .Y(n268) );
  OAI2BB2X1M U255 ( .B0(n360), .B1(n171), .A0N(\REG_FILE[11][3] ), .A1N(n171), 
        .Y(n269) );
  OAI2BB2X1M U256 ( .B0(n361), .B1(n171), .A0N(\REG_FILE[11][4] ), .A1N(n171), 
        .Y(n270) );
  OAI2BB2X1M U257 ( .B0(n362), .B1(n171), .A0N(\REG_FILE[11][5] ), .A1N(n171), 
        .Y(n271) );
  OAI2BB2X1M U258 ( .B0(n363), .B1(n171), .A0N(\REG_FILE[11][6] ), .A1N(n171), 
        .Y(n272) );
  OAI2BB2X1M U259 ( .B0(n364), .B1(n171), .A0N(\REG_FILE[11][7] ), .A1N(n171), 
        .Y(n273) );
  OAI2BB2X1M U260 ( .B0(n357), .B1(n155), .A0N(REG2[0]), .A1N(n155), .Y(n194)
         );
  OAI2BB2X1M U261 ( .B0(n364), .B1(n155), .A0N(REG2[7]), .A1N(n155), .Y(n201)
         );
  OAI2BB2X1M U262 ( .B0(n362), .B1(n157), .A0N(REG3[5]), .A1N(n157), .Y(n207)
         );
  OAI2BB2X1M U263 ( .B0(n357), .B1(n172), .A0N(\REG_FILE[12][0] ), .A1N(n172), 
        .Y(n274) );
  OAI2BB2X1M U264 ( .B0(n358), .B1(n172), .A0N(\REG_FILE[12][1] ), .A1N(n172), 
        .Y(n275) );
  OAI2BB2X1M U265 ( .B0(n359), .B1(n172), .A0N(\REG_FILE[12][2] ), .A1N(n172), 
        .Y(n276) );
  OAI2BB2X1M U266 ( .B0(n360), .B1(n172), .A0N(\REG_FILE[12][3] ), .A1N(n172), 
        .Y(n277) );
  OAI2BB2X1M U267 ( .B0(n361), .B1(n172), .A0N(\REG_FILE[12][4] ), .A1N(n172), 
        .Y(n278) );
  OAI2BB2X1M U268 ( .B0(n362), .B1(n172), .A0N(\REG_FILE[12][5] ), .A1N(n172), 
        .Y(n279) );
  OAI2BB2X1M U269 ( .B0(n363), .B1(n172), .A0N(\REG_FILE[12][6] ), .A1N(n172), 
        .Y(n280) );
  OAI2BB2X1M U270 ( .B0(n364), .B1(n172), .A0N(\REG_FILE[12][7] ), .A1N(n172), 
        .Y(n281) );
  OAI2BB2X1M U271 ( .B0(n357), .B1(n173), .A0N(\REG_FILE[13][0] ), .A1N(n173), 
        .Y(n282) );
  OAI2BB2X1M U272 ( .B0(n358), .B1(n173), .A0N(\REG_FILE[13][1] ), .A1N(n173), 
        .Y(n283) );
  OAI2BB2X1M U273 ( .B0(n359), .B1(n173), .A0N(\REG_FILE[13][2] ), .A1N(n173), 
        .Y(n284) );
  OAI2BB2X1M U274 ( .B0(n360), .B1(n173), .A0N(\REG_FILE[13][3] ), .A1N(n173), 
        .Y(n285) );
  OAI2BB2X1M U275 ( .B0(n361), .B1(n173), .A0N(\REG_FILE[13][4] ), .A1N(n173), 
        .Y(n286) );
  OAI2BB2X1M U276 ( .B0(n362), .B1(n173), .A0N(\REG_FILE[13][5] ), .A1N(n173), 
        .Y(n287) );
  OAI2BB2X1M U277 ( .B0(n363), .B1(n173), .A0N(\REG_FILE[13][6] ), .A1N(n173), 
        .Y(n288) );
  OAI2BB2X1M U278 ( .B0(n364), .B1(n173), .A0N(\REG_FILE[13][7] ), .A1N(n173), 
        .Y(n289) );
  OAI2BB2X1M U279 ( .B0(n357), .B1(n174), .A0N(\REG_FILE[14][0] ), .A1N(n174), 
        .Y(n290) );
  OAI2BB2X1M U280 ( .B0(n358), .B1(n174), .A0N(\REG_FILE[14][1] ), .A1N(n174), 
        .Y(n291) );
  OAI2BB2X1M U281 ( .B0(n359), .B1(n174), .A0N(\REG_FILE[14][2] ), .A1N(n174), 
        .Y(n292) );
  OAI2BB2X1M U282 ( .B0(n360), .B1(n174), .A0N(\REG_FILE[14][3] ), .A1N(n174), 
        .Y(n293) );
  OAI2BB2X1M U283 ( .B0(n361), .B1(n174), .A0N(\REG_FILE[14][4] ), .A1N(n174), 
        .Y(n294) );
  OAI2BB2X1M U284 ( .B0(n362), .B1(n174), .A0N(\REG_FILE[14][5] ), .A1N(n174), 
        .Y(n295) );
  OAI2BB2X1M U285 ( .B0(n363), .B1(n174), .A0N(\REG_FILE[14][6] ), .A1N(n174), 
        .Y(n296) );
  OAI2BB2X1M U286 ( .B0(n364), .B1(n174), .A0N(\REG_FILE[14][7] ), .A1N(n174), 
        .Y(n297) );
  OAI2BB2X1M U287 ( .B0(n357), .B1(n176), .A0N(\REG_FILE[15][0] ), .A1N(n176), 
        .Y(n298) );
  OAI2BB2X1M U288 ( .B0(n358), .B1(n176), .A0N(\REG_FILE[15][1] ), .A1N(n176), 
        .Y(n299) );
  OAI2BB2X1M U289 ( .B0(n359), .B1(n176), .A0N(\REG_FILE[15][2] ), .A1N(n176), 
        .Y(n300) );
  OAI2BB2X1M U290 ( .B0(n360), .B1(n176), .A0N(\REG_FILE[15][3] ), .A1N(n176), 
        .Y(n301) );
  OAI2BB2X1M U291 ( .B0(n361), .B1(n176), .A0N(\REG_FILE[15][4] ), .A1N(n176), 
        .Y(n302) );
  OAI2BB2X1M U292 ( .B0(n362), .B1(n176), .A0N(\REG_FILE[15][5] ), .A1N(n176), 
        .Y(n303) );
  OAI2BB2X1M U293 ( .B0(n363), .B1(n176), .A0N(\REG_FILE[15][6] ), .A1N(n176), 
        .Y(n304) );
  OAI2BB2X1M U294 ( .B0(n364), .B1(n176), .A0N(\REG_FILE[15][7] ), .A1N(n176), 
        .Y(n305) );
  OAI2BB2X1M U295 ( .B0(n357), .B1(n158), .A0N(\REG_FILE[4][0] ), .A1N(n158), 
        .Y(n210) );
  OAI2BB2X1M U296 ( .B0(n358), .B1(n158), .A0N(\REG_FILE[4][1] ), .A1N(n158), 
        .Y(n211) );
  OAI2BB2X1M U297 ( .B0(n359), .B1(n158), .A0N(\REG_FILE[4][2] ), .A1N(n158), 
        .Y(n212) );
  OAI2BB2X1M U298 ( .B0(n360), .B1(n158), .A0N(\REG_FILE[4][3] ), .A1N(n158), 
        .Y(n213) );
  OAI2BB2X1M U299 ( .B0(n361), .B1(n158), .A0N(\REG_FILE[4][4] ), .A1N(n158), 
        .Y(n214) );
  OAI2BB2X1M U300 ( .B0(n362), .B1(n158), .A0N(\REG_FILE[4][5] ), .A1N(n158), 
        .Y(n215) );
  OAI2BB2X1M U301 ( .B0(n363), .B1(n158), .A0N(\REG_FILE[4][6] ), .A1N(n158), 
        .Y(n216) );
  OAI2BB2X1M U302 ( .B0(n364), .B1(n158), .A0N(\REG_FILE[4][7] ), .A1N(n158), 
        .Y(n217) );
  OAI2BB2X1M U303 ( .B0(n357), .B1(n160), .A0N(\REG_FILE[5][0] ), .A1N(n160), 
        .Y(n218) );
  OAI2BB2X1M U304 ( .B0(n358), .B1(n160), .A0N(\REG_FILE[5][1] ), .A1N(n160), 
        .Y(n219) );
  OAI2BB2X1M U305 ( .B0(n359), .B1(n160), .A0N(\REG_FILE[5][2] ), .A1N(n160), 
        .Y(n220) );
  OAI2BB2X1M U306 ( .B0(n360), .B1(n160), .A0N(\REG_FILE[5][3] ), .A1N(n160), 
        .Y(n221) );
  OAI2BB2X1M U307 ( .B0(n361), .B1(n160), .A0N(\REG_FILE[5][4] ), .A1N(n160), 
        .Y(n222) );
  OAI2BB2X1M U308 ( .B0(n362), .B1(n160), .A0N(\REG_FILE[5][5] ), .A1N(n160), 
        .Y(n223) );
  OAI2BB2X1M U309 ( .B0(n363), .B1(n160), .A0N(\REG_FILE[5][6] ), .A1N(n160), 
        .Y(n224) );
  OAI2BB2X1M U310 ( .B0(n364), .B1(n160), .A0N(\REG_FILE[5][7] ), .A1N(n160), 
        .Y(n225) );
  OAI2BB2X1M U311 ( .B0(n357), .B1(n161), .A0N(\REG_FILE[6][0] ), .A1N(n161), 
        .Y(n226) );
  OAI2BB2X1M U312 ( .B0(n358), .B1(n161), .A0N(\REG_FILE[6][1] ), .A1N(n161), 
        .Y(n227) );
  OAI2BB2X1M U313 ( .B0(n359), .B1(n161), .A0N(\REG_FILE[6][2] ), .A1N(n161), 
        .Y(n228) );
  OAI2BB2X1M U314 ( .B0(n360), .B1(n161), .A0N(\REG_FILE[6][3] ), .A1N(n161), 
        .Y(n229) );
  OAI2BB2X1M U315 ( .B0(n361), .B1(n161), .A0N(\REG_FILE[6][4] ), .A1N(n161), 
        .Y(n230) );
  OAI2BB2X1M U316 ( .B0(n362), .B1(n161), .A0N(\REG_FILE[6][5] ), .A1N(n161), 
        .Y(n231) );
  OAI2BB2X1M U317 ( .B0(n363), .B1(n161), .A0N(\REG_FILE[6][6] ), .A1N(n161), 
        .Y(n232) );
  OAI2BB2X1M U318 ( .B0(n364), .B1(n161), .A0N(\REG_FILE[6][7] ), .A1N(n161), 
        .Y(n233) );
  OAI2BB2X1M U319 ( .B0(n357), .B1(n164), .A0N(\REG_FILE[7][0] ), .A1N(n164), 
        .Y(n234) );
  OAI2BB2X1M U320 ( .B0(n358), .B1(n164), .A0N(\REG_FILE[7][1] ), .A1N(n164), 
        .Y(n235) );
  OAI2BB2X1M U321 ( .B0(n359), .B1(n164), .A0N(\REG_FILE[7][2] ), .A1N(n164), 
        .Y(n236) );
  OAI2BB2X1M U322 ( .B0(n360), .B1(n164), .A0N(\REG_FILE[7][3] ), .A1N(n164), 
        .Y(n237) );
  OAI2BB2X1M U323 ( .B0(n361), .B1(n164), .A0N(\REG_FILE[7][4] ), .A1N(n164), 
        .Y(n238) );
  OAI2BB2X1M U324 ( .B0(n362), .B1(n164), .A0N(\REG_FILE[7][5] ), .A1N(n164), 
        .Y(n239) );
  OAI2BB2X1M U325 ( .B0(n363), .B1(n164), .A0N(\REG_FILE[7][6] ), .A1N(n164), 
        .Y(n240) );
  OAI2BB2X1M U326 ( .B0(n364), .B1(n164), .A0N(\REG_FILE[7][7] ), .A1N(n164), 
        .Y(n241) );
  AO22X1M U327 ( .A0(N42), .A1(n365), .B0(RdData[0]), .B1(n177), .Y(n306) );
  MX4X1M U328 ( .A(n142), .B(n140), .C(n141), .D(n139), .S0(N14), .S1(N13), 
        .Y(N42) );
  MX4X1M U329 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n338), 
        .S1(N12), .Y(n142) );
  MX4X1M U330 ( .A(\REG_FILE[8][0] ), .B(\REG_FILE[9][0] ), .C(
        \REG_FILE[10][0] ), .D(\REG_FILE[11][0] ), .S0(n338), .S1(N12), .Y(
        n140) );
  AO22X1M U331 ( .A0(N41), .A1(n365), .B0(RdData[1]), .B1(n177), .Y(n307) );
  MX4X1M U332 ( .A(n146), .B(n144), .C(n145), .D(n143), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U333 ( .A(\REG_FILE[8][1] ), .B(\REG_FILE[9][1] ), .C(
        \REG_FILE[10][1] ), .D(\REG_FILE[11][1] ), .S0(n338), .S1(N12), .Y(
        n144) );
  MX4X1M U334 ( .A(\REG_FILE[12][1] ), .B(\REG_FILE[13][1] ), .C(
        \REG_FILE[14][1] ), .D(\REG_FILE[15][1] ), .S0(n338), .S1(n336), .Y(
        n143) );
  AO22X1M U335 ( .A0(N40), .A1(n365), .B0(RdData[2]), .B1(n177), .Y(n308) );
  MX4X1M U336 ( .A(n314), .B(n148), .C(n149), .D(n147), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U337 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n339), 
        .S1(n336), .Y(n314) );
  MX4X1M U338 ( .A(\REG_FILE[8][2] ), .B(\REG_FILE[9][2] ), .C(
        \REG_FILE[10][2] ), .D(\REG_FILE[11][2] ), .S0(n339), .S1(n336), .Y(
        n148) );
  AO22X1M U339 ( .A0(N39), .A1(n365), .B0(RdData[3]), .B1(n177), .Y(n309) );
  MX4X1M U340 ( .A(n318), .B(n316), .C(n317), .D(n315), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U341 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n339), 
        .S1(n336), .Y(n318) );
  MX4X1M U342 ( .A(\REG_FILE[8][3] ), .B(\REG_FILE[9][3] ), .C(
        \REG_FILE[10][3] ), .D(\REG_FILE[11][3] ), .S0(n339), .S1(n336), .Y(
        n316) );
  AO22X1M U343 ( .A0(N38), .A1(n365), .B0(RdData[4]), .B1(n177), .Y(n310) );
  MX4X1M U344 ( .A(n322), .B(n320), .C(n321), .D(n319), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U345 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(N11), 
        .S1(n336), .Y(n322) );
  MX4X1M U346 ( .A(\REG_FILE[8][4] ), .B(\REG_FILE[9][4] ), .C(
        \REG_FILE[10][4] ), .D(\REG_FILE[11][4] ), .S0(n339), .S1(n336), .Y(
        n320) );
  AO22X1M U347 ( .A0(N37), .A1(n365), .B0(RdData[5]), .B1(n177), .Y(n311) );
  MX4X1M U348 ( .A(n326), .B(n324), .C(n325), .D(n323), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U349 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(N11), 
        .S1(N12), .Y(n326) );
  MX4X1M U350 ( .A(\REG_FILE[8][5] ), .B(\REG_FILE[9][5] ), .C(
        \REG_FILE[10][5] ), .D(\REG_FILE[11][5] ), .S0(n338), .S1(N12), .Y(
        n324) );
  AO22X1M U351 ( .A0(N36), .A1(n365), .B0(RdData[6]), .B1(n177), .Y(n312) );
  MX4X1M U352 ( .A(n330), .B(n328), .C(n329), .D(n327), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U353 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(N11), 
        .S1(N12), .Y(n330) );
  MX4X1M U354 ( .A(\REG_FILE[8][6] ), .B(\REG_FILE[9][6] ), .C(
        \REG_FILE[10][6] ), .D(\REG_FILE[11][6] ), .S0(n339), .S1(N12), .Y(
        n328) );
  AO22X1M U355 ( .A0(N35), .A1(n365), .B0(RdData[7]), .B1(n177), .Y(n313) );
  MX4X1M U356 ( .A(n334), .B(n332), .C(n333), .D(n331), .S0(N14), .S1(N13), 
        .Y(N35) );
  MX4X1M U357 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(N11), 
        .S1(N12), .Y(n334) );
  MX4X1M U358 ( .A(\REG_FILE[8][7] ), .B(\REG_FILE[9][7] ), .C(
        \REG_FILE[10][7] ), .D(\REG_FILE[11][7] ), .S0(N11), .S1(N12), .Y(n332) );
  MX4X1M U359 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n339), 
        .S1(N12), .Y(n146) );
  MX4X1M U360 ( .A(\REG_FILE[4][0] ), .B(\REG_FILE[5][0] ), .C(
        \REG_FILE[6][0] ), .D(\REG_FILE[7][0] ), .S0(n338), .S1(N12), .Y(n141)
         );
  MX4X1M U361 ( .A(\REG_FILE[4][1] ), .B(\REG_FILE[5][1] ), .C(
        \REG_FILE[6][1] ), .D(\REG_FILE[7][1] ), .S0(n339), .S1(N12), .Y(n145)
         );
  MX4X1M U362 ( .A(\REG_FILE[4][2] ), .B(\REG_FILE[5][2] ), .C(
        \REG_FILE[6][2] ), .D(\REG_FILE[7][2] ), .S0(n339), .S1(n336), .Y(n149) );
  MX4X1M U363 ( .A(\REG_FILE[4][3] ), .B(\REG_FILE[5][3] ), .C(
        \REG_FILE[6][3] ), .D(\REG_FILE[7][3] ), .S0(n339), .S1(n336), .Y(n317) );
  MX4X1M U364 ( .A(\REG_FILE[4][4] ), .B(\REG_FILE[5][4] ), .C(
        \REG_FILE[6][4] ), .D(\REG_FILE[7][4] ), .S0(n339), .S1(n336), .Y(n321) );
  MX4X1M U365 ( .A(\REG_FILE[4][5] ), .B(\REG_FILE[5][5] ), .C(
        \REG_FILE[6][5] ), .D(\REG_FILE[7][5] ), .S0(n338), .S1(N12), .Y(n325)
         );
  MX4X1M U366 ( .A(\REG_FILE[4][6] ), .B(\REG_FILE[5][6] ), .C(
        \REG_FILE[6][6] ), .D(\REG_FILE[7][6] ), .S0(n338), .S1(N12), .Y(n329)
         );
  MX4X1M U367 ( .A(\REG_FILE[4][7] ), .B(\REG_FILE[5][7] ), .C(
        \REG_FILE[6][7] ), .D(\REG_FILE[7][7] ), .S0(n338), .S1(N12), .Y(n333)
         );
  MX4X1M U368 ( .A(\REG_FILE[12][0] ), .B(\REG_FILE[13][0] ), .C(
        \REG_FILE[14][0] ), .D(\REG_FILE[15][0] ), .S0(n338), .S1(n336), .Y(
        n139) );
  MX4X1M U369 ( .A(\REG_FILE[12][2] ), .B(\REG_FILE[13][2] ), .C(
        \REG_FILE[14][2] ), .D(\REG_FILE[15][2] ), .S0(n339), .S1(n336), .Y(
        n147) );
  MX4X1M U370 ( .A(\REG_FILE[12][3] ), .B(\REG_FILE[13][3] ), .C(
        \REG_FILE[14][3] ), .D(\REG_FILE[15][3] ), .S0(n339), .S1(n336), .Y(
        n315) );
  MX4X1M U371 ( .A(\REG_FILE[12][4] ), .B(\REG_FILE[13][4] ), .C(
        \REG_FILE[14][4] ), .D(\REG_FILE[15][4] ), .S0(n339), .S1(n336), .Y(
        n319) );
  MX4X1M U372 ( .A(\REG_FILE[12][5] ), .B(\REG_FILE[13][5] ), .C(
        \REG_FILE[14][5] ), .D(\REG_FILE[15][5] ), .S0(n338), .S1(N12), .Y(
        n323) );
  MX4X1M U373 ( .A(\REG_FILE[12][6] ), .B(\REG_FILE[13][6] ), .C(
        \REG_FILE[14][6] ), .D(\REG_FILE[15][6] ), .S0(n338), .S1(N12), .Y(
        n327) );
  MX4X1M U374 ( .A(\REG_FILE[12][7] ), .B(\REG_FILE[13][7] ), .C(
        \REG_FILE[14][7] ), .D(\REG_FILE[15][7] ), .S0(n338), .S1(N12), .Y(
        n331) );
  INVX2M U375 ( .A(N11), .Y(n340) );
  INVX2M U376 ( .A(N12), .Y(n341) );
  DLY1X1M U377 ( .A(test_se), .Y(n370) );
  DLY1X1M U378 ( .A(test_se), .Y(n371) );
  DLY1X1M U379 ( .A(test_se), .Y(n372) );
  DLY1X1M U380 ( .A(test_se), .Y(n373) );
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
  XNOR2X2M U28 ( .A(n19), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U29 ( .A(b[6]), .Y(n13) );
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

  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n7), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
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
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n6), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n5), .CI(\SUMB[1][3] ), .CO(
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
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n3), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  AND2X2M U2 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U11 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U12 ( .A(\ab[0][5] ), .Y(n21) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U15 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n11) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U17 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U18 ( .A(\ab[0][3] ), .Y(n19) );
  XNOR2X2M U19 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  AND2X2M U20 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U21 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n13) );
  CLKXOR2X2M U22 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U23 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  INVX2M U24 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U25 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U26 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U27 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U28 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n16) );
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
  INVX2M U48 ( .A(B[2]), .Y(n29) );
  INVX2M U49 ( .A(B[3]), .Y(n28) );
  INVX2M U50 ( .A(B[4]), .Y(n27) );
  INVX2M U51 ( .A(B[0]), .Y(n31) );
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
  ALU_WIDTH8_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n11, n15, n14, n16, n12, n13, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
endmodule


module ALU_WIDTH8_test_1 ( CLK, RST, EN, ALU_FUN, A, B, ALU_OUT, OUT_VALID, 
        test_si, test_se );
  input [3:0] ALU_FUN;
  input [7:0] A;
  input [7:0] B;
  output [15:0] ALU_OUT;
  input CLK, RST, EN, test_si, test_se;
  output OUT_VALID;
  wire   N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103, N104, N105,
         N106, N107, N108, N109, N110, N111, N112, N113, N114, N115, N116,
         N117, N118, N119, N120, N121, N122, N123, N124, N125, N126, N130,
         N131, N132, N133, N134, N135, N136, N137, N171, N172, N173, N190,
         N191, N192, N193, N194, N195, N196, N197, N198, N199, N200, N201,
         N202, N203, N204, N205, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n4,
         n5, n6, n7, n8, n9, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169;

  SDFFRQX2M \ALU_OUT_reg[15]  ( .D(N205), .SI(ALU_OUT[14]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[15]) );
  SDFFRQX2M \ALU_OUT_reg[14]  ( .D(N204), .SI(ALU_OUT[13]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[14]) );
  SDFFRQX2M \ALU_OUT_reg[13]  ( .D(N203), .SI(ALU_OUT[12]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[13]) );
  SDFFRQX2M \ALU_OUT_reg[12]  ( .D(N202), .SI(ALU_OUT[11]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[12]) );
  SDFFRQX2M \ALU_OUT_reg[11]  ( .D(N201), .SI(ALU_OUT[10]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[11]) );
  SDFFRQX2M \ALU_OUT_reg[10]  ( .D(N200), .SI(ALU_OUT[9]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[10]) );
  SDFFRQX2M \ALU_OUT_reg[9]  ( .D(N199), .SI(ALU_OUT[8]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[9]) );
  SDFFRQX2M \ALU_OUT_reg[8]  ( .D(N198), .SI(ALU_OUT[7]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[8]) );
  SDFFRQX2M \ALU_OUT_reg[7]  ( .D(N197), .SI(ALU_OUT[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[7]) );
  SDFFRQX2M \ALU_OUT_reg[6]  ( .D(N196), .SI(ALU_OUT[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[6]) );
  SDFFRQX2M \ALU_OUT_reg[5]  ( .D(N195), .SI(ALU_OUT[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[5]) );
  SDFFRQX2M \ALU_OUT_reg[4]  ( .D(N194), .SI(ALU_OUT[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[4]) );
  SDFFRQX2M \ALU_OUT_reg[3]  ( .D(N193), .SI(ALU_OUT[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[3]) );
  SDFFRQX2M \ALU_OUT_reg[2]  ( .D(N192), .SI(ALU_OUT[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX2M \ALU_OUT_reg[1]  ( .D(N191), .SI(ALU_OUT[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(ALU_OUT[1]) );
  SDFFRQX2M \ALU_OUT_reg[0]  ( .D(N190), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(ALU_OUT[0]) );
  SDFFRQX1M OUT_VALID_reg ( .D(EN), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  BUFX2M U23 ( .A(A[7]), .Y(n31) );
  BUFX2M U24 ( .A(A[6]), .Y(n30) );
  OAI2BB1X2M U25 ( .A0N(N125), .A1N(n50), .B0(n51), .Y(N204) );
  OAI2BB1X2M U26 ( .A0N(N126), .A1N(n50), .B0(n51), .Y(N205) );
  OAI2BB1X2M U27 ( .A0N(N123), .A1N(n50), .B0(n51), .Y(N202) );
  OAI2BB1X2M U28 ( .A0N(N122), .A1N(n50), .B0(n51), .Y(N201) );
  OAI2BB1X2M U29 ( .A0N(N124), .A1N(n50), .B0(n51), .Y(N203) );
  OAI2BB1X2M U30 ( .A0N(N121), .A1N(n50), .B0(n51), .Y(N200) );
  OAI2BB1X2M U31 ( .A0N(N120), .A1N(n50), .B0(n51), .Y(N199) );
  OAI21X2M U32 ( .A0(n130), .A1(n116), .B0(n131), .Y(n60) );
  OAI21X2M U33 ( .A0(n132), .A1(n129), .B0(n131), .Y(n69) );
  NOR2BX2M U34 ( .AN(n133), .B(n130), .Y(n59) );
  INVX2M U35 ( .A(n71), .Y(n166) );
  OR2X2M U36 ( .A(n52), .B(n165), .Y(n51) );
  BUFX2M U37 ( .A(n58), .Y(n33) );
  NOR2X2M U38 ( .A(n116), .B(n132), .Y(n58) );
  BUFX2M U39 ( .A(n70), .Y(n34) );
  NOR2X2M U40 ( .A(n129), .B(n130), .Y(n70) );
  INVX2M U41 ( .A(n129), .Y(n168) );
  NOR2BX2M U42 ( .AN(n133), .B(n132), .Y(n56) );
  NOR2BX2M U43 ( .AN(n53), .B(n165), .Y(n50) );
  NOR4X1M U44 ( .A(n126), .B(n169), .C(ALU_FUN[2]), .D(ALU_FUN[0]), .Y(n123)
         );
  NAND2X2M U45 ( .A(N171), .B(n32), .Y(n126) );
  NAND3BX2M U46 ( .AN(n116), .B(n32), .C(n167), .Y(n71) );
  NOR3X2M U47 ( .A(n169), .B(ALU_FUN[2]), .C(n130), .Y(n72) );
  NOR3BX2M U48 ( .AN(n57), .B(n33), .C(n151), .Y(n52) );
  AOI21X2M U49 ( .A0(N110), .A1(n59), .B0(n60), .Y(n57) );
  OAI22X1M U50 ( .A0(n78), .A1(n160), .B0(n71), .B1(n163), .Y(n106) );
  OAI22X1M U51 ( .A0(n78), .A1(n159), .B0(n71), .B1(n161), .Y(n99) );
  OAI22X1M U52 ( .A0(n158), .A1(n78), .B0(n71), .B1(n160), .Y(n92) );
  OAI22X1M U53 ( .A0(n157), .A1(n78), .B0(n71), .B1(n159), .Y(n85) );
  OAI22X1M U54 ( .A0(n156), .A1(n78), .B0(n71), .B1(n158), .Y(n77) );
  NOR2X2M U55 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n133) );
  NAND3X2M U56 ( .A(n32), .B(ALU_FUN[0]), .C(n168), .Y(n78) );
  NAND2X2M U57 ( .A(ALU_FUN[2]), .B(n169), .Y(n129) );
  AND3X2M U58 ( .A(n133), .B(n167), .C(n32), .Y(n68) );
  NAND2X2M U59 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n116) );
  INVX2M U60 ( .A(ALU_FUN[1]), .Y(n169) );
  AND4X2M U61 ( .A(N173), .B(n168), .C(n32), .D(n167), .Y(n114) );
  OR2X2M U62 ( .A(n32), .B(n167), .Y(n130) );
  OR2X2M U63 ( .A(n32), .B(ALU_FUN[0]), .Y(n132) );
  INVX2M U64 ( .A(ALU_FUN[0]), .Y(n167) );
  NAND3X2M U65 ( .A(n133), .B(ALU_FUN[0]), .C(n32), .Y(n131) );
  NOR3X2M U66 ( .A(n132), .B(ALU_FUN[2]), .C(n169), .Y(n53) );
  INVX2M U67 ( .A(EN), .Y(n165) );
  AOI31X2M U68 ( .A0(n119), .A1(n120), .A2(n121), .B0(n165), .Y(N190) );
  AOI222X1M U69 ( .A0(N93), .A1(n56), .B0(N111), .B1(n53), .C0(N102), .C1(n59), 
        .Y(n119) );
  NOR4X1M U70 ( .A(n122), .B(n123), .C(n151), .D(n114), .Y(n121) );
  AOI222X1M U71 ( .A0(N130), .A1(n72), .B0(n33), .B1(n164), .C0(n7), .C1(n34), 
        .Y(n120) );
  AOI31X2M U72 ( .A0(n109), .A1(n110), .A2(n111), .B0(n165), .Y(N191) );
  AOI222X1M U73 ( .A0(N94), .A1(n56), .B0(N112), .B1(n53), .C0(N103), .C1(n59), 
        .Y(n109) );
  NOR4BX1M U74 ( .AN(n112), .B(n113), .C(n151), .D(n114), .Y(n111) );
  AOI222X1M U75 ( .A0(N131), .A1(n72), .B0(n33), .B1(n163), .C0(n8), .C1(n34), 
        .Y(n110) );
  AOI31X2M U76 ( .A0(n102), .A1(n103), .A2(n104), .B0(n165), .Y(N192) );
  AOI22X1M U77 ( .A0(N104), .A1(n59), .B0(N95), .B1(n56), .Y(n102) );
  AOI211X2M U78 ( .A0(n33), .A1(n161), .B0(n105), .C0(n106), .Y(n104) );
  AOI222X1M U79 ( .A0(N113), .A1(n53), .B0(n9), .B1(n34), .C0(N132), .C1(n72), 
        .Y(n103) );
  AOI31X2M U80 ( .A0(n95), .A1(n96), .A2(n97), .B0(n165), .Y(N193) );
  AOI22X1M U81 ( .A0(N105), .A1(n59), .B0(N96), .B1(n56), .Y(n95) );
  AOI211X2M U82 ( .A0(n33), .A1(n160), .B0(n98), .C0(n99), .Y(n97) );
  AOI222X1M U83 ( .A0(N114), .A1(n53), .B0(n27), .B1(n34), .C0(N133), .C1(n72), 
        .Y(n96) );
  AOI31X2M U84 ( .A0(n88), .A1(n89), .A2(n90), .B0(n165), .Y(N194) );
  AOI22X1M U85 ( .A0(N106), .A1(n59), .B0(N97), .B1(n56), .Y(n88) );
  AOI211X2M U86 ( .A0(n33), .A1(n159), .B0(n91), .C0(n92), .Y(n90) );
  AOI222X1M U87 ( .A0(N115), .A1(n53), .B0(n28), .B1(n34), .C0(N134), .C1(n72), 
        .Y(n89) );
  AOI31X2M U88 ( .A0(n61), .A1(n62), .A2(n63), .B0(n165), .Y(N197) );
  AOI22X1M U89 ( .A0(N109), .A1(n59), .B0(N100), .B1(n56), .Y(n61) );
  AOI221XLM U90 ( .A0(n30), .A1(n166), .B0(n33), .B1(n156), .C0(n64), .Y(n63)
         );
  AOI222X1M U91 ( .A0(N118), .A1(n53), .B0(n34), .B1(n31), .C0(N137), .C1(n72), 
        .Y(n62) );
  AOI31X2M U92 ( .A0(n52), .A1(n54), .A2(n55), .B0(n165), .Y(N198) );
  NAND2X2M U93 ( .A(N101), .B(n56), .Y(n54) );
  AOI22X1M U94 ( .A0(n31), .A1(n166), .B0(N119), .B1(n53), .Y(n55) );
  AOI31X2M U95 ( .A0(n81), .A1(n82), .A2(n83), .B0(n165), .Y(N195) );
  AOI22X1M U96 ( .A0(N107), .A1(n59), .B0(N98), .B1(n56), .Y(n81) );
  AOI211X2M U97 ( .A0(n33), .A1(n158), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U98 ( .A0(N116), .A1(n53), .B0(n29), .B1(n34), .C0(N135), .C1(n72), 
        .Y(n82) );
  AOI31X2M U99 ( .A0(n73), .A1(n74), .A2(n75), .B0(n165), .Y(N196) );
  AOI22X1M U100 ( .A0(N108), .A1(n59), .B0(N99), .B1(n56), .Y(n73) );
  AOI211X2M U101 ( .A0(n33), .A1(n157), .B0(n76), .C0(n77), .Y(n75) );
  AOI222X1M U102 ( .A0(N117), .A1(n53), .B0(n34), .B1(n30), .C0(N136), .C1(n72), .Y(n74) );
  INVX2M U103 ( .A(n5), .Y(n149) );
  AOI221XLM U104 ( .A0(n163), .A1(n60), .B0(n68), .B1(n8), .C0(n33), .Y(n118)
         );
  OAI222X1M U105 ( .A0(n71), .A1(n164), .B0(n115), .B1(n155), .C0(n78), .C1(
        n161), .Y(n113) );
  AOI221XLM U106 ( .A0(n68), .A1(n163), .B0(n8), .B1(n69), .C0(n34), .Y(n115)
         );
  OAI221X1M U107 ( .A0(n6), .A1(n65), .B0(n66), .B1(n150), .C0(n67), .Y(n64)
         );
  INVX2M U108 ( .A(n6), .Y(n150) );
  AOI221XLM U109 ( .A0(n68), .A1(n31), .B0(n60), .B1(n156), .C0(n33), .Y(n65)
         );
  AOI221XLM U110 ( .A0(n68), .A1(n156), .B0(n31), .B1(n69), .C0(n34), .Y(n66)
         );
  OAI221X1M U111 ( .A0(n5), .A1(n79), .B0(n80), .B1(n149), .C0(n67), .Y(n76)
         );
  AOI221XLM U112 ( .A0(n30), .A1(n68), .B0(n60), .B1(n157), .C0(n33), .Y(n79)
         );
  AOI221XLM U113 ( .A0(n68), .A1(n157), .B0(n30), .B1(n69), .C0(n34), .Y(n80)
         );
  OAI221X1M U114 ( .A0(n4), .A1(n86), .B0(n87), .B1(n152), .C0(n67), .Y(n84)
         );
  INVX2M U115 ( .A(n4), .Y(n152) );
  AOI221XLM U116 ( .A0(n29), .A1(n68), .B0(n60), .B1(n158), .C0(n33), .Y(n86)
         );
  AOI221XLM U117 ( .A0(n68), .A1(n158), .B0(n29), .B1(n69), .C0(n34), .Y(n87)
         );
  AOI32X1M U118 ( .A0(N172), .A1(n32), .A2(n117), .B0(n162), .B1(n155), .Y(
        n112) );
  NOR3X2M U119 ( .A(n167), .B(ALU_FUN[2]), .C(n169), .Y(n117) );
  INVX2M U120 ( .A(n118), .Y(n162) );
  INVX2M U121 ( .A(n67), .Y(n151) );
  BUFX2M U122 ( .A(ALU_FUN[3]), .Y(n32) );
  INVX2M U123 ( .A(n8), .Y(n163) );
  INVX2M U124 ( .A(n29), .Y(n158) );
  INVX2M U125 ( .A(n27), .Y(n160) );
  INVX2M U126 ( .A(n28), .Y(n159) );
  INVX2M U127 ( .A(n9), .Y(n161) );
  INVX2M U128 ( .A(n30), .Y(n157) );
  INVX2M U129 ( .A(n31), .Y(n156) );
  INVX2M U130 ( .A(n7), .Y(n164) );
  BUFX2M U131 ( .A(B[6]), .Y(n5) );
  BUFX2M U132 ( .A(B[7]), .Y(n6) );
  BUFX2M U133 ( .A(B[5]), .Y(n4) );
  BUFX2M U134 ( .A(A[5]), .Y(n29) );
  BUFX2M U135 ( .A(A[4]), .Y(n28) );
  BUFX2M U136 ( .A(A[3]), .Y(n27) );
  BUFX2M U137 ( .A(A[2]), .Y(n9) );
  BUFX2M U138 ( .A(A[1]), .Y(n8) );
  BUFX2M U139 ( .A(A[0]), .Y(n7) );
  OAI222X1M U140 ( .A0(n127), .A1(n145), .B0(B[0]), .B1(n128), .C0(n78), .C1(
        n163), .Y(n122) );
  AOI221XLM U141 ( .A0(n68), .A1(n164), .B0(n7), .B1(n69), .C0(n34), .Y(n127)
         );
  AOI221XLM U142 ( .A0(n7), .A1(n68), .B0(n60), .B1(n164), .C0(n33), .Y(n128)
         );
  NAND4X2M U143 ( .A(n154), .B(n153), .C(n124), .D(n125), .Y(n67) );
  NOR3X2M U144 ( .A(n4), .B(n6), .C(n5), .Y(n124) );
  NOR4BX1M U145 ( .AN(n72), .B(B[2]), .C(B[1]), .D(B[0]), .Y(n125) );
  OAI221X1M U146 ( .A0(B[2]), .A1(n107), .B0(n108), .B1(n147), .C0(n67), .Y(
        n105) );
  AOI221XLM U147 ( .A0(n9), .A1(n68), .B0(n60), .B1(n161), .C0(n33), .Y(n107)
         );
  AOI221XLM U148 ( .A0(n68), .A1(n161), .B0(n9), .B1(n69), .C0(n34), .Y(n108)
         );
  OAI221X1M U149 ( .A0(B[3]), .A1(n100), .B0(n101), .B1(n154), .C0(n67), .Y(
        n98) );
  AOI221XLM U150 ( .A0(n27), .A1(n68), .B0(n60), .B1(n160), .C0(n33), .Y(n100)
         );
  AOI221XLM U151 ( .A0(n68), .A1(n160), .B0(n27), .B1(n69), .C0(n34), .Y(n101)
         );
  OAI221X1M U152 ( .A0(B[4]), .A1(n93), .B0(n94), .B1(n153), .C0(n67), .Y(n91)
         );
  AOI221XLM U153 ( .A0(n28), .A1(n68), .B0(n60), .B1(n159), .C0(n33), .Y(n93)
         );
  AOI221XLM U154 ( .A0(n68), .A1(n159), .B0(n28), .B1(n69), .C0(n34), .Y(n94)
         );
  INVX2M U155 ( .A(n35), .Y(n146) );
  INVX2M U156 ( .A(n46), .Y(n148) );
  INVX2M U157 ( .A(B[0]), .Y(n145) );
  INVX2M U158 ( .A(B[2]), .Y(n147) );
  INVX2M U159 ( .A(B[3]), .Y(n154) );
  INVX2M U160 ( .A(B[4]), .Y(n153) );
  INVX2M U161 ( .A(B[1]), .Y(n155) );
  NOR2X1M U162 ( .A(n156), .B(n6), .Y(n141) );
  NAND2BX1M U163 ( .AN(B[4]), .B(n28), .Y(n134) );
  NAND2BX1M U164 ( .AN(n28), .B(B[4]), .Y(n39) );
  CLKNAND2X2M U165 ( .A(n134), .B(n39), .Y(n136) );
  NOR2X1M U166 ( .A(n154), .B(n27), .Y(n47) );
  NOR2X1M U167 ( .A(n147), .B(n9), .Y(n38) );
  NOR2X1M U168 ( .A(n145), .B(n7), .Y(n35) );
  CLKNAND2X2M U169 ( .A(n9), .B(n147), .Y(n49) );
  NAND2BX1M U170 ( .AN(n38), .B(n49), .Y(n44) );
  AOI21X1M U171 ( .A0(n35), .A1(n163), .B0(B[1]), .Y(n36) );
  AOI211X1M U172 ( .A0(n8), .A1(n146), .B0(n44), .C0(n36), .Y(n37) );
  CLKNAND2X2M U173 ( .A(n27), .B(n154), .Y(n48) );
  OAI31X1M U174 ( .A0(n47), .A1(n38), .A2(n37), .B0(n48), .Y(n40) );
  NAND2BX1M U175 ( .AN(n29), .B(n4), .Y(n139) );
  OAI211X1M U176 ( .A0(n136), .A1(n40), .B0(n39), .C0(n139), .Y(n41) );
  NAND2BX1M U177 ( .AN(n4), .B(n29), .Y(n135) );
  XNOR2X1M U178 ( .A(n30), .B(n5), .Y(n138) );
  AOI32X1M U179 ( .A0(n41), .A1(n135), .A2(n138), .B0(n5), .B1(n157), .Y(n42)
         );
  CLKNAND2X2M U180 ( .A(n6), .B(n156), .Y(n142) );
  OAI21X1M U181 ( .A0(n141), .A1(n42), .B0(n142), .Y(N173) );
  CLKNAND2X2M U182 ( .A(n7), .B(n145), .Y(n45) );
  OA21X1M U183 ( .A0(n45), .A1(n163), .B0(B[1]), .Y(n43) );
  AOI211X1M U184 ( .A0(n45), .A1(n163), .B0(n44), .C0(n43), .Y(n46) );
  AOI31X1M U185 ( .A0(n148), .A1(n49), .A2(n48), .B0(n47), .Y(n137) );
  OAI2B11X1M U186 ( .A1N(n137), .A0(n136), .B0(n135), .C0(n134), .Y(n140) );
  AOI32X1M U187 ( .A0(n140), .A1(n139), .A2(n138), .B0(n30), .B1(n149), .Y(
        n143) );
  AOI2B1X1M U188 ( .A1N(n143), .A0(n142), .B0(n141), .Y(n144) );
  CLKINVX1M U189 ( .A(n144), .Y(N172) );
  NOR2X1M U190 ( .A(N173), .B(N172), .Y(N171) );
  ALU_WIDTH8_DW_div_uns_0 div_46 ( .a({n31, n30, n29, n28, n27, n9, n8, n7}), 
        .b({n6, n5, n4, B[4:0]}), .quotient({N137, N136, N135, N134, N133, 
        N132, N131, N130}) );
  ALU_WIDTH8_DW01_sub_0 sub_44 ( .A({1'b0, n31, n30, n29, n28, n27, n9, n8, n7}), .B({1'b0, n6, n5, n4, B[4:0]}), .CI(1'b0), .DIFF({N110, N109, N108, N107, 
        N106, N105, N104, N103, N102}) );
  ALU_WIDTH8_DW01_add_0 add_43 ( .A({1'b0, n31, n30, n29, n28, n27, n9, n8, n7}), .B({1'b0, n6, n5, n4, B[4:0]}), .CI(1'b0), .SUM({N101, N100, N99, N98, N97, 
        N96, N95, N94, N93}) );
  ALU_WIDTH8_DW02_mult_0 mult_45 ( .A({n31, n30, n29, n28, n27, n9, n8, n7}), 
        .B({n6, n5, n4, B[4:0]}), .TC(1'b0), .PRODUCT({N126, N125, N124, N123, 
        N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111}) );
endmodule


module CLK_GATE ( CLK, CLK_EN, test_en, GATED_CLK );
  input CLK, CLK_EN, test_en;
  output GATED_CLK;
  wire   _0_net_;

  TLATNCAX12M U0_TLATNCAX12M ( .E(_0_net_), .CK(CLK), .ECK(GATED_CLK) );
  OR2X2M U1 ( .A(CLK_EN), .B(test_en), .Y(_0_net_) );
endmodule


module SYS_TOP ( scan_clk, scan_rst, test_mode, SE, SI, SO, RST_N, REF_CLK, 
        UART_CLK, UART_RX_IN, UART_TX_O, parity_error, framing_error );
  input [3:0] SI;
  output [3:0] SO;
  input scan_clk, scan_rst, test_mode, SE, RST_N, REF_CLK, UART_CLK,
         UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   MUXED_REF_CLK, MUXED_UART_CLK, UART_TX_CLK, MUXED_TX_CLK, UART_RX_CLK,
         MUXED_RX_CLK, MUXED_RST, SYNC_REF_RST, MUXED_REF_RST, SYNC_UART_RST,
         MUXED_UART_RST, UART_RX_V_OUT, UART_RX_V_SYNC, UART_TX_VLD,
         UART_TX_Busy_PULSE, FIFO_FULL, UART_TX_V_SYNC, UART_TX_Busy,
         ALU_OUT_VLD, RF_RdData_VLD, RF_WrEn, RF_RdEn, ALU_EN, CLKG_EN,
         ALU_CLK, n1, n2, n3, n4, n5, n6, n7, n8, n10, n11, n12, n17, n18, n19,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36;
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

  INVX4M U3 ( .A(n8), .Y(n7) );
  INVX2M U4 ( .A(n6), .Y(n5) );
  INVX2M U5 ( .A(UART_TX_V_SYNC), .Y(n1) );
  BUFX2M U6 ( .A(RF_Address[0]), .Y(n3) );
  BUFX2M U7 ( .A(RF_Address[1]), .Y(n4) );
  BUFX2M U8 ( .A(UART_RX_IN), .Y(n2) );
  INVX2M U9 ( .A(MUXED_REF_RST), .Y(n8) );
  INVX2M U10 ( .A(MUXED_UART_RST), .Y(n6) );
  DLY1X1M U13 ( .A(SYNC_REF_RST), .Y(n24) );
  INVXLM U14 ( .A(n34), .Y(n25) );
  INVXLM U15 ( .A(n25), .Y(n26) );
  INVXLM U16 ( .A(n25), .Y(n27) );
  INVXLM U17 ( .A(n25), .Y(n28) );
  DLY1X1M U18 ( .A(n35), .Y(n29) );
  INVXLM U19 ( .A(n36), .Y(n30) );
  INVXLM U20 ( .A(n30), .Y(n31) );
  INVXLM U21 ( .A(n30), .Y(n32) );
  INVXLM U22 ( .A(SE), .Y(n33) );
  INVXLM U23 ( .A(n33), .Y(n34) );
  INVXLM U24 ( .A(n33), .Y(n35) );
  INVXLM U25 ( .A(n33), .Y(n36) );
  MUX_2X1_1 U0_REF_CLK_MUX ( .IN_0(REF_CLK), .IN_1(scan_clk), .SEL(test_mode), 
        .OUT(MUXED_REF_CLK) );
  MUX_2X1_4 U1_UART_CLK_MUX ( .IN_0(UART_CLK), .IN_1(scan_clk), .SEL(test_mode), .OUT(MUXED_UART_CLK) );
  MUX_2X1_3 U2_TX_CLK_MUX ( .IN_0(UART_TX_CLK), .IN_1(scan_clk), .SEL(
        test_mode), .OUT(MUXED_TX_CLK) );
  MUX_2X1_2 U3_RX_CLK_MUX ( .IN_0(UART_RX_CLK), .IN_1(scan_clk), .SEL(
        test_mode), .OUT(MUXED_RX_CLK) );
  MUX_2X1_0 U4_RST_MUX ( .IN_0(RST_N), .IN_1(scan_rst), .SEL(test_mode), .OUT(
        MUXED_RST) );
  MUX_2X1_6 U5_SYNC_RST_MUX_REF ( .IN_0(n24), .IN_1(scan_rst), .SEL(test_mode), 
        .OUT(MUXED_REF_RST) );
  MUX_2X1_5 U6_SYNC_RST_MUX_UART ( .IN_0(SYNC_UART_RST), .IN_1(scan_rst), 
        .SEL(test_mode), .OUT(MUXED_UART_RST) );
  RST_SYNC_NUM_STAGES2_test_0 U0_RST_SYNC ( .CLK(MUXED_UART_CLK), .RST(
        MUXED_RST), .SYNC_RST(SYNC_UART_RST), .test_si(n17), .test_se(n31) );
  RST_SYNC_NUM_STAGES2_test_1 U1_RST_SYNC ( .CLK(MUXED_REF_CLK), .RST(
        MUXED_RST), .SYNC_RST(SYNC_REF_RST), .test_si(n10), .test_se(n27) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8_test_1 U0_ref_Data_sync ( .CLK(
        MUXED_REF_CLK), .RST(n7), .BUS_EN(UART_RX_V_OUT), .unsync_bus(
        UART_RX_OUT), .sync_bus(UART_RX_SYNC), .enable_pulse(UART_RX_V_SYNC), 
        .test_si(n11), .test_se(n36) );
  ASYNC_FIFO_TOP_DATA_WIDTH8_DEPTH8_test_1 U0_ASYNC_FIFO ( .W_CLK(
        MUXED_REF_CLK), .W_RST(n7), .W_INC(UART_TX_VLD), .R_CLK(MUXED_TX_CLK), 
        .R_RST(n5), .R_INC(UART_TX_Busy_PULSE), .WR_DATA(UART_TX_IN), 
        .RD_DATA(UART_TX_SYNC), .FULL(FIFO_FULL), .EMPTY(UART_TX_V_SYNC), 
        .test_si2(SI[2]), .test_si1(ALU_OUT_VLD), .test_so2(n19), .test_so1(
        SO[3]), .test_se(SE) );
  PULSE_GEN_test_0 U0_PULSE_GEN ( .CLK(MUXED_TX_CLK), .RST(n5), .LVL_SIG(
        UART_TX_Busy), .PULSE_SIG(UART_TX_Busy_PULSE), .test_si(n18), 
        .test_so(n17), .test_se(n36) );
  Clk_Divider_test_0 U0_ClkDiv ( .i_ref_clk(MUXED_UART_CLK), .i_rst_n(n5), 
        .i_clk_en(1'b1), .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK), 
        .test_si(n19), .test_so(n18), .test_se(n28) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT(DIV_RATIO_RX) );
  Clk_Divider_test_1 U1_ClkDiv ( .i_ref_clk(MUXED_UART_CLK), .i_rst_n(n5), 
        .i_clk_en(1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX}), 
        .o_div_clk(UART_RX_CLK), .test_si(UART_RX_SYNC[7]), .test_so(n10), 
        .test_se(n32) );
  UART_TOP_test_1 U0_UART ( .TX_CLK(MUXED_TX_CLK), .RX_CLK(MUXED_RX_CLK), 
        .RST(n5), .PAR_TYP(UART_Config[1]), .PAR_EN(UART_Config[0]), 
        .Prescale(UART_Config[7:2]), .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n1), 
        .RX_IN_S(n2), .TX_OUT_S(UART_TX_O), .TX_OUT_V(UART_TX_Busy), 
        .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), .parity_error(
        parity_error), .stop_error(framing_error), .test_si(n12), .test_so(n11), .test_se(n29) );
  SYS_CTRL_test_1 U0_SYS_CTRL ( .CLK(MUXED_REF_CLK), .RST(n7), .ALU_Valid(
        ALU_OUT_VLD), .Rd_Data_Valid(RF_RdData_VLD), .RX_ENABLE(UART_RX_V_SYNC), .FIFO_FULL(FIFO_FULL), .Rd_Data(RF_RdData), .RX_P_DATA(UART_RX_SYNC), 
        .ALU_OUT(ALU_OUT), .Wr_En(RF_WrEn), .Rd_En(RF_RdEn), .ALU_EN(ALU_EN), 
        .CLK_EN(CLKG_EN), .TX_D_VLD(UART_TX_VLD), .ALU_FUN(ALU_FUN), .Address(
        RF_Address), .Wr_Data(RF_WrData), .TX_P_DATA(UART_TX_IN), .test_si1(
        SI[0]), .test_so2(n12), .test_so1(SO[1]), .test_se(n31) );
  RegFile_DEPTH16_WIDTH8_test_1 U0_RegFile ( .CLK(MUXED_REF_CLK), .RST(n7), 
        .Address({RF_Address[3:2], n4, n3}), .WrEn(RF_WrEn), .RdEn(RF_RdEn), 
        .WrData(RF_WrData), .RdData(RF_RdData), .RdValid(RF_RdData_VLD), 
        .REG0(Operand_A), .REG1(Operand_B), .REG2(UART_Config), .REG3(
        DIV_RATIO), .test_si2(SI[1]), .test_si1(SYNC_UART_RST), .test_so1(
        SO[2]), .test_se(SE) );
  ALU_WIDTH8_test_1 U0_ALU ( .CLK(ALU_CLK), .RST(n7), .EN(ALU_EN), .ALU_FUN(
        ALU_FUN), .A(Operand_A), .B(Operand_B), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VLD), .test_si(SI[3]), .test_se(n26) );
  CLK_GATE U0_CLK_GATE ( .CLK(MUXED_REF_CLK), .CLK_EN(CLKG_EN), .test_en(
        test_mode), .GATED_CLK(ALU_CLK) );
  BUFX2M U12 ( .A(SYNC_REF_RST), .Y(SO[0]) );
endmodule

