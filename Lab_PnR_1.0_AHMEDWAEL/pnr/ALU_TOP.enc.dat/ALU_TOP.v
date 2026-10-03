/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 12 04:01:15 2022
/////////////////////////////////////////////////////////////
module mux2X1_1 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   MX2X6M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module mux2X1_0 (
	IN_0, 
	IN_1, 
	SEL, 
	OUT);
   input IN_0;
   input IN_1;
   input SEL;
   output OUT;

   // Internal wires
   wire N0;

   assign N0 = SEL ;

   CLKMX2X6M U1 (.Y(OUT), 
	.S0(N0), 
	.B(IN_1), 
	.A(IN_0));
endmodule

module Decoder (
	IN, 
	OUT);
   input [1:0] IN;
   output [3:0] OUT;

   // Internal wires
   wire n1;
   wire n2;

   NOR2X2M U1 (.Y(OUT[0]), 
	.B(IN[0]), 
	.A(IN[1]));
   NOR2X2M U2 (.Y(OUT[3]), 
	.B(n1), 
	.A(n2));
   NOR2X2M U3 (.Y(OUT[1]), 
	.B(n2), 
	.A(IN[1]));
   NOR2X2M U4 (.Y(OUT[2]), 
	.B(n1), 
	.A(IN[0]));
   INVX2M U5 (.Y(n2), 
	.A(IN[0]));
   INVX2M U6 (.Y(n1), 
	.A(IN[1]));
endmodule

