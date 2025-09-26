module TB_SVA 
(
  input  logic REF_CLK,
  input  logic UART_CLK,
  input  logic RST_N,

  // Clock gating
  input  logic CLK_EN,
  input  logic GATED_CLK,

  // FIFO signals
  input  logic W_INC,
  input  logic R_INC,
  input  logic FULL,
  input  logic EMPTY,

  // UART RX/TX
  input  logic UART_RX_IN,
  input  logic TX_D_VLD,

  // ALU / RegFile
  input  logic OUT_VALID,
  input  logic RdData_Valid, 

  // Error flags
  input  logic PAR_ERR,
  input  logic STP_ERR
);

// -----------------------------------------------------------------------------
// Properties
// -----------------------------------------------------------------------------

property p_clk_gate;
  @(posedge REF_CLK) !CLK_EN |-> (GATED_CLK == 1'b0);
endproperty

property p_fifo_no_read_empty;
  @(posedge UART_CLK) disable iff(!RST_N)
    EMPTY |-> !R_INC;
endproperty

property p_result_tx;
  @(posedge REF_CLK) disable iff(!RST_N)
    ($rose(OUT_VALID)) |-> ##1 TX_D_VLD;
endproperty

property p_result_regfile;
  @(posedge REF_CLK) disable iff(!RST_N)
    ($rose(RdData_Valid)) |-> ##1 TX_D_VLD;
endproperty

property p_fifo_no_write_full;
  @(posedge REF_CLK) disable iff(!RST_N)
    FULL |-> !W_INC;
endproperty

property p_no_parity_error;
  @(posedge UART_CLK) disable iff (!RST_N)
    !PAR_ERR;
endproperty

property p_no_framing_error;
  @(posedge UART_CLK) disable iff (!RST_N)
    !STP_ERR;
endproperty

// ============================================================
// Properties definitions
// ============================================================

// ALU OUT_VALID must assert at least once
property p_OUT_VALID_once;
  @(posedge REF_CLK) disable iff (!RST_N)
    ##[0:$] OUT_VALID;
endproperty

// RegFile RdData_Valid must assert at least once
property p_RdData_Valid_once;
  @(posedge REF_CLK) disable iff (!RST_N)
    ##[0:$] RdData_Valid;
endproperty

// UART TX TX_D_VLD must assert at least once
property p_TX_D_VLD_once;
  @(posedge REF_CLK) disable iff (!RST_N)
    ##[0:$] TX_D_VLD;
endproperty


// -----------------------------------------------------------------------------
// Assertions + Covers
// -----------------------------------------------------------------------------

assert property (p_clk_gate);
cover  property (p_clk_gate);

assert property (p_fifo_no_read_empty);
cover  property (p_fifo_no_read_empty);

assert property (p_result_tx);
cover  property (p_result_tx);

assert property (p_result_regfile);
cover  property (p_result_regfile);

assert property (p_fifo_no_write_full);
cover  property (p_fifo_no_write_full);

assert property (p_OUT_VALID_once);
cover  property (p_OUT_VALID_once);

assert property (p_RdData_Valid_once);
cover  property (p_RdData_Valid_once);

assert property (p_TX_D_VLD_once);
cover  property (p_TX_D_VLD_once);

assert property (p_no_parity_error);
cover  property (p_no_parity_error);

assert property (p_no_framing_error);
cover  property (p_no_framing_error);

endmodule