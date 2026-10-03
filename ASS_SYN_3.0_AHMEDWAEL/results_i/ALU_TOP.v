/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Wed Sep  2 00:28:35 2026
/////////////////////////////////////////////////////////////


module add_unit_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module add_unit ( clk, rst_n, en, a, b, sum, cout, valid );
  input [7:0] a;
  input [7:0] b;
  output [7:0] sum;
  input clk, rst_n, en;
  output cout, valid;
  wire   en_reg, n2, n3, n4, n5, n6, n7, n8, n9, n10, n1, n12;
  wire   [8:0] add_result;

  add_unit_DW01_add_0 add_34 ( .A({1'b0, a}), .B({1'b0, b}), .CI(1'b0), .SUM(
        add_result) );
  DFFRQX2M en_reg_reg ( .D(en), .CK(clk), .RN(rst_n), .Q(en_reg) );
  DFFRQX2M valid_reg ( .D(n1), .CK(clk), .RN(rst_n), .Q(valid) );
  DFFRQX2M cout_reg ( .D(n10), .CK(clk), .RN(rst_n), .Q(cout) );
  DFFRQX2M \sum_reg[7]  ( .D(n9), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRQX2M \sum_reg[6]  ( .D(n8), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRQX2M \sum_reg[5]  ( .D(n7), .CK(clk), .RN(rst_n), .Q(sum[5]) );
  DFFRQX2M \sum_reg[4]  ( .D(n6), .CK(clk), .RN(rst_n), .Q(sum[4]) );
  DFFRQX2M \sum_reg[3]  ( .D(n5), .CK(clk), .RN(rst_n), .Q(sum[3]) );
  DFFRQX2M \sum_reg[2]  ( .D(n4), .CK(clk), .RN(rst_n), .Q(sum[2]) );
  DFFRQX2M \sum_reg[1]  ( .D(n3), .CK(clk), .RN(rst_n), .Q(sum[1]) );
  DFFRQX2M \sum_reg[0]  ( .D(n2), .CK(clk), .RN(rst_n), .Q(sum[0]) );
  CLKBUFX6M U3 ( .A(en_reg), .Y(n1) );
  INVX4M U4 ( .A(n1), .Y(n12) );
  AO22X1M U5 ( .A0(sum[5]), .A1(n12), .B0(add_result[5]), .B1(n1), .Y(n7) );
  AO22X1M U6 ( .A0(sum[6]), .A1(n12), .B0(add_result[6]), .B1(n1), .Y(n8) );
  AO22X1M U7 ( .A0(sum[7]), .A1(n12), .B0(add_result[7]), .B1(n1), .Y(n9) );
  AO22X1M U8 ( .A0(cout), .A1(n12), .B0(add_result[8]), .B1(n1), .Y(n10) );
  AO22X1M U9 ( .A0(sum[1]), .A1(n12), .B0(add_result[1]), .B1(n1), .Y(n3) );
  AO22X1M U10 ( .A0(sum[2]), .A1(n12), .B0(add_result[2]), .B1(n1), .Y(n4) );
  AO22X1M U11 ( .A0(sum[3]), .A1(n12), .B0(add_result[3]), .B1(n1), .Y(n5) );
  AO22X1M U12 ( .A0(sum[4]), .A1(n12), .B0(add_result[4]), .B1(n1), .Y(n6) );
  AO22X1M U14 ( .A0(sum[0]), .A1(n12), .B0(n1), .B1(add_result[0]), .Y(n2) );
endmodule


module mult_unit_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5;
  wire   [15:1] carry;
  assign SUM[1] = B[1];
  assign SUM[0] = B[0];

  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(n1), .CO(carry[4]), .S(SUM[3]) );
  ADDFX2M U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2M U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX8M U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFHX8M U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFHX2M U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFHX8M U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  CLKNAND2X16M U1 ( .A(B[15]), .B(n3), .Y(n4) );
  INVX12M U2 ( .A(B[15]), .Y(n2) );
  INVX4M U3 ( .A(carry[15]), .Y(n3) );
  AND2X2M U4 ( .A(B[2]), .B(A[2]), .Y(n1) );
  NAND2X6M U5 ( .A(n2), .B(carry[15]), .Y(n5) );
  CLKNAND2X16M U6 ( .A(n4), .B(n5), .Y(SUM[15]) );
  XOR2X1M U7 ( .A(B[2]), .B(A[2]), .Y(SUM[2]) );
endmodule


module mult_unit ( clk, rst_n, en, a, b, product, valid );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  input clk, rst_n, en;
  output valid;
  wire   \pp[0][7] , \pp[0][6] , \pp[0][5] , \pp[0][4] , \pp[0][3] ,
         \pp[0][2] , \pp[0][1] , \pp[1][7] , \pp[1][6] , \pp[1][5] ,
         \pp[1][4] , \pp[1][3] , \pp[1][2] , \pp[1][1] , \pp[1][0] ,
         \pp[2][7] , \pp[2][6] , \pp[2][5] , \pp[2][4] , \pp[2][3] ,
         \pp[2][2] , \pp[2][1] , \pp[3][7] , \pp[3][6] , \pp[3][5] ,
         \pp[3][4] , \pp[3][3] , \pp[3][2] , \pp[3][1] , \pp[3][0] ,
         \pp[4][7] , \pp[4][6] , \pp[4][5] , \pp[4][4] , \pp[4][3] ,
         \pp[4][2] , \pp[4][1] , \pp[5][7] , \pp[5][6] , \pp[5][5] ,
         \pp[5][4] , \pp[5][3] , \pp[5][2] , \pp[5][1] , \pp[5][0] ,
         \pp[6][7] , \pp[6][6] , \pp[6][5] , \pp[6][4] , \pp[6][3] ,
         \pp[6][2] , \pp[6][1] , \pp[6][0] , \pp[7][7] , \pp[7][6] ,
         \pp[7][5] , \pp[7][4] , \pp[7][3] , \pp[7][2] , \pp[7][1] ,
         \pp[7][0] , n20, n21, n24, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, \add_1_root_add_0_root_add_135/carry[15] ,
         \add_1_root_add_0_root_add_135/carry[14] ,
         \add_1_root_add_0_root_add_135/carry[13] ,
         \add_1_root_add_0_root_add_135/carry[12] ,
         \add_1_root_add_0_root_add_135/carry[11] ,
         \add_1_root_add_0_root_add_135/carry[10] ,
         \add_1_root_add_0_root_add_135/carry[9] ,
         \add_1_root_add_0_root_add_135/carry[8] ,
         \add_1_root_add_0_root_add_135/carry[7] ,
         \add_1_root_add_0_root_add_135/carry[6] ,
         \add_1_root_add_0_root_add_135/carry[5] ,
         \add_1_root_add_0_root_add_135/SUM[4] ,
         \add_1_root_add_0_root_add_135/SUM[5] ,
         \add_1_root_add_0_root_add_135/SUM[6] ,
         \add_1_root_add_0_root_add_135/SUM[7] ,
         \add_1_root_add_0_root_add_135/SUM[8] ,
         \add_1_root_add_0_root_add_135/SUM[9] ,
         \add_1_root_add_0_root_add_135/SUM[10] ,
         \add_1_root_add_0_root_add_135/SUM[11] ,
         \add_1_root_add_0_root_add_135/SUM[12] ,
         \add_1_root_add_0_root_add_135/SUM[13] ,
         \add_1_root_add_0_root_add_135/SUM[14] ,
         \add_1_root_add_0_root_add_135/SUM[15] ,
         \add_1_root_add_0_root_add_135/B[4] ,
         \add_1_root_add_0_root_add_135/B[5] ,
         \add_1_root_add_0_root_add_135/B[6] ,
         \add_1_root_add_0_root_add_135/B[7] ,
         \add_1_root_add_0_root_add_135/B[8] ,
         \add_1_root_add_0_root_add_135/B[9] ,
         \add_1_root_add_0_root_add_135/B[10] ,
         \add_1_root_add_0_root_add_135/B[11] ,
         \add_1_root_add_0_root_add_135/B[12] ,
         \add_1_root_add_0_root_add_135/B[13] ,
         \add_1_root_add_0_root_add_135/B[14] ,
         \add_1_root_add_0_root_add_135/B[15] ,
         \add_1_root_add_0_root_add_135/A[0] ,
         \add_1_root_add_0_root_add_135/A[1] ,
         \add_1_root_add_0_root_add_135/A[2] ,
         \add_1_root_add_0_root_add_135/A[3] ,
         \add_1_root_add_0_root_add_135/A[4] ,
         \add_1_root_add_0_root_add_135/A[5] ,
         \add_1_root_add_0_root_add_135/A[6] ,
         \add_1_root_add_0_root_add_135/A[7] ,
         \add_1_root_add_0_root_add_135/A[8] ,
         \add_1_root_add_0_root_add_135/A[9] ,
         \add_2_root_add_0_root_add_135/carry[8] ,
         \add_2_root_add_0_root_add_135/carry[9] ,
         \add_2_root_add_0_root_add_135/carry[10] ,
         \add_2_root_add_0_root_add_135/carry[11] ,
         \add_2_root_add_0_root_add_135/carry[12] ,
         \add_2_root_add_0_root_add_135/carry[13] ,
         \add_2_root_add_0_root_add_135/carry[14] ,
         \add_2_root_add_0_root_add_135/B[7] ,
         \add_2_root_add_0_root_add_135/B[8] ,
         \add_2_root_add_0_root_add_135/B[9] ,
         \add_2_root_add_0_root_add_135/B[10] ,
         \add_2_root_add_0_root_add_135/B[11] ,
         \add_2_root_add_0_root_add_135/B[12] ,
         \add_2_root_add_0_root_add_135/B[13] ,
         \add_4_root_add_0_root_add_135/carry[12] ,
         \add_4_root_add_0_root_add_135/carry[11] ,
         \add_4_root_add_0_root_add_135/carry[10] ,
         \add_4_root_add_0_root_add_135/carry[9] ,
         \add_4_root_add_0_root_add_135/carry[8] ,
         \add_4_root_add_0_root_add_135/carry[7] ,
         \add_4_root_add_0_root_add_135/carry[6] ,
         \add_3_root_add_0_root_add_135/carry[13] ,
         \add_3_root_add_0_root_add_135/carry[12] ,
         \add_3_root_add_0_root_add_135/carry[11] ,
         \add_3_root_add_0_root_add_135/carry[10] ,
         \add_3_root_add_0_root_add_135/carry[9] ,
         \add_3_root_add_0_root_add_135/carry[8] ,
         \add_3_root_add_0_root_add_135/carry[7] ,
         \add_3_root_add_0_root_add_135/SUM[6] ,
         \add_3_root_add_0_root_add_135/SUM[7] ,
         \add_3_root_add_0_root_add_135/SUM[8] ,
         \add_3_root_add_0_root_add_135/SUM[9] ,
         \add_3_root_add_0_root_add_135/SUM[10] ,
         \add_3_root_add_0_root_add_135/SUM[11] ,
         \add_3_root_add_0_root_add_135/SUM[12] ,
         \add_3_root_add_0_root_add_135/SUM[13] ,
         \add_3_root_add_0_root_add_135/SUM[14] ,
         \add_3_root_add_0_root_add_135/B[2] ,
         \add_3_root_add_0_root_add_135/B[3] ,
         \add_3_root_add_0_root_add_135/B[4] ,
         \add_3_root_add_0_root_add_135/B[5] ,
         \add_3_root_add_0_root_add_135/B[6] ,
         \add_3_root_add_0_root_add_135/B[7] ,
         \add_3_root_add_0_root_add_135/B[8] ,
         \add_3_root_add_0_root_add_135/B[9] ,
         \add_3_root_add_0_root_add_135/B[10] ,
         \add_3_root_add_0_root_add_135/B[11] ,
         \add_5_root_add_0_root_add_135/carry[10] ,
         \add_5_root_add_0_root_add_135/carry[9] ,
         \add_5_root_add_0_root_add_135/carry[8] ,
         \add_5_root_add_0_root_add_135/carry[7] ,
         \add_5_root_add_0_root_add_135/carry[6] ,
         \add_5_root_add_0_root_add_135/carry[5] ,
         \add_5_root_add_0_root_add_135/carry[4] ,
         \add_6_root_add_0_root_add_135/carry[8] ,
         \add_6_root_add_0_root_add_135/carry[7] ,
         \add_6_root_add_0_root_add_135/carry[6] ,
         \add_6_root_add_0_root_add_135/carry[5] ,
         \add_6_root_add_0_root_add_135/carry[4] ,
         \add_6_root_add_0_root_add_135/carry[3] ,
         \add_6_root_add_0_root_add_135/carry[2] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n22, n23,
         n25, n26, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72;
  wire   [15:0] level7;

  mult_unit_DW01_add_0 add_0_root_add_0_root_add_135 ( .A({1'b0, 
        \add_3_root_add_0_root_add_135/SUM[14] , 
        \add_3_root_add_0_root_add_135/SUM[13] , 
        \add_3_root_add_0_root_add_135/SUM[12] , 
        \add_3_root_add_0_root_add_135/SUM[11] , 
        \add_3_root_add_0_root_add_135/SUM[10] , 
        \add_3_root_add_0_root_add_135/SUM[9] , 
        \add_3_root_add_0_root_add_135/SUM[8] , 
        \add_3_root_add_0_root_add_135/SUM[7] , 
        \add_3_root_add_0_root_add_135/SUM[6] , 
        \add_3_root_add_0_root_add_135/B[5] , 
        \add_3_root_add_0_root_add_135/B[4] , 
        \add_3_root_add_0_root_add_135/B[3] , 
        \add_3_root_add_0_root_add_135/B[2] , 1'b0, 1'b0}), .B({
        \add_1_root_add_0_root_add_135/SUM[15] , 
        \add_1_root_add_0_root_add_135/SUM[14] , 
        \add_1_root_add_0_root_add_135/SUM[13] , 
        \add_1_root_add_0_root_add_135/SUM[12] , 
        \add_1_root_add_0_root_add_135/SUM[11] , 
        \add_1_root_add_0_root_add_135/SUM[10] , 
        \add_1_root_add_0_root_add_135/SUM[9] , 
        \add_1_root_add_0_root_add_135/SUM[8] , 
        \add_1_root_add_0_root_add_135/SUM[7] , 
        \add_1_root_add_0_root_add_135/SUM[6] , 
        \add_1_root_add_0_root_add_135/SUM[5] , 
        \add_1_root_add_0_root_add_135/SUM[4] , 
        \add_1_root_add_0_root_add_135/A[3] , 
        \add_1_root_add_0_root_add_135/A[2] , 
        \add_1_root_add_0_root_add_135/A[1] , 
        \add_1_root_add_0_root_add_135/A[0] }), .CI(1'b0), .SUM(level7) );
  DFFRQX2M valid_reg ( .D(n58), .CK(clk), .RN(rst_n), .Q(valid) );
  DFFRQX2M \product_reg[8]  ( .D(n42), .CK(clk), .RN(rst_n), .Q(product[8]) );
  DFFRQX2M \product_reg[7]  ( .D(n41), .CK(clk), .RN(rst_n), .Q(product[7]) );
  DFFRQX2M \product_reg[6]  ( .D(n40), .CK(clk), .RN(rst_n), .Q(product[6]) );
  DFFRQX2M \product_reg[5]  ( .D(n39), .CK(clk), .RN(rst_n), .Q(product[5]) );
  DFFRQX2M \product_reg[4]  ( .D(n38), .CK(clk), .RN(rst_n), .Q(product[4]) );
  DFFRQX2M \product_reg[3]  ( .D(n37), .CK(clk), .RN(rst_n), .Q(product[3]) );
  DFFRQX2M \product_reg[2]  ( .D(n36), .CK(clk), .RN(rst_n), .Q(product[2]) );
  DFFRQX2M \product_reg[1]  ( .D(n35), .CK(clk), .RN(rst_n), .Q(product[1]) );
  DFFRQX2M \product_reg[0]  ( .D(n34), .CK(clk), .RN(rst_n), .Q(product[0]) );
  DFFRQX2M \product_reg[15]  ( .D(n49), .CK(clk), .RN(rst_n), .Q(product[15])
         );
  DFFRQX2M \product_reg[14]  ( .D(n48), .CK(clk), .RN(rst_n), .Q(product[14])
         );
  DFFRQX2M \product_reg[11]  ( .D(n45), .CK(clk), .RN(rst_n), .Q(product[11])
         );
  DFFRQX2M \product_reg[10]  ( .D(n44), .CK(clk), .RN(rst_n), .Q(product[10])
         );
  DFFRQX2M \product_reg[9]  ( .D(n43), .CK(clk), .RN(rst_n), .Q(product[9]) );
  DFFRX1M \b_reg_reg[6]  ( .D(b[6]), .CK(clk), .RN(rst_n), .Q(n24) );
  DFFRX1M \b_reg_reg[7]  ( .D(b[7]), .CK(clk), .RN(rst_n), .Q(n32) );
  DFFRX1M \a_reg_reg[7]  ( .D(a[7]), .CK(clk), .RN(rst_n), .Q(n33) );
  DFFRX2M \b_reg_reg[3]  ( .D(b[3]), .CK(clk), .RN(rst_n), .Q(n21) );
  DFFRX2M \a_reg_reg[2]  ( .D(a[2]), .CK(clk), .RN(rst_n), .Q(n27) );
  DFFRQX1M \product_reg[12]  ( .D(n46), .CK(clk), .RN(rst_n), .Q(product[12])
         );
  DFFRX1M \a_reg_reg[6]  ( .D(a[6]), .CK(clk), .RN(rst_n), .Q(n31) );
  DFFRX1M \a_reg_reg[5]  ( .D(a[5]), .CK(clk), .RN(rst_n), .Q(n30) );
  DFFRX1M \a_reg_reg[4]  ( .D(a[4]), .CK(clk), .RN(rst_n), .Q(n29) );
  DFFRQX2M \product_reg[13]  ( .D(n47), .CK(clk), .RN(rst_n), .Q(product[13])
         );
  DFFRQX2M \b_reg_reg[1]  ( .D(b[1]), .CK(clk), .RN(rst_n), .Q(n12) );
  DFFRX4M \b_reg_reg[4]  ( .D(b[4]), .CK(clk), .RN(rst_n), .QN(n63) );
  DFFRQX2M \b_reg_reg[5]  ( .D(b[5]), .CK(clk), .RN(rst_n), .Q(n6) );
  DFFRQX2M \a_reg_reg[1]  ( .D(a[1]), .CK(clk), .RN(rst_n), .Q(n50) );
  DFFRQX2M \a_reg_reg[0]  ( .D(a[0]), .CK(clk), .RN(rst_n), .Q(n52) );
  DFFRQX2M \b_reg_reg[0]  ( .D(b[0]), .CK(clk), .RN(rst_n), .Q(n14) );
  DFFRX1M en_reg_reg ( .D(en), .CK(clk), .RN(rst_n), .QN(n56) );
  DFFRX1M \b_reg_reg[2]  ( .D(b[2]), .CK(clk), .RN(rst_n), .Q(n20) );
  DFFRX1M \a_reg_reg[3]  ( .D(a[3]), .CK(clk), .RN(rst_n), .Q(n28) );
  XOR2X2M U3 ( .A(\add_1_root_add_0_root_add_135/carry[7] ), .B(n2), .Y(
        \add_1_root_add_0_root_add_135/SUM[7] ) );
  ADDFHX8M U4 ( .A(\pp[2][2] ), .B(\pp[3][1] ), .CI(
        \add_5_root_add_0_root_add_135/carry[4] ), .CO(
        \add_5_root_add_0_root_add_135/carry[5] ), .S(
        \add_3_root_add_0_root_add_135/B[4] ) );
  NOR2X2M U5 ( .A(n72), .B(n65), .Y(\pp[2][2] ) );
  CLKAND2X4M U6 ( .A(\add_1_root_add_0_root_add_135/carry[10] ), .B(
        \add_1_root_add_0_root_add_135/B[10] ), .Y(
        \add_1_root_add_0_root_add_135/carry[11] ) );
  AND2X8M U7 ( .A(\pp[2][1] ), .B(\pp[3][0] ), .Y(
        \add_5_root_add_0_root_add_135/carry[4] ) );
  XOR2X8M U8 ( .A(\add_1_root_add_0_root_add_135/A[7] ), .B(
        \add_1_root_add_0_root_add_135/B[7] ), .Y(n2) );
  NOR2X1M U9 ( .A(n72), .B(n7), .Y(\pp[5][2] ) );
  NOR2X1M U10 ( .A(n71), .B(n7), .Y(\pp[5][3] ) );
  INVX8M U11 ( .A(n6), .Y(n7) );
  XOR2X1M U12 ( .A(\pp[5][0] ), .B(\pp[4][1] ), .Y(
        \add_1_root_add_0_root_add_135/B[5] ) );
  AND2X8M U13 ( .A(\pp[4][1] ), .B(\pp[5][0] ), .Y(
        \add_4_root_add_0_root_add_135/carry[6] ) );
  NOR2X4M U14 ( .A(n53), .B(n7), .Y(\pp[5][0] ) );
  ADDFX2M U15 ( .A(\pp[7][5] ), .B(\add_2_root_add_0_root_add_135/B[12] ), 
        .CI(\add_2_root_add_0_root_add_135/carry[12] ), .CO(
        \add_2_root_add_0_root_add_135/carry[13] ), .S(
        \add_1_root_add_0_root_add_135/B[12] ) );
  ADDFHX4M U16 ( .A(\pp[4][5] ), .B(\pp[5][4] ), .CI(
        \add_4_root_add_0_root_add_135/carry[9] ), .CO(
        \add_4_root_add_0_root_add_135/carry[10] ), .S(
        \add_2_root_add_0_root_add_135/B[9] ) );
  ADDFHX4M U17 ( .A(\pp[7][6] ), .B(\add_2_root_add_0_root_add_135/B[13] ), 
        .CI(\add_2_root_add_0_root_add_135/carry[13] ), .CO(
        \add_2_root_add_0_root_add_135/carry[14] ), .S(
        \add_1_root_add_0_root_add_135/B[13] ) );
  XOR2X1M U18 ( .A(\add_1_root_add_0_root_add_135/carry[9] ), .B(n16), .Y(
        \add_1_root_add_0_root_add_135/SUM[9] ) );
  CLKXOR2X2M U19 ( .A(\add_1_root_add_0_root_add_135/A[9] ), .B(
        \add_1_root_add_0_root_add_135/B[9] ), .Y(n16) );
  ADDFX2M U20 ( .A(\pp[2][7] ), .B(\pp[3][6] ), .CI(
        \add_5_root_add_0_root_add_135/carry[9] ), .CO(
        \add_5_root_add_0_root_add_135/carry[10] ), .S(
        \add_3_root_add_0_root_add_135/B[9] ) );
  NOR2X2M U21 ( .A(n51), .B(n63), .Y(\pp[4][1] ) );
  INVX6M U22 ( .A(n28), .Y(n71) );
  ADDFHX2M U23 ( .A(\pp[0][6] ), .B(\pp[1][5] ), .CI(
        \add_6_root_add_0_root_add_135/carry[6] ), .CO(
        \add_6_root_add_0_root_add_135/carry[7] ), .S(
        \add_1_root_add_0_root_add_135/A[6] ) );
  AND2X2M U24 ( .A(\add_6_root_add_0_root_add_135/carry[8] ), .B(\pp[1][7] ), 
        .Y(\add_1_root_add_0_root_add_135/A[9] ) );
  ADDFX2M U25 ( .A(\pp[7][2] ), .B(\add_2_root_add_0_root_add_135/B[9] ), .CI(
        \add_2_root_add_0_root_add_135/carry[9] ), .CO(
        \add_2_root_add_0_root_add_135/carry[10] ), .S(
        \add_1_root_add_0_root_add_135/B[9] ) );
  INVX8M U26 ( .A(n12), .Y(n13) );
  INVX6M U27 ( .A(n50), .Y(n51) );
  INVX6M U28 ( .A(n20), .Y(n65) );
  NOR2X4M U29 ( .A(n53), .B(n64), .Y(\pp[3][0] ) );
  CLKXOR2X2M U30 ( .A(\add_2_root_add_0_root_add_135/B[7] ), .B(\pp[7][0] ), 
        .Y(\add_1_root_add_0_root_add_135/B[7] ) );
  XOR2X4M U31 ( .A(\add_1_root_add_0_root_add_135/B[15] ), .B(
        \add_1_root_add_0_root_add_135/carry[15] ), .Y(
        \add_1_root_add_0_root_add_135/SUM[15] ) );
  INVX8M U32 ( .A(n52), .Y(n53) );
  INVX6M U33 ( .A(n14), .Y(n15) );
  NOR2X4M U34 ( .A(n51), .B(n15), .Y(\pp[0][1] ) );
  CLKXOR2X2M U35 ( .A(\add_1_root_add_0_root_add_135/A[8] ), .B(
        \add_1_root_add_0_root_add_135/B[8] ), .Y(n8) );
  NAND2X2M U36 ( .A(n54), .B(n55), .Y(n47) );
  NAND2X2M U37 ( .A(product[13]), .B(n60), .Y(n55) );
  CLKAND2X6M U38 ( .A(n17), .B(n19), .Y(n1) );
  NOR2X2M U39 ( .A(n51), .B(n13), .Y(\pp[1][1] ) );
  NOR2X3M U40 ( .A(n51), .B(n65), .Y(\pp[2][1] ) );
  NAND2X6M U41 ( .A(\add_1_root_add_0_root_add_135/carry[9] ), .B(
        \add_1_root_add_0_root_add_135/A[9] ), .Y(n17) );
  CLKNAND2X16M U42 ( .A(\add_1_root_add_0_root_add_135/carry[7] ), .B(
        \add_1_root_add_0_root_add_135/A[7] ), .Y(n3) );
  CLKNAND2X16M U43 ( .A(\add_1_root_add_0_root_add_135/carry[7] ), .B(
        \add_1_root_add_0_root_add_135/B[7] ), .Y(n4) );
  CLKNAND2X8M U44 ( .A(\add_1_root_add_0_root_add_135/A[7] ), .B(
        \add_1_root_add_0_root_add_135/B[7] ), .Y(n5) );
  NAND3X12M U45 ( .A(n5), .B(n4), .C(n3), .Y(
        \add_1_root_add_0_root_add_135/carry[8] ) );
  ADDFHX4M U46 ( .A(\pp[0][7] ), .B(\pp[1][6] ), .CI(
        \add_6_root_add_0_root_add_135/carry[7] ), .CO(
        \add_6_root_add_0_root_add_135/carry[8] ), .S(
        \add_1_root_add_0_root_add_135/A[7] ) );
  ADDFHX8M U47 ( .A(\add_1_root_add_0_root_add_135/A[6] ), .B(
        \add_1_root_add_0_root_add_135/B[6] ), .CI(
        \add_1_root_add_0_root_add_135/carry[6] ), .CO(
        \add_1_root_add_0_root_add_135/carry[7] ), .S(
        \add_1_root_add_0_root_add_135/SUM[6] ) );
  XOR2X1M U48 ( .A(\add_1_root_add_0_root_add_135/carry[8] ), .B(n8), .Y(
        \add_1_root_add_0_root_add_135/SUM[8] ) );
  NAND2X5M U49 ( .A(\add_1_root_add_0_root_add_135/carry[8] ), .B(
        \add_1_root_add_0_root_add_135/A[8] ), .Y(n9) );
  NAND2X5M U50 ( .A(\add_1_root_add_0_root_add_135/carry[8] ), .B(
        \add_1_root_add_0_root_add_135/B[8] ), .Y(n10) );
  INVX2M U51 ( .A(\add_1_root_add_0_root_add_135/carry[10] ), .Y(n23) );
  NAND2X2M U52 ( .A(n22), .B(\add_1_root_add_0_root_add_135/carry[10] ), .Y(
        n26) );
  NAND2X2M U53 ( .A(\add_1_root_add_0_root_add_135/A[9] ), .B(
        \add_1_root_add_0_root_add_135/B[9] ), .Y(n19) );
  CLKNAND2X12M U54 ( .A(n18), .B(n1), .Y(
        \add_1_root_add_0_root_add_135/carry[10] ) );
  NAND2X2M U55 ( .A(\add_1_root_add_0_root_add_135/carry[9] ), .B(
        \add_1_root_add_0_root_add_135/B[9] ), .Y(n18) );
  NAND2X3M U56 ( .A(\add_1_root_add_0_root_add_135/A[8] ), .B(
        \add_1_root_add_0_root_add_135/B[8] ), .Y(n11) );
  NOR2X4M U57 ( .A(n53), .B(n13), .Y(\pp[1][0] ) );
  ADDFHX4M U58 ( .A(\pp[7][1] ), .B(\add_2_root_add_0_root_add_135/B[8] ), 
        .CI(\add_2_root_add_0_root_add_135/carry[8] ), .CO(
        \add_2_root_add_0_root_add_135/carry[9] ), .S(
        \add_1_root_add_0_root_add_135/B[8] ) );
  NOR2X1M U59 ( .A(n61), .B(n51), .Y(\pp[7][1] ) );
  NAND3X12M U60 ( .A(n11), .B(n10), .C(n9), .Y(
        \add_1_root_add_0_root_add_135/carry[9] ) );
  CLKXOR2X8M U61 ( .A(\pp[1][7] ), .B(\add_6_root_add_0_root_add_135/carry[8] ), .Y(\add_1_root_add_0_root_add_135/A[8] ) );
  AO22X8M U62 ( .A0(level7[15]), .A1(n58), .B0(product[15]), .B1(n60), .Y(n49)
         );
  CLKAND2X4M U63 ( .A(\add_1_root_add_0_root_add_135/carry[11] ), .B(
        \add_1_root_add_0_root_add_135/B[11] ), .Y(
        \add_1_root_add_0_root_add_135/carry[12] ) );
  XOR2X2M U64 ( .A(\add_1_root_add_0_root_add_135/B[14] ), .B(
        \add_1_root_add_0_root_add_135/carry[14] ), .Y(
        \add_1_root_add_0_root_add_135/SUM[14] ) );
  AO22X1M U65 ( .A0(level7[11]), .A1(n58), .B0(product[11]), .B1(n60), .Y(n45)
         );
  ADDFHX8M U66 ( .A(\pp[0][2] ), .B(\pp[1][1] ), .CI(
        \add_6_root_add_0_root_add_135/carry[2] ), .CO(
        \add_6_root_add_0_root_add_135/carry[3] ), .S(
        \add_1_root_add_0_root_add_135/A[2] ) );
  NOR2X3M U67 ( .A(n72), .B(n15), .Y(\pp[0][2] ) );
  ADDFX2M U68 ( .A(\pp[7][3] ), .B(\add_2_root_add_0_root_add_135/B[10] ), 
        .CI(\add_2_root_add_0_root_add_135/carry[10] ), .CO(
        \add_2_root_add_0_root_add_135/carry[11] ), .S(
        \add_1_root_add_0_root_add_135/B[10] ) );
  AND2X4M U69 ( .A(\pp[0][1] ), .B(\pp[1][0] ), .Y(
        \add_6_root_add_0_root_add_135/carry[2] ) );
  NAND2X2M U70 ( .A(\add_1_root_add_0_root_add_135/B[10] ), .B(n23), .Y(n25)
         );
  NAND2X2M U71 ( .A(n25), .B(n26), .Y(\add_1_root_add_0_root_add_135/SUM[10] )
         );
  NOR2X1M U72 ( .A(n67), .B(n15), .Y(\pp[0][7] ) );
  INVXLM U73 ( .A(\add_1_root_add_0_root_add_135/B[10] ), .Y(n22) );
  NOR2X1M U74 ( .A(n51), .B(n7), .Y(\pp[5][1] ) );
  NOR2X1M U75 ( .A(n72), .B(n63), .Y(\pp[4][2] ) );
  NOR2X1M U76 ( .A(n51), .B(n64), .Y(\pp[3][1] ) );
  NOR2X1M U77 ( .A(n61), .B(n69), .Y(\pp[7][5] ) );
  NOR2X1M U78 ( .A(n67), .B(n65), .Y(\pp[2][7] ) );
  ADDFX2M U79 ( .A(\pp[6][4] ), .B(\add_3_root_add_0_root_add_135/B[10] ), 
        .CI(\add_3_root_add_0_root_add_135/carry[10] ), .CO(
        \add_3_root_add_0_root_add_135/carry[11] ), .S(
        \add_3_root_add_0_root_add_135/SUM[10] ) );
  NOR2X1M U80 ( .A(n70), .B(n62), .Y(\pp[6][4] ) );
  BUFX4M U81 ( .A(n66), .Y(n60) );
  AND2X2M U82 ( .A(\add_1_root_add_0_root_add_135/carry[12] ), .B(
        \add_1_root_add_0_root_add_135/B[12] ), .Y(
        \add_1_root_add_0_root_add_135/carry[13] ) );
  NOR2X1M U83 ( .A(n68), .B(n15), .Y(\pp[0][6] ) );
  INVX6M U84 ( .A(n56), .Y(n58) );
  NAND2X2M U85 ( .A(level7[13]), .B(n58), .Y(n54) );
  AND2X2M U86 ( .A(\add_1_root_add_0_root_add_135/carry[14] ), .B(
        \add_1_root_add_0_root_add_135/B[14] ), .Y(
        \add_1_root_add_0_root_add_135/carry[15] ) );
  AND2X2M U87 ( .A(\add_3_root_add_0_root_add_135/carry[12] ), .B(\pp[6][6] ), 
        .Y(\add_3_root_add_0_root_add_135/carry[13] ) );
  INVX4M U88 ( .A(n29), .Y(n70) );
  INVX4M U89 ( .A(n30), .Y(n69) );
  INVX4M U90 ( .A(n31), .Y(n68) );
  INVX6M U91 ( .A(n21), .Y(n64) );
  INVX8M U92 ( .A(n27), .Y(n72) );
  AND2X2M U93 ( .A(\add_1_root_add_0_root_add_135/carry[13] ), .B(
        \add_1_root_add_0_root_add_135/B[13] ), .Y(
        \add_1_root_add_0_root_add_135/carry[14] ) );
  NOR2X2M U94 ( .A(n53), .B(n65), .Y(\add_3_root_add_0_root_add_135/B[2] ) );
  INVX4M U95 ( .A(n33), .Y(n67) );
  INVX4M U96 ( .A(n32), .Y(n61) );
  INVX4M U97 ( .A(n24), .Y(n62) );
  NOR2X1M U98 ( .A(n53), .B(n15), .Y(\add_1_root_add_0_root_add_135/A[0] ) );
  BUFX4M U99 ( .A(n66), .Y(n59) );
  ADDFX2M U100 ( .A(\add_1_root_add_0_root_add_135/A[5] ), .B(
        \add_1_root_add_0_root_add_135/B[5] ), .CI(
        \add_1_root_add_0_root_add_135/carry[5] ), .CO(
        \add_1_root_add_0_root_add_135/carry[6] ), .S(
        \add_1_root_add_0_root_add_135/SUM[5] ) );
  INVX2M U101 ( .A(n57), .Y(n66) );
  NOR2X2M U102 ( .A(n68), .B(n13), .Y(\pp[1][6] ) );
  ADDFX2M U103 ( .A(\pp[0][3] ), .B(\pp[1][2] ), .CI(
        \add_6_root_add_0_root_add_135/carry[3] ), .CO(
        \add_6_root_add_0_root_add_135/carry[4] ), .S(
        \add_1_root_add_0_root_add_135/A[3] ) );
  NOR2X2M U104 ( .A(n72), .B(n13), .Y(\pp[1][2] ) );
  NOR2X2M U105 ( .A(n71), .B(n15), .Y(\pp[0][3] ) );
  ADDFX2M U106 ( .A(\pp[0][4] ), .B(\pp[1][3] ), .CI(
        \add_6_root_add_0_root_add_135/carry[4] ), .CO(
        \add_6_root_add_0_root_add_135/carry[5] ), .S(
        \add_1_root_add_0_root_add_135/A[4] ) );
  NOR2X2M U107 ( .A(n71), .B(n13), .Y(\pp[1][3] ) );
  NOR2X2M U108 ( .A(n70), .B(n15), .Y(\pp[0][4] ) );
  ADDFX2M U109 ( .A(\pp[0][5] ), .B(\pp[1][4] ), .CI(
        \add_6_root_add_0_root_add_135/carry[5] ), .CO(
        \add_6_root_add_0_root_add_135/carry[6] ), .S(
        \add_1_root_add_0_root_add_135/A[5] ) );
  NOR2X2M U110 ( .A(n70), .B(n13), .Y(\pp[1][4] ) );
  NOR2X2M U111 ( .A(n69), .B(n15), .Y(\pp[0][5] ) );
  NOR2X2M U112 ( .A(n69), .B(n13), .Y(\pp[1][5] ) );
  NOR2X2M U113 ( .A(n53), .B(n63), .Y(\add_1_root_add_0_root_add_135/B[4] ) );
  ADDFX2M U114 ( .A(\pp[4][3] ), .B(\pp[5][2] ), .CI(
        \add_4_root_add_0_root_add_135/carry[7] ), .CO(
        \add_4_root_add_0_root_add_135/carry[8] ), .S(
        \add_2_root_add_0_root_add_135/B[7] ) );
  NOR2X2M U115 ( .A(n71), .B(n63), .Y(\pp[4][3] ) );
  NOR2X2M U116 ( .A(n61), .B(n71), .Y(\pp[7][3] ) );
  ADDFX2M U117 ( .A(\pp[7][4] ), .B(\add_2_root_add_0_root_add_135/B[11] ), 
        .CI(\add_2_root_add_0_root_add_135/carry[11] ), .CO(
        \add_2_root_add_0_root_add_135/carry[12] ), .S(
        \add_1_root_add_0_root_add_135/B[11] ) );
  NOR2X2M U118 ( .A(n61), .B(n70), .Y(\pp[7][4] ) );
  ADDFX2M U119 ( .A(\pp[4][4] ), .B(\pp[5][3] ), .CI(
        \add_4_root_add_0_root_add_135/carry[8] ), .CO(
        \add_4_root_add_0_root_add_135/carry[9] ), .S(
        \add_2_root_add_0_root_add_135/B[8] ) );
  NOR2X2M U120 ( .A(n70), .B(n63), .Y(\pp[4][4] ) );
  NOR2X2M U121 ( .A(n70), .B(n7), .Y(\pp[5][4] ) );
  NOR2X2M U122 ( .A(n69), .B(n63), .Y(\pp[4][5] ) );
  NOR2X2M U123 ( .A(n61), .B(n72), .Y(\pp[7][2] ) );
  ADDFX2M U124 ( .A(\pp[4][6] ), .B(\pp[5][5] ), .CI(
        \add_4_root_add_0_root_add_135/carry[10] ), .CO(
        \add_4_root_add_0_root_add_135/carry[11] ), .S(
        \add_2_root_add_0_root_add_135/B[10] ) );
  NOR2X2M U125 ( .A(n69), .B(n7), .Y(\pp[5][5] ) );
  NOR2X2M U126 ( .A(n68), .B(n63), .Y(\pp[4][6] ) );
  ADDFX2M U127 ( .A(\pp[4][7] ), .B(\pp[5][6] ), .CI(
        \add_4_root_add_0_root_add_135/carry[11] ), .CO(
        \add_4_root_add_0_root_add_135/carry[12] ), .S(
        \add_2_root_add_0_root_add_135/B[11] ) );
  NOR2X2M U128 ( .A(n68), .B(n7), .Y(\pp[5][6] ) );
  NOR2X2M U129 ( .A(n67), .B(n63), .Y(\pp[4][7] ) );
  ADDFX2M U130 ( .A(\pp[4][2] ), .B(\pp[5][1] ), .CI(
        \add_4_root_add_0_root_add_135/carry[6] ), .CO(
        \add_4_root_add_0_root_add_135/carry[7] ), .S(
        \add_1_root_add_0_root_add_135/B[6] ) );
  ADDFX2M U131 ( .A(\pp[6][1] ), .B(\add_3_root_add_0_root_add_135/B[7] ), 
        .CI(\add_3_root_add_0_root_add_135/carry[7] ), .CO(
        \add_3_root_add_0_root_add_135/carry[8] ), .S(
        \add_3_root_add_0_root_add_135/SUM[7] ) );
  NOR2X2M U132 ( .A(n51), .B(n62), .Y(\pp[6][1] ) );
  NOR2X2M U133 ( .A(n67), .B(n13), .Y(\pp[1][7] ) );
  NOR2X2M U134 ( .A(n61), .B(n53), .Y(\pp[7][0] ) );
  NOR2X2M U135 ( .A(n61), .B(n68), .Y(\pp[7][6] ) );
  ADDFX2M U136 ( .A(\pp[6][5] ), .B(\add_3_root_add_0_root_add_135/B[11] ), 
        .CI(\add_3_root_add_0_root_add_135/carry[11] ), .CO(
        \add_3_root_add_0_root_add_135/carry[12] ), .S(
        \add_3_root_add_0_root_add_135/SUM[11] ) );
  NOR2X2M U137 ( .A(n69), .B(n62), .Y(\pp[6][5] ) );
  NOR2X2M U138 ( .A(n68), .B(n64), .Y(\pp[3][6] ) );
  ADDFX2M U139 ( .A(\pp[2][3] ), .B(\pp[3][2] ), .CI(
        \add_5_root_add_0_root_add_135/carry[5] ), .CO(
        \add_5_root_add_0_root_add_135/carry[6] ), .S(
        \add_3_root_add_0_root_add_135/B[5] ) );
  NOR2X2M U140 ( .A(n72), .B(n64), .Y(\pp[3][2] ) );
  NOR2X2M U141 ( .A(n71), .B(n65), .Y(\pp[2][3] ) );
  ADDFX2M U142 ( .A(\pp[2][4] ), .B(\pp[3][3] ), .CI(
        \add_5_root_add_0_root_add_135/carry[6] ), .CO(
        \add_5_root_add_0_root_add_135/carry[7] ), .S(
        \add_3_root_add_0_root_add_135/B[6] ) );
  NOR2X2M U143 ( .A(n71), .B(n64), .Y(\pp[3][3] ) );
  NOR2X2M U144 ( .A(n70), .B(n65), .Y(\pp[2][4] ) );
  ADDFX2M U145 ( .A(\pp[2][5] ), .B(\pp[3][4] ), .CI(
        \add_5_root_add_0_root_add_135/carry[7] ), .CO(
        \add_5_root_add_0_root_add_135/carry[8] ), .S(
        \add_3_root_add_0_root_add_135/B[7] ) );
  NOR2X2M U146 ( .A(n70), .B(n64), .Y(\pp[3][4] ) );
  NOR2X2M U147 ( .A(n69), .B(n65), .Y(\pp[2][5] ) );
  ADDFX2M U148 ( .A(\pp[2][6] ), .B(\pp[3][5] ), .CI(
        \add_5_root_add_0_root_add_135/carry[8] ), .CO(
        \add_5_root_add_0_root_add_135/carry[9] ), .S(
        \add_3_root_add_0_root_add_135/B[8] ) );
  NOR2X2M U149 ( .A(n69), .B(n64), .Y(\pp[3][5] ) );
  NOR2X2M U150 ( .A(n68), .B(n65), .Y(\pp[2][6] ) );
  ADDFX2M U151 ( .A(\pp[6][2] ), .B(\add_3_root_add_0_root_add_135/B[8] ), 
        .CI(\add_3_root_add_0_root_add_135/carry[8] ), .CO(
        \add_3_root_add_0_root_add_135/carry[9] ), .S(
        \add_3_root_add_0_root_add_135/SUM[8] ) );
  NOR2X2M U152 ( .A(n72), .B(n62), .Y(\pp[6][2] ) );
  ADDFX2M U153 ( .A(\pp[6][3] ), .B(\add_3_root_add_0_root_add_135/B[9] ), 
        .CI(\add_3_root_add_0_root_add_135/carry[9] ), .CO(
        \add_3_root_add_0_root_add_135/carry[10] ), .S(
        \add_3_root_add_0_root_add_135/SUM[9] ) );
  NOR2X2M U154 ( .A(n71), .B(n62), .Y(\pp[6][3] ) );
  NOR2X2M U155 ( .A(n53), .B(n62), .Y(\pp[6][0] ) );
  NOR2X2M U156 ( .A(n67), .B(n64), .Y(\pp[3][7] ) );
  NOR2X2M U157 ( .A(n67), .B(n7), .Y(\pp[5][7] ) );
  NOR2X2M U158 ( .A(n68), .B(n62), .Y(\pp[6][6] ) );
  NOR2X2M U159 ( .A(n67), .B(n61), .Y(\pp[7][7] ) );
  NOR2X2M U160 ( .A(n67), .B(n62), .Y(\pp[6][7] ) );
  INVX4M U161 ( .A(n56), .Y(n57) );
  AO22X1M U162 ( .A0(level7[14]), .A1(n58), .B0(product[14]), .B1(n60), .Y(n48) );
  AO22X1M U163 ( .A0(level7[12]), .A1(n58), .B0(product[12]), .B1(n60), .Y(n46) );
  AO22X1M U164 ( .A0(level7[9]), .A1(n58), .B0(product[9]), .B1(n60), .Y(n43)
         );
  AO22X1M U165 ( .A0(level7[10]), .A1(n58), .B0(product[10]), .B1(n60), .Y(n44) );
  AO22X1M U166 ( .A0(level7[6]), .A1(n57), .B0(product[6]), .B1(n59), .Y(n40)
         );
  AO22X1M U167 ( .A0(level7[7]), .A1(n58), .B0(product[7]), .B1(n59), .Y(n41)
         );
  AO22X1M U168 ( .A0(level7[8]), .A1(n58), .B0(product[8]), .B1(n60), .Y(n42)
         );
  AO22X1M U169 ( .A0(level7[4]), .A1(n57), .B0(product[4]), .B1(n59), .Y(n38)
         );
  AO22X1M U170 ( .A0(level7[5]), .A1(n57), .B0(product[5]), .B1(n59), .Y(n39)
         );
  AO22X1M U171 ( .A0(level7[2]), .A1(n57), .B0(product[2]), .B1(n59), .Y(n36)
         );
  AO22X1M U172 ( .A0(level7[3]), .A1(n57), .B0(product[3]), .B1(n59), .Y(n37)
         );
  AO22X1M U173 ( .A0(level7[1]), .A1(n57), .B0(product[1]), .B1(n59), .Y(n35)
         );
  AO22X1M U174 ( .A0(level7[0]), .A1(n57), .B0(product[0]), .B1(n59), .Y(n34)
         );
  AND2X1M U175 ( .A(\add_3_root_add_0_root_add_135/carry[13] ), .B(\pp[6][7] ), 
        .Y(\add_3_root_add_0_root_add_135/SUM[14] ) );
  CLKXOR2X2M U176 ( .A(\pp[6][7] ), .B(
        \add_3_root_add_0_root_add_135/carry[13] ), .Y(
        \add_3_root_add_0_root_add_135/SUM[13] ) );
  CLKXOR2X2M U177 ( .A(\pp[6][6] ), .B(
        \add_3_root_add_0_root_add_135/carry[12] ), .Y(
        \add_3_root_add_0_root_add_135/SUM[12] ) );
  AND2X1M U178 ( .A(\pp[6][0] ), .B(\add_3_root_add_0_root_add_135/B[6] ), .Y(
        \add_3_root_add_0_root_add_135/carry[7] ) );
  CLKXOR2X2M U179 ( .A(\add_3_root_add_0_root_add_135/B[6] ), .B(\pp[6][0] ), 
        .Y(\add_3_root_add_0_root_add_135/SUM[6] ) );
  AND2X1M U180 ( .A(\add_5_root_add_0_root_add_135/carry[10] ), .B(\pp[3][7] ), 
        .Y(\add_3_root_add_0_root_add_135/B[11] ) );
  CLKXOR2X2M U181 ( .A(\pp[3][7] ), .B(
        \add_5_root_add_0_root_add_135/carry[10] ), .Y(
        \add_3_root_add_0_root_add_135/B[10] ) );
  CLKXOR2X2M U182 ( .A(\pp[3][0] ), .B(\pp[2][1] ), .Y(
        \add_3_root_add_0_root_add_135/B[3] ) );
  CLKXOR2X2M U183 ( .A(\add_1_root_add_0_root_add_135/B[13] ), .B(
        \add_1_root_add_0_root_add_135/carry[13] ), .Y(
        \add_1_root_add_0_root_add_135/SUM[13] ) );
  CLKXOR2X2M U184 ( .A(\add_1_root_add_0_root_add_135/B[12] ), .B(
        \add_1_root_add_0_root_add_135/carry[12] ), .Y(
        \add_1_root_add_0_root_add_135/SUM[12] ) );
  CLKXOR2X2M U185 ( .A(\add_1_root_add_0_root_add_135/B[11] ), .B(
        \add_1_root_add_0_root_add_135/carry[11] ), .Y(
        \add_1_root_add_0_root_add_135/SUM[11] ) );
  AND2X1M U186 ( .A(\add_1_root_add_0_root_add_135/A[4] ), .B(
        \add_1_root_add_0_root_add_135/B[4] ), .Y(
        \add_1_root_add_0_root_add_135/carry[5] ) );
  CLKXOR2X2M U187 ( .A(\add_1_root_add_0_root_add_135/B[4] ), .B(
        \add_1_root_add_0_root_add_135/A[4] ), .Y(
        \add_1_root_add_0_root_add_135/SUM[4] ) );
  CLKXOR2X2M U188 ( .A(\pp[1][0] ), .B(\pp[0][1] ), .Y(
        \add_1_root_add_0_root_add_135/A[1] ) );
  AND2X1M U189 ( .A(\add_2_root_add_0_root_add_135/carry[14] ), .B(\pp[7][7] ), 
        .Y(\add_1_root_add_0_root_add_135/B[15] ) );
  CLKXOR2X2M U190 ( .A(\pp[7][7] ), .B(
        \add_2_root_add_0_root_add_135/carry[14] ), .Y(
        \add_1_root_add_0_root_add_135/B[14] ) );
  AND2X1M U191 ( .A(\pp[7][0] ), .B(\add_2_root_add_0_root_add_135/B[7] ), .Y(
        \add_2_root_add_0_root_add_135/carry[8] ) );
  AND2X1M U192 ( .A(\add_4_root_add_0_root_add_135/carry[12] ), .B(\pp[5][7] ), 
        .Y(\add_2_root_add_0_root_add_135/B[13] ) );
  CLKXOR2X2M U193 ( .A(\pp[5][7] ), .B(
        \add_4_root_add_0_root_add_135/carry[12] ), .Y(
        \add_2_root_add_0_root_add_135/B[12] ) );
endmodule


module alu8_top ( clk, rst_n, mode, add_en, mul_en, a, b, result, valid );
  input [7:0] a;
  input [7:0] b;
  output [15:0] result;
  input clk, rst_n, mode, add_en, mul_en;
  output valid;
  wire   add_cout, add_valid, mul_valid, n2, n3, n4;
  wire   [7:0] add_sum;
  wire   [15:0] mul_product;

  AO22X8M U2 ( .A0(mul_valid), .A1(n2), .B0(add_valid), .B1(n3), .Y(valid) );
  AO22X8M U4 ( .A0(mul_product[8]), .A1(n2), .B0(add_cout), .B1(n3), .Y(
        result[8]) );
  AO22X8M U5 ( .A0(mul_product[7]), .A1(n2), .B0(add_sum[7]), .B1(n3), .Y(
        result[7]) );
  AO22X8M U6 ( .A0(mul_product[6]), .A1(n2), .B0(add_sum[6]), .B1(n3), .Y(
        result[6]) );
  AO22X8M U7 ( .A0(mul_product[5]), .A1(n2), .B0(add_sum[5]), .B1(n3), .Y(
        result[5]) );
  AO22X8M U8 ( .A0(mul_product[4]), .A1(n2), .B0(add_sum[4]), .B1(n3), .Y(
        result[4]) );
  AO22X8M U9 ( .A0(mul_product[3]), .A1(n2), .B0(add_sum[3]), .B1(n3), .Y(
        result[3]) );
  AO22X8M U10 ( .A0(mul_product[2]), .A1(n2), .B0(add_sum[2]), .B1(n3), .Y(
        result[2]) );
  AO22X8M U11 ( .A0(mul_product[1]), .A1(n2), .B0(add_sum[1]), .B1(n3), .Y(
        result[1]) );
  AO22X8M U18 ( .A0(mul_product[0]), .A1(n2), .B0(add_sum[0]), .B1(n3), .Y(
        result[0]) );
  add_unit u_add ( .clk(clk), .rst_n(rst_n), .en(add_en), .a(a), .b(b), .sum(
        add_sum), .cout(add_cout), .valid(add_valid) );
  mult_unit u_mul ( .clk(clk), .rst_n(rst_n), .en(mul_en), .a(a), .b(b), 
        .product(mul_product), .valid(mul_valid) );
  CLKBUFX6M U20 ( .A(n4), .Y(n3) );
  INVX2M U21 ( .A(n2), .Y(n4) );
  AND2X8M U22 ( .A(mul_product[9]), .B(n2), .Y(result[9]) );
  AND2X8M U23 ( .A(mul_product[10]), .B(n2), .Y(result[10]) );
  AND2X8M U24 ( .A(mul_product[11]), .B(n2), .Y(result[11]) );
  AND2X8M U25 ( .A(mul_product[12]), .B(n2), .Y(result[12]) );
  AND2X8M U26 ( .A(mul_product[13]), .B(n2), .Y(result[13]) );
  AND2X8M U27 ( .A(mul_product[14]), .B(n2), .Y(result[14]) );
  AND2X8M U28 ( .A(mul_product[15]), .B(n2), .Y(result[15]) );
  BUFX10M U29 ( .A(mode), .Y(n2) );
endmodule

