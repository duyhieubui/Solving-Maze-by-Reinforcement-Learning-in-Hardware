circuit reset_signal :
  module reset_signal :
    input clock : Clock
    input reset : UInt<1>
    input io_reset_sig : UInt<1>
  
    reg register : UInt<4>, clock with :
      reset => (UInt<1>("h0"), register) @[draft.scala 73:23]
    reg signalReg : UInt<1>, clock with :
      reset => (UInt<1>("h0"), signalReg) @[draft.scala 74:20]
    node _GEN_0 = mux(signalReg, UInt<1>("h0"), register) @[draft.scala 77:18]
    node _GEN_1 = mux(signalReg, UInt<1>("h0"), io_reset_sig) @[draft.scala 77:18]
    register <= mux(reset, UInt<4>("hc"), _GEN_0) @[draft.scala 78:13]
    signalReg <= _GEN_1 @[draft.scala 75:12 draft.scala 79:14]
