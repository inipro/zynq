`timescale 1 ns / 1 ps

module ander (sw, btn, led);

  input [3:0] sw,btn;
  output [3:0] led;

  assign led = sw & btn;

endmodule
