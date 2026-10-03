/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Thu Sep  3 21:16:12 2026
/////////////////////////////////////////////////////////////


module Serializer_test_1 ( P_DATA, ser_en, clk, rst, ser_data, ser_done, 
        test_si, test_so, test_se );
  input [7:0] P_DATA;
  input ser_en, clk, rst, test_si, test_se;
  output ser_data, ser_done, test_so;
  wire   N34, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n47, n48, n49, n50, n51, n54, n55, n56, n57, n58, n59, n60, n61, n63,
         n64, n65, n66, n67, n68, n69, n70, n71;
  wire   [3:0] count;
  wire   [6:1] shift_reg;

  SDFFRX1M shift_reg_reg_0_ ( .D(n37), .SI(count[3]), .SE(n64), .CK(clk), .RN(
        rst), .Q(n59), .QN(n19) );
  SDFFSQX2M count_reg_3_ ( .D(n44), .SI(n60), .SE(n68), .CK(clk), .SN(rst), 
        .Q(count[3]) );
  SDFFRQX2M count_reg_0_ ( .D(n45), .SI(test_si), .SE(n65), .CK(clk), .RN(rst), 
        .Q(count[0]) );
  SDFFRX1M count_reg_2_ ( .D(n48), .SI(n61), .SE(n65), .CK(clk), .RN(rst), .Q(
        count[2]), .QN(n60) );
  SDFFRX1M count_reg_1_ ( .D(n49), .SI(count[0]), .SE(n69), .CK(clk), .RN(rst), 
        .Q(count[1]), .QN(n61) );
  SDFFRX1M shift_reg_reg_4_ ( .D(n40), .SI(n56), .SE(n64), .CK(clk), .RN(rst), 
        .Q(shift_reg[4]), .QN(n55) );
  SDFFRX1M shift_reg_reg_3_ ( .D(n41), .SI(n57), .SE(n69), .CK(clk), .RN(rst), 
        .Q(shift_reg[3]), .QN(n56) );
  SDFFRX1M shift_reg_reg_2_ ( .D(n42), .SI(n58), .SE(n71), .CK(clk), .RN(rst), 
        .Q(shift_reg[2]), .QN(n57) );
  SDFFRX1M shift_reg_reg_5_ ( .D(n39), .SI(n55), .SE(n70), .CK(clk), .RN(rst), 
        .Q(shift_reg[5]), .QN(n54) );
  SDFFRX1M shift_reg_reg_1_ ( .D(n43), .SI(n59), .SE(n71), .CK(clk), .RN(rst), 
        .Q(shift_reg[1]), .QN(n58) );
  SDFFRX1M shift_reg_reg_6_ ( .D(n38), .SI(n54), .SE(n68), .CK(clk), .RN(rst), 
        .Q(shift_reg[6]), .QN(test_so) );
  NOR2X2M U22 ( .A(count[1]), .B(count[0]), .Y(n32) );
  NOR2BX2M U23 ( .AN(n34), .B(count[3]), .Y(ser_done) );
  CLKAND2X4M U24 ( .A(n47), .B(n50), .Y(n22) );
  CLKAND2X4M U25 ( .A(n47), .B(n29), .Y(n21) );
  INVX4M U26 ( .A(n33), .Y(n47) );
  INVX4M U27 ( .A(n36), .Y(n50) );
  INVX2M U28 ( .A(n32), .Y(n51) );
  NOR2X2M U29 ( .A(n50), .B(ser_done), .Y(n29) );
  NAND2BX2M U30 ( .AN(n29), .B(n36), .Y(n35) );
  NAND2X2M U31 ( .A(ser_en), .B(n35), .Y(n33) );
  AND2X2M U32 ( .A(ser_en), .B(n35), .Y(N34) );
  OAI2BB2X1M U33 ( .B0(n50), .B1(n19), .A0N(P_DATA[0]), .A1N(n50), .Y(ser_data) );
  NOR2X4M U34 ( .A(n51), .B(count[2]), .Y(n34) );
  NAND2X2M U35 ( .A(count[3]), .B(n34), .Y(n36) );
  OAI21X2M U36 ( .A0(n47), .A1(n19), .B0(n20), .Y(n37) );
  AOI22X1M U37 ( .A0(shift_reg[1]), .A1(n21), .B0(P_DATA[1]), .B1(n22), .Y(n20) );
  OAI2B1X2M U38 ( .A1N(shift_reg[1]), .A0(n47), .B0(n28), .Y(n43) );
  AOI22X1M U39 ( .A0(shift_reg[2]), .A1(n21), .B0(P_DATA[2]), .B1(n22), .Y(n28) );
  OAI2B1X2M U40 ( .A1N(shift_reg[2]), .A0(N34), .B0(n27), .Y(n42) );
  AOI22X1M U41 ( .A0(shift_reg[3]), .A1(n21), .B0(P_DATA[3]), .B1(n22), .Y(n27) );
  OAI2B1X2M U42 ( .A1N(shift_reg[3]), .A0(n47), .B0(n26), .Y(n41) );
  AOI22X1M U43 ( .A0(shift_reg[4]), .A1(n21), .B0(P_DATA[4]), .B1(n22), .Y(n26) );
  OAI2B1X2M U44 ( .A1N(shift_reg[4]), .A0(n47), .B0(n25), .Y(n40) );
  AOI22X1M U45 ( .A0(shift_reg[5]), .A1(n21), .B0(P_DATA[5]), .B1(n22), .Y(n25) );
  OAI2B1X2M U46 ( .A1N(shift_reg[5]), .A0(n47), .B0(n24), .Y(n39) );
  AOI22X1M U47 ( .A0(shift_reg[6]), .A1(n21), .B0(P_DATA[6]), .B1(n22), .Y(n24) );
  OAI2B1X2M U48 ( .A1N(shift_reg[6]), .A0(n47), .B0(n23), .Y(n38) );
  NAND2X2M U49 ( .A(P_DATA[7]), .B(n22), .Y(n23) );
  INVX2M U50 ( .A(n31), .Y(n49) );
  AOI32X1M U51 ( .A0(count[1]), .A1(n47), .A2(count[0]), .B0(n32), .B1(N34), 
        .Y(n31) );
  INVX2M U52 ( .A(n30), .Y(n48) );
  AOI32X1M U53 ( .A0(count[2]), .A1(n51), .A2(N34), .B0(n50), .B1(ser_en), .Y(
        n30) );
  OAI2B1X2M U54 ( .A1N(count[3]), .A0(n34), .B0(ser_en), .Y(n44) );
  NOR2X2M U55 ( .A(count[0]), .B(n33), .Y(n45) );
  DLY1X1M U56 ( .A(n66), .Y(n63) );
  DLY1X1M U57 ( .A(n70), .Y(n64) );
  DLY1X1M U58 ( .A(n66), .Y(n65) );
  DLY1X1M U59 ( .A(test_se), .Y(n66) );
  DLY1X1M U60 ( .A(test_se), .Y(n67) );
  DLY1X1M U61 ( .A(n67), .Y(n68) );
  DLY1X1M U62 ( .A(n63), .Y(n69) );
  DLY1X1M U63 ( .A(n67), .Y(n70) );
  DLY1X1M U64 ( .A(n63), .Y(n71) );
