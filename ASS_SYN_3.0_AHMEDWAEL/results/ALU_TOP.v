/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Sep  2 03:19:51 2026
/////////////////////////////////////////////////////////////


module add_unit_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4;
  wire   [8:1] carry;

  ADDFHX8M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFHX8M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFHX8M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFHX8M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFHX4M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  ADDFHX8M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  XOR2X1M U1 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  CLKAND2X16M U2 ( .A(B[0]), .B(A[0]), .Y(n1) );
  NAND2X8M U3 ( .A(n1), .B(A[1]), .Y(n2) );
  NAND2X8M U4 ( .A(n1), .B(B[1]), .Y(n3) );
  XOR3XLM U5 ( .A(n1), .B(A[1]), .C(B[1]), .Y(SUM[1]) );
  NAND2X6M U6 ( .A(A[1]), .B(B[1]), .Y(n4) );
  NAND3X12M U7 ( .A(n3), .B(n4), .C(n2), .Y(carry[2]) );
endmodule


module add_unit ( clk, rst_n, en, a, b, sum, cout, valid );
  input [7:0] a;
  input [7:0] b;
  output [7:0] sum;
  input clk, rst_n, en;
  output cout, valid;
  wire   en_reg, n2, n3, n4, n5, n6, n7, n8, n9, n10, n1, n12, n13, n14, n15,
         n16, n17, n18;
  wire   [8:0] add_result;

  add_unit_DW01_add_0 add_34 ( .A({1'b0, a}), .B({1'b0, b}), .CI(1'b0), .SUM(
        add_result) );
  DFFRQX2M en_reg_reg ( .D(en), .CK(clk), .RN(rst_n), .Q(en_reg) );
  DFFRQX2M valid_reg ( .D(n17), .CK(clk), .RN(rst_n), .Q(valid) );
  DFFRQX2M \sum_reg[5]  ( .D(n7), .CK(clk), .RN(rst_n), .Q(sum[5]) );
  DFFRQX2M \sum_reg[3]  ( .D(n5), .CK(clk), .RN(rst_n), .Q(sum[3]) );
  DFFRQX2M \sum_reg[2]  ( .D(n4), .CK(clk), .RN(rst_n), .Q(sum[2]) );
  DFFRQX2M \sum_reg[1]  ( .D(n3), .CK(clk), .RN(rst_n), .Q(sum[1]) );
  DFFRQX2M \sum_reg[0]  ( .D(n2), .CK(clk), .RN(rst_n), .Q(sum[0]) );
  DFFRQX1M \sum_reg[6]  ( .D(n8), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRQX2M \sum_reg[4]  ( .D(n6), .CK(clk), .RN(rst_n), .Q(sum[4]) );
  DFFRQX2M \sum_reg[7]  ( .D(n9), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRQX2M cout_reg ( .D(n10), .CK(clk), .RN(rst_n), .Q(cout) );
  NAND2X4M U3 ( .A(add_result[7]), .B(n17), .Y(n16) );
  INVX4M U4 ( .A(n17), .Y(n18) );
  NAND2X2M U5 ( .A(n13), .B(n14), .Y(n10) );
  NAND2X2M U6 ( .A(add_result[8]), .B(n17), .Y(n14) );
  NAND2X2M U7 ( .A(n15), .B(n16), .Y(n9) );
  NAND2X2M U8 ( .A(sum[7]), .B(n18), .Y(n15) );
  CLKBUFX6M U9 ( .A(en_reg), .Y(n17) );
  NAND2X2M U10 ( .A(cout), .B(n18), .Y(n13) );
  NAND2X2M U11 ( .A(sum[4]), .B(n18), .Y(n1) );
  NAND2X2M U12 ( .A(add_result[4]), .B(n17), .Y(n12) );
  NAND2X2M U14 ( .A(n1), .B(n12), .Y(n6) );
  AO22X1M U15 ( .A0(sum[5]), .A1(n18), .B0(add_result[5]), .B1(n17), .Y(n7) );
  AO22X1M U16 ( .A0(sum[6]), .A1(n18), .B0(add_result[6]), .B1(n17), .Y(n8) );
  AO22X1M U17 ( .A0(sum[1]), .A1(n18), .B0(add_result[1]), .B1(n17), .Y(n3) );
  AO22X1M U18 ( .A0(sum[2]), .A1(n18), .B0(add_result[2]), .B1(n17), .Y(n4) );
  AO22X1M U19 ( .A0(sum[3]), .A1(n18), .B0(add_result[3]), .B1(n17), .Y(n5) );
  AO22X1M U20 ( .A0(sum[0]), .A1(n18), .B0(n17), .B1(add_result[0]), .Y(n2) );
endmodule


module mult_unit_DW01_add_10 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   \A[1] , \A[0] , n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76;
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  NAND2X6M U2 ( .A(n43), .B(n46), .Y(n74) );
  OR2X8M U3 ( .A(A[5]), .B(B[5]), .Y(n46) );
  CLKAND2X6M U4 ( .A(n5), .B(A[9]), .Y(n60) );
  INVX6M U5 ( .A(n5), .Y(n10) );
  NOR2X8M U6 ( .A(A[9]), .B(n5), .Y(n67) );
  BUFX14M U7 ( .A(B[9]), .Y(n5) );
  NOR2BX8M U8 ( .AN(n61), .B(n6), .Y(n11) );
  NAND2X8M U9 ( .A(n49), .B(n75), .Y(n43) );
  NAND2X12M U10 ( .A(n50), .B(n47), .Y(n75) );
  CLKNAND2X16M U11 ( .A(n56), .B(n57), .Y(n15) );
  CLKINVX40M U12 ( .A(n38), .Y(n30) );
  XNOR2X1M U13 ( .A(n9), .B(n51), .Y(SUM[3]) );
  CLKINVX2M U14 ( .A(n9), .Y(n54) );
  NAND2X12M U15 ( .A(n9), .B(n53), .Y(n76) );
  NAND2X12M U16 ( .A(n72), .B(n10), .Y(n61) );
  INVX3M U17 ( .A(A[9]), .Y(n72) );
  BUFX16M U18 ( .A(A[4]), .Y(n1) );
  OR2X8M U19 ( .A(n1), .B(B[4]), .Y(n50) );
  INVX5M U20 ( .A(n41), .Y(n18) );
  CLKAND2X16M U21 ( .A(n45), .B(n41), .Y(n19) );
  NAND2X12M U22 ( .A(B[6]), .B(n23), .Y(n41) );
  BUFX14M U23 ( .A(B[3]), .Y(n2) );
  NAND2X8M U24 ( .A(n31), .B(n4), .Y(n63) );
  NAND2X4M U25 ( .A(n69), .B(n60), .Y(n59) );
  BUFX18M U26 ( .A(A[7]), .Y(n24) );
  BUFX14M U27 ( .A(B[7]), .Y(n25) );
  NAND2X6M U28 ( .A(n74), .B(n19), .Y(n16) );
  BUFX12M U29 ( .A(B[10]), .Y(n69) );
  INVX6M U30 ( .A(n34), .Y(n6) );
  INVX6M U31 ( .A(n33), .Y(n73) );
  NAND2X4M U32 ( .A(B[4]), .B(n1), .Y(n49) );
  OR2X6M U33 ( .A(A[3]), .B(n2), .Y(n53) );
  NAND2X4M U34 ( .A(n2), .B(A[3]), .Y(n52) );
  BUFX18M U35 ( .A(B[8]), .Y(n26) );
  BUFX24M U36 ( .A(A[8]), .Y(n27) );
  INVX2M U37 ( .A(n24), .Y(n7) );
  INVX2M U38 ( .A(n25), .Y(n8) );
  CLKXOR2X2M U39 ( .A(n40), .B(n21), .Y(SUM[6]) );
  AND2X2M U40 ( .A(n54), .B(n55), .Y(SUM[2]) );
  NAND2X2M U41 ( .A(n25), .B(n24), .Y(n4) );
  INVX2M U42 ( .A(B[11]), .Y(n20) );
  AO21X2M U43 ( .A0(n7), .A1(n8), .B0(n30), .Y(n39) );
  AND2X8M U44 ( .A(B[2]), .B(A[2]), .Y(n9) );
  AND2X2M U45 ( .A(n26), .B(n27), .Y(n29) );
  OAI2BB2X8M U46 ( .B0(n67), .B1(n22), .A0N(n5), .A1N(A[9]), .Y(n71) );
  NAND2X1M U47 ( .A(n45), .B(n74), .Y(n40) );
  NAND3X12M U48 ( .A(n69), .B(n61), .C(n62), .Y(n58) );
  OR2X12M U49 ( .A(n27), .B(n26), .Y(n34) );
  AND2X6M U50 ( .A(n26), .B(n27), .Y(n62) );
  BUFX20M U51 ( .A(A[6]), .Y(n23) );
  OR2X4M U52 ( .A(n27), .B(n26), .Y(n64) );
  AOI21X8M U53 ( .A0(n70), .A1(n11), .B0(n71), .Y(n68) );
  NAND2X3M U54 ( .A(n27), .B(n26), .Y(n22) );
  XOR2X3M U55 ( .A(n39), .B(n31), .Y(SUM[7]) );
  XNOR2X1M U56 ( .A(n43), .B(n44), .Y(SUM[5]) );
  NAND2X2M U57 ( .A(n45), .B(n46), .Y(n44) );
  XOR2X8M U58 ( .A(n12), .B(n13), .Y(SUM[9]) );
  NOR2X8M U59 ( .A(n28), .B(n29), .Y(n12) );
  XNOR2X2M U60 ( .A(n5), .B(A[9]), .Y(n13) );
  CLKNAND2X16M U61 ( .A(n25), .B(n24), .Y(n38) );
  AND2X12M U62 ( .A(n16), .B(n17), .Y(n37) );
  NAND4X12M U63 ( .A(n63), .B(n33), .C(n64), .D(n65), .Y(n56) );
  OAI2BB1X2M U64 ( .A0N(n37), .A1N(n14), .B0(n38), .Y(n35) );
  OR2X4M U65 ( .A(n25), .B(n24), .Y(n14) );
  XNOR2X8M U66 ( .A(n15), .B(n20), .Y(SUM[11]) );
  CLKINVX40M U67 ( .A(n37), .Y(n31) );
  OR2X12M U68 ( .A(n24), .B(n25), .Y(n33) );
  NAND2X12M U69 ( .A(n33), .B(n34), .Y(n32) );
  CLKAND2X16M U70 ( .A(n58), .B(n59), .Y(n57) );
  OR2X6M U71 ( .A(n18), .B(n42), .Y(n17) );
  NAND2X12M U72 ( .A(B[5]), .B(A[5]), .Y(n45) );
  AOI2B1X8M U73 ( .A1N(n30), .A0(n31), .B0(n32), .Y(n28) );
  AOI2B1X8M U74 ( .A1N(n30), .A0(n31), .B0(n73), .Y(n70) );
  NAND2X8M U75 ( .A(n52), .B(n76), .Y(n47) );
  NOR2X12M U76 ( .A(n66), .B(n67), .Y(n65) );
  NAND2X2M U77 ( .A(n52), .B(n53), .Y(n51) );
  XNOR2X8M U78 ( .A(n68), .B(n69), .Y(SUM[10]) );
  INVX20M U79 ( .A(n69), .Y(n66) );
  AND2X1M U80 ( .A(n41), .B(n42), .Y(n21) );
  XNOR2X1M U81 ( .A(n47), .B(n48), .Y(SUM[4]) );
  NAND2X2M U82 ( .A(n49), .B(n50), .Y(n48) );
  OR2X1M U83 ( .A(A[2]), .B(B[2]), .Y(n55) );
  XOR2X2M U84 ( .A(n26), .B(n27), .Y(n36) );
  XOR2X8M U85 ( .A(n35), .B(n36), .Y(SUM[8]) );
  OR2X12M U86 ( .A(n23), .B(B[6]), .Y(n42) );
endmodule


module mult_unit_DW01_add_14 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   \B[3] , \B[2] , net4948, net4947, net4946, net4945, net4943, net4937,
         net4930, net4929, net4926, net4921, net4863, net4862, net4860,
         net6139, net6666, net6799, net7037, net7623, net7710, net7851,
         net7850, net8027, net10573, net7034, net6147, net4938, net4927,
         net4914, net4934, net4933, net4928, net4861, net10512, net7825,
         net7328, net4932, net4931, net7598, net6048, net6047, net4917,
         net4916, net4912, net4911, net4909, net4904, net10413, n1, n2, n3, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55;
  assign SUM[1] = B[1];
  assign SUM[0] = B[0];
  assign SUM[3] = \B[3] ;
  assign \B[3]  = B[3];
  assign SUM[2] = \B[2] ;
  assign \B[2]  = B[2];

  BUFX10M U2 ( .A(n6), .Y(net7598) );
  INVX20M U3 ( .A(B[13]), .Y(net6047) );
  XNOR2X4M U4 ( .A(net6048), .B(A[13]), .Y(net6666) );
  OR2X8M U5 ( .A(B[13]), .B(A[13]), .Y(net4912) );
  AND2X12M U6 ( .A(net4863), .B(n24), .Y(net10512) );
  NAND2X12M U7 ( .A(B[10]), .B(n21), .Y(net4934) );
  AND2X6M U8 ( .A(B[12]), .B(n16), .Y(net4916) );
  INVX20M U9 ( .A(B[12]), .Y(n17) );
  INVX1M U10 ( .A(net4863), .Y(net4862) );
  CLKNAND2X16M U11 ( .A(n23), .B(B[9]), .Y(net4861) );
  CLKINVX24M U12 ( .A(A[9]), .Y(n27) );
  NAND2X12M U13 ( .A(n19), .B(n17), .Y(net10413) );
  CLKINVX32M U14 ( .A(n21), .Y(net7825) );
  CLKINVX16M U15 ( .A(net6047), .Y(net6048) );
  BUFX18M U16 ( .A(net4927), .Y(net6147) );
  INVX6M U17 ( .A(net6147), .Y(n11) );
  NOR2BX4M U18 ( .AN(net6147), .B(net4938), .Y(net4937) );
  CLKINVX8M U19 ( .A(n27), .Y(n23) );
  CLKINVX6M U20 ( .A(n26), .Y(net4948) );
  BUFX18M U21 ( .A(A[8]), .Y(n26) );
  NAND2X8M U22 ( .A(n16), .B(net7034), .Y(net7710) );
  CLKINVX16M U23 ( .A(n8), .Y(n9) );
  BUFX18M U24 ( .A(A[10]), .Y(n21) );
  CLKAND2X16M U25 ( .A(net4931), .B(net4932), .Y(net7328) );
  INVX20M U26 ( .A(n28), .Y(n36) );
  CLKINVX40M U27 ( .A(n20), .Y(n22) );
  NAND3X4M U28 ( .A(net4946), .B(net4945), .C(net10512), .Y(n3) );
  NAND2X3M U29 ( .A(net4914), .B(net10413), .Y(net4926) );
  NAND2X2M U30 ( .A(net4861), .B(n3), .Y(net4943) );
  CLKAND2X16M U31 ( .A(B[6]), .B(A[6]), .Y(n5) );
  NOR2BX8M U32 ( .AN(net4928), .B(n11), .Y(net4930) );
  NAND2X12M U33 ( .A(net7328), .B(net4933), .Y(net4928) );
  NAND2X8M U34 ( .A(net8027), .B(net4926), .Y(n51) );
  NAND2X12M U35 ( .A(net4928), .B(net6147), .Y(net4914) );
  BUFX8M U36 ( .A(B[12]), .Y(n18) );
  AND2X6M U37 ( .A(net7851), .B(net7037), .Y(n52) );
  NOR2BX4M U38 ( .AN(n22), .B(n2), .Y(net4938) );
  XNOR2X8M U39 ( .A(n18), .B(n16), .Y(net4929) );
  INVX4M U40 ( .A(net4916), .Y(net8027) );
  OAI2BB1X4M U41 ( .A0N(net4861), .A1N(n3), .B0(net7623), .Y(net7037) );
  CLKNAND2X16M U42 ( .A(n46), .B(n55), .Y(n40) );
  NAND2X12M U43 ( .A(n44), .B(n47), .Y(n55) );
  AND2X1M U44 ( .A(n48), .B(n49), .Y(SUM[4]) );
  CLKINVX32M U45 ( .A(n48), .Y(n44) );
  NAND2X12M U46 ( .A(B[4]), .B(n1), .Y(n48) );
  XNOR2X8M U47 ( .A(net4937), .B(n52), .Y(SUM[11]) );
  INVX8M U48 ( .A(n16), .Y(n19) );
  XOR2X8M U49 ( .A(net4929), .B(net4930), .Y(SUM[12]) );
  BUFX10M U50 ( .A(A[4]), .Y(n1) );
  XNOR2X8M U51 ( .A(n51), .B(net6666), .Y(SUM[13]) );
  BUFX18M U52 ( .A(A[11]), .Y(n20) );
  NAND2X8M U53 ( .A(net4917), .B(net4911), .Y(n14) );
  AND2X12M U54 ( .A(n6), .B(n18), .Y(net7034) );
  BUFX2M U55 ( .A(B[11]), .Y(n2) );
  BUFX8M U56 ( .A(A[12]), .Y(n16) );
  CLKINVX20M U57 ( .A(n5), .Y(n42) );
  OR2X6M U58 ( .A(A[5]), .B(B[5]), .Y(n47) );
  NAND2X4M U59 ( .A(B[5]), .B(A[5]), .Y(n46) );
  XOR2X4M U60 ( .A(n34), .B(n35), .Y(SUM[8]) );
  NOR2X4M U61 ( .A(net10573), .B(net6799), .Y(n35) );
  AND2X12M U62 ( .A(A[13]), .B(net6048), .Y(net4917) );
  CLKNAND2X16M U63 ( .A(net6047), .B(n13), .Y(n6) );
  BUFX20M U64 ( .A(A[7]), .Y(n29) );
  BUFX4M U65 ( .A(net4932), .Y(net7623) );
  INVX4M U66 ( .A(B[15]), .Y(n7) );
  NOR2BX2M U67 ( .AN(net4861), .B(net4862), .Y(net4860) );
  NAND2X1M U68 ( .A(n32), .B(n33), .Y(n31) );
  OR2X6M U69 ( .A(n29), .B(B[7]), .Y(n54) );
  XNOR2X8M U70 ( .A(net4904), .B(n7), .Y(SUM[15]) );
  CLKINVX12M U71 ( .A(A[13]), .Y(n13) );
  NAND2X4M U72 ( .A(net6048), .B(A[13]), .Y(net4921) );
  CLKINVX32M U73 ( .A(n10), .Y(n8) );
  CLKNAND2X16M U74 ( .A(n36), .B(n54), .Y(n33) );
  CLKAND2X3M U75 ( .A(net6139), .B(n26), .Y(net6799) );
  XOR2X2M U76 ( .A(n36), .B(n38), .Y(SUM[7]) );
  NAND2X2M U77 ( .A(net7851), .B(net7623), .Y(n53) );
  CLKINVX12M U78 ( .A(net7850), .Y(net7851) );
  INVX4M U79 ( .A(net4911), .Y(n12) );
  NAND2X12M U80 ( .A(n8), .B(net4911), .Y(net4909) );
  NAND3X12M U81 ( .A(net4914), .B(net4912), .C(net10413), .Y(n10) );
  XNOR2X8M U82 ( .A(n50), .B(n12), .Y(SUM[14]) );
  BUFX32M U83 ( .A(B[14]), .Y(net4911) );
  NAND3X12M U84 ( .A(net4909), .B(n15), .C(n14), .Y(net4904) );
  NAND3X12M U85 ( .A(net4911), .B(net7598), .C(net4916), .Y(n15) );
  NAND2BX12M U86 ( .AN(B[11]), .B(n22), .Y(net4931) );
  NAND2X3M U87 ( .A(B[11]), .B(n20), .Y(net4927) );
  NAND2BX12M U88 ( .AN(B[10]), .B(net7825), .Y(net4932) );
  NAND3X12M U89 ( .A(n25), .B(net4934), .C(net4861), .Y(net4933) );
  NAND3X12M U90 ( .A(net10512), .B(net4945), .C(net4946), .Y(n25) );
  INVX6M U91 ( .A(net4934), .Y(net7850) );
  NAND2BX12M U92 ( .AN(B[9]), .B(n27), .Y(net4863) );
  OR2X12M U93 ( .A(net6139), .B(n26), .Y(n24) );
  NOR2X4M U94 ( .A(net6139), .B(n26), .Y(net10573) );
  BUFX24M U95 ( .A(B[8]), .Y(net6139) );
  CLKINVX6M U96 ( .A(net6139), .Y(net4947) );
  NAND3X12M U97 ( .A(net4947), .B(n32), .C(n33), .Y(net4946) );
  NAND2X8M U98 ( .A(B[7]), .B(n29), .Y(n32) );
  XNOR2X8M U99 ( .A(n53), .B(net4943), .Y(SUM[10]) );
  AOI2B1X4M U100 ( .A1N(net10573), .A0(n31), .B0(net6799), .Y(n30) );
  AOI21BX8M U101 ( .A0(n40), .A1(n43), .B0N(n42), .Y(n28) );
  NAND3X12M U102 ( .A(n9), .B(net7710), .C(net4921), .Y(n50) );
  OR2X12M U103 ( .A(A[6]), .B(B[6]), .Y(n43) );
  XNOR2X8M U104 ( .A(n30), .B(net4860), .Y(SUM[9]) );
  NOR2X1M U105 ( .A(n29), .B(B[7]), .Y(n37) );
  NOR2BX1M U106 ( .AN(n32), .B(n39), .Y(n38) );
  NOR2X1M U107 ( .A(n29), .B(B[7]), .Y(n39) );
  OAI2B1X1M U108 ( .A1N(n36), .A0(n37), .B0(n32), .Y(n34) );
  XNOR2X1M U109 ( .A(n40), .B(n41), .Y(SUM[6]) );
  NAND2XLM U110 ( .A(n42), .B(n43), .Y(n41) );
  XNOR2X1M U111 ( .A(n44), .B(n45), .Y(SUM[5]) );
  NAND2XLM U112 ( .A(n46), .B(n47), .Y(n45) );
  OR2X1M U113 ( .A(n1), .B(B[4]), .Y(n49) );
  NAND3X12M U114 ( .A(n32), .B(net4948), .C(n33), .Y(net4945) );
endmodule


module mult_unit ( clk, rst_n, en, a, b, product, valid );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  input clk, rst_n, en;
  output valid;
  wire   en_reg, \pp[0][0] , \pp[2][0] , en_pipe, n28, n30, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, \level5[9] ,
         \level5[8] , \level5[7] , \level5[6] , \level5[5] , \level5[4] ,
         \level5[3] , \level5[2] , \level5[1] , \level5[15] , \level5[14] ,
         \level5[13] , \level5[12] , \level5[11] , \level5[10] , \level5[0] ,
         \level4[9] , \level4[8] , \level4[7] , \level4[6] , \level4[5] ,
         \level4[4] , \level4[13] , \level4[12] , \level4[11] , \level4[10] ,
         \add_1_root_add_0_root_add_59/SUM[3] ,
         \add_1_root_add_0_root_add_59/SUM[4] ,
         \add_1_root_add_0_root_add_59/SUM[5] ,
         \add_1_root_add_0_root_add_59/SUM[6] ,
         \add_1_root_add_0_root_add_59/SUM[7] ,
         \add_1_root_add_0_root_add_59/SUM[8] ,
         \add_1_root_add_0_root_add_59/SUM[9] ,
         \add_1_root_add_0_root_add_59/SUM[10] ,
         \add_1_root_add_0_root_add_59/SUM[11] ,
         \add_2_root_add_0_root_add_59/SUM[1] ,
         \add_2_root_add_0_root_add_59/SUM[2] ,
         \add_2_root_add_0_root_add_59/SUM[3] ,
         \add_2_root_add_0_root_add_59/SUM[4] ,
         \add_2_root_add_0_root_add_59/SUM[5] ,
         \add_2_root_add_0_root_add_59/SUM[6] ,
         \add_2_root_add_0_root_add_59/SUM[7] ,
         \add_2_root_add_0_root_add_59/SUM[8] ,
         \add_2_root_add_0_root_add_59/SUM[9] , net5414, net5415, net5417,
         net5418, net5421, net5427, net5428, net5434, net5437, net5443,
         net5446, net5451, net5454, net5459, net5466, net5469, net5480,
         net5483, net5484, net5487, net5488, net5489, net5494, net5498,
         net5501, net5502, net5503, net5514, net5522, net5532, net5534,
         net5544, net5546, net5683, net5691, net5694, net5701, net5703,
         net5706, net5718, net5724, net5734, net5927, net5937, net5940,
         net6004, net6014, net6720, net6719, net6718, net6752, net6763,
         net6778, net6814, net6884, net6932, net6931, net6943, net7220,
         net7400, net7438, net7446, net7450, net7462, net7468, net7467,
         net7471, net7632, net7647, net7646, net7796, net7854, net7880,
         net7897, net7896, net7900, net7918, net7974, net8009, net8008,
         net8014, net6105, net5519, net6032, net5500, net5499, net5495,
         net7860, net6944, net6062, net5515, net5493, net9021, net9274,
         net9270, net9265, net9266, net9244, net9240, net9226, net9221,
         net9148, net9137, net9394, net9628, net9612, net9608, net9560,
         net9551, net9691, net10035, net10034, net10030, net9995, net10124,
         net10245, net10312, net10309, net10431, net10430, net10482, net10532,
         net10530, net10560, net10608, net7461, net5549, net5440, net9780,
         net10311, net9259, net8981, net5520, net7877, net7868, net7585,
         net5476, net5449, net5429, net9594, net7584, net5533, net7574,
         net6815, net5548, net5541, net5416, net10354, net10320, net10305, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n29, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313;
  wire   [7:0] a_reg;
  wire   [7:0] b_reg;
  wire   [11:0] level3;
  wire   [15:0] level3_pipe;
  wire   [15:0] level7;

  DFFRHQX8M \a_reg_reg[6]  ( .D(a[6]), .CK(clk), .RN(rst_n), .Q(a_reg[6]) );
  DFFRHQX8M \a_reg_reg[5]  ( .D(a[5]), .CK(clk), .RN(rst_n), .Q(a_reg[5]) );
  DFFRHQX8M \a_reg_reg[4]  ( .D(a[4]), .CK(clk), .RN(rst_n), .Q(a_reg[4]) );
  DFFRHQX8M \a_reg_reg[3]  ( .D(a[3]), .CK(clk), .RN(rst_n), .Q(a_reg[3]) );
  DFFRHQX8M \a_reg_reg[2]  ( .D(a[2]), .CK(clk), .RN(rst_n), .Q(a_reg[2]) );
  DFFRHQX8M \a_reg_reg[1]  ( .D(a[1]), .CK(clk), .RN(rst_n), .Q(a_reg[1]) );
  DFFRHQX8M \level3_pipe_reg[8]  ( .D(level3[8]), .CK(clk), .RN(rst_n), .Q(
        level3_pipe[8]) );
  mult_unit_DW01_add_10 add_0_root_add_0_root_add_59 ( .A({1'b0, 1'b0, 
        \add_2_root_add_0_root_add_59/SUM[9] , 
        \add_2_root_add_0_root_add_59/SUM[8] , 
        \add_2_root_add_0_root_add_59/SUM[7] , 
        \add_2_root_add_0_root_add_59/SUM[6] , 
        \add_2_root_add_0_root_add_59/SUM[5] , 
        \add_2_root_add_0_root_add_59/SUM[4] , 
        \add_2_root_add_0_root_add_59/SUM[3] , 
        \add_2_root_add_0_root_add_59/SUM[2] , 
        \add_2_root_add_0_root_add_59/SUM[1] , \pp[0][0] }), .B({
        \add_1_root_add_0_root_add_59/SUM[11] , 
        \add_1_root_add_0_root_add_59/SUM[10] , 
        \add_1_root_add_0_root_add_59/SUM[9] , 
        \add_1_root_add_0_root_add_59/SUM[8] , 
        \add_1_root_add_0_root_add_59/SUM[7] , 
        \add_1_root_add_0_root_add_59/SUM[6] , 
        \add_1_root_add_0_root_add_59/SUM[5] , 
        \add_1_root_add_0_root_add_59/SUM[4] , 
        \add_1_root_add_0_root_add_59/SUM[3] , \pp[2][0] , 1'b0, 1'b0}), .CI(
        1'b0), .SUM(level3) );
  mult_unit_DW01_add_14 add_0_root_add_0_root_add_110 ( .A({1'b0, 1'b0, 
        \level4[13] , \level4[12] , \level4[11] , \level4[10] , \level4[9] , 
        \level4[8] , \level4[7] , \level4[6] , \level4[5] , \level4[4] , 1'b0, 
        1'b0, 1'b0, 1'b0}), .B({\level5[15] , \level5[14] , \level5[13] , 
        \level5[12] , \level5[11] , \level5[10] , \level5[9] , \level5[8] , 
        \level5[7] , \level5[6] , \level5[5] , \level5[4] , \level5[3] , 
        \level5[2] , \level5[1] , \level5[0] }), .CI(1'b0), .SUM(level7) );
  DFFRHQX8M \level3_pipe_reg[7]  ( .D(level3[7]), .CK(clk), .RN(rst_n), .Q(
        level3_pipe[7]) );
  DFFRQX2M \level3_pipe_reg[3]  ( .D(level3[3]), .CK(clk), .RN(rst_n), .Q(
        \level5[3] ) );
  DFFRQX2M \level3_pipe_reg[2]  ( .D(level3[2]), .CK(clk), .RN(rst_n), .Q(
        \level5[2] ) );
  DFFRQX2M \level3_pipe_reg[1]  ( .D(level3[1]), .CK(clk), .RN(rst_n), .Q(
        \level5[1] ) );
  DFFRQX2M \level3_pipe_reg[0]  ( .D(level3[0]), .CK(clk), .RN(rst_n), .Q(
        \level5[0] ) );
  DFFRQX2M en_pipe_reg ( .D(en_reg), .CK(clk), .RN(rst_n), .Q(en_pipe) );
  DFFRQX2M valid_reg ( .D(net5927), .CK(clk), .RN(rst_n), .Q(valid) );
  DFFRQX2M \product_reg[5]  ( .D(n47), .CK(clk), .RN(rst_n), .Q(product[5]) );
  DFFRQX2M \product_reg[4]  ( .D(n46), .CK(clk), .RN(rst_n), .Q(product[4]) );
  DFFRQX2M \product_reg[3]  ( .D(n45), .CK(clk), .RN(rst_n), .Q(product[3]) );
  DFFRQX2M \product_reg[2]  ( .D(n44), .CK(clk), .RN(rst_n), .Q(product[2]) );
  DFFRQX2M \product_reg[1]  ( .D(n43), .CK(clk), .RN(rst_n), .Q(product[1]) );
  DFFRQX2M \product_reg[0]  ( .D(n42), .CK(clk), .RN(rst_n), .Q(product[0]) );
  DFFRQX2M \product_reg[10]  ( .D(n52), .CK(clk), .RN(rst_n), .Q(product[10])
         );
  DFFRQX2M \product_reg[9]  ( .D(n51), .CK(clk), .RN(rst_n), .Q(product[9]) );
  DFFRQX2M \level3_pipe_reg[5]  ( .D(level3[5]), .CK(clk), .RN(rst_n), .Q(
        \level5[5] ) );
  DFFRHQX8M \a_pipe_reg[2]  ( .D(n98), .CK(clk), .RN(rst_n), .Q(net6814) );
  DFFRQX2M \product_reg[8]  ( .D(n50), .CK(clk), .RN(rst_n), .Q(product[8]) );
  DFFRQX2M \product_reg[6]  ( .D(n48), .CK(clk), .RN(rst_n), .Q(product[6]) );
  DFFRHQX8M \a_pipe_reg[5]  ( .D(a_reg[5]), .CK(clk), .RN(rst_n), .Q(net6943)
         );
  DFFRHQX8M \b_pipe_reg[4]  ( .D(b_reg[4]), .CK(clk), .RN(rst_n), .Q(n30) );
  DFFRQX2M en_reg_reg ( .D(en), .CK(clk), .RN(rst_n), .Q(en_reg) );
  DFFRQX2M \b_reg_reg[6]  ( .D(b[6]), .CK(clk), .RN(rst_n), .Q(b_reg[6]) );
  DFFRHQX8M \b_pipe_reg[6]  ( .D(b_reg[6]), .CK(clk), .RN(rst_n), .Q(net7438)
         );
  DFFRHQX8M \a_pipe_reg[1]  ( .D(n167), .CK(clk), .RN(rst_n), .Q(net7450) );
  DFFRHQX8M \a_pipe_reg[0]  ( .D(n66), .CK(clk), .RN(rst_n), .Q(net7471) );
  DFFRHQX8M \b_pipe_reg[7]  ( .D(b_reg[7]), .CK(clk), .RN(rst_n), .Q(net7646)
         );
  DFFRHQX8M \level3_pipe_reg[9]  ( .D(level3[9]), .CK(clk), .RN(rst_n), .Q(
        level3_pipe[9]) );
  DFFRHQX8M \b_pipe_reg[5]  ( .D(b_reg[5]), .CK(clk), .RN(rst_n), .Q(net7896)
         );
  DFFRHQX8M \a_pipe_reg[4]  ( .D(a_reg[4]), .CK(clk), .RN(rst_n), .Q(net7918)
         );
  DFFRHQX8M \b_reg_reg[3]  ( .D(b[3]), .CK(clk), .RN(rst_n), .Q(n152) );
  DFFRHQX4M \level3_pipe_reg[10]  ( .D(level3[10]), .CK(clk), .RN(rst_n), .Q(
        level3_pipe[10]) );
  DFFRHQX8M \product_reg[14]  ( .D(n56), .CK(clk), .RN(rst_n), .Q(product[14])
         );
  DFFRQX2M \b_reg_reg[5]  ( .D(b[5]), .CK(clk), .RN(rst_n), .Q(b_reg[5]) );
  DFFRQX4M \a_pipe_reg[6]  ( .D(a_reg[6]), .CK(clk), .RN(rst_n), .Q(n112) );
  DFFRHQX8M \b_reg_reg[1]  ( .D(b[1]), .CK(clk), .RN(rst_n), .Q(n130) );
  DFFRHQX4M \level3_pipe_reg[11]  ( .D(level3[11]), .CK(clk), .RN(rst_n), .Q(
        level3_pipe[11]) );
  DFFRHQX4M \product_reg[15]  ( .D(n85), .CK(clk), .RN(rst_n), .Q(product[15])
         );
  DFFRQX2M \b_reg_reg[4]  ( .D(b[4]), .CK(clk), .RN(rst_n), .Q(b_reg[4]) );
  DFFRX4M \a_reg_reg[7]  ( .D(a[7]), .CK(clk), .RN(rst_n), .Q(a_reg[7]), .QN(
        n236) );
  DFFRQX4M \a_pipe_reg[7]  ( .D(a_reg[7]), .CK(clk), .RN(rst_n), .Q(n159) );
  DFFRQX2M \level3_pipe_reg[4]  ( .D(level3[4]), .CK(clk), .RN(rst_n), .Q(
        \level5[4] ) );
  DFFRHQX4M \product_reg[13]  ( .D(n55), .CK(clk), .RN(rst_n), .Q(product[13])
         );
  DFFRHQX1M \product_reg[7]  ( .D(n49), .CK(clk), .RN(rst_n), .Q(product[7])
         );
  DFFRHQX1M \product_reg[12]  ( .D(n54), .CK(clk), .RN(rst_n), .Q(product[12])
         );
  DFFRHQX1M \product_reg[11]  ( .D(n53), .CK(clk), .RN(rst_n), .Q(product[11])
         );
  DFFRQX2M \b_reg_reg[7]  ( .D(b[7]), .CK(clk), .RN(rst_n), .Q(b_reg[7]) );
  DFFRHQX8M \a_pipe_reg[3]  ( .D(a_reg[3]), .CK(clk), .RN(rst_n), .Q(net7467)
         );
  DFFRX4M \b_reg_reg[2]  ( .D(b[2]), .CK(clk), .RN(rst_n), .Q(n28), .QN(n162)
         );
  DFFRHQX8M \a_reg_reg[0]  ( .D(a[0]), .CK(clk), .RN(rst_n), .Q(a_reg[0]) );
  DFFRHQX8M \b_reg_reg[0]  ( .D(b[0]), .CK(clk), .RN(rst_n), .Q(n170) );
  DFFRHQX8M \level3_pipe_reg[6]  ( .D(level3[6]), .CK(clk), .RN(rst_n), .Q(
        level3_pipe[6]) );
  BUFX4M U3 ( .A(net5549), .Y(net9612) );
  NAND2BX12M U4 ( .AN(n203), .B(n202), .Y(n205) );
  INVX8M U5 ( .A(n164), .Y(n175) );
  OR2X8M U6 ( .A(net5415), .B(net7461), .Y(net5440) );
  CLKNAND2X16M U7 ( .A(n1), .B(n2), .Y(n3) );
  NAND2X12M U8 ( .A(n3), .B(n32), .Y(\level5[14] ) );
  INVX6M U9 ( .A(n65), .Y(n1) );
  INVX16M U10 ( .A(n99), .Y(n2) );
  AND3X12M U11 ( .A(n124), .B(n143), .C(n142), .Y(n99) );
  NOR2X6M U12 ( .A(n33), .B(n34), .Y(n32) );
  INVX6M U13 ( .A(a_reg[4]), .Y(n221) );
  OR2X4M U14 ( .A(n249), .B(n250), .Y(n241) );
  NAND2X5M U15 ( .A(net10311), .B(net9608), .Y(net10312) );
  CLKXOR2X16M U16 ( .A(net10309), .B(n115), .Y(n25) );
  INVX24M U17 ( .A(net7220), .Y(net9608) );
  NAND3X6M U18 ( .A(net8014), .B(n311), .C(n164), .Y(n165) );
  NAND2X12M U19 ( .A(n61), .B(net10124), .Y(n60) );
  OR2X12M U20 ( .A(net10124), .B(net9608), .Y(n118) );
  NAND2X6M U21 ( .A(net10124), .B(net7646), .Y(net9560) );
  XOR2X8M U22 ( .A(n115), .B(net10309), .Y(n69) );
  INVX24M U23 ( .A(net6752), .Y(net5503) );
  INVX24M U24 ( .A(net7471), .Y(net5544) );
  CLKINVX24M U25 ( .A(n109), .Y(n215) );
  INVX24M U26 ( .A(net6814), .Y(net6815) );
  AND2X12M U27 ( .A(net10430), .B(net5940), .Y(n109) );
  CLKNAND2X16M U28 ( .A(net7220), .B(net7796), .Y(n158) );
  INVX6M U29 ( .A(n282), .Y(n284) );
  NAND2X12M U30 ( .A(n208), .B(n216), .Y(n209) );
  INVX16M U31 ( .A(n187), .Y(n217) );
  INVX20M U32 ( .A(n150), .Y(n148) );
  NAND2X12M U33 ( .A(n105), .B(n96), .Y(net5502) );
  CLKINVX16M U34 ( .A(net9551), .Y(n117) );
  OR2X12M U35 ( .A(n148), .B(n149), .Y(net5495) );
  CLKINVX4M U36 ( .A(net9265), .Y(net9266) );
  OR2X6M U37 ( .A(net9265), .B(net7868), .Y(net8014) );
  INVX20M U38 ( .A(net5476), .Y(net9265) );
  INVX8M U39 ( .A(n201), .Y(n202) );
  NAND2X6M U40 ( .A(net6931), .B(net6932), .Y(n171) );
  INVX5M U41 ( .A(net5503), .Y(net6931) );
  NAND2BX2M U42 ( .AN(net5544), .B(net7646), .Y(net5437) );
  XNOR3X2M U43 ( .A(net5691), .B(n213), .C(n212), .Y(\level4[8] ) );
  XNOR2X8M U44 ( .A(n27), .B(n11), .Y(n4) );
  XNOR2X8M U45 ( .A(net7877), .B(n5), .Y(n10) );
  INVX12M U46 ( .A(n4), .Y(n5) );
  INVX2M U47 ( .A(net5446), .Y(n11) );
  INVX16M U48 ( .A(n10), .Y(\level5[11] ) );
  CLKXOR2X16M U49 ( .A(n148), .B(n149), .Y(n6) );
  XOR2X8M U50 ( .A(net5459), .B(n6), .Y(\level5[13] ) );
  XNOR2X2M U51 ( .A(net10030), .B(n119), .Y(net10560) );
  NAND2BX8M U52 ( .AN(net6815), .B(net5937), .Y(net5683) );
  INVX32M U53 ( .A(net5501), .Y(net6932) );
  NAND3X12M U54 ( .A(net5548), .B(net5416), .C(net5549), .Y(n9) );
  NAND2X4M U55 ( .A(net9560), .B(net7574), .Y(net5548) );
  CLKINVX24M U56 ( .A(n83), .Y(n56) );
  NAND2BX8M U57 ( .AN(net10530), .B(net5429), .Y(net5449) );
  NAND2X12M U58 ( .A(net10530), .B(net5532), .Y(net7585) );
  INVX6M U59 ( .A(net5434), .Y(net5427) );
  INVX18M U60 ( .A(net7646), .Y(net7647) );
  NAND2X8M U61 ( .A(n61), .B(net9608), .Y(n59) );
  XOR2X8M U62 ( .A(net5440), .B(n7), .Y(net5418) );
  XNOR2X8M U63 ( .A(net10311), .B(net7220), .Y(n7) );
  INVX3M U64 ( .A(net10245), .Y(n8) );
  NAND2X12M U65 ( .A(net7400), .B(n94), .Y(n57) );
  AND2X4M U66 ( .A(n20), .B(net9628), .Y(n70) );
  NAND2X12M U67 ( .A(net6944), .B(net5520), .Y(net9995) );
  NOR2X6M U68 ( .A(n96), .B(net6062), .Y(n147) );
  BUFX32M U69 ( .A(net5493), .Y(net6062) );
  BUFX5M U70 ( .A(net5484), .Y(n146) );
  INVX32M U71 ( .A(net9594), .Y(net10311) );
  NAND3X3M U72 ( .A(n144), .B(n141), .C(net6718), .Y(n143) );
  INVX12M U73 ( .A(net5483), .Y(n139) );
  CLKXOR2X16M U74 ( .A(n96), .B(n182), .Y(net5483) );
  INVX6M U75 ( .A(net5520), .Y(net9259) );
  INVX6M U76 ( .A(level3_pipe[11]), .Y(net5520) );
  INVX24M U77 ( .A(net7438), .Y(net10320) );
  OR2X8M U78 ( .A(net5451), .B(net7900), .Y(n164) );
  NAND2X12M U79 ( .A(n128), .B(n127), .Y(n129) );
  NAND2X8M U80 ( .A(n69), .B(net9560), .Y(n68) );
  NOR2BX12M U81 ( .AN(net5476), .B(net7868), .Y(net7877) );
  MX2X4M U82 ( .A(product[11]), .B(level7[11]), .S0(net5927), .Y(n53) );
  NAND2X3M U83 ( .A(net9270), .B(net5454), .Y(n103) );
  CLKINVX24M U84 ( .A(n27), .Y(net5454) );
  CLKXOR2X16M U85 ( .A(net5428), .B(n132), .Y(\level5[9] ) );
  AO21X2M U86 ( .A0(n288), .A1(n289), .B0(n290), .Y(n26) );
  INVX16M U87 ( .A(n267), .Y(n290) );
  CLKINVX12M U88 ( .A(n287), .Y(n269) );
  INVX20M U89 ( .A(net6943), .Y(net6944) );
  BUFX32M U90 ( .A(net6004), .Y(net9021) );
  INVX24M U91 ( .A(net6062), .Y(net6004) );
  NAND2X5M U92 ( .A(net9021), .B(net5488), .Y(net6014) );
  INVX8M U93 ( .A(n96), .Y(net5488) );
  AND2X12M U94 ( .A(net9995), .B(net10245), .Y(net9394) );
  NAND2X12M U95 ( .A(n78), .B(net9274), .Y(n122) );
  BUFX6M U96 ( .A(n300), .Y(n166) );
  INVX2M U97 ( .A(n293), .Y(n300) );
  CLKINVX20M U98 ( .A(n82), .Y(net5480) );
  XNOR2X4M U99 ( .A(net10530), .B(net5429), .Y(n12) );
  XNOR2X8M U100 ( .A(net7854), .B(n13), .Y(\level5[10] ) );
  INVX5M U101 ( .A(n12), .Y(n13) );
  NAND2X6M U102 ( .A(n313), .B(net5443), .Y(net7854) );
  XNOR2X4M U103 ( .A(n29), .B(n279), .Y(n14) );
  XNOR2X2M U104 ( .A(n276), .B(n15), .Y(\add_1_root_add_0_root_add_59/SUM[9] )
         );
  INVX2M U105 ( .A(n14), .Y(n15) );
  NAND2BXLM U106 ( .AN(n153), .B(a_reg[6]), .Y(n279) );
  OR2X6M U107 ( .A(n277), .B(n222), .Y(n291) );
  INVX1M U108 ( .A(n161), .Y(n257) );
  AND2X12M U109 ( .A(n26), .B(n281), .Y(n177) );
  XNOR3X4M U110 ( .A(n290), .B(n288), .C(n289), .Y(
        \add_1_root_add_0_root_add_59/SUM[6] ) );
  INVX32M U111 ( .A(net7868), .Y(net9691) );
  INVX32M U112 ( .A(net5449), .Y(net7868) );
  NAND2BX1M U113 ( .AN(n160), .B(n97), .Y(n185) );
  INVX16M U114 ( .A(n159), .Y(n160) );
  CLKINVX8M U115 ( .A(n108), .Y(n302) );
  NAND2BX8M U116 ( .AN(n247), .B(n229), .Y(n243) );
  CLKINVX16M U117 ( .A(n248), .Y(n229) );
  CLKINVX20M U118 ( .A(n77), .Y(n55) );
  XOR3X8M U119 ( .A(n258), .B(n257), .C(n256), .Y(
        \add_2_root_add_0_root_add_59/SUM[3] ) );
  INVX20M U120 ( .A(n207), .Y(n178) );
  OR2X12M U121 ( .A(net5703), .B(net5694), .Y(n204) );
  CLKINVX20M U122 ( .A(net5691), .Y(net6778) );
  CLKINVX32M U123 ( .A(n212), .Y(n189) );
  BUFX18M U124 ( .A(n170), .Y(n184) );
  XOR2X8M U125 ( .A(n181), .B(n302), .Y(\add_1_root_add_0_root_add_59/SUM[3] )
         );
  AND2X12M U126 ( .A(n240), .B(n241), .Y(n174) );
  CLKXOR2X16M U127 ( .A(n40), .B(n95), .Y(n27) );
  INVX14M U128 ( .A(a_reg[6]), .Y(n238) );
  XNOR3X4M U129 ( .A(n261), .B(n154), .C(n260), .Y(
        \add_2_root_add_0_root_add_59/SUM[2] ) );
  INVX4M U130 ( .A(n254), .Y(n261) );
  INVX20M U131 ( .A(net6004), .Y(net7860) );
  INVX1M U132 ( .A(n252), .Y(n258) );
  XOR3X4M U133 ( .A(n247), .B(n174), .C(n229), .Y(
        \add_2_root_add_0_root_add_59/SUM[5] ) );
  NAND2BX4M U134 ( .AN(n220), .B(n67), .Y(n247) );
  OAI211X8M U135 ( .A0(n199), .A1(net5706), .B0(n193), .C0(n192), .Y(n156) );
  OAI211X8M U136 ( .A0(n199), .A1(net5706), .B0(n193), .C0(n192), .Y(n197) );
  NAND2BX12M U137 ( .AN(net5718), .B(net5937), .Y(n199) );
  NAND2X8M U138 ( .A(net5937), .B(net7918), .Y(net5691) );
  NAND2BX8M U139 ( .AN(n261), .B(n255), .Y(n256) );
  NAND2BX12M U140 ( .AN(net5734), .B(n199), .Y(n190) );
  NAND2BX12M U141 ( .AN(n229), .B(n247), .Y(n242) );
  XNOR3X4M U142 ( .A(n166), .B(n298), .C(n299), .Y(
        \add_1_root_add_0_root_add_59/SUM[4] ) );
  INVX16M U143 ( .A(a_reg[5]), .Y(n220) );
  BUFX24M U144 ( .A(n170), .Y(n67) );
  ADDFHX8M U145 ( .A(net5724), .B(n194), .CI(n156), .CO(n196) );
  XOR2X8M U146 ( .A(n21), .B(n218), .Y(\level4[5] ) );
  CLKAND2X3M U147 ( .A(net5937), .B(n61), .Y(\level4[4] ) );
  MXI2X12M U148 ( .A(level7[13]), .B(product[13]), .S0(n91), .Y(n77) );
  INVX6M U149 ( .A(level3_pipe[10]), .Y(n93) );
  INVX2M U150 ( .A(n151), .Y(net5718) );
  BUFX18M U151 ( .A(n112), .Y(n151) );
  INVX16M U152 ( .A(n227), .Y(n251) );
  OR2X8M U153 ( .A(n288), .B(n289), .Y(n281) );
  INVX20M U154 ( .A(level3_pipe[8]), .Y(net5541) );
  CLKINVX32M U155 ( .A(n39), .Y(n111) );
  INVX14M U156 ( .A(a_reg[3]), .Y(n222) );
  NOR2X8M U157 ( .A(net9221), .B(n146), .Y(n135) );
  BUFX18M U158 ( .A(n253), .Y(n161) );
  INVX2M U159 ( .A(n107), .Y(n268) );
  CLKINVX12M U160 ( .A(n226), .Y(n260) );
  NAND2BX4M U161 ( .AN(n286), .B(n269), .Y(n283) );
  CLKXOR2X12M U162 ( .A(net5416), .B(net5417), .Y(\level5[7] ) );
  INVX2M U163 ( .A(n239), .Y(n24) );
  CLKINVX24M U164 ( .A(n64), .Y(n105) );
  INVX16M U165 ( .A(level3_pipe[9]), .Y(net5546) );
  INVX4M U166 ( .A(net9259), .Y(net8981) );
  INVX8M U167 ( .A(net7918), .Y(n92) );
  INVX4M U168 ( .A(net9560), .Y(net7446) );
  NAND2X8M U169 ( .A(net9244), .B(n139), .Y(n141) );
  NAND2X12M U170 ( .A(n57), .B(n41), .Y(n40) );
  INVX24M U171 ( .A(net7467), .Y(net7468) );
  INVX8M U172 ( .A(n266), .Y(n299) );
  NAND2BX4M U173 ( .AN(n221), .B(n67), .Y(n249) );
  NAND2BX4M U174 ( .AN(n222), .B(n63), .Y(n250) );
  INVX6M U175 ( .A(a_reg[2]), .Y(n224) );
  INVX2M U176 ( .A(n242), .Y(n244) );
  CLKBUFX32M U177 ( .A(n130), .Y(n63) );
  NAND2BX2M U178 ( .AN(n238), .B(n67), .Y(n228) );
  NAND2BX2M U179 ( .AN(n220), .B(n63), .Y(n245) );
  INVX4M U180 ( .A(net8014), .Y(net6763) );
  INVX4M U181 ( .A(n180), .Y(n110) );
  INVX2M U182 ( .A(n185), .Y(n195) );
  NAND2BX1M U183 ( .AN(n277), .B(n167), .Y(n108) );
  NAND2BX2M U184 ( .AN(n153), .B(a_reg[4]), .Y(n287) );
  INVX2M U185 ( .A(n278), .Y(n29) );
  XOR2X4M U186 ( .A(n196), .B(n195), .Y(\level4[12] ) );
  CLKINVX24M U187 ( .A(n223), .Y(n263) );
  INVX2M U188 ( .A(product[15]), .Y(n90) );
  MX2X2M U189 ( .A(product[12]), .B(level7[12]), .S0(net5927), .Y(n54) );
  MX2X2M U190 ( .A(product[7]), .B(level7[7]), .S0(net5927), .Y(n49) );
  BUFX6M U191 ( .A(a_reg[2]), .Y(n98) );
  MX2X3M U192 ( .A(product[9]), .B(level7[9]), .S0(net5927), .Y(n51) );
  OR2X4M U193 ( .A(n90), .B(n84), .Y(n86) );
  NAND2X12M U194 ( .A(n60), .B(n59), .Y(n58) );
  INVX16M U195 ( .A(n82), .Y(net6718) );
  CLKNAND2X12M U196 ( .A(n121), .B(n129), .Y(n313) );
  INVX14M U197 ( .A(level3_pipe[6]), .Y(net7461) );
  CLKINVX16M U198 ( .A(n304), .Y(n101) );
  CLKINVX32M U199 ( .A(net7461), .Y(net7462) );
  AND2X8M U200 ( .A(net5454), .B(net9270), .Y(n145) );
  NAND2X8M U201 ( .A(net9148), .B(n93), .Y(n94) );
  INVX8M U202 ( .A(net9148), .Y(net9226) );
  OA21X8M U203 ( .A0(net9148), .A1(n93), .B0(n94), .Y(n18) );
  XNOR2X8M U204 ( .A(net10030), .B(n119), .Y(n16) );
  XNOR2X8M U205 ( .A(net10030), .B(n119), .Y(n17) );
  INVX32M U206 ( .A(level3_pipe[7]), .Y(net7220) );
  NAND2BX8M U207 ( .AN(net7796), .B(net5940), .Y(n187) );
  NAND2X8M U208 ( .A(net9628), .B(n61), .Y(net9551) );
  AND2X8M U209 ( .A(net9274), .B(n151), .Y(n131) );
  NAND2X12M U210 ( .A(net8008), .B(net9274), .Y(n74) );
  NAND2BX8M U211 ( .AN(net5544), .B(net7462), .Y(n304) );
  INVX32M U212 ( .A(net5544), .Y(n61) );
  OR3X12M U213 ( .A(net7632), .B(net6815), .C(net5541), .Y(n303) );
  XOR2X3M U214 ( .A(net7462), .B(net5414), .Y(\level5[6] ) );
  OR2X8M U215 ( .A(n135), .B(n136), .Y(n37) );
  INVX6M U216 ( .A(net5437), .Y(net5416) );
  NAND2X8M U217 ( .A(net9021), .B(net5503), .Y(n114) );
  CLKBUFX12M U218 ( .A(net6943), .Y(net6105) );
  CLKINVX32M U219 ( .A(n265), .Y(n66) );
  INVX24M U220 ( .A(n89), .Y(n88) );
  CLKXOR2X16M U221 ( .A(n74), .B(net8009), .Y(n119) );
  CLKNAND2X16M U222 ( .A(n148), .B(n149), .Y(n124) );
  BUFX32M U223 ( .A(n131), .Y(n96) );
  CLKINVX12M U224 ( .A(net5541), .Y(net10354) );
  CLKINVX40M U225 ( .A(net6815), .Y(net10430) );
  OR2X6M U226 ( .A(net6032), .B(net5466), .Y(n65) );
  INVX32M U227 ( .A(net7796), .Y(net10124) );
  INVX32M U228 ( .A(net7450), .Y(net7796) );
  NAND2X8M U229 ( .A(net6815), .B(net5541), .Y(n20) );
  OR2X6M U230 ( .A(net5541), .B(net10431), .Y(net10034) );
  NAND2X12M U231 ( .A(net9628), .B(net6105), .Y(net5519) );
  CLKINVX40M U232 ( .A(net10320), .Y(net10245) );
  NAND2BX4M U233 ( .AN(net7647), .B(net10430), .Y(net5434) );
  INVX2M U234 ( .A(n228), .Y(n246) );
  NAND2BX2M U235 ( .AN(net7647), .B(n151), .Y(n149) );
  INVX4M U236 ( .A(n64), .Y(net5489) );
  NAND2BX8M U237 ( .AN(n277), .B(n98), .Y(n298) );
  NAND3X6M U238 ( .A(net9628), .B(net10354), .C(net10430), .Y(n19) );
  INVX2M U239 ( .A(n146), .Y(net5451) );
  NAND2X2M U240 ( .A(net10124), .B(net5937), .Y(n21) );
  INVX2M U241 ( .A(n311), .Y(n310) );
  OR2X4M U242 ( .A(net7647), .B(n92), .Y(net5446) );
  INVX2M U243 ( .A(net5446), .Y(net9240) );
  INVX14M U244 ( .A(a_reg[0]), .Y(n265) );
  BUFX8M U245 ( .A(en_pipe), .Y(net5927) );
  XNOR2X2M U246 ( .A(n263), .B(n262), .Y(\add_2_root_add_0_root_add_59/SUM[1] ) );
  CLKNAND2X16M U247 ( .A(n22), .B(n9), .Y(n73) );
  NAND2X12M U248 ( .A(net7446), .B(net10608), .Y(n22) );
  XNOR3X4M U249 ( .A(n25), .B(net5421), .C(net9560), .Y(\level5[8] ) );
  OAI21X8M U250 ( .A0(n174), .A1(n244), .B0(n243), .Y(n62) );
  NAND2X8M U251 ( .A(n195), .B(n196), .Y(n23) );
  CLKINVX40M U252 ( .A(n23), .Y(\level4[13] ) );
  XNOR3X4M U253 ( .A(n235), .B(n237), .C(n24), .Y(
        \add_2_root_add_0_root_add_59/SUM[7] ) );
  NAND2X12M U254 ( .A(n38), .B(n210), .Y(n200) );
  CLKINVX24M U255 ( .A(n162), .Y(n163) );
  XNOR3X4M U256 ( .A(n199), .B(n31), .C(net6884), .Y(\level4[10] ) );
  OAI2BB1X4M U257 ( .A0N(n206), .A1N(n205), .B0(n204), .Y(n31) );
  NAND2X12M U258 ( .A(n16), .B(net5434), .Y(n72) );
  AND2X8M U259 ( .A(net6032), .B(net5466), .Y(n34) );
  NOR2X12M U260 ( .A(n35), .B(n36), .Y(n33) );
  OAI2BB1X4M U261 ( .A0N(n110), .A1N(n308), .B0(n124), .Y(n35) );
  NAND2X12M U262 ( .A(net5469), .B(n37), .Y(n36) );
  NAND2BX2M U263 ( .AN(n238), .B(n63), .Y(n239) );
  OAI21X8M U264 ( .A0(net5701), .A1(n178), .B0(n208), .Y(n38) );
  OR2X12M U265 ( .A(n214), .B(n215), .Y(n39) );
  NAND2BX12M U266 ( .AN(net5701), .B(n207), .Y(n216) );
  OR2X4M U267 ( .A(net9148), .B(n93), .Y(n41) );
  OR2X12M U268 ( .A(n293), .B(n291), .Y(n125) );
  NAND2X12M U269 ( .A(n61), .B(net9628), .Y(net5415) );
  XOR2X4M U270 ( .A(n17), .B(net5427), .Y(n132) );
  XNOR3X4M U271 ( .A(n246), .B(n62), .C(n245), .Y(
        \add_2_root_add_0_root_add_59/SUM[6] ) );
  XOR3X4M U272 ( .A(net5683), .B(n217), .C(n216), .Y(\level4[6] ) );
  BUFX24M U273 ( .A(n130), .Y(n183) );
  CLKINVX8M U274 ( .A(n200), .Y(n203) );
  NAND2BX12M U275 ( .AN(n222), .B(n67), .Y(n252) );
  AND2X8M U276 ( .A(net9274), .B(n159), .Y(n64) );
  INVX32M U277 ( .A(net7632), .Y(net9274) );
  MXI2X12M U278 ( .A(net10532), .B(n18), .S0(net5501), .Y(net10530) );
  INVX32M U279 ( .A(n76), .Y(net5501) );
  NAND2BX8M U280 ( .AN(n224), .B(n183), .Y(n253) );
  NOR2X8M U281 ( .A(net5483), .B(net9221), .Y(n136) );
  NAND2X12M U282 ( .A(n66), .B(n183), .Y(n223) );
  NAND2X12M U283 ( .A(n113), .B(n114), .Y(n307) );
  OAI2BB2X4M U284 ( .B0(net9021), .B1(net5502), .A0N(n64), .A1N(net5488), .Y(
        net5499) );
  CLKAND2X6M U285 ( .A(net5480), .B(net9691), .Y(n140) );
  CLKINVX32M U286 ( .A(n262), .Y(n75) );
  NAND2X12M U287 ( .A(net10035), .B(n70), .Y(net10030) );
  AND2X8M U288 ( .A(n151), .B(n97), .Y(n71) );
  NAND2X12M U289 ( .A(n73), .B(n72), .Y(net5533) );
  NAND2X12M U290 ( .A(net5533), .B(net5443), .Y(net7584) );
  CLKNAND2X16M U291 ( .A(n101), .B(n102), .Y(n123) );
  CLKINVX32M U292 ( .A(net5546), .Y(net8009) );
  NAND2X12M U293 ( .A(n75), .B(n263), .Y(n254) );
  OAI31X4M U294 ( .A0(net6763), .A1(n310), .A2(n175), .B0(n179), .Y(net5494)
         );
  AOI21BX8M U295 ( .A0(net5534), .A1(n306), .B0N(n305), .Y(n76) );
  OAI2BB2X8M U296 ( .B0(net8008), .B1(net8009), .A0N(net10431), .A1N(net5541), 
        .Y(net5534) );
  INVX24M U297 ( .A(net6932), .Y(net7880) );
  NAND2BX4M U298 ( .AN(net7468), .B(level3_pipe[9]), .Y(n306) );
  AND2X12M U299 ( .A(n158), .B(net10245), .Y(n102) );
  NAND2X12M U300 ( .A(n79), .B(n80), .Y(n78) );
  OR2X12M U301 ( .A(net7220), .B(net7796), .Y(n80) );
  NAND2BX12M U302 ( .AN(net5546), .B(net8008), .Y(n79) );
  CLKINVX40M U303 ( .A(net7468), .Y(net8008) );
  INVX2M U304 ( .A(net5927), .Y(n91) );
  NAND3X12M U305 ( .A(n81), .B(n103), .C(net9266), .Y(net5469) );
  CLKINVX40M U306 ( .A(n138), .Y(n81) );
  INVXLM U307 ( .A(n291), .Y(n297) );
  OR2X12M U308 ( .A(n291), .B(n292), .Y(n126) );
  AND2X12M U309 ( .A(n133), .B(net5515), .Y(n82) );
  INVX4M U310 ( .A(net5532), .Y(net5429) );
  NAND2BX8M U311 ( .AN(n82), .B(net9691), .Y(n138) );
  INVX32M U312 ( .A(net10245), .Y(net7632) );
  MXI2X12M U313 ( .A(product[14]), .B(level7[14]), .S0(en_pipe), .Y(n83) );
  OR2X12M U314 ( .A(n252), .B(n254), .Y(n168) );
  NAND2BX2M U315 ( .AN(n221), .B(n63), .Y(n248) );
  CLKINVX1M U316 ( .A(n91), .Y(n84) );
  CLKNAND2X16M U317 ( .A(n87), .B(n86), .Y(n85) );
  NAND2X12M U318 ( .A(level7[15]), .B(en_pipe), .Y(n87) );
  NAND2BX12M U319 ( .AN(net5418), .B(net5416), .Y(net5421) );
  NAND2X8M U320 ( .A(n19), .B(n88), .Y(net7574) );
  NAND2X12M U321 ( .A(n88), .B(n19), .Y(net10309) );
  CLKNAND2X16M U322 ( .A(net10305), .B(n20), .Y(n89) );
  NAND2X12M U323 ( .A(net7632), .B(net5541), .Y(net10305) );
  CLKINVX40M U324 ( .A(net10320), .Y(net9628) );
  XNOR2X8M U325 ( .A(net9780), .B(net5440), .Y(net5549) );
  NAND2X12M U326 ( .A(net7584), .B(net7585), .Y(net5476) );
  NAND2BX12M U327 ( .AN(net7796), .B(net9628), .Y(net9594) );
  NAND2BX8M U328 ( .AN(net9240), .B(n27), .Y(net9244) );
  XNOR2X4M U329 ( .A(net5519), .B(net8981), .Y(n95) );
  AOI21BX8M U330 ( .A0(net5519), .A1(net8981), .B0N(net5522), .Y(net6752) );
  OAI2B1X8M U331 ( .A1N(net9259), .A0(net5519), .B0(net9137), .Y(net5493) );
  CLKXOR2X8M U332 ( .A(net9226), .B(n93), .Y(net10532) );
  CLKINVX40M U333 ( .A(n92), .Y(net10482) );
  XNOR2X8M U334 ( .A(net10311), .B(net7220), .Y(net9780) );
  CLKINVX8M U335 ( .A(net5415), .Y(net5414) );
  NAND2BX4M U336 ( .AN(net7220), .B(net10124), .Y(n120) );
  NAND2BX4M U337 ( .AN(net6944), .B(net5937), .Y(net5703) );
  INVX14M U338 ( .A(net7897), .Y(n97) );
  INVX4M U339 ( .A(net7896), .Y(net7897) );
  XNOR3X4M U340 ( .A(n197), .B(n198), .C(n71), .Y(\level4[11] ) );
  INVX24M U341 ( .A(net10430), .Y(net10431) );
  NAND2X12M U342 ( .A(n179), .B(n165), .Y(net5459) );
  NAND2BX12M U343 ( .AN(n137), .B(n145), .Y(net6720) );
  XNOR2X8M U344 ( .A(n115), .B(net10309), .Y(net10608) );
  NAND2BX12M U345 ( .AN(n225), .B(n184), .Y(n262) );
  NAND2BX8M U346 ( .AN(n225), .B(n63), .Y(n226) );
  CLKAND2X4M U347 ( .A(n28), .B(a_reg[6]), .Y(n107) );
  OA21X8M U348 ( .A0(n178), .A1(net5701), .B0(n208), .Y(n100) );
  NAND2X12M U349 ( .A(net10124), .B(net5937), .Y(net5701) );
  INVX2M U350 ( .A(net5446), .Y(net9270) );
  NAND2BX12M U351 ( .AN(net9265), .B(net9691), .Y(n157) );
  XNOR2X8M U352 ( .A(net10030), .B(n119), .Y(n104) );
  NAND2X2M U353 ( .A(net5451), .B(net9244), .Y(n144) );
  INVX12M U354 ( .A(net9244), .Y(net9221) );
  NAND2BX1M U355 ( .AN(n298), .B(n299), .Y(n106) );
  NAND2BX4M U356 ( .AN(n153), .B(a_reg[3]), .Y(n289) );
  XNOR3X2M U357 ( .A(n251), .B(n249), .C(n250), .Y(
        \add_2_root_add_0_root_add_59/SUM[4] ) );
  CLKNAND2X16M U358 ( .A(n200), .B(n204), .Y(n188) );
  NAND2BX8M U359 ( .AN(n8), .B(net10482), .Y(n134) );
  NAND2BX2M U360 ( .AN(net7647), .B(n159), .Y(n309) );
  CLKINVX2M U361 ( .A(n309), .Y(n308) );
  NAND2BX8M U362 ( .AN(net7468), .B(net5940), .Y(n212) );
  NAND2BX12M U363 ( .AN(net5544), .B(net5940), .Y(n186) );
  NAND2BX2M U364 ( .AN(net5544), .B(net5940), .Y(n218) );
  NAND2X12M U365 ( .A(net9274), .B(net10482), .Y(net9148) );
  NAND2X4M U366 ( .A(net5940), .B(net7918), .Y(net5694) );
  OAI2BB1X4M U367 ( .A0N(net5494), .A1N(n124), .B0(net5495), .Y(net5487) );
  NAND2BX4M U368 ( .AN(n277), .B(a_reg[4]), .Y(n288) );
  NAND2BX4M U369 ( .AN(n277), .B(a_reg[5]), .Y(n286) );
  NAND2X12M U370 ( .A(net9021), .B(net7880), .Y(n113) );
  INVX12M U371 ( .A(n129), .Y(net5428) );
  NAND2X12M U372 ( .A(net10312), .B(n116), .Y(n115) );
  NAND3X12M U373 ( .A(n118), .B(net7462), .C(n117), .Y(n116) );
  NAND3X6M U374 ( .A(net9266), .B(n103), .C(n140), .Y(n142) );
  ADDFHX4M U375 ( .A(n232), .B(n231), .CI(n235), .CO(n234) );
  INVX20M U376 ( .A(n152), .Y(n153) );
  NAND2BX4M U377 ( .AN(n153), .B(n98), .Y(n292) );
  NAND2BX8M U378 ( .AN(net7468), .B(net5937), .Y(n214) );
  NAND3X12M U379 ( .A(net7974), .B(n120), .C(net10034), .Y(net10035) );
  NAND2X12M U380 ( .A(net5434), .B(net10560), .Y(n121) );
  NAND3X12M U381 ( .A(n122), .B(n123), .C(n303), .Y(n305) );
  NAND2X12M U382 ( .A(net7462), .B(n58), .Y(net7974) );
  OR3X12M U383 ( .A(net7880), .B(net5488), .C(net5503), .Y(net5514) );
  BUFX24M U384 ( .A(n259), .Y(n154) );
  NAND2BX12M U385 ( .AN(n224), .B(n184), .Y(n259) );
  NAND3X12M U386 ( .A(n125), .B(n126), .C(n294), .Y(n267) );
  NAND2BX12M U387 ( .AN(n277), .B(n167), .Y(n301) );
  INVX32M U388 ( .A(n163), .Y(n277) );
  NAND3X12M U389 ( .A(net5416), .B(net9612), .C(n68), .Y(n127) );
  NAND2BX8M U390 ( .AN(n25), .B(net7446), .Y(n128) );
  NOR2X12M U391 ( .A(n265), .B(n153), .Y(n181) );
  AO22X8M U392 ( .A0(n311), .A1(n157), .B0(net5454), .B1(net9240), .Y(n312) );
  OA21X8M U393 ( .A0(net6931), .A1(net6014), .B0(net5514), .Y(n133) );
  AND2X12M U394 ( .A(n171), .B(net9021), .Y(n182) );
  NAND2BX8M U395 ( .AN(level3_pipe[10]), .B(n134), .Y(net5522) );
  NAND2BX8M U396 ( .AN(n146), .B(n145), .Y(net6719) );
  CLKINVX12M U397 ( .A(net7900), .Y(n137) );
  NAND3X12M U398 ( .A(level3_pipe[10]), .B(net10482), .C(net9394), .Y(net9137)
         );
  AOI221X4M U399 ( .A0(net5501), .A1(n147), .B0(n96), .B1(net7860), .C0(n146), 
        .Y(net5515) );
  OAI33X4M U400 ( .A0(net6932), .A1(net5489), .A2(net7860), .B0(net5501), .B1(
        net5502), .B2(net5503), .Y(net5500) );
  OR2X12M U401 ( .A(net6944), .B(net7897), .Y(net5706) );
  INVX16M U402 ( .A(net5495), .Y(net6032) );
  AND2X1M U403 ( .A(n97), .B(n151), .Y(net5724) );
  OR3X8M U404 ( .A(net5500), .B(net5498), .C(net5499), .Y(n150) );
  NAND2BX2M U405 ( .AN(net7647), .B(net6105), .Y(net5484) );
  AND3X4M U406 ( .A(n64), .B(net5503), .C(net9021), .Y(net5498) );
  AND3X6M U407 ( .A(n155), .B(n96), .C(n64), .Y(n180) );
  CLKINVX40M U408 ( .A(n182), .Y(n155) );
  NAND2BX12M U409 ( .AN(n154), .B(n260), .Y(n255) );
  CLKXOR2X16M U410 ( .A(n307), .B(net5488), .Y(net7900) );
  NAND2BX2M U411 ( .AN(net7647), .B(net8008), .Y(net5532) );
  INVX4M U412 ( .A(net5418), .Y(net5417) );
  NAND2BX8M U413 ( .AN(n153), .B(n167), .Y(n266) );
  BUFX32M U414 ( .A(net7896), .Y(net5940) );
  OA21X8M U415 ( .A0(n213), .A1(n176), .B0(n211), .Y(n172) );
  NAND3X12M U416 ( .A(n206), .B(n190), .C(n201), .Y(n192) );
  CLKINVX16M U417 ( .A(n191), .Y(n206) );
  NAND2BX12M U418 ( .AN(net5454), .B(net5446), .Y(n311) );
  CLKINVX16M U419 ( .A(n186), .Y(n207) );
  NAND2BX8M U420 ( .AN(n166), .B(n106), .Y(n295) );
  NAND2BX12M U421 ( .AN(n111), .B(n211), .Y(n201) );
  AOI21BX8M U422 ( .A0(net5534), .A1(n306), .B0N(n305), .Y(net7400) );
  NAND2BX8M U423 ( .AN(net5691), .B(n189), .Y(n211) );
  AO21X8M U424 ( .A0(net5703), .A1(net5694), .B0(n176), .Y(n191) );
  XNOR3X2M U425 ( .A(n214), .B(n100), .C(n215), .Y(\level4[7] ) );
  MX2X8M U426 ( .A(product[10]), .B(level7[10]), .S0(net5927), .Y(n52) );
  AO22X8M U427 ( .A0(n308), .A1(net5487), .B0(n180), .B1(n308), .Y(
        \level5[15] ) );
  NAND2BX12M U428 ( .AN(n298), .B(n299), .Y(n294) );
  AO21X8M U429 ( .A0(n288), .A1(n289), .B0(n290), .Y(n280) );
  NAND2BX12M U430 ( .AN(n104), .B(net5427), .Y(net5443) );
  INVX14M U431 ( .A(a_reg[1]), .Y(n225) );
  XOR2X8M U432 ( .A(n234), .B(n233), .Y(\add_2_root_add_0_root_add_59/SUM[8] )
         );
  AND2X12M U433 ( .A(n233), .B(n234), .Y(\add_2_root_add_0_root_add_59/SUM[9] ) );
  XNOR3X2M U434 ( .A(n286), .B(n177), .C(n287), .Y(
        \add_1_root_add_0_root_add_59/SUM[7] ) );
  NAND2BX8M U435 ( .AN(n109), .B(n214), .Y(n210) );
  XNOR3X4M U436 ( .A(net5703), .B(n172), .C(net5694), .Y(\level4[9] ) );
  NAND2BX2M U437 ( .AN(n269), .B(n286), .Y(n282) );
  BUFX32M U438 ( .A(n30), .Y(net5937) );
  OR2X12M U439 ( .A(n252), .B(n161), .Y(n169) );
  NOR2X12M U440 ( .A(n189), .B(net6778), .Y(n176) );
  INVXLM U441 ( .A(n292), .Y(n296) );
  INVX8M U442 ( .A(n225), .Y(n167) );
  NAND3X12M U443 ( .A(n168), .B(n169), .C(n255), .Y(n227) );
  INVXLM U444 ( .A(net5706), .Y(net6884) );
  OA21X8M U445 ( .A0(n177), .A1(n284), .B0(n283), .Y(n173) );
  NAND2BXLM U446 ( .AN(n160), .B(net5937), .Y(n198) );
  AO21X8M U447 ( .A0(n249), .A1(n250), .B0(n251), .Y(n240) );
  NAND2BX12M U448 ( .AN(net5683), .B(n217), .Y(n208) );
  XOR2X8M U449 ( .A(n180), .B(n309), .Y(net5466) );
  AND3X12M U450 ( .A(net6718), .B(net6719), .C(net6720), .Y(n179) );
  XOR3X4M U451 ( .A(n107), .B(n173), .C(n285), .Y(
        \add_1_root_add_0_root_add_59/SUM[8] ) );
  NAND2BXLM U452 ( .AN(n236), .B(n67), .Y(n237) );
  AND2X1M U453 ( .A(n63), .B(a_reg[6]), .Y(n232) );
  AND2X1M U454 ( .A(n67), .B(a_reg[7]), .Y(n231) );
  OAI2BB2X8M U455 ( .B0(n245), .B1(n228), .A0N(n230), .A1N(n242), .Y(n235) );
  INVX2M U456 ( .A(n285), .Y(n271) );
  AND2X1M U457 ( .A(n274), .B(n275), .Y(\add_1_root_add_0_root_add_59/SUM[11] ) );
  INVX2M U458 ( .A(net5706), .Y(net5734) );
  INVX2M U459 ( .A(n219), .Y(n233) );
  NAND2BX2M U460 ( .AN(n236), .B(n63), .Y(n219) );
  AND2X1M U461 ( .A(a_reg[7]), .B(n28), .Y(n272) );
  AND2X1M U462 ( .A(a_reg[6]), .B(n152), .Y(n273) );
  AND2X1M U463 ( .A(net5937), .B(n159), .Y(n194) );
  NAND2BX2M U464 ( .AN(n153), .B(a_reg[5]), .Y(n285) );
  MX2X2M U465 ( .A(product[8]), .B(level7[8]), .S0(net5927), .Y(n50) );
  MX2X2M U466 ( .A(product[6]), .B(level7[6]), .S0(net5927), .Y(n48) );
  AND2X1M U467 ( .A(n28), .B(a_reg[0]), .Y(\pp[2][0] ) );
  NAND2BX1M U468 ( .AN(n277), .B(a_reg[7]), .Y(n278) );
  INVX2M U469 ( .A(n264), .Y(n274) );
  NAND2BX1M U470 ( .AN(n153), .B(a_reg[7]), .Y(n264) );
  MX2X2M U471 ( .A(product[5]), .B(level7[5]), .S0(net5927), .Y(n47) );
  MX2X2M U472 ( .A(product[4]), .B(level7[4]), .S0(net5927), .Y(n46) );
  AND2X1M U473 ( .A(n67), .B(n66), .Y(\pp[0][0] ) );
  MX2X2M U474 ( .A(product[0]), .B(level7[0]), .S0(net5927), .Y(n42) );
  MX2X2M U475 ( .A(product[1]), .B(level7[1]), .S0(net5927), .Y(n43) );
  MX2X2M U476 ( .A(product[2]), .B(level7[2]), .S0(net5927), .Y(n44) );
  MX2X2M U477 ( .A(product[3]), .B(level7[3]), .S0(net5927), .Y(n45) );
  NAND2BX12M U478 ( .AN(n301), .B(n181), .Y(n293) );
  ADDFHX8M U479 ( .A(n273), .B(n276), .CI(n272), .CO(n275) );
  AO22X8M U480 ( .A0(n271), .A1(n107), .B0(n282), .B1(n270), .Y(n276) );
  XOR2X8M U481 ( .A(n275), .B(n274), .Y(\add_1_root_add_0_root_add_59/SUM[10] ) );
  XOR3X8M U482 ( .A(net7900), .B(net5451), .C(n312), .Y(\level5[12] ) );
  NAND3X12M U483 ( .A(n206), .B(n188), .C(n190), .Y(n193) );
  AOI21X8M U484 ( .A0(n210), .A1(n209), .B0(n111), .Y(n213) );
  AOI32X4M U485 ( .A0(n243), .A1(n240), .A2(n241), .B0(n228), .B1(n245), .Y(
        n230) );
  AOI32X4M U486 ( .A0(n283), .A1(n280), .A2(n281), .B0(n268), .B1(n285), .Y(
        n270) );
  XOR3X2M U487 ( .A(n297), .B(n296), .C(n295), .Y(
        \add_1_root_add_0_root_add_59/SUM[5] ) );
endmodule


module alu8_top ( clk, rst_n, mode, add_en, mul_en, a, b, result, valid );
  input [7:0] a;
  input [7:0] b;
  output [15:0] result;
  input clk, rst_n, mode, add_en, mul_en;
  output valid;
  wire   add_cout, add_valid, mul_valid, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15;
  wire   [7:0] add_sum;
  wire   [15:0] mul_product;

  AO22X8M U2 ( .A0(mul_valid), .A1(n13), .B0(add_valid), .B1(n14), .Y(valid)
         );
  AO22X8M U7 ( .A0(mul_product[5]), .A1(n13), .B0(add_sum[5]), .B1(n14), .Y(
        result[5]) );
  AO22X8M U8 ( .A0(mul_product[4]), .A1(n13), .B0(add_sum[4]), .B1(n14), .Y(
        result[4]) );
  AO22X8M U9 ( .A0(mul_product[3]), .A1(n13), .B0(add_sum[3]), .B1(n14), .Y(
        result[3]) );
  AO22X8M U10 ( .A0(mul_product[2]), .A1(n13), .B0(add_sum[2]), .B1(n14), .Y(
        result[2]) );
  AO22X8M U11 ( .A0(mul_product[1]), .A1(n13), .B0(add_sum[1]), .B1(n14), .Y(
        result[1]) );
  AO22X8M U18 ( .A0(mul_product[0]), .A1(n13), .B0(add_sum[0]), .B1(n14), .Y(
        result[0]) );
  add_unit u_add ( .clk(clk), .rst_n(rst_n), .en(add_en), .a({a[7:2], n6, n5}), 
        .b({b[7:2], n3, n4}), .sum(add_sum), .cout(add_cout), .valid(add_valid) );
  mult_unit u_mul ( .clk(clk), .rst_n(rst_n), .en(mul_en), .a({a[7:2], n6, n5}), .b({b[7:2], n3, n4}), .product(mul_product), .valid(mul_valid) );
  INVX6M U20 ( .A(b[1]), .Y(n2) );
  INVX8M U21 ( .A(n2), .Y(n3) );
  BUFX14M U22 ( .A(b[0]), .Y(n4) );
  BUFX14M U23 ( .A(a[0]), .Y(n5) );
  BUFX5M U24 ( .A(a[1]), .Y(n6) );
  CLKAND2X8M U25 ( .A(mul_product[15]), .B(n13), .Y(result[15]) );
  BUFX8M U26 ( .A(n15), .Y(n14) );
  CLKBUFX12M U27 ( .A(mode), .Y(n13) );
  NAND2X2M U28 ( .A(add_sum[6]), .B(n14), .Y(n8) );
  NAND2X2M U29 ( .A(add_sum[7]), .B(n14), .Y(n10) );
  NAND2X2M U30 ( .A(add_cout), .B(n14), .Y(n12) );
  NAND2X2M U31 ( .A(mul_product[6]), .B(n13), .Y(n7) );
  NAND2X8M U32 ( .A(n7), .B(n8), .Y(result[6]) );
  NAND2X2M U33 ( .A(mul_product[7]), .B(n13), .Y(n9) );
  NAND2X8M U34 ( .A(n9), .B(n10), .Y(result[7]) );
  NAND2X2M U35 ( .A(mul_product[8]), .B(n13), .Y(n11) );
  NAND2X8M U36 ( .A(n11), .B(n12), .Y(result[8]) );
  INVX2M U37 ( .A(mode), .Y(n15) );
  AND2X8M U38 ( .A(mul_product[13]), .B(n13), .Y(result[13]) );
  AND2X8M U39 ( .A(mul_product[9]), .B(n13), .Y(result[9]) );
  AND2X8M U40 ( .A(mul_product[10]), .B(n13), .Y(result[10]) );
  AND2X8M U41 ( .A(mul_product[11]), .B(n13), .Y(result[11]) );
  AND2X8M U42 ( .A(mul_product[12]), .B(n13), .Y(result[12]) );
  AND2X8M U43 ( .A(mul_product[14]), .B(n13), .Y(result[14]) );
endmodule

