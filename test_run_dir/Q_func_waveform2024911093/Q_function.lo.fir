circuit Q_function :
  module Q_function :
    input clock : Clock
    input reset : UInt<1>
    input io_Q_s_a : SInt<21>
    input io_Q_prime_max : SInt<21>
    output io_Q_updated : SInt<21>
    input io_cal : UInt<1>
    input io_reward : SInt<8>
    output io_wrEna : UInt<1>
  
    reg Q_s_a : SInt<21>, clock with :
      reset => (UInt<1>("h0"), Q_s_a) @[Q_function.scala 12:20]
    reg Q_prime_max : SInt<21>, clock with :
      reset => (UInt<1>("h0"), Q_prime_max) @[Q_function.scala 13:26]
    reg reward : SInt<8>, clock with :
      reset => (UInt<1>("h0"), reward) @[Q_function.scala 14:21]
    node _T = div(Q_s_a, asSInt(UInt<3>("h2"))) @[Q_function.scala 19:25]
    node _T_1 = mul(asSInt(UInt<5>("h9")), Q_prime_max) @[Q_function.scala 19:47]
    node _T_2 = div(_T_1, asSInt(UInt<5>("ha"))) @[Q_function.scala 19:60]
    node _T_3 = add(reward, _T_2) @[Q_function.scala 19:42]
    node _T_4 = tail(_T_3, 1) @[Q_function.scala 19:42]
    node _T_5 = asSInt(_T_4) @[Q_function.scala 19:42]
    node _T_6 = div(_T_5, asSInt(UInt<3>("h2"))) @[Q_function.scala 19:68]
    node _T_7 = add(_T, _T_6) @[Q_function.scala 19:32]
    node _T_8 = tail(_T_7, 1) @[Q_function.scala 19:32]
    node _T_9 = asSInt(_T_8) @[Q_function.scala 19:32]
    node _GEN_0 = mux(io_cal, _T_9, asSInt(UInt<1>("h0"))) @[Q_function.scala 18:15]
    node _GEN_1 = mux(io_cal, UInt<1>("h1"), UInt<1>("h0")) @[Q_function.scala 18:15]
    io_Q_updated <= asSInt(bits(_GEN_0, 20, 0)) @[Q_function.scala 19:18 Q_function.scala 22:17]
    io_wrEna <= _GEN_1 @[Q_function.scala 20:13 Q_function.scala 23:13]
    Q_s_a <= mux(reset, asSInt(UInt<21>("h0")), io_Q_s_a) @[Q_function.scala 15:8]
    Q_prime_max <= mux(reset, asSInt(UInt<21>("h0")), io_Q_prime_max) @[Q_function.scala 16:14]
    reward <= mux(reset, asSInt(UInt<8>("h0")), io_reward) @[Q_function.scala 17:9]