module ARITHMETIC_UNIT_DW_div_uns_0 (
	a, 
	b, 
	quotient, 
	remainder, 
	divide_by_0);
   input [7:0] a;
   input [7:0] b;
   output [7:0] quotient;
   output [7:0] remainder;
   output divide_by_0;

   // Internal wires
   wire \u_div/SumTmp[1][0] ;
   wire \u_div/SumTmp[1][1] ;
   wire \u_div/SumTmp[1][2] ;
   wire \u_div/SumTmp[1][3] ;
   wire \u_div/SumTmp[1][4] ;
   wire \u_div/SumTmp[1][5] ;
   wire \u_div/SumTmp[1][6] ;
   wire \u_div/SumTmp[2][0] ;
   wire \u_div/SumTmp[2][1] ;
   wire \u_div/SumTmp[2][2] ;
   wire \u_div/SumTmp[2][3] ;
   wire \u_div/SumTmp[2][4] ;
   wire \u_div/SumTmp[2][5] ;
   wire \u_div/SumTmp[3][0] ;
   wire \u_div/SumTmp[3][1] ;
   wire \u_div/SumTmp[3][2] ;
   wire \u_div/SumTmp[3][3] ;
   wire \u_div/SumTmp[3][4] ;
   wire \u_div/SumTmp[4][0] ;
   wire \u_div/SumTmp[4][1] ;
   wire \u_div/SumTmp[4][2] ;
   wire \u_div/SumTmp[4][3] ;
   wire \u_div/SumTmp[5][0] ;
   wire \u_div/SumTmp[5][1] ;
   wire \u_div/SumTmp[5][2] ;
   wire \u_div/SumTmp[6][0] ;
   wire \u_div/SumTmp[6][1] ;
   wire \u_div/SumTmp[7][0] ;
   wire \u_div/CryTmp[0][1] ;
   wire \u_div/CryTmp[0][2] ;
   wire \u_div/CryTmp[0][3] ;
   wire \u_div/CryTmp[0][4] ;
   wire \u_div/CryTmp[0][5] ;
   wire \u_div/CryTmp[0][6] ;
   wire \u_div/CryTmp[0][7] ;
   wire \u_div/CryTmp[1][1] ;
   wire \u_div/CryTmp[1][2] ;
   wire \u_div/CryTmp[1][3] ;
   wire \u_div/CryTmp[1][4] ;
   wire \u_div/CryTmp[1][5] ;
   wire \u_div/CryTmp[1][6] ;
   wire \u_div/CryTmp[1][7] ;
   wire \u_div/CryTmp[2][1] ;
   wire \u_div/CryTmp[2][2] ;
   wire \u_div/CryTmp[2][3] ;
   wire \u_div/CryTmp[2][4] ;
   wire \u_div/CryTmp[2][5] ;
   wire \u_div/CryTmp[2][6] ;
   wire \u_div/CryTmp[3][1] ;
   wire \u_div/CryTmp[3][2] ;
   wire \u_div/CryTmp[3][3] ;
   wire \u_div/CryTmp[3][4] ;
   wire \u_div/CryTmp[3][5] ;
   wire \u_div/CryTmp[4][1] ;
   wire \u_div/CryTmp[4][2] ;
   wire \u_div/CryTmp[4][3] ;
   wire \u_div/CryTmp[4][4] ;
   wire \u_div/CryTmp[5][1] ;
   wire \u_div/CryTmp[5][2] ;
   wire \u_div/CryTmp[5][3] ;
   wire \u_div/CryTmp[6][1] ;
   wire \u_div/CryTmp[6][2] ;
   wire \u_div/CryTmp[7][1] ;
   wire \u_div/PartRem[1][1] ;
   wire \u_div/PartRem[1][2] ;
   wire \u_div/PartRem[1][3] ;
   wire \u_div/PartRem[1][4] ;
   wire \u_div/PartRem[1][5] ;
   wire \u_div/PartRem[1][6] ;
   wire \u_div/PartRem[1][7] ;
   wire \u_div/PartRem[2][1] ;
   wire \u_div/PartRem[2][2] ;
   wire \u_div/PartRem[2][3] ;
   wire \u_div/PartRem[2][4] ;
   wire \u_div/PartRem[2][5] ;
   wire \u_div/PartRem[2][6] ;
   wire \u_div/PartRem[3][1] ;
   wire \u_div/PartRem[3][2] ;
   wire \u_div/PartRem[3][3] ;
   wire \u_div/PartRem[3][4] ;
   wire \u_div/PartRem[3][5] ;
   wire \u_div/PartRem[4][1] ;
   wire \u_div/PartRem[4][2] ;
   wire \u_div/PartRem[4][3] ;
   wire \u_div/PartRem[4][4] ;
   wire \u_div/PartRem[5][1] ;
   wire \u_div/PartRem[5][2] ;
   wire \u_div/PartRem[5][3] ;
   wire \u_div/PartRem[6][1] ;
   wire \u_div/PartRem[6][2] ;
   wire \u_div/PartRem[7][1] ;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;

   ADDFX2M \u_div/u_fa_PartRem_0_6_1  (.S(\u_div/SumTmp[6][1] ), 
	.CO(\u_div/CryTmp[6][2] ), 
	.CI(\u_div/CryTmp[6][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[7][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_1  (.S(\u_div/SumTmp[1][1] ), 
	.CO(\u_div/CryTmp[1][2] ), 
	.CI(\u_div/CryTmp[1][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[2][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_1  (.S(\u_div/SumTmp[2][1] ), 
	.CO(\u_div/CryTmp[2][2] ), 
	.CI(\u_div/CryTmp[2][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[3][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_1  (.S(\u_div/SumTmp[3][1] ), 
	.CO(\u_div/CryTmp[3][2] ), 
	.CI(\u_div/CryTmp[3][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[4][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_1  (.S(\u_div/SumTmp[4][1] ), 
	.CO(\u_div/CryTmp[4][2] ), 
	.CI(\u_div/CryTmp[4][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[5][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_5_1  (.S(\u_div/SumTmp[5][1] ), 
	.CO(\u_div/CryTmp[5][2] ), 
	.CI(\u_div/CryTmp[5][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[6][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_1  (.CO(\u_div/CryTmp[0][2] ), 
	.CI(\u_div/CryTmp[0][1] ), 
	.B(n7), 
	.A(\u_div/PartRem[1][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_6  (.S(\u_div/SumTmp[1][6] ), 
	.CO(\u_div/CryTmp[1][7] ), 
	.CI(\u_div/CryTmp[1][6] ), 
	.B(n2), 
	.A(\u_div/PartRem[2][6] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_5  (.S(\u_div/SumTmp[2][5] ), 
	.CO(\u_div/CryTmp[2][6] ), 
	.CI(\u_div/CryTmp[2][5] ), 
	.B(n3), 
	.A(\u_div/PartRem[3][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_3  (.S(\u_div/SumTmp[4][3] ), 
	.CO(\u_div/CryTmp[4][4] ), 
	.CI(\u_div/CryTmp[4][3] ), 
	.B(n5), 
	.A(\u_div/PartRem[5][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_4  (.S(\u_div/SumTmp[3][4] ), 
	.CO(\u_div/CryTmp[3][5] ), 
	.CI(\u_div/CryTmp[3][4] ), 
	.B(n4), 
	.A(\u_div/PartRem[4][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_5_2  (.S(\u_div/SumTmp[5][2] ), 
	.CO(\u_div/CryTmp[5][3] ), 
	.CI(\u_div/CryTmp[5][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[6][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_6  (.CO(\u_div/CryTmp[0][7] ), 
	.CI(\u_div/CryTmp[0][6] ), 
	.B(n2), 
	.A(\u_div/PartRem[1][6] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_7  (.CO(quotient[0]), 
	.CI(\u_div/CryTmp[0][7] ), 
	.B(n1), 
	.A(\u_div/PartRem[1][7] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_4  (.CO(\u_div/CryTmp[0][5] ), 
	.CI(\u_div/CryTmp[0][4] ), 
	.B(n4), 
	.A(\u_div/PartRem[1][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_5  (.CO(\u_div/CryTmp[0][6] ), 
	.CI(\u_div/CryTmp[0][5] ), 
	.B(n3), 
	.A(\u_div/PartRem[1][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_5  (.S(\u_div/SumTmp[1][5] ), 
	.CO(\u_div/CryTmp[1][6] ), 
	.CI(\u_div/CryTmp[1][5] ), 
	.B(n3), 
	.A(\u_div/PartRem[2][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_4  (.S(\u_div/SumTmp[1][4] ), 
	.CO(\u_div/CryTmp[1][5] ), 
	.CI(\u_div/CryTmp[1][4] ), 
	.B(n4), 
	.A(\u_div/PartRem[2][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_4  (.S(\u_div/SumTmp[2][4] ), 
	.CO(\u_div/CryTmp[2][5] ), 
	.CI(\u_div/CryTmp[2][4] ), 
	.B(n4), 
	.A(\u_div/PartRem[3][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_3  (.S(\u_div/SumTmp[1][3] ), 
	.CO(\u_div/CryTmp[1][4] ), 
	.CI(\u_div/CryTmp[1][3] ), 
	.B(n5), 
	.A(\u_div/PartRem[2][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_3  (.S(\u_div/SumTmp[2][3] ), 
	.CO(\u_div/CryTmp[2][4] ), 
	.CI(\u_div/CryTmp[2][3] ), 
	.B(n5), 
	.A(\u_div/PartRem[3][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_3  (.S(\u_div/SumTmp[3][3] ), 
	.CO(\u_div/CryTmp[3][4] ), 
	.CI(\u_div/CryTmp[3][3] ), 
	.B(n5), 
	.A(\u_div/PartRem[4][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_2  (.CO(\u_div/CryTmp[0][3] ), 
	.CI(\u_div/CryTmp[0][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[1][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_3  (.CO(\u_div/CryTmp[0][4] ), 
	.CI(\u_div/CryTmp[0][3] ), 
	.B(n5), 
	.A(\u_div/PartRem[1][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_2  (.S(\u_div/SumTmp[1][2] ), 
	.CO(\u_div/CryTmp[1][3] ), 
	.CI(\u_div/CryTmp[1][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[2][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_2  (.S(\u_div/SumTmp[2][2] ), 
	.CO(\u_div/CryTmp[2][3] ), 
	.CI(\u_div/CryTmp[2][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[3][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_2  (.S(\u_div/SumTmp[3][2] ), 
	.CO(\u_div/CryTmp[3][3] ), 
	.CI(\u_div/CryTmp[3][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[4][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_2  (.S(\u_div/SumTmp[4][2] ), 
	.CO(\u_div/CryTmp[4][3] ), 
	.CI(\u_div/CryTmp[4][2] ), 
	.B(n6), 
	.A(\u_div/PartRem[5][2] ));
   INVX4M U1 (.Y(n8), 
	.A(b[0]));
   NOR2X2M U2 (.Y(n11), 
	.B(b[7]), 
	.A(b[6]));
   AND3X2M U3 (.Y(quotient[3]), 
	.C(\u_div/CryTmp[3][5] ), 
	.B(n3), 
	.A(n11));
   AND2X2M U4 (.Y(quotient[4]), 
	.B(n10), 
	.A(\u_div/CryTmp[4][4] ));
   AND2X2M U5 (.Y(quotient[2]), 
	.B(n11), 
	.A(\u_div/CryTmp[2][6] ));
   AND2X2M U6 (.Y(quotient[1]), 
	.B(n1), 
	.A(\u_div/CryTmp[1][7] ));
   AND2X2M U7 (.Y(quotient[5]), 
	.B(n9), 
	.A(\u_div/CryTmp[5][3] ));
   MX2X1M U8 (.Y(\u_div/PartRem[2][3] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][2] ), 
	.A(\u_div/PartRem[3][2] ));
   MX2X1M U9 (.Y(\u_div/PartRem[2][4] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][3] ), 
	.A(\u_div/PartRem[3][3] ));
   MX2X1M U10 (.Y(\u_div/PartRem[3][4] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][3] ), 
	.A(\u_div/PartRem[4][3] ));
   MX2X1M U11 (.Y(\u_div/PartRem[3][3] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][2] ), 
	.A(\u_div/PartRem[4][2] ));
   MX2X1M U12 (.Y(\u_div/PartRem[4][4] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][3] ), 
	.A(\u_div/PartRem[5][3] ));
   MX2X1M U13 (.Y(\u_div/PartRem[4][3] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][2] ), 
	.A(\u_div/PartRem[5][2] ));
   MX2X1M U14 (.Y(\u_div/PartRem[5][3] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][2] ), 
	.A(\u_div/PartRem[6][2] ));
   MX2X1M U15 (.Y(\u_div/PartRem[2][5] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][4] ), 
	.A(\u_div/PartRem[3][4] ));
   MX2X1M U16 (.Y(\u_div/PartRem[2][6] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][5] ), 
	.A(\u_div/PartRem[3][5] ));
   MX2X1M U17 (.Y(\u_div/PartRem[3][5] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][4] ), 
	.A(\u_div/PartRem[4][4] ));
   AND3X2M U18 (.Y(quotient[6]), 
	.C(\u_div/CryTmp[6][2] ), 
	.B(n6), 
	.A(n9));
   AND2X2M U19 (.Y(n9), 
	.B(n5), 
	.A(n10));
   MX2X1M U20 (.Y(\u_div/PartRem[2][2] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][1] ), 
	.A(\u_div/PartRem[3][1] ));
   MX2X1M U21 (.Y(\u_div/PartRem[3][2] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][1] ), 
	.A(\u_div/PartRem[4][1] ));
   MX2X1M U22 (.Y(\u_div/PartRem[4][2] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][1] ), 
	.A(\u_div/PartRem[5][1] ));
   MX2X1M U23 (.Y(\u_div/PartRem[5][2] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][1] ), 
	.A(\u_div/PartRem[6][1] ));
   MX2X1M U24 (.Y(\u_div/PartRem[6][2] ), 
	.S0(quotient[6]), 
	.B(\u_div/SumTmp[6][1] ), 
	.A(\u_div/PartRem[7][1] ));
   CLKINVX2M U25 (.Y(n6), 
	.A(b[2]));
   CLKINVX2M U26 (.Y(n7), 
	.A(b[1]));
   OR2X2M U27 (.Y(\u_div/CryTmp[7][1] ), 
	.B(n8), 
	.A(a[7]));
   XNOR2X2M U28 (.Y(\u_div/SumTmp[2][0] ), 
	.B(a[2]), 
	.A(n8));
   XNOR2X2M U29 (.Y(\u_div/SumTmp[3][0] ), 
	.B(a[3]), 
	.A(n8));
   XNOR2X2M U30 (.Y(\u_div/SumTmp[4][0] ), 
	.B(a[4]), 
	.A(n8));
   XNOR2X2M U31 (.Y(\u_div/SumTmp[5][0] ), 
	.B(a[5]), 
	.A(n8));
   XNOR2X2M U32 (.Y(\u_div/SumTmp[6][0] ), 
	.B(a[6]), 
	.A(n8));
   XNOR2X2M U33 (.Y(\u_div/SumTmp[7][0] ), 
	.B(a[7]), 
	.A(n8));
   NAND2BX2M U34 (.Y(\u_div/CryTmp[0][1] ), 
	.B(b[0]), 
	.AN(a[0]));
   OR2X2M U35 (.Y(\u_div/CryTmp[5][1] ), 
	.B(n8), 
	.A(a[5]));
   OR2X2M U36 (.Y(\u_div/CryTmp[4][1] ), 
	.B(n8), 
	.A(a[4]));
   OR2X2M U37 (.Y(\u_div/CryTmp[3][1] ), 
	.B(n8), 
	.A(a[3]));
   OR2X2M U38 (.Y(\u_div/CryTmp[2][1] ), 
	.B(n8), 
	.A(a[2]));
   OR2X2M U39 (.Y(\u_div/CryTmp[1][1] ), 
	.B(n8), 
	.A(a[1]));
   OR2X2M U40 (.Y(\u_div/CryTmp[6][1] ), 
	.B(n8), 
	.A(a[6]));
   CLKINVX2M U41 (.Y(n4), 
	.A(b[4]));
   CLKINVX2M U42 (.Y(n3), 
	.A(b[5]));
   CLKINVX2M U43 (.Y(n5), 
	.A(b[3]));
   INVX2M U44 (.Y(n2), 
	.A(b[6]));
   INVX2M U45 (.Y(n1), 
	.A(b[7]));
   XNOR2X2M U46 (.Y(\u_div/SumTmp[1][0] ), 
	.B(a[1]), 
	.A(n8));
   CLKMX2X2M U47 (.Y(\u_div/PartRem[1][7] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][6] ), 
	.A(\u_div/PartRem[2][6] ));
   CLKMX2X2M U48 (.Y(\u_div/PartRem[7][1] ), 
	.S0(quotient[7]), 
	.B(\u_div/SumTmp[7][0] ), 
	.A(a[7]));
   CLKMX2X2M U49 (.Y(\u_div/PartRem[1][6] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][5] ), 
	.A(\u_div/PartRem[2][5] ));
   CLKMX2X2M U50 (.Y(\u_div/PartRem[6][1] ), 
	.S0(quotient[6]), 
	.B(\u_div/SumTmp[6][0] ), 
	.A(a[6]));
   CLKMX2X2M U51 (.Y(\u_div/PartRem[1][5] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][4] ), 
	.A(\u_div/PartRem[2][4] ));
   CLKMX2X2M U52 (.Y(\u_div/PartRem[5][1] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][0] ), 
	.A(a[5]));
   CLKMX2X2M U53 (.Y(\u_div/PartRem[1][4] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][3] ), 
	.A(\u_div/PartRem[2][3] ));
   CLKMX2X2M U54 (.Y(\u_div/PartRem[4][1] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][0] ), 
	.A(a[4]));
   CLKMX2X2M U55 (.Y(\u_div/PartRem[1][3] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][2] ), 
	.A(\u_div/PartRem[2][2] ));
   CLKMX2X2M U56 (.Y(\u_div/PartRem[3][1] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][0] ), 
	.A(a[3]));
   CLKMX2X2M U57 (.Y(\u_div/PartRem[1][2] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][1] ), 
	.A(\u_div/PartRem[2][1] ));
   CLKMX2X2M U58 (.Y(\u_div/PartRem[2][1] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][0] ), 
	.A(a[2]));
   CLKMX2X2M U59 (.Y(\u_div/PartRem[1][1] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][0] ), 
	.A(a[1]));
   AND4X1M U60 (.Y(quotient[7]), 
	.D(n6), 
	.C(n7), 
	.B(n9), 
	.A(\u_div/CryTmp[7][1] ));
   AND3X1M U61 (.Y(n10), 
	.C(n3), 
	.B(n4), 
	.A(n11));
endmodule

module ARITHMETIC_UNIT_DW01_sub_0 (
	A, 
	B, 
	CI, 
	DIFF, 
	CO);
   input [8:0] A;
   input [8:0] B;
   input CI;
   output [8:0] DIFF;
   output CO;

   // Internal wires
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire [9:0] carry;

   ADDFX2M U2_7 (.S(DIFF[7]), 
	.CO(carry[8]), 
	.CI(carry[7]), 
	.B(n1), 
	.A(A[7]));
   ADDFX2M U2_6 (.S(DIFF[6]), 
	.CO(carry[7]), 
	.CI(carry[6]), 
	.B(n2), 
	.A(A[6]));
   ADDFX2M U2_5 (.S(DIFF[5]), 
	.CO(carry[6]), 
	.CI(carry[5]), 
	.B(n3), 
	.A(A[5]));
   ADDFX2M U2_4 (.S(DIFF[4]), 
	.CO(carry[5]), 
	.CI(carry[4]), 
	.B(n4), 
	.A(A[4]));
   ADDFX2M U2_3 (.S(DIFF[3]), 
	.CO(carry[4]), 
	.CI(carry[3]), 
	.B(n5), 
	.A(A[3]));
   ADDFX2M U2_2 (.S(DIFF[2]), 
	.CO(carry[3]), 
	.CI(carry[2]), 
	.B(n6), 
	.A(A[2]));
   ADDFX2M U2_1 (.S(DIFF[1]), 
	.CO(carry[2]), 
	.CI(carry[1]), 
	.B(n7), 
	.A(A[1]));
   XNOR2X2M U1 (.Y(DIFF[0]), 
	.B(A[0]), 
	.A(n8));
   INVX2M U2 (.Y(n8), 
	.A(B[0]));
   INVX2M U3 (.Y(n7), 
	.A(B[1]));
   OR2X2M U4 (.Y(carry[1]), 
	.B(n8), 
	.A(A[0]));
   INVX2M U5 (.Y(n6), 
	.A(B[2]));
   INVX2M U6 (.Y(n5), 
	.A(B[3]));
   INVX2M U7 (.Y(n4), 
	.A(B[4]));
   INVX2M U8 (.Y(n3), 
	.A(B[5]));
   INVX2M U9 (.Y(n2), 
	.A(B[6]));
   INVX2M U10 (.Y(n1), 
	.A(B[7]));
   CLKINVX1M U11 (.Y(DIFF[8]), 
	.A(carry[8]));
endmodule

module ARITHMETIC_UNIT_DW01_add_0 (
	A, 
	B, 
	CI, 
	SUM, 
	CO);
   input [8:0] A;
   input [8:0] B;
   input CI;
   output [8:0] SUM;
   output CO;

   // Internal wires
   wire n1;
   wire [8:1] carry;

   ADDFX2M U1_7 (.S(SUM[7]), 
	.CO(SUM[8]), 
	.CI(carry[7]), 
	.B(B[7]), 
	.A(A[7]));
   ADDFX2M U1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.CI(carry[6]), 
	.B(B[6]), 
	.A(A[6]));
   ADDFX2M U1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.CI(carry[5]), 
	.B(B[5]), 
	.A(A[5]));
   ADDFX2M U1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.CI(carry[4]), 
	.B(B[4]), 
	.A(A[4]));
   ADDFX2M U1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.CI(carry[3]), 
	.B(B[3]), 
	.A(A[3]));
   ADDFX2M U1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.CI(carry[2]), 
	.B(B[2]), 
	.A(A[2]));
   ADDFX2M U1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.CI(n1), 
	.B(B[1]), 
	.A(A[1]));
   AND2X2M U1 (.Y(n1), 
	.B(A[0]), 
	.A(B[0]));
   CLKXOR2X2M U2 (.Y(SUM[0]), 
	.B(A[0]), 
	.A(B[0]));
endmodule

module ARITHMETIC_UNIT_DW01_add_1 (
	A, 
	B, 
	CI, 
	SUM, 
	CO);
   input [13:0] A;
   input [13:0] B;
   input CI;
   output [13:0] SUM;
   output CO;

   // Internal wires
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;

   OAI21BX1M U2 (.Y(n17), 
	.B0N(n21), 
	.A1(n20), 
	.A0(n19));
   AOI2BB1X2M U3 (.Y(n24), 
	.B0(n10), 
	.A1N(n11), 
	.A0N(n8));
   NOR2X2M U4 (.Y(n14), 
	.B(A[8]), 
	.A(B[8]));
   NOR2X2M U5 (.Y(n11), 
	.B(A[9]), 
	.A(B[9]));
   NOR2X2M U6 (.Y(n23), 
	.B(A[10]), 
	.A(B[10]));
   NOR2X2M U7 (.Y(n19), 
	.B(A[11]), 
	.A(B[11]));
   NAND2X2M U8 (.Y(n13), 
	.B(B[7]), 
	.A(A[7]));
   CLKXOR2X2M U9 (.Y(SUM[13]), 
	.B(n16), 
	.A(B[13]));
   INVX2M U10 (.Y(SUM[6]), 
	.A(n7));
   INVX2M U11 (.Y(n7), 
	.A(A[6]));
   CLKXOR2X2M U12 (.Y(SUM[7]), 
	.B(B[7]), 
	.A(A[7]));
   BUFX2M U13 (.Y(SUM[0]), 
	.A(A[0]));
   BUFX2M U14 (.Y(SUM[1]), 
	.A(A[1]));
   BUFX2M U15 (.Y(SUM[2]), 
	.A(A[2]));
   BUFX2M U16 (.Y(SUM[3]), 
	.A(A[3]));
   BUFX2M U17 (.Y(SUM[4]), 
	.A(A[4]));
   BUFX2M U18 (.Y(SUM[5]), 
	.A(A[5]));
   XNOR2X1M U19 (.Y(SUM[9]), 
	.B(n9), 
	.A(n8));
   NOR2X1M U20 (.Y(n9), 
	.B(n11), 
	.A(n10));
   CLKXOR2X2M U21 (.Y(SUM[8]), 
	.B(n13), 
	.A(n12));
   NAND2BX1M U22 (.Y(n12), 
	.B(n15), 
	.AN(n14));
   OAI2BB1X1M U23 (.Y(n16), 
	.B0(n18), 
	.A1N(A[12]), 
	.A0N(n17));
   OAI21X1M U24 (.Y(n18), 
	.B0(B[12]), 
	.A1(n17), 
	.A0(A[12]));
   XOR3XLM U25 (.Y(SUM[12]), 
	.C(n17), 
	.B(A[12]), 
	.A(B[12]));
   XNOR2X1M U26 (.Y(SUM[11]), 
	.B(n22), 
	.A(n20));
   NOR2X1M U27 (.Y(n22), 
	.B(n19), 
	.A(n21));
   AND2X1M U28 (.Y(n21), 
	.B(A[11]), 
	.A(B[11]));
   OA21X1M U29 (.Y(n20), 
	.B0(n25), 
	.A1(n24), 
	.A0(n23));
   CLKXOR2X2M U30 (.Y(SUM[10]), 
	.B(n24), 
	.A(n26));
   AND2X1M U31 (.Y(n10), 
	.B(A[9]), 
	.A(B[9]));
   OA21X1M U32 (.Y(n8), 
	.B0(n15), 
	.A1(n14), 
	.A0(n13));
   CLKNAND2X2M U33 (.Y(n15), 
	.B(A[8]), 
	.A(B[8]));
   NAND2BX1M U34 (.Y(n26), 
	.B(n25), 
	.AN(n23));
   CLKNAND2X2M U35 (.Y(n25), 
	.B(A[10]), 
	.A(B[10]));
endmodule

module ARITHMETIC_UNIT_DW02_mult_0 (
	A, 
	B, 
	TC, 
	PRODUCT);
   input [7:0] A;
   input [7:0] B;
   input TC;
   output [15:0] PRODUCT;

   // Internal wires
   wire \ab[7][7] ;
   wire \ab[7][6] ;
   wire \ab[7][5] ;
   wire \ab[7][4] ;
   wire \ab[7][3] ;
   wire \ab[7][2] ;
   wire \ab[7][1] ;
   wire \ab[7][0] ;
   wire \ab[6][7] ;
   wire \ab[6][6] ;
   wire \ab[6][5] ;
   wire \ab[6][4] ;
   wire \ab[6][3] ;
   wire \ab[6][2] ;
   wire \ab[6][1] ;
   wire \ab[6][0] ;
   wire \ab[5][7] ;
   wire \ab[5][6] ;
   wire \ab[5][5] ;
   wire \ab[5][4] ;
   wire \ab[5][3] ;
   wire \ab[5][2] ;
   wire \ab[5][1] ;
   wire \ab[5][0] ;
   wire \ab[4][7] ;
   wire \ab[4][6] ;
   wire \ab[4][5] ;
   wire \ab[4][4] ;
   wire \ab[4][3] ;
   wire \ab[4][2] ;
   wire \ab[4][1] ;
   wire \ab[4][0] ;
   wire \ab[3][7] ;
   wire \ab[3][6] ;
   wire \ab[3][5] ;
   wire \ab[3][4] ;
   wire \ab[3][3] ;
   wire \ab[3][2] ;
   wire \ab[3][1] ;
   wire \ab[3][0] ;
   wire \ab[2][7] ;
   wire \ab[2][6] ;
   wire \ab[2][5] ;
   wire \ab[2][4] ;
   wire \ab[2][3] ;
   wire \ab[2][2] ;
   wire \ab[2][1] ;
   wire \ab[2][0] ;
   wire \ab[1][7] ;
   wire \ab[1][6] ;
   wire \ab[1][5] ;
   wire \ab[1][4] ;
   wire \ab[1][3] ;
   wire \ab[1][2] ;
   wire \ab[1][1] ;
   wire \ab[1][0] ;
   wire \ab[0][7] ;
   wire \ab[0][6] ;
   wire \ab[0][5] ;
   wire \ab[0][4] ;
   wire \ab[0][3] ;
   wire \ab[0][2] ;
   wire \ab[0][1] ;
   wire \CARRYB[7][6] ;
   wire \CARRYB[7][5] ;
   wire \CARRYB[7][4] ;
   wire \CARRYB[7][3] ;
   wire \CARRYB[7][2] ;
   wire \CARRYB[7][1] ;
   wire \CARRYB[7][0] ;
   wire \CARRYB[6][6] ;
   wire \CARRYB[6][5] ;
   wire \CARRYB[6][4] ;
   wire \CARRYB[6][3] ;
   wire \CARRYB[6][2] ;
   wire \CARRYB[6][1] ;
   wire \CARRYB[6][0] ;
   wire \CARRYB[5][6] ;
   wire \CARRYB[5][5] ;
   wire \CARRYB[5][4] ;
   wire \CARRYB[5][3] ;
   wire \CARRYB[5][2] ;
   wire \CARRYB[5][1] ;
   wire \CARRYB[5][0] ;
   wire \CARRYB[4][6] ;
   wire \CARRYB[4][5] ;
   wire \CARRYB[4][4] ;
   wire \CARRYB[4][3] ;
   wire \CARRYB[4][2] ;
   wire \CARRYB[4][1] ;
   wire \CARRYB[4][0] ;
   wire \CARRYB[3][6] ;
   wire \CARRYB[3][5] ;
   wire \CARRYB[3][4] ;
   wire \CARRYB[3][3] ;
   wire \CARRYB[3][2] ;
   wire \CARRYB[3][1] ;
   wire \CARRYB[3][0] ;
   wire \CARRYB[2][6] ;
   wire \CARRYB[2][5] ;
   wire \CARRYB[2][4] ;
   wire \CARRYB[2][3] ;
   wire \CARRYB[2][2] ;
   wire \CARRYB[2][1] ;
   wire \CARRYB[2][0] ;
   wire \SUMB[7][6] ;
   wire \SUMB[7][5] ;
   wire \SUMB[7][4] ;
   wire \SUMB[7][3] ;
   wire \SUMB[7][2] ;
   wire \SUMB[7][1] ;
   wire \SUMB[7][0] ;
   wire \SUMB[6][6] ;
   wire \SUMB[6][5] ;
   wire \SUMB[6][4] ;
   wire \SUMB[6][3] ;
   wire \SUMB[6][2] ;
   wire \SUMB[6][1] ;
   wire \SUMB[5][6] ;
   wire \SUMB[5][5] ;
   wire \SUMB[5][4] ;
   wire \SUMB[5][3] ;
   wire \SUMB[5][2] ;
   wire \SUMB[5][1] ;
   wire \SUMB[4][6] ;
   wire \SUMB[4][5] ;
   wire \SUMB[4][4] ;
   wire \SUMB[4][3] ;
   wire \SUMB[4][2] ;
   wire \SUMB[4][1] ;
   wire \SUMB[3][6] ;
   wire \SUMB[3][5] ;
   wire \SUMB[3][4] ;
   wire \SUMB[3][3] ;
   wire \SUMB[3][2] ;
   wire \SUMB[3][1] ;
   wire \SUMB[2][6] ;
   wire \SUMB[2][5] ;
   wire \SUMB[2][4] ;
   wire \SUMB[2][3] ;
   wire \SUMB[2][2] ;
   wire \SUMB[2][1] ;
   wire \SUMB[1][6] ;
   wire \SUMB[1][5] ;
   wire \SUMB[1][4] ;
   wire \SUMB[1][3] ;
   wire \SUMB[1][2] ;
   wire \SUMB[1][1] ;
   wire \A1[12] ;
   wire \A1[11] ;
   wire \A1[10] ;
   wire \A1[9] ;
   wire \A1[8] ;
   wire \A1[7] ;
   wire \A1[6] ;
   wire \A1[4] ;
   wire \A1[3] ;
   wire \A1[2] ;
   wire \A1[1] ;
   wire \A1[0] ;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;

   ADDFX2M S5_6 (.S(\SUMB[7][6] ), 
	.CO(\CARRYB[7][6] ), 
	.CI(\ab[6][7] ), 
	.B(\CARRYB[6][6] ), 
	.A(\ab[7][6] ));
   ADDFX2M S3_6_6 (.S(\SUMB[6][6] ), 
	.CO(\CARRYB[6][6] ), 
	.CI(\ab[5][7] ), 
	.B(\CARRYB[5][6] ), 
	.A(\ab[6][6] ));
   ADDFX2M S4_5 (.S(\SUMB[7][5] ), 
	.CO(\CARRYB[7][5] ), 
	.CI(\SUMB[6][6] ), 
	.B(\CARRYB[6][5] ), 
	.A(\ab[7][5] ));
   ADDFX2M S1_6_0 (.S(\A1[4] ), 
	.CO(\CARRYB[6][0] ), 
	.CI(\SUMB[5][1] ), 
	.B(\CARRYB[5][0] ), 
	.A(\ab[6][0] ));
   ADDFX2M S1_5_0 (.S(\A1[3] ), 
	.CO(\CARRYB[5][0] ), 
	.CI(\SUMB[4][1] ), 
	.B(\CARRYB[4][0] ), 
	.A(\ab[5][0] ));
   ADDFX2M S1_4_0 (.S(\A1[2] ), 
	.CO(\CARRYB[4][0] ), 
	.CI(\SUMB[3][1] ), 
	.B(\CARRYB[3][0] ), 
	.A(\ab[4][0] ));
   ADDFX2M S1_3_0 (.S(\A1[1] ), 
	.CO(\CARRYB[3][0] ), 
	.CI(\SUMB[2][1] ), 
	.B(\CARRYB[2][0] ), 
	.A(\ab[3][0] ));
   ADDFX2M S1_2_0 (.S(\A1[0] ), 
	.CO(\CARRYB[2][0] ), 
	.CI(\SUMB[1][1] ), 
	.B(n9), 
	.A(\ab[2][0] ));
   ADDFX2M S2_6_5 (.S(\SUMB[6][5] ), 
	.CO(\CARRYB[6][5] ), 
	.CI(\SUMB[5][6] ), 
	.B(\CARRYB[5][5] ), 
	.A(\ab[6][5] ));
   ADDFX2M S3_5_6 (.S(\SUMB[5][6] ), 
	.CO(\CARRYB[5][6] ), 
	.CI(\ab[4][7] ), 
	.B(\CARRYB[4][6] ), 
	.A(\ab[5][6] ));
   ADDFX2M S4_0 (.S(\SUMB[7][0] ), 
	.CO(\CARRYB[7][0] ), 
	.CI(\SUMB[6][1] ), 
	.B(\CARRYB[6][0] ), 
	.A(\ab[7][0] ));
   ADDFX2M S4_4 (.S(\SUMB[7][4] ), 
	.CO(\CARRYB[7][4] ), 
	.CI(\SUMB[6][5] ), 
	.B(\CARRYB[6][4] ), 
	.A(\ab[7][4] ));
   ADDFX2M S2_6_3 (.S(\SUMB[6][3] ), 
	.CO(\CARRYB[6][3] ), 
	.CI(\SUMB[5][4] ), 
	.B(\CARRYB[5][3] ), 
	.A(\ab[6][3] ));
   ADDFX2M S2_5_4 (.S(\SUMB[5][4] ), 
	.CO(\CARRYB[5][4] ), 
	.CI(\SUMB[4][5] ), 
	.B(\CARRYB[4][4] ), 
	.A(\ab[5][4] ));
   ADDFX2M S2_6_1 (.S(\SUMB[6][1] ), 
	.CO(\CARRYB[6][1] ), 
	.CI(\SUMB[5][2] ), 
	.B(\CARRYB[5][1] ), 
	.A(\ab[6][1] ));
   ADDFX2M S2_6_2 (.S(\SUMB[6][2] ), 
	.CO(\CARRYB[6][2] ), 
	.CI(\SUMB[5][3] ), 
	.B(\CARRYB[5][2] ), 
	.A(\ab[6][2] ));
   ADDFX2M S2_4_5 (.S(\SUMB[4][5] ), 
	.CO(\CARRYB[4][5] ), 
	.CI(\SUMB[3][6] ), 
	.B(\CARRYB[3][5] ), 
	.A(\ab[4][5] ));
   ADDFX2M S2_5_1 (.S(\SUMB[5][1] ), 
	.CO(\CARRYB[5][1] ), 
	.CI(\SUMB[4][2] ), 
	.B(\CARRYB[4][1] ), 
	.A(\ab[5][1] ));
   ADDFX2M S2_5_2 (.S(\SUMB[5][2] ), 
	.CO(\CARRYB[5][2] ), 
	.CI(\SUMB[4][3] ), 
	.B(\CARRYB[4][2] ), 
	.A(\ab[5][2] ));
   ADDFX2M S2_5_3 (.S(\SUMB[5][3] ), 
	.CO(\CARRYB[5][3] ), 
	.CI(\SUMB[4][4] ), 
	.B(\CARRYB[4][3] ), 
	.A(\ab[5][3] ));
   ADDFX2M S2_4_1 (.S(\SUMB[4][1] ), 
	.CO(\CARRYB[4][1] ), 
	.CI(\SUMB[3][2] ), 
	.B(\CARRYB[3][1] ), 
	.A(\ab[4][1] ));
   ADDFX2M S2_4_2 (.S(\SUMB[4][2] ), 
	.CO(\CARRYB[4][2] ), 
	.CI(\SUMB[3][3] ), 
	.B(\CARRYB[3][2] ), 
	.A(\ab[4][2] ));
   ADDFX2M S2_4_3 (.S(\SUMB[4][3] ), 
	.CO(\CARRYB[4][3] ), 
	.CI(\SUMB[3][4] ), 
	.B(\CARRYB[3][3] ), 
	.A(\ab[4][3] ));
   ADDFX2M S2_3_1 (.S(\SUMB[3][1] ), 
	.CO(\CARRYB[3][1] ), 
	.CI(\SUMB[2][2] ), 
	.B(\CARRYB[2][1] ), 
	.A(\ab[3][1] ));
   ADDFX2M S2_3_2 (.S(\SUMB[3][2] ), 
	.CO(\CARRYB[3][2] ), 
	.CI(\SUMB[2][3] ), 
	.B(\CARRYB[2][2] ), 
	.A(\ab[3][2] ));
   ADDFX2M S2_3_3 (.S(\SUMB[3][3] ), 
	.CO(\CARRYB[3][3] ), 
	.CI(\SUMB[2][4] ), 
	.B(\CARRYB[2][3] ), 
	.A(\ab[3][3] ));
   ADDFX2M S2_3_5 (.S(\SUMB[3][5] ), 
	.CO(\CARRYB[3][5] ), 
	.CI(\SUMB[2][6] ), 
	.B(\CARRYB[2][5] ), 
	.A(\ab[3][5] ));
   ADDFX2M S2_6_4 (.S(\SUMB[6][4] ), 
	.CO(\CARRYB[6][4] ), 
	.CI(\SUMB[5][5] ), 
	.B(\CARRYB[5][4] ), 
	.A(\ab[6][4] ));
   ADDFX2M S2_5_5 (.S(\SUMB[5][5] ), 
	.CO(\CARRYB[5][5] ), 
	.CI(\SUMB[4][6] ), 
	.B(\CARRYB[4][5] ), 
	.A(\ab[5][5] ));
   ADDFX2M S2_4_4 (.S(\SUMB[4][4] ), 
	.CO(\CARRYB[4][4] ), 
	.CI(\SUMB[3][5] ), 
	.B(\CARRYB[3][4] ), 
	.A(\ab[4][4] ));
   ADDFX2M S2_3_4 (.S(\SUMB[3][4] ), 
	.CO(\CARRYB[3][4] ), 
	.CI(\SUMB[2][5] ), 
	.B(\CARRYB[2][4] ), 
	.A(\ab[3][4] ));
   ADDFX2M S3_4_6 (.S(\SUMB[4][6] ), 
	.CO(\CARRYB[4][6] ), 
	.CI(\ab[3][7] ), 
	.B(\CARRYB[3][6] ), 
	.A(\ab[4][6] ));
   ADDFX2M S3_3_6 (.S(\SUMB[3][6] ), 
	.CO(\CARRYB[3][6] ), 
	.CI(\ab[2][7] ), 
	.B(\CARRYB[2][6] ), 
	.A(\ab[3][6] ));
   ADDFX2M S3_2_6 (.S(\SUMB[2][6] ), 
	.CO(\CARRYB[2][6] ), 
	.CI(\ab[1][7] ), 
	.B(n8), 
	.A(\ab[2][6] ));
   ADDFX2M S2_2_2 (.S(\SUMB[2][2] ), 
	.CO(\CARRYB[2][2] ), 
	.CI(\SUMB[1][3] ), 
	.B(n5), 
	.A(\ab[2][2] ));
   ADDFX2M S2_2_3 (.S(\SUMB[2][3] ), 
	.CO(\CARRYB[2][3] ), 
	.CI(\SUMB[1][4] ), 
	.B(n4), 
	.A(\ab[2][3] ));
   ADDFX2M S2_2_4 (.S(\SUMB[2][4] ), 
	.CO(\CARRYB[2][4] ), 
	.CI(\SUMB[1][5] ), 
	.B(n3), 
	.A(\ab[2][4] ));
   ADDFX2M S2_2_5 (.S(\SUMB[2][5] ), 
	.CO(\CARRYB[2][5] ), 
	.CI(\SUMB[1][6] ), 
	.B(n7), 
	.A(\ab[2][5] ));
   ADDFX2M S4_1 (.S(\SUMB[7][1] ), 
	.CO(\CARRYB[7][1] ), 
	.CI(\SUMB[6][2] ), 
	.B(\CARRYB[6][1] ), 
	.A(\ab[7][1] ));
   ADDFX2M S4_3 (.S(\SUMB[7][3] ), 
	.CO(\CARRYB[7][3] ), 
	.CI(\SUMB[6][4] ), 
	.B(\CARRYB[6][3] ), 
	.A(\ab[7][3] ));
   ADDFX2M S4_2 (.S(\SUMB[7][2] ), 
	.CO(\CARRYB[7][2] ), 
	.CI(\SUMB[6][3] ), 
	.B(\CARRYB[6][2] ), 
	.A(\ab[7][2] ));
   ADDFX2M S2_2_1 (.S(\SUMB[2][1] ), 
	.CO(\CARRYB[2][1] ), 
	.CI(\SUMB[1][2] ), 
	.B(n6), 
	.A(\ab[2][1] ));
   AND2X2M U2 (.Y(n3), 
	.B(\ab[1][4] ), 
	.A(\ab[0][5] ));
   AND2X2M U3 (.Y(n4), 
	.B(\ab[1][3] ), 
	.A(\ab[0][4] ));
   AND2X2M U4 (.Y(n5), 
	.B(\ab[1][2] ), 
	.A(\ab[0][3] ));
   AND2X2M U5 (.Y(n6), 
	.B(\ab[1][1] ), 
	.A(\ab[0][2] ));
   AND2X2M U6 (.Y(n7), 
	.B(\ab[1][5] ), 
	.A(\ab[0][6] ));
   AND2X2M U7 (.Y(n8), 
	.B(\ab[1][6] ), 
	.A(\ab[0][7] ));
   AND2X2M U8 (.Y(n9), 
	.B(\ab[1][0] ), 
	.A(\ab[0][1] ));
   AND2X2M U9 (.Y(n10), 
	.B(\ab[7][7] ), 
	.A(\CARRYB[7][6] ));
   NOR2X2M U10 (.Y(\ab[0][4] ), 
	.B(n24), 
	.A(n28));
   NOR2X2M U11 (.Y(\ab[0][3] ), 
	.B(n24), 
	.A(n29));
   CLKXOR2X2M U12 (.Y(\SUMB[1][3] ), 
	.B(\ab[0][4] ), 
	.A(\ab[1][3] ));
   NOR2X2M U13 (.Y(\ab[0][1] ), 
	.B(n24), 
	.A(n31));
   NOR2X2M U14 (.Y(\ab[0][7] ), 
	.B(n24), 
	.A(n25));
   NOR2X2M U15 (.Y(\ab[0][6] ), 
	.B(n24), 
	.A(n26));
   NOR2X2M U16 (.Y(\ab[0][5] ), 
	.B(n24), 
	.A(n27));
   NOR2X2M U17 (.Y(\ab[0][2] ), 
	.B(n24), 
	.A(n30));
   NOR2X2M U18 (.Y(\ab[1][0] ), 
	.B(n23), 
	.A(n32));
   NOR2X2M U19 (.Y(\ab[1][6] ), 
	.B(n23), 
	.A(n26));
   NOR2X2M U20 (.Y(\ab[1][5] ), 
	.B(n23), 
	.A(n27));
   NOR2X2M U21 (.Y(\ab[1][4] ), 
	.B(n23), 
	.A(n28));
   NOR2X2M U22 (.Y(\ab[1][3] ), 
	.B(n23), 
	.A(n29));
   NOR2X2M U23 (.Y(\ab[1][2] ), 
	.B(n23), 
	.A(n30));
   NOR2X2M U24 (.Y(\ab[1][1] ), 
	.B(n23), 
	.A(n31));
   NOR2X2M U25 (.Y(\ab[7][7] ), 
	.B(n25), 
	.A(n17));
   CLKXOR2X2M U26 (.Y(\A1[8] ), 
	.B(\SUMB[7][3] ), 
	.A(\CARRYB[7][2] ));
   AND2X2M U27 (.Y(n11), 
	.B(\SUMB[7][2] ), 
	.A(\CARRYB[7][1] ));
   CLKXOR2X2M U28 (.Y(\A1[7] ), 
	.B(\SUMB[7][2] ), 
	.A(\CARRYB[7][1] ));
   CLKXOR2X2M U29 (.Y(\A1[9] ), 
	.B(\SUMB[7][4] ), 
	.A(\CARRYB[7][3] ));
   AND2X2M U30 (.Y(n12), 
	.B(\SUMB[7][1] ), 
	.A(\CARRYB[7][0] ));
   AND2X2M U31 (.Y(n13), 
	.B(\SUMB[7][3] ), 
	.A(\CARRYB[7][2] ));
   CLKXOR2X2M U32 (.Y(\A1[10] ), 
	.B(\SUMB[7][5] ), 
	.A(\CARRYB[7][4] ));
   AND2X2M U33 (.Y(n14), 
	.B(\SUMB[7][4] ), 
	.A(\CARRYB[7][3] ));
   CLKXOR2X2M U34 (.Y(\A1[11] ), 
	.B(\SUMB[7][6] ), 
	.A(\CARRYB[7][5] ));
   AND2X2M U35 (.Y(n15), 
	.B(\SUMB[7][5] ), 
	.A(\CARRYB[7][4] ));
   CLKXOR2X2M U36 (.Y(\A1[12] ), 
	.B(\ab[7][7] ), 
	.A(\CARRYB[7][6] ));
   CLKXOR2X2M U37 (.Y(\A1[6] ), 
	.B(\SUMB[7][1] ), 
	.A(\CARRYB[7][0] ));
   AND2X2M U38 (.Y(n16), 
	.B(\SUMB[7][6] ), 
	.A(\CARRYB[7][5] ));
   XOR2X1M U39 (.Y(PRODUCT[1]), 
	.B(\ab[0][1] ), 
	.A(\ab[1][0] ));
   XOR2X1M U40 (.Y(\SUMB[1][2] ), 
	.B(\ab[0][3] ), 
	.A(\ab[1][2] ));
   XOR2X1M U41 (.Y(\SUMB[1][6] ), 
	.B(\ab[0][7] ), 
	.A(\ab[1][6] ));
   XOR2X1M U42 (.Y(\SUMB[1][5] ), 
	.B(\ab[0][6] ), 
	.A(\ab[1][5] ));
   XOR2X1M U43 (.Y(\SUMB[1][4] ), 
	.B(\ab[0][5] ), 
	.A(\ab[1][4] ));
   XOR2X1M U44 (.Y(\SUMB[1][1] ), 
	.B(\ab[0][2] ), 
	.A(\ab[1][1] ));
   CLKINVX2M U45 (.Y(n26), 
	.A(B[6]));
   CLKINVX2M U46 (.Y(n28), 
	.A(B[4]));
   CLKINVX2M U47 (.Y(n27), 
	.A(B[5]));
   CLKINVX2M U48 (.Y(n29), 
	.A(B[3]));
   CLKINVX2M U49 (.Y(n25), 
	.A(B[7]));
   CLKINVX2M U50 (.Y(n23), 
	.A(A[1]));
   CLKINVX2M U51 (.Y(n24), 
	.A(A[0]));
   CLKINVX2M U52 (.Y(n31), 
	.A(B[1]));
   CLKINVX2M U53 (.Y(n30), 
	.A(B[2]));
   CLKINVX2M U54 (.Y(n22), 
	.A(A[2]));
   CLKINVX2M U55 (.Y(n32), 
	.A(B[0]));
   CLKINVX2M U56 (.Y(n21), 
	.A(A[3]));
   CLKINVX2M U57 (.Y(n20), 
	.A(A[4]));
   CLKINVX2M U58 (.Y(n19), 
	.A(A[5]));
   CLKINVX2M U59 (.Y(n17), 
	.A(A[7]));
   CLKINVX2M U60 (.Y(n18), 
	.A(A[6]));
   NOR2X1M U62 (.Y(\ab[7][6] ), 
	.B(n26), 
	.A(n17));
   NOR2X1M U63 (.Y(\ab[7][5] ), 
	.B(n27), 
	.A(n17));
   NOR2X1M U64 (.Y(\ab[7][4] ), 
	.B(n28), 
	.A(n17));
   NOR2X1M U65 (.Y(\ab[7][3] ), 
	.B(n29), 
	.A(n17));
   NOR2X1M U66 (.Y(\ab[7][2] ), 
	.B(n30), 
	.A(n17));
   NOR2X1M U67 (.Y(\ab[7][1] ), 
	.B(n31), 
	.A(n17));
   NOR2X1M U68 (.Y(\ab[7][0] ), 
	.B(n32), 
	.A(n17));
   NOR2X1M U69 (.Y(\ab[6][7] ), 
	.B(n18), 
	.A(n25));
   NOR2X1M U70 (.Y(\ab[6][6] ), 
	.B(n18), 
	.A(n26));
   NOR2X1M U71 (.Y(\ab[6][5] ), 
	.B(n18), 
	.A(n27));
   NOR2X1M U72 (.Y(\ab[6][4] ), 
	.B(n18), 
	.A(n28));
   NOR2X1M U73 (.Y(\ab[6][3] ), 
	.B(n18), 
	.A(n29));
   NOR2X1M U74 (.Y(\ab[6][2] ), 
	.B(n18), 
	.A(n30));
   NOR2X1M U75 (.Y(\ab[6][1] ), 
	.B(n18), 
	.A(n31));
   NOR2X1M U76 (.Y(\ab[6][0] ), 
	.B(n18), 
	.A(n32));
   NOR2X1M U77 (.Y(\ab[5][7] ), 
	.B(n19), 
	.A(n25));
   NOR2X1M U78 (.Y(\ab[5][6] ), 
	.B(n19), 
	.A(n26));
   NOR2X1M U79 (.Y(\ab[5][5] ), 
	.B(n19), 
	.A(n27));
   NOR2X1M U80 (.Y(\ab[5][4] ), 
	.B(n19), 
	.A(n28));
   NOR2X1M U81 (.Y(\ab[5][3] ), 
	.B(n19), 
	.A(n29));
   NOR2X1M U82 (.Y(\ab[5][2] ), 
	.B(n19), 
	.A(n30));
   NOR2X1M U83 (.Y(\ab[5][1] ), 
	.B(n19), 
	.A(n31));
   NOR2X1M U84 (.Y(\ab[5][0] ), 
	.B(n19), 
	.A(n32));
   NOR2X1M U85 (.Y(\ab[4][7] ), 
	.B(n20), 
	.A(n25));
   NOR2X1M U86 (.Y(\ab[4][6] ), 
	.B(n20), 
	.A(n26));
   NOR2X1M U87 (.Y(\ab[4][5] ), 
	.B(n20), 
	.A(n27));
   NOR2X1M U88 (.Y(\ab[4][4] ), 
	.B(n20), 
	.A(n28));
   NOR2X1M U89 (.Y(\ab[4][3] ), 
	.B(n20), 
	.A(n29));
   NOR2X1M U90 (.Y(\ab[4][2] ), 
	.B(n20), 
	.A(n30));
   NOR2X1M U91 (.Y(\ab[4][1] ), 
	.B(n20), 
	.A(n31));
   NOR2X1M U92 (.Y(\ab[4][0] ), 
	.B(n20), 
	.A(n32));
   NOR2X1M U93 (.Y(\ab[3][7] ), 
	.B(n21), 
	.A(n25));
   NOR2X1M U94 (.Y(\ab[3][6] ), 
	.B(n21), 
	.A(n26));
   NOR2X1M U95 (.Y(\ab[3][5] ), 
	.B(n21), 
	.A(n27));
   NOR2X1M U96 (.Y(\ab[3][4] ), 
	.B(n21), 
	.A(n28));
   NOR2X1M U97 (.Y(\ab[3][3] ), 
	.B(n21), 
	.A(n29));
   NOR2X1M U98 (.Y(\ab[3][2] ), 
	.B(n21), 
	.A(n30));
   NOR2X1M U99 (.Y(\ab[3][1] ), 
	.B(n21), 
	.A(n31));
   NOR2X1M U100 (.Y(\ab[3][0] ), 
	.B(n21), 
	.A(n32));
   NOR2X1M U101 (.Y(\ab[2][7] ), 
	.B(n22), 
	.A(n25));
   NOR2X1M U102 (.Y(\ab[2][6] ), 
	.B(n22), 
	.A(n26));
   NOR2X1M U103 (.Y(\ab[2][5] ), 
	.B(n22), 
	.A(n27));
   NOR2X1M U104 (.Y(\ab[2][4] ), 
	.B(n22), 
	.A(n28));
   NOR2X1M U105 (.Y(\ab[2][3] ), 
	.B(n22), 
	.A(n29));
   NOR2X1M U106 (.Y(\ab[2][2] ), 
	.B(n22), 
	.A(n30));
   NOR2X1M U107 (.Y(\ab[2][1] ), 
	.B(n22), 
	.A(n31));
   NOR2X1M U108 (.Y(\ab[2][0] ), 
	.B(n22), 
	.A(n32));
   NOR2X1M U109 (.Y(\ab[1][7] ), 
	.B(n23), 
	.A(n25));
   NOR2X1M U110 (.Y(PRODUCT[0]), 
	.B(n24), 
	.A(n32));
   ARITHMETIC_UNIT_DW01_add_1 FS_1 (.A({ 1'b0,
		\A1[12] ,
		\A1[11] ,
		\A1[10] ,
		\A1[9] ,
		\A1[8] ,
		\A1[7] ,
		\A1[6] ,
		\SUMB[7][0] ,
		\A1[4] ,
		\A1[3] ,
		\A1[2] ,
		\A1[1] ,
		\A1[0]  }), 
	.B({ n10,
		n16,
		n15,
		n14,
		n13,
		n11,
		n12,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.CI(1'b0), 
	.SUM({ PRODUCT[15],
		PRODUCT[14],
		PRODUCT[13],
		PRODUCT[12],
		PRODUCT[11],
		PRODUCT[10],
		PRODUCT[9],
		PRODUCT[8],
		PRODUCT[7],
		PRODUCT[6],
		PRODUCT[5],
		PRODUCT[4],
		PRODUCT[3],
		PRODUCT[2] }));
endmodule

module ARITHMETIC_UNIT_test_1 (
	A, 
	B, 
	ALU_FUNC, 
	CLK, 
	RST, 
	Arith_enable, 
	Carry_OUT, 
	Arith_OUT, 
	Arith_Flag, 
	test_si, 
	test_se);
   input [7:0] A;
   input [7:0] B;
   input [1:0] ALU_FUNC;
   input CLK;
   input RST;
   input Arith_enable;
   output Carry_OUT;
   output [15:0] Arith_OUT;
   output Arith_Flag;
   input test_si;
   input test_se;

   // Internal wires
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N26;
   wire N27;
   wire N28;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N34;
   wire N35;
   wire N36;
   wire N37;
   wire N38;
   wire N39;
   wire N40;
   wire N41;
   wire N42;
   wire N43;
   wire N44;
   wire N45;
   wire N46;
   wire N47;
   wire N48;
   wire N49;
   wire N50;
   wire N51;
   wire N52;
   wire N53;
   wire N54;
   wire N55;
   wire N56;
   wire N57;
   wire N58;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n68;
   wire n69;
   wire n70;
   wire [15:0] Arith_OUT_comb;

   SDFFRQX1M Arith_Flag_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_Flag), 
	.D(Arith_enable), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[6]  (.SI(Arith_OUT[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[6]), 
	.D(Arith_OUT_comb[6]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[5]  (.SI(Arith_OUT[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[5]), 
	.D(Arith_OUT_comb[5]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[7]  (.SI(Arith_OUT[6]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[7]), 
	.D(Arith_OUT_comb[7]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[9]  (.SI(Arith_OUT[8]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[9]), 
	.D(Arith_OUT_comb[9]), 
	.CK(CLK));
   SDFFRQX1M Carry_OUT_reg (.SI(Arith_OUT[15]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Carry_OUT), 
	.D(n68), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[8]  (.SI(Arith_OUT[7]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[8]), 
	.D(n68), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[10]  (.SI(Arith_OUT[9]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[10]), 
	.D(Arith_OUT_comb[10]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[11]  (.SI(Arith_OUT[10]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[11]), 
	.D(Arith_OUT_comb[11]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[4]  (.SI(Arith_OUT[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[4]), 
	.D(Arith_OUT_comb[4]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[12]  (.SI(Arith_OUT[11]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[12]), 
	.D(Arith_OUT_comb[12]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[13]  (.SI(Arith_OUT[12]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[13]), 
	.D(Arith_OUT_comb[13]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[14]  (.SI(Arith_OUT[13]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[14]), 
	.D(Arith_OUT_comb[14]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[15]  (.SI(Arith_OUT[14]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[15]), 
	.D(Arith_OUT_comb[15]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[3]  (.SI(Arith_OUT[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[3]), 
	.D(Arith_OUT_comb[3]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[2]  (.SI(Arith_OUT[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[2]), 
	.D(Arith_OUT_comb[2]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[1]  (.SI(Arith_OUT[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[1]), 
	.D(Arith_OUT_comb[1]), 
	.CK(CLK));
   SDFFRQX1M \Arith_OUT_reg[0]  (.SI(Arith_Flag), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Arith_OUT[0]), 
	.D(Arith_OUT_comb[0]), 
	.CK(CLK));
   NOR3BX2M U42 (.Y(n33), 
	.C(n70), 
	.B(n69), 
	.AN(Arith_enable));
   AND2X2M U43 (.Y(n28), 
	.B(n34), 
	.A(N34));
   NAND2X2M U45 (.Y(Arith_OUT_comb[1]), 
	.B(n46), 
	.A(n45));
   AOI22X1M U46 (.Y(n45), 
	.B1(n34), 
	.B0(N27), 
	.A1(n27), 
	.A0(N36));
   AOI22X1M U47 (.Y(n46), 
	.B1(n30), 
	.B0(N18), 
	.A1(n33), 
	.A0(N52));
   NAND2X2M U48 (.Y(Arith_OUT_comb[2]), 
	.B(n44), 
	.A(n43));
   AOI22X1M U49 (.Y(n43), 
	.B1(n34), 
	.B0(N28), 
	.A1(n27), 
	.A0(N37));
   AOI22X1M U50 (.Y(n44), 
	.B1(n30), 
	.B0(N19), 
	.A1(n33), 
	.A0(N53));
   NAND2X2M U51 (.Y(Arith_OUT_comb[3]), 
	.B(n42), 
	.A(n41));
   AOI22X1M U52 (.Y(n41), 
	.B1(n34), 
	.B0(N29), 
	.A1(n27), 
	.A0(N38));
   AOI22X1M U53 (.Y(n42), 
	.B1(n30), 
	.B0(N20), 
	.A1(n33), 
	.A0(N54));
   NAND2X2M U54 (.Y(Arith_OUT_comb[4]), 
	.B(n40), 
	.A(n39));
   AOI22X1M U55 (.Y(n39), 
	.B1(n34), 
	.B0(N30), 
	.A1(n27), 
	.A0(N39));
   AOI22X1M U56 (.Y(n40), 
	.B1(n30), 
	.B0(N21), 
	.A1(n33), 
	.A0(N55));
   AO21XLM U57 (.Y(Arith_OUT_comb[15]), 
	.B0(n28), 
	.A1(n27), 
	.A0(N50));
   AO21XLM U58 (.Y(Arith_OUT_comb[14]), 
	.B0(n28), 
	.A1(n27), 
	.A0(N49));
   NAND2X2M U59 (.Y(Arith_OUT_comb[5]), 
	.B(n38), 
	.A(n37));
   AOI22X1M U60 (.Y(n37), 
	.B1(n34), 
	.B0(N31), 
	.A1(n27), 
	.A0(N40));
   AOI22X1M U61 (.Y(n38), 
	.B1(n30), 
	.B0(N22), 
	.A1(n33), 
	.A0(N56));
   AO21XLM U62 (.Y(Arith_OUT_comb[13]), 
	.B0(n28), 
	.A1(n27), 
	.A0(N48));
   AO21XLM U63 (.Y(Arith_OUT_comb[12]), 
	.B0(n28), 
	.A1(n27), 
	.A0(N47));
   NAND2X2M U64 (.Y(Arith_OUT_comb[6]), 
	.B(n36), 
	.A(n35));
   AOI22X1M U65 (.Y(n35), 
	.B1(n34), 
	.B0(N32), 
	.A1(n27), 
	.A0(N41));
   AOI22X1M U66 (.Y(n36), 
	.B1(n30), 
	.B0(N23), 
	.A1(n33), 
	.A0(N57));
   AO21XLM U67 (.Y(Arith_OUT_comb[10]), 
	.B0(n28), 
	.A1(n27), 
	.A0(N45));
   AO21XLM U68 (.Y(Arith_OUT_comb[11]), 
	.B0(n28), 
	.A1(n27), 
	.A0(N46));
   INVX2M U69 (.Y(n68), 
	.A(n29));
   AOI221XLM U70 (.Y(n29), 
	.C0(n28), 
	.B1(n30), 
	.B0(N25), 
	.A1(n27), 
	.A0(N43));
   NAND2X2M U71 (.Y(Arith_OUT_comb[7]), 
	.B(n32), 
	.A(n31));
   AOI22X1M U72 (.Y(n32), 
	.B1(n30), 
	.B0(N24), 
	.A1(n33), 
	.A0(N58));
   AOI22X1M U73 (.Y(n31), 
	.B1(n34), 
	.B0(N33), 
	.A1(n27), 
	.A0(N42));
   AO21XLM U74 (.Y(Arith_OUT_comb[9]), 
	.B0(n28), 
	.A1(n27), 
	.A0(N44));
   NAND2X2M U77 (.Y(Arith_OUT_comb[0]), 
	.B(n48), 
	.A(n47));
   AOI22X1M U78 (.Y(n47), 
	.B1(n34), 
	.B0(N26), 
	.A1(n27), 
	.A0(N35));
   AOI22X1M U79 (.Y(n48), 
	.B1(n30), 
	.B0(N17), 
	.A1(n33), 
	.A0(N51));
   INVX2M U80 (.Y(n70), 
	.A(ALU_FUNC[0]));
   INVX2M U81 (.Y(n69), 
	.A(ALU_FUNC[1]));
   NOR3BX4M U82 (.Y(n27), 
	.C(ALU_FUNC[0]), 
	.B(n69), 
	.AN(Arith_enable));
   NOR3BX2M U84 (.Y(n34), 
	.C(n70), 
	.B(ALU_FUNC[1]), 
	.AN(Arith_enable));
   NOR3BX2M U86 (.Y(n30), 
	.C(ALU_FUNC[1]), 
	.B(ALU_FUNC[0]), 
	.AN(Arith_enable));
   ARITHMETIC_UNIT_DW_div_uns_0 div_63 (.a({ A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.b({ B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.quotient({ N58,
		N57,
		N56,
		N55,
		N54,
		N53,
		N52,
		N51 }));
   ARITHMETIC_UNIT_DW01_sub_0 sub_55 (.A({ 1'b0,
		A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ 1'b0,
		B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.CI(1'b0), 
	.DIFF({ N34,
		N33,
		N32,
		N31,
		N30,
		N29,
		N28,
		N27,
		N26 }));
   ARITHMETIC_UNIT_DW01_add_0 add_51 (.A({ 1'b0,
		A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ 1'b0,
		B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.CI(1'b0), 
	.SUM({ N25,
		N24,
		N23,
		N22,
		N21,
		N20,
		N19,
		N18,
		N17 }));
   ARITHMETIC_UNIT_DW02_mult_0 mult_59 (.A({ A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.TC(1'b0), 
	.PRODUCT({ N50,
		N49,
		N48,
		N47,
		N46,
		N45,
		N44,
		N43,
		N42,
		N41,
		N40,
		N39,
		N38,
		N37,
		N36,
		N35 }));
endmodule

module LOGIC_UNIT_test_1 (
	A, 
	B, 
	ALU_FUNC, 
	CLK, 
	RST, 
	Logic_enable, 
	Logic_OUT, 
	Logic_Flag, 
	test_si, 
	test_se);
   input [7:0] A;
   input [7:0] B;
   input [1:0] ALU_FUNC;
   input CLK;
   input RST;
   input Logic_enable;
   output [7:0] Logic_OUT;
   output Logic_Flag;
   input test_si;
   input test_se;

   // Internal wires
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n23;
   wire n24;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire [7:0] Logic_OUT_comb;

   SDFFRQX1M Logic_Flag_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Logic_Flag), 
	.D(Logic_enable), 
	.CK(CLK));
   SDFFRQX1M \Logic_OUT_reg[7]  (.SI(Logic_OUT[6]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Logic_OUT[7]), 
	.D(Logic_OUT_comb[7]), 
	.CK(CLK));
   SDFFRQX1M \Logic_OUT_reg[3]  (.SI(Logic_OUT[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Logic_OUT[3]), 
	.D(Logic_OUT_comb[3]), 
	.CK(CLK));
   SDFFRQX1M \Logic_OUT_reg[2]  (.SI(Logic_OUT[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Logic_OUT[2]), 
	.D(Logic_OUT_comb[2]), 
	.CK(CLK));
   SDFFRQX1M \Logic_OUT_reg[0]  (.SI(Logic_Flag), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Logic_OUT[0]), 
	.D(Logic_OUT_comb[0]), 
	.CK(CLK));
   SDFFRQX1M \Logic_OUT_reg[5]  (.SI(Logic_OUT[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Logic_OUT[5]), 
	.D(Logic_OUT_comb[5]), 
	.CK(CLK));
   SDFFRQX1M \Logic_OUT_reg[4]  (.SI(Logic_OUT[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Logic_OUT[4]), 
	.D(Logic_OUT_comb[4]), 
	.CK(CLK));
   SDFFRQX1M \Logic_OUT_reg[1]  (.SI(Logic_OUT[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Logic_OUT[1]), 
	.D(Logic_OUT_comb[1]), 
	.CK(CLK));
   SDFFRQX1M \Logic_OUT_reg[6]  (.SI(Logic_OUT[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Logic_OUT[6]), 
	.D(Logic_OUT_comb[6]), 
	.CK(CLK));
   CLKNAND2X2M U23 (.Y(n33), 
	.B(n65), 
	.A(Logic_enable));
   OAI21X2M U24 (.Y(n52), 
	.B0(n29), 
	.A1(n57), 
	.A0(n33));
   OAI21X2M U25 (.Y(n49), 
	.B0(n29), 
	.A1(n56), 
	.A0(n33));
   OAI21X2M U26 (.Y(n46), 
	.B0(n29), 
	.A1(n55), 
	.A0(n33));
   OAI21X2M U27 (.Y(n43), 
	.B0(n29), 
	.A1(n54), 
	.A0(n33));
   OAI21X2M U28 (.Y(n40), 
	.B0(n29), 
	.A1(n53), 
	.A0(n33));
   OAI21X2M U29 (.Y(n37), 
	.B0(n29), 
	.A1(n24), 
	.A0(n33));
   OAI21X2M U30 (.Y(n32), 
	.B0(n29), 
	.A1(n23), 
	.A0(n33));
   CLKNAND2X2M U31 (.Y(n34), 
	.B(ALU_FUNC[1]), 
	.A(Logic_enable));
   OAI221X1M U32 (.Y(Logic_OUT_comb[0]), 
	.C0(n50), 
	.B1(n57), 
	.B0(n29), 
	.A1(n28), 
	.A0(A[0]));
   AOI22X1M U33 (.Y(n50), 
	.B1(n52), 
	.B0(B[0]), 
	.A1(n64), 
	.A0(n51));
   INVX2M U34 (.Y(n64), 
	.A(B[0]));
   OAI21X2M U35 (.Y(n51), 
	.B0(n28), 
	.A1(n34), 
	.A0(A[0]));
   OAI221X1M U36 (.Y(Logic_OUT_comb[1]), 
	.C0(n47), 
	.B1(n56), 
	.B0(n29), 
	.A1(n28), 
	.A0(A[1]));
   AOI22X1M U37 (.Y(n47), 
	.B1(n49), 
	.B0(B[1]), 
	.A1(n63), 
	.A0(n48));
   INVX2M U38 (.Y(n63), 
	.A(B[1]));
   OAI21X2M U39 (.Y(n48), 
	.B0(n28), 
	.A1(n34), 
	.A0(A[1]));
   OAI221X1M U40 (.Y(Logic_OUT_comb[2]), 
	.C0(n44), 
	.B1(n55), 
	.B0(n29), 
	.A1(n28), 
	.A0(A[2]));
   AOI22X1M U41 (.Y(n44), 
	.B1(n46), 
	.B0(B[2]), 
	.A1(n62), 
	.A0(n45));
   INVX2M U42 (.Y(n62), 
	.A(B[2]));
   OAI21X2M U43 (.Y(n45), 
	.B0(n28), 
	.A1(n34), 
	.A0(A[2]));
   OAI221X1M U44 (.Y(Logic_OUT_comb[3]), 
	.C0(n41), 
	.B1(n54), 
	.B0(n29), 
	.A1(n28), 
	.A0(A[3]));
   AOI22X1M U45 (.Y(n41), 
	.B1(n43), 
	.B0(B[3]), 
	.A1(n61), 
	.A0(n42));
   INVX2M U46 (.Y(n61), 
	.A(B[3]));
   OAI21X2M U47 (.Y(n42), 
	.B0(n28), 
	.A1(n34), 
	.A0(A[3]));
   OAI221X1M U48 (.Y(Logic_OUT_comb[4]), 
	.C0(n38), 
	.B1(n53), 
	.B0(n29), 
	.A1(n28), 
	.A0(A[4]));
   AOI22X1M U49 (.Y(n38), 
	.B1(n40), 
	.B0(B[4]), 
	.A1(n60), 
	.A0(n39));
   INVX2M U50 (.Y(n60), 
	.A(B[4]));
   OAI21X2M U51 (.Y(n39), 
	.B0(n28), 
	.A1(n34), 
	.A0(A[4]));
   OAI221X1M U52 (.Y(Logic_OUT_comb[5]), 
	.C0(n35), 
	.B1(n24), 
	.B0(n29), 
	.A1(n28), 
	.A0(A[5]));
   AOI22X1M U53 (.Y(n35), 
	.B1(n37), 
	.B0(B[5]), 
	.A1(n59), 
	.A0(n36));
   INVX2M U54 (.Y(n59), 
	.A(B[5]));
   OAI21X2M U55 (.Y(n36), 
	.B0(n28), 
	.A1(n34), 
	.A0(A[5]));
   OAI221X1M U56 (.Y(Logic_OUT_comb[6]), 
	.C0(n30), 
	.B1(n29), 
	.B0(n23), 
	.A1(n28), 
	.A0(A[6]));
   AOI22X1M U57 (.Y(n30), 
	.B1(n32), 
	.B0(B[6]), 
	.A1(n58), 
	.A0(n31));
   INVX2M U58 (.Y(n58), 
	.A(B[6]));
   OAI21X2M U59 (.Y(n31), 
	.B0(n28), 
	.A1(n34), 
	.A0(A[6]));
   NAND3BX2M U60 (.Y(n28), 
	.C(Logic_enable), 
	.B(ALU_FUNC[1]), 
	.AN(ALU_FUNC[0]));
   NAND3X2M U61 (.Y(n29), 
	.C(Logic_enable), 
	.B(n65), 
	.A(ALU_FUNC[0]));
   INVX2M U62 (.Y(n65), 
	.A(ALU_FUNC[1]));
   INVX2M U63 (.Y(n23), 
	.A(A[6]));
   INVX2M U64 (.Y(n56), 
	.A(A[1]));
   INVX2M U65 (.Y(n55), 
	.A(A[2]));
   INVX2M U66 (.Y(n54), 
	.A(A[3]));
   INVX2M U67 (.Y(n53), 
	.A(A[4]));
   INVX2M U68 (.Y(n24), 
	.A(A[5]));
   INVX2M U69 (.Y(n57), 
	.A(A[0]));
   NOR2BX2M U70 (.Y(Logic_OUT_comb[7]), 
	.B(n25), 
	.AN(Logic_enable));
   XNOR2X2M U71 (.Y(n25), 
	.B(n26), 
	.A(ALU_FUNC[1]));
   OAI2BB1XLM U72 (.Y(n26), 
	.B0(n27), 
	.A1N(A[7]), 
	.A0N(ALU_FUNC[0]));
   OAI21X2M U73 (.Y(n27), 
	.B0(B[7]), 
	.A1(A[7]), 
	.A0(ALU_FUNC[0]));
endmodule

module SHIFT_UNIT_test_1 (
	A, 
	B, 
	ALU_FUNC, 
	CLK, 
	RST, 
	Shift_enable, 
	Shift_OUT, 
	Shift_Flag, 
	test_si, 
	test_se);
   input [7:0] A;
   input [7:0] B;
   input [1:0] ALU_FUNC;
   input CLK;
   input RST;
   input Shift_enable;
   output [7:0] Shift_OUT;
   output Shift_Flag;
   input test_si;
   input test_se;

   // Internal wires
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n39;
   wire n40;
   wire n41;
   wire [7:0] Shift_OUT_comb;

   SDFFRQX1M Shift_Flag_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Shift_Flag), 
	.D(Shift_enable), 
	.CK(CLK));
   SDFFRQX1M \Shift_OUT_reg[0]  (.SI(Shift_Flag), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Shift_OUT[0]), 
	.D(Shift_OUT_comb[0]), 
	.CK(CLK));
   SDFFRQX1M \Shift_OUT_reg[7]  (.SI(Shift_OUT[6]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Shift_OUT[7]), 
	.D(Shift_OUT_comb[7]), 
	.CK(CLK));
   SDFFRQX1M \Shift_OUT_reg[1]  (.SI(Shift_OUT[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Shift_OUT[1]), 
	.D(Shift_OUT_comb[1]), 
	.CK(CLK));
   SDFFRQX1M \Shift_OUT_reg[2]  (.SI(Shift_OUT[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Shift_OUT[2]), 
	.D(Shift_OUT_comb[2]), 
	.CK(CLK));
   SDFFRQX1M \Shift_OUT_reg[6]  (.SI(Shift_OUT[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Shift_OUT[6]), 
	.D(Shift_OUT_comb[6]), 
	.CK(CLK));
   SDFFRQX1M \Shift_OUT_reg[3]  (.SI(Shift_OUT[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Shift_OUT[3]), 
	.D(Shift_OUT_comb[3]), 
	.CK(CLK));
   SDFFRQX1M \Shift_OUT_reg[5]  (.SI(Shift_OUT[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Shift_OUT[5]), 
	.D(Shift_OUT_comb[5]), 
	.CK(CLK));
   SDFFRQX1M \Shift_OUT_reg[4]  (.SI(Shift_OUT[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Shift_OUT[4]), 
	.D(Shift_OUT_comb[4]), 
	.CK(CLK));
   CLKINVX2M U21 (.Y(n39), 
	.A(Shift_enable));
   NOR2X2M U22 (.Y(n14), 
	.B(n41), 
	.A(n40));
   NOR2XLM U23 (.Y(n18), 
	.B(ALU_FUNC[0]), 
	.A(n40));
   NOR2XLM U24 (.Y(n19), 
	.B(ALU_FUNC[1]), 
	.A(ALU_FUNC[0]));
   NOR2X2M U25 (.Y(n15), 
	.B(ALU_FUNC[1]), 
	.A(n41));
   NOR2X2M U26 (.Y(Shift_OUT_comb[7]), 
	.B(n39), 
	.A(n13));
   AOI22X1M U27 (.Y(n13), 
	.B1(n15), 
	.B0(A[6]), 
	.A1(n14), 
	.A0(B[6]));
   AOI21X2M U28 (.Y(Shift_OUT_comb[1]), 
	.B0(n39), 
	.A1(n29), 
	.A0(n28));
   AOI22X1M U29 (.Y(n28), 
	.B1(n19), 
	.B0(A[2]), 
	.A1(n15), 
	.A0(A[0]));
   AOI22X1M U30 (.Y(n29), 
	.B1(n18), 
	.B0(B[2]), 
	.A1(n14), 
	.A0(B[0]));
   AOI21X2M U31 (.Y(Shift_OUT_comb[2]), 
	.B0(n39), 
	.A1(n27), 
	.A0(n26));
   AOI22X1M U32 (.Y(n26), 
	.B1(n19), 
	.B0(A[3]), 
	.A1(n15), 
	.A0(A[1]));
   AOI22X1M U33 (.Y(n27), 
	.B1(n18), 
	.B0(B[3]), 
	.A1(n14), 
	.A0(B[1]));
   AOI21X2M U34 (.Y(Shift_OUT_comb[3]), 
	.B0(n39), 
	.A1(n25), 
	.A0(n24));
   AOI22X1M U35 (.Y(n24), 
	.B1(n19), 
	.B0(A[4]), 
	.A1(n15), 
	.A0(A[2]));
   AOI22X1M U36 (.Y(n25), 
	.B1(n18), 
	.B0(B[4]), 
	.A1(n14), 
	.A0(B[2]));
   AOI21X2M U37 (.Y(Shift_OUT_comb[4]), 
	.B0(n39), 
	.A1(n23), 
	.A0(n22));
   AOI22X1M U38 (.Y(n22), 
	.B1(A[5]), 
	.B0(n19), 
	.A1(n15), 
	.A0(A[3]));
   AOI22X1M U39 (.Y(n23), 
	.B1(B[5]), 
	.B0(n18), 
	.A1(n14), 
	.A0(B[3]));
   AOI21X2M U40 (.Y(Shift_OUT_comb[5]), 
	.B0(n39), 
	.A1(n21), 
	.A0(n20));
   AOI22X1M U41 (.Y(n20), 
	.B1(A[6]), 
	.B0(n19), 
	.A1(n15), 
	.A0(A[4]));
   AOI22X1M U42 (.Y(n21), 
	.B1(B[6]), 
	.B0(n18), 
	.A1(n14), 
	.A0(B[4]));
   AOI21X2M U43 (.Y(Shift_OUT_comb[6]), 
	.B0(n39), 
	.A1(n17), 
	.A0(n16));
   AOI22X1M U44 (.Y(n16), 
	.B1(n19), 
	.B0(A[7]), 
	.A1(n15), 
	.A0(A[5]));
   AOI22X1M U45 (.Y(n17), 
	.B1(n18), 
	.B0(B[7]), 
	.A1(n14), 
	.A0(B[5]));
   NOR2X2M U46 (.Y(Shift_OUT_comb[0]), 
	.B(n39), 
	.A(n30));
   AOI22X1M U47 (.Y(n30), 
	.B1(n19), 
	.B0(A[1]), 
	.A1(n18), 
	.A0(B[1]));
   INVX2M U48 (.Y(n40), 
	.A(ALU_FUNC[1]));
   INVX2M U49 (.Y(n41), 
	.A(ALU_FUNC[0]));
endmodule

module CMP_UNIT_test_1 (
	A, 
	B, 
	ALU_FUNC, 
	CLK, 
	RST, 
	CMP_enable, 
	CMP_OUT, 
	CMP_Flag, 
	test_si, 
	test_se);
   input [7:0] A;
   input [7:0] B;
   input [1:0] ALU_FUNC;
   input CLK;
   input RST;
   input CMP_enable;
   output [2:0] CMP_OUT;
   output CMP_Flag;
   input test_si;
   input test_se;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire N17;
   wire N19;
   wire n11;
   wire n12;
   wire n10;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire [1:0] CMP_OUT_comb;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   SDFFRQX1M CMP_Flag_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(CMP_Flag), 
	.D(CMP_enable), 
	.CK(CLK));
   SDFFRQX1M \CMP_OUT_reg[1]  (.SI(CMP_OUT[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(CMP_OUT[1]), 
	.D(CMP_OUT_comb[1]), 
	.CK(CLK));
   SDFFRQX1M \CMP_OUT_reg[0]  (.SI(CMP_Flag), 
	.SE(test_se), 
	.RN(RST), 
	.Q(CMP_OUT[0]), 
	.D(CMP_OUT_comb[0]), 
	.CK(CLK));
   AOI2B1X1M U9 (.Y(n37), 
	.B0(n34), 
	.A1N(n36), 
	.A0(n35));
   INVX2M U10 (.Y(n47), 
	.A(n37));
   XNOR2X2M U14 (.Y(n31), 
	.B(B[6]), 
	.A(A[6]));
   OAI31X1M U15 (.Y(n17), 
	.B0(n25), 
	.A2(n14), 
	.A1(n15), 
	.A0(n24));
   AOI211X2M U16 (.Y(n14), 
	.C0(n13), 
	.B0(n21), 
	.A1(n42), 
	.A0(A[1]));
   AOI211X2M U17 (.Y(n23), 
	.C0(n20), 
	.B0(n21), 
	.A1(n43), 
	.A0(n22));
   NAND2BX2M U18 (.Y(n21), 
	.B(n26), 
	.AN(n15));
   OAI21X2M U19 (.Y(N19), 
	.B0(n35), 
	.A1(n19), 
	.A0(n34));
   NOR2X2M U20 (.Y(n15), 
	.B(A[2]), 
	.A(n39));
   NOR2X2M U21 (.Y(n10), 
	.B(A[0]), 
	.A(n38));
   NOR2X2M U22 (.Y(n24), 
	.B(A[3]), 
	.A(n40));
   NOR2X2M U23 (.Y(n34), 
	.B(B[7]), 
	.A(n46));
   INVX2M U24 (.Y(n48), 
	.A(CMP_enable));
   INVX2M U25 (.Y(n45), 
	.A(A[6]));
   INVXLM U26 (.Y(n42), 
	.A(n10));
   NOR3X2M U27 (.Y(CMP_OUT_comb[0]), 
	.C(n50), 
	.B(n12), 
	.A(n48));
   AOI22X1M U28 (.Y(n12), 
	.B1(N19), 
	.B0(ALU_FUNC[1]), 
	.A1(n49), 
	.A0(N17));
   INVX2M U29 (.Y(n38), 
	.A(B[0]));
   NOR3X2M U30 (.Y(CMP_OUT_comb[1]), 
	.C(n49), 
	.B(n11), 
	.A(n48));
   AOI22X1M U31 (.Y(n11), 
	.B1(ALU_FUNC[0]), 
	.B0(N19), 
	.A1(n50), 
	.A0(n47));
   INVX2M U32 (.Y(n39), 
	.A(B[2]));
   INVX2M U33 (.Y(n41), 
	.A(B[6]));
   INVXLM U34 (.Y(n44), 
	.A(n23));
   INVX2M U35 (.Y(n43), 
	.A(A[1]));
   INVX2M U36 (.Y(n40), 
	.A(B[3]));
   INVX2M U37 (.Y(n46), 
	.A(A[7]));
   INVX2M U38 (.Y(n49), 
	.A(ALU_FUNC[1]));
   INVX2M U39 (.Y(n50), 
	.A(ALU_FUNC[0]));
   NAND2BX1M U41 (.Y(n27), 
	.B(A[4]), 
	.AN(B[4]));
   NAND2BX1M U42 (.Y(n16), 
	.B(B[4]), 
	.AN(A[4]));
   CLKNAND2X2M U43 (.Y(n29), 
	.B(n16), 
	.A(n27));
   CLKNAND2X2M U44 (.Y(n26), 
	.B(n39), 
	.A(A[2]));
   AOI21X1M U45 (.Y(n13), 
	.B0(B[1]), 
	.A1(n43), 
	.A0(n10));
   CLKNAND2X2M U46 (.Y(n25), 
	.B(n40), 
	.A(A[3]));
   NAND2BX1M U47 (.Y(n32), 
	.B(B[5]), 
	.AN(A[5]));
   OAI211X1M U48 (.Y(n18), 
	.C0(n32), 
	.B0(n16), 
	.A1(n17), 
	.A0(n29));
   NAND2BX1M U49 (.Y(n28), 
	.B(A[5]), 
	.AN(B[5]));
   AOI32X1M U50 (.Y(n19), 
	.B1(n45), 
	.B0(B[6]), 
	.A2(n31), 
	.A1(n28), 
	.A0(n18));
   CLKNAND2X2M U51 (.Y(n35), 
	.B(n46), 
	.A(B[7]));
   CLKNAND2X2M U52 (.Y(n22), 
	.B(n38), 
	.A(A[0]));
   OA21X1M U53 (.Y(n20), 
	.B0(B[1]), 
	.A1(n43), 
	.A0(n22));
   AOI31X1M U54 (.Y(n30), 
	.B0(n24), 
	.A2(n25), 
	.A1(n26), 
	.A0(n44));
   OAI2B11X1M U55 (.Y(n33), 
	.C0(n27), 
	.B0(n28), 
	.A1N(n30), 
	.A0(n29));
   AOI32X1M U56 (.Y(n36), 
	.B1(n41), 
	.B0(A[6]), 
	.A2(n31), 
	.A1(n32), 
	.A0(n33));
   NOR2X1M U57 (.Y(N17), 
	.B(n47), 
	.A(N19));
   INVX2M U3 (.Y(CMP_OUT[2]), 
	.A(HTIE_LTIEHI_NET));
endmodule

module ALU_TOP (
	scan_clk, 
	scan_rst, 
	test_mode, 
	SI, 
	SE, 
	SO, 
	A, 
	B, 
	ALU_FUNC, 
	CLK, 
	RST, 
	Arith_OUT, 
	Carry_OUT, 
	Arith_Flag, 
	Logic_OUT, 
	Logic_Flag, 
	Shift_OUT, 
	Shift_Flag, 
	CMP_OUT, 
	CMP_Flag);
   input scan_clk;
   input scan_rst;
   input test_mode;
   input SI;
   input SE;
   output SO;
   input [7:0] A;
   input [7:0] B;
   input [3:0] ALU_FUNC;
   input CLK;
   input RST;
   output [15:0] Arith_OUT;
   output Carry_OUT;
   output Arith_Flag;
   output [7:0] Logic_OUT;
   output Logic_Flag;
   output [7:0] Shift_OUT;
   output Shift_Flag;
   output [2:0] CMP_OUT;
   output CMP_Flag;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire FE_OFCN161_Shift_OUT_0_;
   wire FE_OFCN160_Logic_OUT_2_;
   wire FE_OFN159_CMP_OUT_2_;
   wire FE_OFN158_CMP_OUT_2_;
   wire FE_OFN157_Arith_Flag;
   wire FE_OFN156_Arith_Flag;
   wire FE_OFN155_Arith_OUT_6_;
   wire FE_OFN154_Arith_OUT_6_;
   wire FE_OFN153_Arith_OUT_5_;
   wire FE_OFN152_Arith_OUT_5_;
   wire FE_OFN151_Arith_OUT_7_;
   wire FE_OFN150_Arith_OUT_7_;
   wire FE_OFN149_Arith_OUT_9_;
   wire FE_OFN148_Arith_OUT_9_;
   wire FE_OFN147_Carry_OUT;
   wire FE_OFN146_Carry_OUT;
   wire FE_OFN145_Arith_OUT_8_;
   wire FE_OFN144_Arith_OUT_8_;
   wire FE_OFN143_Arith_OUT_10_;
   wire FE_OFN142_Arith_OUT_10_;
   wire FE_OFN141_Arith_OUT_11_;
   wire FE_OFN140_Arith_OUT_11_;
   wire FE_OFN139_Arith_OUT_4_;
   wire FE_OFN138_Arith_OUT_4_;
   wire FE_OFN137_Arith_OUT_12_;
   wire FE_OFN136_Arith_OUT_12_;
   wire FE_OFN135_Arith_OUT_13_;
   wire FE_OFN134_Arith_OUT_13_;
   wire FE_OFN133_Arith_OUT_14_;
   wire FE_OFN132_Arith_OUT_14_;
   wire FE_OFN131_Arith_OUT_15_;
   wire FE_OFN130_Arith_OUT_15_;
   wire FE_OFN129_Arith_OUT_3_;
   wire FE_OFN128_Arith_OUT_3_;
   wire FE_OFN127_Arith_OUT_2_;
   wire FE_OFN126_Arith_OUT_2_;
   wire FE_OFN125_Arith_OUT_1_;
   wire FE_OFN124_Arith_OUT_1_;
   wire FE_OFN123_Arith_OUT_0_;
   wire FE_OFN122_Arith_OUT_0_;
   wire FE_OFN121_Logic_Flag;
   wire FE_OFN120_Logic_Flag;
   wire FE_OFN119_Logic_OUT_7_;
   wire FE_OFN118_Logic_OUT_7_;
   wire FE_OFN117_Logic_OUT_3_;
   wire FE_OFN116_Logic_OUT_3_;
   wire FE_OFN115_Logic_OUT_2_;
   wire FE_OFN114_Logic_OUT_2_;
   wire FE_OFN113_Logic_OUT_0_;
   wire FE_OFN112_Logic_OUT_0_;
   wire FE_OFN111_Logic_OUT_5_;
   wire FE_OFN110_Logic_OUT_5_;
   wire FE_OFN109_Logic_OUT_4_;
   wire FE_OFN108_Logic_OUT_4_;
   wire FE_OFN107_Logic_OUT_1_;
   wire FE_OFN106_Logic_OUT_1_;
   wire FE_OFN105_Logic_OUT_6_;
   wire FE_OFN104_Logic_OUT_6_;
   wire FE_OFN103_Shift_Flag;
   wire FE_OFN102_Shift_Flag;
   wire FE_OFN101_Shift_OUT_0_;
   wire FE_OFN100_Shift_OUT_0_;
   wire FE_OFN99_Shift_OUT_7_;
   wire FE_OFN98_Shift_OUT_7_;
   wire FE_OFN97_Shift_OUT_1_;
   wire FE_OFN96_Shift_OUT_1_;
   wire FE_OFN95_Shift_OUT_2_;
   wire FE_OFN94_Shift_OUT_2_;
   wire FE_OFN93_Shift_OUT_6_;
   wire FE_OFN92_Shift_OUT_6_;
   wire FE_OFN91_Shift_OUT_3_;
   wire FE_OFN90_Shift_OUT_3_;
   wire FE_OFN89_Shift_OUT_5_;
   wire FE_OFN88_Shift_OUT_5_;
   wire FE_OFN87_Shift_OUT_4_;
   wire FE_OFN86_Shift_OUT_4_;
   wire FE_OFN85_CMP_Flag;
   wire FE_OFN84_CMP_Flag;
   wire FE_OFN83_CMP_OUT_1_;
   wire FE_OFN82_CMP_OUT_1_;
   wire FE_OFN81_CMP_OUT_0_;
   wire FE_OFN80_CMP_OUT_0_;
   wire FE_OFN79_CMP_OUT_2_;
   wire FE_OFN78_CMP_OUT_2_;
   wire FE_OFN77_Arith_Flag;
   wire FE_OFN76_Arith_Flag;
   wire FE_OFN75_Arith_OUT_6_;
   wire FE_OFN74_Arith_OUT_6_;
   wire FE_OFN73_Arith_OUT_5_;
   wire FE_OFN72_Arith_OUT_5_;
   wire FE_OFN71_Arith_OUT_7_;
   wire FE_OFN70_Arith_OUT_7_;
   wire FE_OFN69_Arith_OUT_9_;
   wire FE_OFN68_Arith_OUT_9_;
   wire FE_OFN67_Carry_OUT;
   wire FE_OFN66_Carry_OUT;
   wire FE_OFN65_Arith_OUT_8_;
   wire FE_OFN64_Arith_OUT_8_;
   wire FE_OFN63_Arith_OUT_10_;
   wire FE_OFN62_Arith_OUT_10_;
   wire FE_OFN61_Arith_OUT_11_;
   wire FE_OFN60_Arith_OUT_11_;
   wire FE_OFN59_Arith_OUT_4_;
   wire FE_OFN58_Arith_OUT_4_;
   wire FE_OFN57_Arith_OUT_12_;
   wire FE_OFN56_Arith_OUT_12_;
   wire FE_OFN55_Arith_OUT_13_;
   wire FE_OFN54_Arith_OUT_13_;
   wire FE_OFN53_Arith_OUT_14_;
   wire FE_OFN52_Arith_OUT_14_;
   wire FE_OFN51_Arith_OUT_15_;
   wire FE_OFN50_Arith_OUT_15_;
   wire FE_OFN49_Arith_OUT_3_;
   wire FE_OFN48_Arith_OUT_3_;
   wire FE_OFN47_Arith_OUT_2_;
   wire FE_OFN46_Arith_OUT_2_;
   wire FE_OFN45_Arith_OUT_1_;
   wire FE_OFN44_Arith_OUT_1_;
   wire FE_OFN43_Arith_OUT_0_;
   wire FE_OFN42_Arith_OUT_0_;
   wire FE_OFN41_Logic_Flag;
   wire FE_OFN40_Logic_Flag;
   wire FE_OFN39_Logic_OUT_7_;
   wire FE_OFN38_Logic_OUT_7_;
   wire FE_OFN37_Logic_OUT_3_;
   wire FE_OFN36_Logic_OUT_3_;
   wire FE_OFN35_Logic_OUT_2_;
   wire FE_OFN34_Logic_OUT_2_;
   wire FE_OFN33_Logic_OUT_0_;
   wire FE_OFN32_Logic_OUT_0_;
   wire FE_OFN31_Logic_OUT_5_;
   wire FE_OFN30_Logic_OUT_5_;
   wire FE_OFN29_Logic_OUT_4_;
   wire FE_OFN28_Logic_OUT_4_;
   wire FE_OFN27_Logic_OUT_1_;
   wire FE_OFN26_Logic_OUT_1_;
   wire FE_OFN25_Logic_OUT_6_;
   wire FE_OFN24_Logic_OUT_6_;
   wire FE_OFN23_Shift_Flag;
   wire FE_OFN22_Shift_Flag;
   wire FE_OFN21_Shift_OUT_0_;
   wire FE_OFN20_Shift_OUT_0_;
   wire FE_OFN19_Shift_OUT_7_;
   wire FE_OFN18_Shift_OUT_7_;
   wire FE_OFN17_Shift_OUT_1_;
   wire FE_OFN16_Shift_OUT_1_;
   wire FE_OFN15_Shift_OUT_2_;
   wire FE_OFN14_Shift_OUT_2_;
   wire FE_OFN13_Shift_OUT_6_;
   wire FE_OFN12_Shift_OUT_6_;
   wire FE_OFN11_Shift_OUT_3_;
   wire FE_OFN10_Shift_OUT_3_;
   wire FE_OFN9_Shift_OUT_5_;
   wire FE_OFN8_Shift_OUT_5_;
   wire FE_OFN7_Shift_OUT_4_;
   wire FE_OFN6_Shift_OUT_4_;
   wire FE_OFN5_CMP_Flag;
   wire FE_OFN4_CMP_Flag;
   wire FE_OFN3_CMP_OUT_1_;
   wire FE_OFN2_CMP_OUT_1_;
   wire FE_OFN1_CMP_OUT_0_;
   wire FE_OFN0_CMP_OUT_0_;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n139;
   wire n140;
   wire n142;
   wire n143;
   wire n144;
   wire scan_fun_clk;
   wire scan_fun_rst;
   wire Shift_enable;
   wire CMP_enable;
   wire Logic_enable;
   wire Arith_enable;
   wire n5;
   wire n7;
   wire n9;
   wire n11;
   wire n13;
   wire n15;
   wire n17;
   wire n19;
   wire n21;
   wire n23;
   wire n25;
   wire n27;
   wire n29;
   wire n31;
   wire n33;
   wire n35;
   wire n37;
   wire n39;
   wire n41;
   wire n43;
   wire n45;
   wire n47;
   wire n49;
   wire n51;
   wire n53;
   wire n55;
   wire n57;
   wire n59;
   wire n61;
   wire n63;
   wire n65;
   wire n67;
   wire n69;
   wire n71;
   wire n73;
   wire n75;
   wire n77;
   wire n79;
   wire n81;
   wire SYNOPSYS_UNCONNECTED__0;

   assign SO = n132 ;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   CLKBUFX32M FE_OFCC161_Shift_OUT_0_ (.Y(Shift_OUT[0]), 
	.A(FE_OFCN161_Shift_OUT_0_));
   CLKBUFX40M FE_OFCC160_Logic_OUT_2_ (.Y(Logic_OUT[2]), 
	.A(FE_OFCN160_Logic_OUT_2_));
   CLKINVX40M FE_OFC159_CMP_OUT_2_ (.Y(CMP_OUT[2]), 
	.A(FE_OFN159_CMP_OUT_2_));
   CLKINVX1M FE_OFC158_CMP_OUT_2_ (.Y(FE_OFN159_CMP_OUT_2_), 
	.A(FE_OFN158_CMP_OUT_2_));
   CLKINVX40M FE_OFC157_Arith_Flag (.Y(Arith_Flag), 
	.A(FE_OFN157_Arith_Flag));
   CLKINVX1M FE_OFC156_Arith_Flag (.Y(FE_OFN157_Arith_Flag), 
	.A(FE_OFN156_Arith_Flag));
   CLKINVX40M FE_OFC155_Arith_OUT_6_ (.Y(Arith_OUT[6]), 
	.A(FE_OFN155_Arith_OUT_6_));
   CLKINVX1M FE_OFC154_Arith_OUT_6_ (.Y(FE_OFN155_Arith_OUT_6_), 
	.A(FE_OFN154_Arith_OUT_6_));
   CLKINVX40M FE_OFC153_Arith_OUT_5_ (.Y(Arith_OUT[5]), 
	.A(FE_OFN153_Arith_OUT_5_));
   CLKINVX1M FE_OFC152_Arith_OUT_5_ (.Y(FE_OFN153_Arith_OUT_5_), 
	.A(FE_OFN152_Arith_OUT_5_));
   CLKINVX40M FE_OFC151_Arith_OUT_7_ (.Y(Arith_OUT[7]), 
	.A(FE_OFN151_Arith_OUT_7_));
   CLKINVX1M FE_OFC150_Arith_OUT_7_ (.Y(FE_OFN151_Arith_OUT_7_), 
	.A(FE_OFN150_Arith_OUT_7_));
   CLKINVX40M FE_OFC149_Arith_OUT_9_ (.Y(Arith_OUT[9]), 
	.A(FE_OFN149_Arith_OUT_9_));
   CLKINVX1M FE_OFC148_Arith_OUT_9_ (.Y(FE_OFN149_Arith_OUT_9_), 
	.A(FE_OFN148_Arith_OUT_9_));
   CLKINVX40M FE_OFC147_Carry_OUT (.Y(Carry_OUT), 
	.A(FE_OFN147_Carry_OUT));
   CLKINVX1M FE_OFC146_Carry_OUT (.Y(FE_OFN147_Carry_OUT), 
	.A(FE_OFN146_Carry_OUT));
   CLKINVX40M FE_OFC145_Arith_OUT_8_ (.Y(Arith_OUT[8]), 
	.A(FE_OFN145_Arith_OUT_8_));
   CLKINVX1M FE_OFC144_Arith_OUT_8_ (.Y(FE_OFN145_Arith_OUT_8_), 
	.A(FE_OFN144_Arith_OUT_8_));
   CLKINVX40M FE_OFC143_Arith_OUT_10_ (.Y(Arith_OUT[10]), 
	.A(FE_OFN143_Arith_OUT_10_));
   CLKINVX1M FE_OFC142_Arith_OUT_10_ (.Y(FE_OFN143_Arith_OUT_10_), 
	.A(FE_OFN142_Arith_OUT_10_));
   CLKINVX40M FE_OFC141_Arith_OUT_11_ (.Y(Arith_OUT[11]), 
	.A(FE_OFN141_Arith_OUT_11_));
   CLKINVX1M FE_OFC140_Arith_OUT_11_ (.Y(FE_OFN141_Arith_OUT_11_), 
	.A(FE_OFN140_Arith_OUT_11_));
   CLKINVX40M FE_OFC139_Arith_OUT_4_ (.Y(Arith_OUT[4]), 
	.A(FE_OFN139_Arith_OUT_4_));
   CLKINVX1M FE_OFC138_Arith_OUT_4_ (.Y(FE_OFN139_Arith_OUT_4_), 
	.A(FE_OFN138_Arith_OUT_4_));
   CLKINVX40M FE_OFC137_Arith_OUT_12_ (.Y(Arith_OUT[12]), 
	.A(FE_OFN137_Arith_OUT_12_));
   CLKINVX1M FE_OFC136_Arith_OUT_12_ (.Y(FE_OFN137_Arith_OUT_12_), 
	.A(FE_OFN136_Arith_OUT_12_));
   CLKINVX40M FE_OFC135_Arith_OUT_13_ (.Y(Arith_OUT[13]), 
	.A(FE_OFN135_Arith_OUT_13_));
   CLKINVX1M FE_OFC134_Arith_OUT_13_ (.Y(FE_OFN135_Arith_OUT_13_), 
	.A(FE_OFN134_Arith_OUT_13_));
   CLKINVX40M FE_OFC133_Arith_OUT_14_ (.Y(Arith_OUT[14]), 
	.A(FE_OFN133_Arith_OUT_14_));
   CLKINVX1M FE_OFC132_Arith_OUT_14_ (.Y(FE_OFN133_Arith_OUT_14_), 
	.A(FE_OFN132_Arith_OUT_14_));
   CLKINVX40M FE_OFC131_Arith_OUT_15_ (.Y(Arith_OUT[15]), 
	.A(FE_OFN131_Arith_OUT_15_));
   CLKINVX1M FE_OFC130_Arith_OUT_15_ (.Y(FE_OFN131_Arith_OUT_15_), 
	.A(FE_OFN130_Arith_OUT_15_));
   CLKINVX40M FE_OFC129_Arith_OUT_3_ (.Y(Arith_OUT[3]), 
	.A(FE_OFN129_Arith_OUT_3_));
   CLKINVX1M FE_OFC128_Arith_OUT_3_ (.Y(FE_OFN129_Arith_OUT_3_), 
	.A(FE_OFN128_Arith_OUT_3_));
   CLKINVX40M FE_OFC127_Arith_OUT_2_ (.Y(Arith_OUT[2]), 
	.A(FE_OFN127_Arith_OUT_2_));
   CLKINVX1M FE_OFC126_Arith_OUT_2_ (.Y(FE_OFN127_Arith_OUT_2_), 
	.A(FE_OFN126_Arith_OUT_2_));
   CLKINVX40M FE_OFC125_Arith_OUT_1_ (.Y(Arith_OUT[1]), 
	.A(FE_OFN125_Arith_OUT_1_));
   CLKINVX1M FE_OFC124_Arith_OUT_1_ (.Y(FE_OFN125_Arith_OUT_1_), 
	.A(FE_OFN124_Arith_OUT_1_));
   CLKINVX40M FE_OFC123_Arith_OUT_0_ (.Y(Arith_OUT[0]), 
	.A(FE_OFN123_Arith_OUT_0_));
   CLKINVX1M FE_OFC122_Arith_OUT_0_ (.Y(FE_OFN123_Arith_OUT_0_), 
	.A(FE_OFN122_Arith_OUT_0_));
   CLKINVX40M FE_OFC121_Logic_Flag (.Y(Logic_Flag), 
	.A(FE_OFN121_Logic_Flag));
   CLKINVX1M FE_OFC120_Logic_Flag (.Y(FE_OFN121_Logic_Flag), 
	.A(FE_OFN120_Logic_Flag));
   CLKINVX40M FE_OFC119_Logic_OUT_7_ (.Y(Logic_OUT[7]), 
	.A(FE_OFN119_Logic_OUT_7_));
   CLKINVX1M FE_OFC118_Logic_OUT_7_ (.Y(FE_OFN119_Logic_OUT_7_), 
	.A(FE_OFN118_Logic_OUT_7_));
   CLKINVX40M FE_OFC117_Logic_OUT_3_ (.Y(Logic_OUT[3]), 
	.A(FE_OFN117_Logic_OUT_3_));
   CLKINVX1M FE_OFC116_Logic_OUT_3_ (.Y(FE_OFN117_Logic_OUT_3_), 
	.A(FE_OFN116_Logic_OUT_3_));
   CLKINVX40M FE_OFC115_Logic_OUT_2_ (.Y(FE_OFCN160_Logic_OUT_2_), 
	.A(FE_OFN115_Logic_OUT_2_));
   CLKINVX1M FE_OFC114_Logic_OUT_2_ (.Y(FE_OFN115_Logic_OUT_2_), 
	.A(FE_OFN114_Logic_OUT_2_));
   CLKINVX40M FE_OFC113_Logic_OUT_0_ (.Y(Logic_OUT[0]), 
	.A(FE_OFN113_Logic_OUT_0_));
   CLKINVX1M FE_OFC112_Logic_OUT_0_ (.Y(FE_OFN113_Logic_OUT_0_), 
	.A(FE_OFN112_Logic_OUT_0_));
   CLKINVX40M FE_OFC111_Logic_OUT_5_ (.Y(Logic_OUT[5]), 
	.A(FE_OFN111_Logic_OUT_5_));
   CLKINVX1M FE_OFC110_Logic_OUT_5_ (.Y(FE_OFN111_Logic_OUT_5_), 
	.A(FE_OFN110_Logic_OUT_5_));
   CLKINVX40M FE_OFC109_Logic_OUT_4_ (.Y(Logic_OUT[4]), 
	.A(FE_OFN109_Logic_OUT_4_));
   CLKINVX1M FE_OFC108_Logic_OUT_4_ (.Y(FE_OFN109_Logic_OUT_4_), 
	.A(FE_OFN108_Logic_OUT_4_));
   CLKINVX40M FE_OFC107_Logic_OUT_1_ (.Y(Logic_OUT[1]), 
	.A(FE_OFN107_Logic_OUT_1_));
   CLKINVX1M FE_OFC106_Logic_OUT_1_ (.Y(FE_OFN107_Logic_OUT_1_), 
	.A(FE_OFN106_Logic_OUT_1_));
   CLKINVX40M FE_OFC105_Logic_OUT_6_ (.Y(Logic_OUT[6]), 
	.A(FE_OFN105_Logic_OUT_6_));
   CLKINVX1M FE_OFC104_Logic_OUT_6_ (.Y(FE_OFN105_Logic_OUT_6_), 
	.A(FE_OFN104_Logic_OUT_6_));
   CLKINVX40M FE_OFC103_Shift_Flag (.Y(Shift_Flag), 
	.A(FE_OFN103_Shift_Flag));
   CLKINVX1M FE_OFC102_Shift_Flag (.Y(FE_OFN103_Shift_Flag), 
	.A(FE_OFN102_Shift_Flag));
   CLKINVX40M FE_OFC101_Shift_OUT_0_ (.Y(FE_OFCN161_Shift_OUT_0_), 
	.A(FE_OFN101_Shift_OUT_0_));
   CLKINVX1M FE_OFC100_Shift_OUT_0_ (.Y(FE_OFN101_Shift_OUT_0_), 
	.A(FE_OFN100_Shift_OUT_0_));
   CLKINVX40M FE_OFC99_Shift_OUT_7_ (.Y(Shift_OUT[7]), 
	.A(FE_OFN99_Shift_OUT_7_));
   CLKINVX1M FE_OFC98_Shift_OUT_7_ (.Y(FE_OFN99_Shift_OUT_7_), 
	.A(FE_OFN98_Shift_OUT_7_));
   CLKINVX40M FE_OFC97_Shift_OUT_1_ (.Y(Shift_OUT[1]), 
	.A(FE_OFN97_Shift_OUT_1_));
   CLKINVX1M FE_OFC96_Shift_OUT_1_ (.Y(FE_OFN97_Shift_OUT_1_), 
	.A(FE_OFN96_Shift_OUT_1_));
   CLKINVX40M FE_OFC95_Shift_OUT_2_ (.Y(Shift_OUT[2]), 
	.A(FE_OFN95_Shift_OUT_2_));
   CLKINVX1M FE_OFC94_Shift_OUT_2_ (.Y(FE_OFN95_Shift_OUT_2_), 
	.A(FE_OFN94_Shift_OUT_2_));
   CLKINVX40M FE_OFC93_Shift_OUT_6_ (.Y(Shift_OUT[6]), 
	.A(FE_OFN93_Shift_OUT_6_));
   CLKINVX1M FE_OFC92_Shift_OUT_6_ (.Y(FE_OFN93_Shift_OUT_6_), 
	.A(FE_OFN92_Shift_OUT_6_));
   CLKINVX40M FE_OFC91_Shift_OUT_3_ (.Y(Shift_OUT[3]), 
	.A(FE_OFN91_Shift_OUT_3_));
   CLKINVX1M FE_OFC90_Shift_OUT_3_ (.Y(FE_OFN91_Shift_OUT_3_), 
	.A(FE_OFN90_Shift_OUT_3_));
   CLKINVX40M FE_OFC89_Shift_OUT_5_ (.Y(Shift_OUT[5]), 
	.A(FE_OFN89_Shift_OUT_5_));
   CLKINVX1M FE_OFC88_Shift_OUT_5_ (.Y(FE_OFN89_Shift_OUT_5_), 
	.A(FE_OFN88_Shift_OUT_5_));
   CLKINVX40M FE_OFC87_Shift_OUT_4_ (.Y(Shift_OUT[4]), 
	.A(FE_OFN87_Shift_OUT_4_));
   CLKINVX1M FE_OFC86_Shift_OUT_4_ (.Y(FE_OFN87_Shift_OUT_4_), 
	.A(FE_OFN86_Shift_OUT_4_));
   CLKINVX40M FE_OFC85_CMP_Flag (.Y(CMP_Flag), 
	.A(FE_OFN85_CMP_Flag));
   CLKINVX1M FE_OFC84_CMP_Flag (.Y(FE_OFN85_CMP_Flag), 
	.A(FE_OFN84_CMP_Flag));
   CLKINVX40M FE_OFC83_CMP_OUT_1_ (.Y(CMP_OUT[1]), 
	.A(FE_OFN83_CMP_OUT_1_));
   CLKINVX1M FE_OFC82_CMP_OUT_1_ (.Y(FE_OFN83_CMP_OUT_1_), 
	.A(FE_OFN82_CMP_OUT_1_));
   CLKINVX40M FE_OFC81_CMP_OUT_0_ (.Y(CMP_OUT[0]), 
	.A(FE_OFN81_CMP_OUT_0_));
   CLKINVX1M FE_OFC80_CMP_OUT_0_ (.Y(FE_OFN81_CMP_OUT_0_), 
	.A(FE_OFN80_CMP_OUT_0_));
   CLKINVX32M FE_OFC79_CMP_OUT_2_ (.Y(FE_OFN158_CMP_OUT_2_), 
	.A(FE_OFN79_CMP_OUT_2_));
   CLKINVX1M FE_OFC78_CMP_OUT_2_ (.Y(FE_OFN79_CMP_OUT_2_), 
	.A(FE_OFN78_CMP_OUT_2_));
   CLKINVX32M FE_OFC77_Arith_Flag (.Y(FE_OFN156_Arith_Flag), 
	.A(FE_OFN77_Arith_Flag));
   CLKINVX1M FE_OFC76_Arith_Flag (.Y(FE_OFN77_Arith_Flag), 
	.A(FE_OFN76_Arith_Flag));
   CLKINVX32M FE_OFC75_Arith_OUT_6_ (.Y(FE_OFN154_Arith_OUT_6_), 
	.A(FE_OFN75_Arith_OUT_6_));
   CLKINVX1M FE_OFC74_Arith_OUT_6_ (.Y(FE_OFN75_Arith_OUT_6_), 
	.A(FE_OFN74_Arith_OUT_6_));
   CLKINVX32M FE_OFC73_Arith_OUT_5_ (.Y(FE_OFN152_Arith_OUT_5_), 
	.A(FE_OFN73_Arith_OUT_5_));
   CLKINVX1M FE_OFC72_Arith_OUT_5_ (.Y(FE_OFN73_Arith_OUT_5_), 
	.A(FE_OFN72_Arith_OUT_5_));
   CLKINVX32M FE_OFC71_Arith_OUT_7_ (.Y(FE_OFN150_Arith_OUT_7_), 
	.A(FE_OFN71_Arith_OUT_7_));
   CLKINVX1M FE_OFC70_Arith_OUT_7_ (.Y(FE_OFN71_Arith_OUT_7_), 
	.A(FE_OFN70_Arith_OUT_7_));
   CLKINVX32M FE_OFC69_Arith_OUT_9_ (.Y(FE_OFN148_Arith_OUT_9_), 
	.A(FE_OFN69_Arith_OUT_9_));
   CLKINVX1M FE_OFC68_Arith_OUT_9_ (.Y(FE_OFN69_Arith_OUT_9_), 
	.A(FE_OFN68_Arith_OUT_9_));
   CLKINVX32M FE_OFC67_Carry_OUT (.Y(FE_OFN146_Carry_OUT), 
	.A(FE_OFN67_Carry_OUT));
   CLKINVX1M FE_OFC66_Carry_OUT (.Y(FE_OFN67_Carry_OUT), 
	.A(FE_OFN66_Carry_OUT));
   CLKINVX32M FE_OFC65_Arith_OUT_8_ (.Y(FE_OFN144_Arith_OUT_8_), 
	.A(FE_OFN65_Arith_OUT_8_));
   CLKINVX1M FE_OFC64_Arith_OUT_8_ (.Y(FE_OFN65_Arith_OUT_8_), 
	.A(FE_OFN64_Arith_OUT_8_));
   CLKINVX32M FE_OFC63_Arith_OUT_10_ (.Y(FE_OFN142_Arith_OUT_10_), 
	.A(FE_OFN63_Arith_OUT_10_));
   CLKINVX1M FE_OFC62_Arith_OUT_10_ (.Y(FE_OFN63_Arith_OUT_10_), 
	.A(FE_OFN62_Arith_OUT_10_));
   CLKINVX32M FE_OFC61_Arith_OUT_11_ (.Y(FE_OFN140_Arith_OUT_11_), 
	.A(FE_OFN61_Arith_OUT_11_));
   CLKINVX1M FE_OFC60_Arith_OUT_11_ (.Y(FE_OFN61_Arith_OUT_11_), 
	.A(FE_OFN60_Arith_OUT_11_));
   CLKINVX32M FE_OFC59_Arith_OUT_4_ (.Y(FE_OFN138_Arith_OUT_4_), 
	.A(FE_OFN59_Arith_OUT_4_));
   CLKINVX1M FE_OFC58_Arith_OUT_4_ (.Y(FE_OFN59_Arith_OUT_4_), 
	.A(FE_OFN58_Arith_OUT_4_));
   CLKINVX32M FE_OFC57_Arith_OUT_12_ (.Y(FE_OFN136_Arith_OUT_12_), 
	.A(FE_OFN57_Arith_OUT_12_));
   CLKINVX1M FE_OFC56_Arith_OUT_12_ (.Y(FE_OFN57_Arith_OUT_12_), 
	.A(FE_OFN56_Arith_OUT_12_));
   CLKINVX32M FE_OFC55_Arith_OUT_13_ (.Y(FE_OFN134_Arith_OUT_13_), 
	.A(FE_OFN55_Arith_OUT_13_));
   CLKINVX1M FE_OFC54_Arith_OUT_13_ (.Y(FE_OFN55_Arith_OUT_13_), 
	.A(FE_OFN54_Arith_OUT_13_));
   CLKINVX32M FE_OFC53_Arith_OUT_14_ (.Y(FE_OFN132_Arith_OUT_14_), 
	.A(FE_OFN53_Arith_OUT_14_));
   CLKINVX1M FE_OFC52_Arith_OUT_14_ (.Y(FE_OFN53_Arith_OUT_14_), 
	.A(FE_OFN52_Arith_OUT_14_));
   CLKINVX32M FE_OFC51_Arith_OUT_15_ (.Y(FE_OFN130_Arith_OUT_15_), 
	.A(FE_OFN51_Arith_OUT_15_));
   CLKINVX1M FE_OFC50_Arith_OUT_15_ (.Y(FE_OFN51_Arith_OUT_15_), 
	.A(FE_OFN50_Arith_OUT_15_));
   CLKINVX32M FE_OFC49_Arith_OUT_3_ (.Y(FE_OFN128_Arith_OUT_3_), 
	.A(FE_OFN49_Arith_OUT_3_));
   CLKINVX1M FE_OFC48_Arith_OUT_3_ (.Y(FE_OFN49_Arith_OUT_3_), 
	.A(FE_OFN48_Arith_OUT_3_));
   CLKINVX32M FE_OFC47_Arith_OUT_2_ (.Y(FE_OFN126_Arith_OUT_2_), 
	.A(FE_OFN47_Arith_OUT_2_));
   CLKINVX1M FE_OFC46_Arith_OUT_2_ (.Y(FE_OFN47_Arith_OUT_2_), 
	.A(FE_OFN46_Arith_OUT_2_));
   CLKINVX32M FE_OFC45_Arith_OUT_1_ (.Y(FE_OFN124_Arith_OUT_1_), 
	.A(FE_OFN45_Arith_OUT_1_));
   CLKINVX1M FE_OFC44_Arith_OUT_1_ (.Y(FE_OFN45_Arith_OUT_1_), 
	.A(FE_OFN44_Arith_OUT_1_));
   CLKINVX32M FE_OFC43_Arith_OUT_0_ (.Y(FE_OFN122_Arith_OUT_0_), 
	.A(FE_OFN43_Arith_OUT_0_));
   CLKINVX1M FE_OFC42_Arith_OUT_0_ (.Y(FE_OFN43_Arith_OUT_0_), 
	.A(FE_OFN42_Arith_OUT_0_));
   CLKINVX32M FE_OFC41_Logic_Flag (.Y(FE_OFN120_Logic_Flag), 
	.A(FE_OFN41_Logic_Flag));
   CLKINVX1M FE_OFC40_Logic_Flag (.Y(FE_OFN41_Logic_Flag), 
	.A(FE_OFN40_Logic_Flag));
   CLKINVX32M FE_OFC39_Logic_OUT_7_ (.Y(FE_OFN118_Logic_OUT_7_), 
	.A(FE_OFN39_Logic_OUT_7_));
   CLKINVX1M FE_OFC38_Logic_OUT_7_ (.Y(FE_OFN39_Logic_OUT_7_), 
	.A(FE_OFN38_Logic_OUT_7_));
   CLKINVX32M FE_OFC37_Logic_OUT_3_ (.Y(FE_OFN116_Logic_OUT_3_), 
	.A(FE_OFN37_Logic_OUT_3_));
   CLKINVX1M FE_OFC36_Logic_OUT_3_ (.Y(FE_OFN37_Logic_OUT_3_), 
	.A(FE_OFN36_Logic_OUT_3_));
   CLKINVX32M FE_OFC35_Logic_OUT_2_ (.Y(FE_OFN114_Logic_OUT_2_), 
	.A(FE_OFN35_Logic_OUT_2_));
   CLKINVX1M FE_OFC34_Logic_OUT_2_ (.Y(FE_OFN35_Logic_OUT_2_), 
	.A(FE_OFN34_Logic_OUT_2_));
   CLKINVX32M FE_OFC33_Logic_OUT_0_ (.Y(FE_OFN112_Logic_OUT_0_), 
	.A(FE_OFN33_Logic_OUT_0_));
   CLKINVX1M FE_OFC32_Logic_OUT_0_ (.Y(FE_OFN33_Logic_OUT_0_), 
	.A(FE_OFN32_Logic_OUT_0_));
   CLKINVX32M FE_OFC31_Logic_OUT_5_ (.Y(FE_OFN110_Logic_OUT_5_), 
	.A(FE_OFN31_Logic_OUT_5_));
   CLKINVX1M FE_OFC30_Logic_OUT_5_ (.Y(FE_OFN31_Logic_OUT_5_), 
	.A(FE_OFN30_Logic_OUT_5_));
   CLKINVX32M FE_OFC29_Logic_OUT_4_ (.Y(FE_OFN108_Logic_OUT_4_), 
	.A(FE_OFN29_Logic_OUT_4_));
   CLKINVX1M FE_OFC28_Logic_OUT_4_ (.Y(FE_OFN29_Logic_OUT_4_), 
	.A(FE_OFN28_Logic_OUT_4_));
   CLKINVX32M FE_OFC27_Logic_OUT_1_ (.Y(FE_OFN106_Logic_OUT_1_), 
	.A(FE_OFN27_Logic_OUT_1_));
   CLKINVX1M FE_OFC26_Logic_OUT_1_ (.Y(FE_OFN27_Logic_OUT_1_), 
	.A(FE_OFN26_Logic_OUT_1_));
   CLKINVX32M FE_OFC25_Logic_OUT_6_ (.Y(FE_OFN104_Logic_OUT_6_), 
	.A(FE_OFN25_Logic_OUT_6_));
   CLKINVX1M FE_OFC24_Logic_OUT_6_ (.Y(FE_OFN25_Logic_OUT_6_), 
	.A(FE_OFN24_Logic_OUT_6_));
   CLKINVX32M FE_OFC23_Shift_Flag (.Y(FE_OFN102_Shift_Flag), 
	.A(FE_OFN23_Shift_Flag));
   CLKINVX1M FE_OFC22_Shift_Flag (.Y(FE_OFN23_Shift_Flag), 
	.A(FE_OFN22_Shift_Flag));
   CLKINVX32M FE_OFC21_Shift_OUT_0_ (.Y(FE_OFN100_Shift_OUT_0_), 
	.A(FE_OFN21_Shift_OUT_0_));
   CLKINVX1M FE_OFC20_Shift_OUT_0_ (.Y(FE_OFN21_Shift_OUT_0_), 
	.A(FE_OFN20_Shift_OUT_0_));
   CLKINVX32M FE_OFC19_Shift_OUT_7_ (.Y(FE_OFN98_Shift_OUT_7_), 
	.A(FE_OFN19_Shift_OUT_7_));
   CLKINVX1M FE_OFC18_Shift_OUT_7_ (.Y(FE_OFN19_Shift_OUT_7_), 
	.A(FE_OFN18_Shift_OUT_7_));
   CLKINVX32M FE_OFC17_Shift_OUT_1_ (.Y(FE_OFN96_Shift_OUT_1_), 
	.A(FE_OFN17_Shift_OUT_1_));
   CLKINVX1M FE_OFC16_Shift_OUT_1_ (.Y(FE_OFN17_Shift_OUT_1_), 
	.A(FE_OFN16_Shift_OUT_1_));
   CLKINVX32M FE_OFC15_Shift_OUT_2_ (.Y(FE_OFN94_Shift_OUT_2_), 
	.A(FE_OFN15_Shift_OUT_2_));
   CLKINVX1M FE_OFC14_Shift_OUT_2_ (.Y(FE_OFN15_Shift_OUT_2_), 
	.A(FE_OFN14_Shift_OUT_2_));
   CLKINVX32M FE_OFC13_Shift_OUT_6_ (.Y(FE_OFN92_Shift_OUT_6_), 
	.A(FE_OFN13_Shift_OUT_6_));
   CLKINVX1M FE_OFC12_Shift_OUT_6_ (.Y(FE_OFN13_Shift_OUT_6_), 
	.A(FE_OFN12_Shift_OUT_6_));
   CLKINVX32M FE_OFC11_Shift_OUT_3_ (.Y(FE_OFN90_Shift_OUT_3_), 
	.A(FE_OFN11_Shift_OUT_3_));
   CLKINVX1M FE_OFC10_Shift_OUT_3_ (.Y(FE_OFN11_Shift_OUT_3_), 
	.A(FE_OFN10_Shift_OUT_3_));
   CLKINVX32M FE_OFC9_Shift_OUT_5_ (.Y(FE_OFN88_Shift_OUT_5_), 
	.A(FE_OFN9_Shift_OUT_5_));
   CLKINVX1M FE_OFC8_Shift_OUT_5_ (.Y(FE_OFN9_Shift_OUT_5_), 
	.A(FE_OFN8_Shift_OUT_5_));
   CLKINVX32M FE_OFC7_Shift_OUT_4_ (.Y(FE_OFN86_Shift_OUT_4_), 
	.A(FE_OFN7_Shift_OUT_4_));
   CLKINVX1M FE_OFC6_Shift_OUT_4_ (.Y(FE_OFN7_Shift_OUT_4_), 
	.A(FE_OFN6_Shift_OUT_4_));
   CLKINVX32M FE_OFC5_CMP_Flag (.Y(FE_OFN84_CMP_Flag), 
	.A(FE_OFN5_CMP_Flag));
   CLKINVX1M FE_OFC4_CMP_Flag (.Y(FE_OFN5_CMP_Flag), 
	.A(FE_OFN4_CMP_Flag));
   CLKINVX32M FE_OFC3_CMP_OUT_1_ (.Y(FE_OFN82_CMP_OUT_1_), 
	.A(FE_OFN3_CMP_OUT_1_));
   CLKINVX1M FE_OFC2_CMP_OUT_1_ (.Y(FE_OFN3_CMP_OUT_1_), 
	.A(FE_OFN2_CMP_OUT_1_));
   CLKINVX32M FE_OFC1_CMP_OUT_0_ (.Y(FE_OFN80_CMP_OUT_0_), 
	.A(FE_OFN1_CMP_OUT_0_));
   CLKINVX1M FE_OFC0_CMP_OUT_0_ (.Y(FE_OFN1_CMP_OUT_0_), 
	.A(FE_OFN0_CMP_OUT_0_));
   CLKINVX1M U27 (.Y(n5), 
	.A(n144));
   CLKINVX1M U28 (.Y(FE_OFN4_CMP_Flag), 
	.A(n5));
   CLKINVX1M U29 (.Y(n7), 
	.A(n143));
   CLKINVX1M U30 (.Y(FE_OFN0_CMP_OUT_0_), 
	.A(n7));
   CLKINVX1M U31 (.Y(n9), 
	.A(n142));
   CLKINVX1M U32 (.Y(FE_OFN2_CMP_OUT_1_), 
	.A(n9));
   CLKINVX1M U33 (.Y(n11), 
	.A(n140));
   CLKINVX1M U34 (.Y(FE_OFN22_Shift_Flag), 
	.A(n11));
   CLKINVX1M U35 (.Y(n13), 
	.A(n139));
   CLKINVX1M U36 (.Y(FE_OFN20_Shift_OUT_0_), 
	.A(n13));
   CLKINVX1M U37 (.Y(n15), 
	.A(n138));
   CLKINVX1M U38 (.Y(FE_OFN16_Shift_OUT_1_), 
	.A(n15));
   CLKINVX1M U39 (.Y(n17), 
	.A(n137));
   CLKINVX1M U40 (.Y(FE_OFN14_Shift_OUT_2_), 
	.A(n17));
   CLKINVX1M U41 (.Y(n19), 
	.A(n136));
   CLKINVX1M U42 (.Y(FE_OFN10_Shift_OUT_3_), 
	.A(n19));
   CLKINVX1M U43 (.Y(n21), 
	.A(n135));
   CLKINVX1M U44 (.Y(FE_OFN6_Shift_OUT_4_), 
	.A(n21));
   CLKINVX1M U45 (.Y(n23), 
	.A(n134));
   CLKINVX1M U46 (.Y(FE_OFN8_Shift_OUT_5_), 
	.A(n23));
   CLKINVX1M U47 (.Y(n25), 
	.A(n133));
   CLKINVX1M U48 (.Y(FE_OFN12_Shift_OUT_6_), 
	.A(n25));
   CLKINVX1M U49 (.Y(n27), 
	.A(n132));
   CLKINVX1M U50 (.Y(FE_OFN18_Shift_OUT_7_), 
	.A(n27));
   CLKINVX1M U51 (.Y(n29), 
	.A(n131));
   CLKINVX1M U52 (.Y(FE_OFN40_Logic_Flag), 
	.A(n29));
   CLKINVX1M U53 (.Y(n31), 
	.A(n130));
   CLKINVX1M U54 (.Y(FE_OFN32_Logic_OUT_0_), 
	.A(n31));
   CLKINVX1M U55 (.Y(n33), 
	.A(n129));
   CLKINVX1M U56 (.Y(FE_OFN26_Logic_OUT_1_), 
	.A(n33));
   CLKINVX1M U57 (.Y(n35), 
	.A(n128));
   CLKINVX1M U58 (.Y(FE_OFN34_Logic_OUT_2_), 
	.A(n35));
   CLKINVX1M U59 (.Y(n37), 
	.A(n127));
   CLKINVX1M U60 (.Y(FE_OFN36_Logic_OUT_3_), 
	.A(n37));
   CLKINVX1M U61 (.Y(n39), 
	.A(n126));
   CLKINVX1M U62 (.Y(FE_OFN28_Logic_OUT_4_), 
	.A(n39));
   CLKINVX1M U63 (.Y(n41), 
	.A(n125));
   CLKINVX1M U64 (.Y(FE_OFN30_Logic_OUT_5_), 
	.A(n41));
   CLKINVX1M U65 (.Y(n43), 
	.A(n124));
   CLKINVX1M U66 (.Y(FE_OFN24_Logic_OUT_6_), 
	.A(n43));
   CLKINVX1M U67 (.Y(n45), 
	.A(n123));
   CLKINVX1M U68 (.Y(FE_OFN38_Logic_OUT_7_), 
	.A(n45));
   CLKINVX1M U69 (.Y(n47), 
	.A(n122));
   CLKINVX1M U70 (.Y(FE_OFN76_Arith_Flag), 
	.A(n47));
   CLKINVX1M U71 (.Y(n49), 
	.A(n121));
   CLKINVX1M U72 (.Y(FE_OFN66_Carry_OUT), 
	.A(n49));
   CLKINVX1M U73 (.Y(n51), 
	.A(n120));
   CLKINVX1M U74 (.Y(FE_OFN42_Arith_OUT_0_), 
	.A(n51));
   CLKINVX1M U75 (.Y(n53), 
	.A(n119));
   CLKINVX1M U76 (.Y(FE_OFN44_Arith_OUT_1_), 
	.A(n53));
   CLKINVX1M U77 (.Y(n55), 
	.A(n118));
   CLKINVX1M U78 (.Y(FE_OFN46_Arith_OUT_2_), 
	.A(n55));
   CLKINVX1M U79 (.Y(n57), 
	.A(n117));
   CLKINVX1M U80 (.Y(FE_OFN48_Arith_OUT_3_), 
	.A(n57));
   CLKINVX1M U81 (.Y(n59), 
	.A(n116));
   CLKINVX1M U82 (.Y(FE_OFN58_Arith_OUT_4_), 
	.A(n59));
   CLKINVX1M U83 (.Y(n61), 
	.A(n115));
   CLKINVX1M U84 (.Y(FE_OFN72_Arith_OUT_5_), 
	.A(n61));
   CLKINVX1M U85 (.Y(n63), 
	.A(n114));
   CLKINVX1M U86 (.Y(FE_OFN74_Arith_OUT_6_), 
	.A(n63));
   CLKINVX1M U87 (.Y(n65), 
	.A(n113));
   CLKINVX1M U88 (.Y(FE_OFN70_Arith_OUT_7_), 
	.A(n65));
   CLKINVX1M U89 (.Y(n67), 
	.A(n112));
   CLKINVX1M U90 (.Y(FE_OFN64_Arith_OUT_8_), 
	.A(n67));
   CLKINVX1M U91 (.Y(n69), 
	.A(n111));
   CLKINVX1M U92 (.Y(FE_OFN68_Arith_OUT_9_), 
	.A(n69));
   CLKINVX1M U93 (.Y(n71), 
	.A(n110));
   CLKINVX1M U94 (.Y(FE_OFN62_Arith_OUT_10_), 
	.A(n71));
   CLKINVX1M U95 (.Y(n73), 
	.A(n109));
   CLKINVX1M U96 (.Y(FE_OFN60_Arith_OUT_11_), 
	.A(n73));
   CLKINVX1M U97 (.Y(n75), 
	.A(n108));
   CLKINVX1M U98 (.Y(FE_OFN56_Arith_OUT_12_), 
	.A(n75));
   CLKINVX1M U99 (.Y(n77), 
	.A(n107));
   CLKINVX1M U100 (.Y(FE_OFN54_Arith_OUT_13_), 
	.A(n77));
   CLKINVX1M U101 (.Y(n79), 
	.A(n106));
   CLKINVX1M U102 (.Y(FE_OFN52_Arith_OUT_14_), 
	.A(n79));
   CLKINVX1M U103 (.Y(n81), 
	.A(n105));
   CLKINVX1M U104 (.Y(FE_OFN50_Arith_OUT_15_), 
	.A(n81));
   mux2X1_1 U0_clk_mux (.IN_0(CLK), 
	.IN_1(scan_clk), 
	.SEL(test_mode), 
	.OUT(scan_fun_clk));
   mux2X1_0 U0_rst_mux (.IN_0(RST), 
	.IN_1(scan_rst), 
	.SEL(test_mode), 
	.OUT(scan_fun_rst));
   Decoder U0 (.IN({ ALU_FUNC[3],
		ALU_FUNC[2] }), 
	.OUT({ Shift_enable,
		CMP_enable,
		Logic_enable,
		Arith_enable }));
   ARITHMETIC_UNIT_test_1 U0_ARITHMETIC_UNIT (.A({ A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.ALU_FUNC({ ALU_FUNC[1],
		ALU_FUNC[0] }), 
	.CLK(scan_fun_clk), 
	.RST(scan_fun_rst), 
	.Arith_enable(Arith_enable), 
	.Carry_OUT(n121), 
	.Arith_OUT({ n105,
		n106,
		n107,
		n108,
		n109,
		n110,
		n111,
		n112,
		n113,
		n114,
		n115,
		n116,
		n117,
		n118,
		n119,
		n120 }), 
	.Arith_Flag(n122), 
	.test_si(SI), 
	.test_se(SE));
   LOGIC_UNIT_test_1 U0_LOGIC_UNIT (.A({ A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.ALU_FUNC({ ALU_FUNC[1],
		ALU_FUNC[0] }), 
	.CLK(scan_fun_clk), 
	.RST(scan_fun_rst), 
	.Logic_enable(Logic_enable), 
	.Logic_OUT({ n123,
		n124,
		n125,
		n126,
		n127,
		n128,
		n129,
		n130 }), 
	.Logic_Flag(n131), 
	.test_si(n142), 
	.test_se(SE));
   SHIFT_UNIT_test_1 U0_SHIFT_UNIT (.A({ A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.ALU_FUNC({ ALU_FUNC[1],
		ALU_FUNC[0] }), 
	.CLK(scan_fun_clk), 
	.RST(scan_fun_rst), 
	.Shift_enable(Shift_enable), 
	.Shift_OUT({ n132,
		n133,
		n134,
		n135,
		n136,
		n137,
		n138,
		n139 }), 
	.Shift_Flag(n140), 
	.test_si(n123), 
	.test_se(SE));
   CMP_UNIT_test_1 U0_CMP_UNIT (.A({ A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.ALU_FUNC({ ALU_FUNC[1],
		ALU_FUNC[0] }), 
	.CLK(scan_fun_clk), 
	.RST(scan_fun_rst), 
	.CMP_enable(CMP_enable), 
	.CMP_OUT({ SYNOPSYS_UNCONNECTED__0,
		n142,
		n143 }), 
	.CMP_Flag(n144), 
	.test_si(n121), 
	.test_se(SE));
   CLKINVX40M U1 (.Y(FE_OFN78_CMP_OUT_2_), 
	.A(HTIE_LTIEHI_NET));
endmodule

