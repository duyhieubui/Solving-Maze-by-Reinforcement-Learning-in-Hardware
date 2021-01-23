;buildInfoPackage: chisel3, version: 3.2.2, scalaVersion: 2.11.12, sbtVersion: 1.3.2
circuit Ep : 
  module Ep : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip episode : UInt<9>, epsilon : UInt<10>}
    
    node _T = mul(io.episode, UInt<4>("h0a")) @[draft.scala 13:28]
    node _T_1 = div(_T, UInt<2>("h03")) @[draft.scala 13:33]
    node _T_2 = sub(UInt<10>("h03e8"), _T_1) @[draft.scala 13:17]
    node out = tail(_T_2, 1) @[draft.scala 13:17]
    node _T_3 = bits(out, 9, 0) @[draft.scala 14:18]
    io.epsilon <= _T_3 @[draft.scala 14:13]
    
