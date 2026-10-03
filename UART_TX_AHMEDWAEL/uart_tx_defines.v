`ifndef UART_TX_DEFINES_V
`define UART_TX_DEFINES_V

// ==========================================
// Global Configuration Macros
// ==========================================
`define DATA_WIDTH  8
`define PARITY_TYPE 0  // 0: Even Parity, 1: Odd Parity
`define PAR_EN      1  // 1: Enable Parity, 0: Disable Parity

// ==========================================
// FSM State Mux Selector Controls
// ==========================================
`define MUX_START  2'b00  // Drives logic 0 (Start bit)
`define MUX_DATA   2'b01  // Drives Serializer output
`define MUX_PARITY 2'b10  // Drives Parity bit
`define MUX_STOP   2'b11  // Drives logic 1 (Stop/Idle bit)



`endif