endmodule


module MUX ( IO, I1, I2, I3, sel, Op );
  input [1:0] sel;
  input IO, I1, I2, I3;
  output Op;
  wire   n2, n3, n1;

  OAI2B2X8M U1 ( .A1N(sel[1]), .A0(n2), .B0(sel[1]), .B1(n3), .Y(Op) );
  AOI22X1M U2 ( .A0(sel[0]), .A1(I1), .B0(IO), .B1(n1), .Y(n3) );
  AOI22X1M U3 ( .A0(I2), .A1(n1), .B0(I3), .B1(sel[0]), .Y(n2) );
  INVX2M U4 ( .A(sel[0]), .Y(n1) );
endmodule


module Parity ( P_DATA, DATA_VALID, par_bit );
  input [7:0] P_DATA;
  input DATA_VALID;
  output par_bit;
  wire   n1, n2, n3, n4, n5;

  XNOR2X2M U2 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n4) );
  XNOR2X2M U3 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n5) );
  NOR2BX2M U4 ( .AN(DATA_VALID), .B(n1), .Y(par_bit) );
  CLKXOR2X2M U5 ( .A(n2), .B(n3), .Y(n1) );
  XOR3XLM U6 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n5), .Y(n2) );
  XOR3XLM U7 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n4), .Y(n3) );
endmodule


