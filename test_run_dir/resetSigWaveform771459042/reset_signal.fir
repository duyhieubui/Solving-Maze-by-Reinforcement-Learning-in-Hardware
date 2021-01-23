;buildInfoPackage: chisel3, version: 3.2.2, scalaVersion: 2.11.12, sbtVersion: 1.3.2
circuit reset_signal : 
  module reset_signal : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip reset_sig : UInt<1>}
    
    reg register : UInt<4>, clock with : (reset => (reset, UInt<4>("h0c"))) @[draft.scala 73:23]
    reg signalReg : UInt<1>, clock @[draft.scala 74:20]
    signalReg <= io.reset_sig @[draft.scala 75:12]
    when signalReg : @[draft.scala 77:18]
      register <= UInt<1>("h00") @[draft.scala 78:13]
      signalReg <= UInt<1>("h00") @[draft.scala 79:14]
      skip @[draft.scala 77:18]
    
