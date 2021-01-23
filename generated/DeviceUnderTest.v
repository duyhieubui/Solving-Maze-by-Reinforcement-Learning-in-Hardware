module DeviceUnderTest(
  input        clock,
  input        reset,
  input  [4:0] io_a,
  input  [4:0] io_b,
  output [4:0] io_out
);
  assign io_out = io_a & io_b; // @[DeviceUnderTest.scala 12:10]
endmodule