module FSM_test_1 ( DATA_VALID, ser_done, clk, rst, Busy, ser_en, mux_sel, 
        test_si, test_so, test_se );
  output [1:0] mux_sel;
  input DATA_VALID, ser_done, clk, rst, test_si, test_se;
  output Busy, ser_en, test_so;
  wire   current_state_1_, current_state_0_, next_state_2_, n8, n9, n10, n11,
         n6, n7, n12, n13, n16, n17;

  SDFFRQX2M current_state_reg_0_ ( .D(n6), .SI(test_si), .SE(n16), .CK(clk), 
        .RN(rst), .Q(current_state_0_) );
  SDFFRX4M current_state_reg_1_ ( .D(n7), .SI(current_state_0_), .SE(test_se), 
        .CK(clk), .RN(rst), .Q(current_state_1_), .QN(n13) );
  AND2X2M U8 ( .A(mux_sel[0]), .B(n12), .Y(n9) );
  NOR2X2M U9 ( .A(mux_sel[0]), .B(n13), .Y(next_state_2_) );
  INVX2M U10 ( .A(mux_sel[1]), .Y(n7) );
  NAND2X4M U11 ( .A(current_state_0_), .B(n12), .Y(mux_sel[0]) );
  OAI211X4M U12 ( .A0(n13), .A1(test_so), .B0(n11), .C0(mux_sel[0]), .Y(Busy)
         );
  NAND3BX2M U13 ( .AN(current_state_0_), .B(n13), .C(n17), .Y(n11) );
  NAND2X2M U14 ( .A(n10), .B(n12), .Y(mux_sel[1]) );
  XNOR2X2M U15 ( .A(n13), .B(current_state_0_), .Y(n10) );
  INVX2M U16 ( .A(n8), .Y(n6) );
  AOI32X1M U17 ( .A0(n9), .A1(n13), .A2(DATA_VALID), .B0(ser_done), .B1(ser_en), .Y(n8) );
  CLKAND2X4M U18 ( .A(n9), .B(current_state_1_), .Y(ser_en) );
  DLY1X1M U19 ( .A(test_se), .Y(n16) );
  INVXLM U20 ( .A(n12), .Y(n17) );
  SDFFRX4M current_state_reg_2_ ( .D(next_state_2_), .SI(current_state_1_), 
        .SE(n16), .CK(clk), .RN(rst), .Q(test_so), .QN(n12) );
endmodule


module UART_TOP_TX ( P_DATA, Data_Valid, clk, rst, scan_clk, scan_rst, SI, SE, 
        test_mode, SO, TX_out, Busy );
  input [7:0] P_DATA;
  input Data_Valid, clk, rst, scan_clk, scan_rst, SI, SE, test_mode;
  output SO, TX_out, Busy;
  wire   CLK_M, RST_M, ser_en_wire, ser_done_wire, ser_data_wire, par_bit_wire,
         n1, n4, n6, n7, n8, n9, n10, n11, n12;
  wire   [1:0] mux_sel_wire;

  MX2X8M U5 ( .A(rst), .B(scan_rst), .S0(test_mode), .Y(RST_M) );
  BUFX2M U6 ( .A(P_DATA[7]), .Y(n1) );
  MX2X6M U7 ( .A(clk), .B(scan_clk), .S0(test_mode), .Y(CLK_M) );
  INVXLM U8 ( .A(SE), .Y(n6) );
  DLY1X1M U9 ( .A(n11), .Y(n7) );
  DLY1X1M U10 ( .A(n9), .Y(n8) );
  DLY1X1M U11 ( .A(n12), .Y(n9) );
  INVXLM U12 ( .A(SE), .Y(n10) );
  INVXLM U13 ( .A(n10), .Y(n11) );
  INVXLM U14 ( .A(n6), .Y(n12) );
  Serializer_test_1 Ser ( .P_DATA({n1, P_DATA[6:0]}), .ser_en(ser_en_wire), 
        .clk(CLK_M), .rst(RST_M), .ser_data(ser_data_wire), .ser_done(
        ser_done_wire), .test_si(SI), .test_so(n4), .test_se(n8) );
  MUX mux ( .IO(1'b0), .I1(ser_data_wire), .I2(par_bit_wire), .I3(1'b1), .sel(
        mux_sel_wire), .Op(TX_out) );
  Parity par ( .P_DATA({n1, P_DATA[6:0]}), .DATA_VALID(Data_Valid), .par_bit(
        par_bit_wire) );
  FSM_test_1 fsm ( .DATA_VALID(Data_Valid), .ser_done(ser_done_wire), .clk(
        CLK_M), .rst(RST_M), .Busy(Busy), .ser_en(ser_en_wire), .mux_sel(
        mux_sel_wire), .test_si(n4), .test_so(SO), .test_se(n7) );
endmodule

