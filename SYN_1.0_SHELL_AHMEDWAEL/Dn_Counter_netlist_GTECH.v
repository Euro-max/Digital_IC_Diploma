/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : O-2018.06-SP1
// Date      : Wed Jul 29 00:18:06 2026
/////////////////////////////////////////////////////////////


module Down_Counter ( clock, in, latch, dec, zero );
  input [3:0] in;
  input clock, latch, dec;
  output zero;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20;
  wire   [3:0] counter;

  \**SEQGEN**  \counter_reg[3]  ( .clear(1'b0), .preset(1'b0), .next_state(N13), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(counter[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N9) );
  \**SEQGEN**  \counter_reg[2]  ( .clear(1'b0), .preset(1'b0), .next_state(N12), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(counter[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N9) );
  \**SEQGEN**  \counter_reg[1]  ( .clear(1'b0), .preset(1'b0), .next_state(N11), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(counter[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N9) );
  \**SEQGEN**  \counter_reg[0]  ( .clear(1'b0), .preset(1'b0), .next_state(N10), .clocked_on(clock), .data_in(1'b0), .enable(1'b0), .Q(counter[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N9) );
  GTECH_OR2 C32 ( .A(counter[2]), .B(counter[3]), .Z(N16) );
  GTECH_OR2 C33 ( .A(counter[1]), .B(N16), .Z(N17) );
  GTECH_OR2 C34 ( .A(counter[0]), .B(N17), .Z(N18) );
  GTECH_NOT I_0 ( .A(N18), .Z(N19) );
  SUB_UNS_OP sub_24 ( .A(counter), .B(1'b1), .Z({N8, N7, N6, N5}) );
  SELECT_OP C36 ( .DATA1(1'b1), .DATA2(1'b1), .DATA3(1'b0), .CONTROL1(N0), 
        .CONTROL2(N15), .CONTROL3(N3), .Z(N9) );
  GTECH_BUF B_0 ( .A(latch), .Z(N0) );
  SELECT_OP C37 ( .DATA1(in), .DATA2({N8, N7, N6, N5}), .CONTROL1(N0), 
        .CONTROL2(N15), .Z({N13, N12, N11, N10}) );
  GTECH_AND2 C40 ( .A(dec), .B(N20), .Z(N1) );
  GTECH_NOT I_1 ( .A(zero), .Z(N20) );
  GTECH_OR2 C44 ( .A(N1), .B(latch), .Z(N2) );
  GTECH_NOT I_2 ( .A(N2), .Z(N3) );
  GTECH_BUF B_1 ( .A(N15), .Z(N4) );
  GTECH_NOT I_3 ( .A(latch), .Z(N14) );
  GTECH_AND2 C48 ( .A(N1), .B(N14), .Z(N15) );
  GTECH_AND2 C49 ( .A(N4), .B(N14) );
  GTECH_BUF B_2 ( .A(N19), .Z(zero) );
endmodule

