circuit Ep :
  module Ep :
    input clock : Clock
    input reset : UInt<1>
    input io_episode : UInt<9>
    output io_epsilon : UInt<10>
  
    node _T = mul(io_episode, UInt<4>("ha")) @[draft.scala 13:28]
    node _T_1 = div(_T, UInt<2>("h3")) @[draft.scala 13:33]
    node _T_2 = sub(UInt<10>("h3e8"), _T_1) @[draft.scala 13:17]
    node out = tail(_T_2, 1) @[draft.scala 13:17]
    node _T_3 = bits(out, 9, 0) @[draft.scala 14:18]
    io_epsilon <= _T_3 @[draft.scala 14:13]
