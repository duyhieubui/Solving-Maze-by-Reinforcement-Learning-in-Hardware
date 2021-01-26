circuit Q_function :
  module Q_function :
    input clock : Clock
    input reset : UInt<1>
    input io_Q_s_a : SInt<16>
    input io_Q_prime_max : SInt<16>
    output io_Q_updated : SInt<16>
    input io_cal : UInt<1>
    input io_reward : SInt<9>
    output io_wrEna : UInt<1>
  
    reg Q_s_a : SInt<16>, clock with :
      reset => (UInt<1>("h0"), Q_s_a) @[Q_function.scala 16:20]
    reg reward : SInt<9>, clock with :
      reset => (UInt<1>("h0"), reward) @[Q_function.scala 17:21]
    node _T = mul(reward, asSInt(UInt<9>("h80"))) @[Q_function.scala 23:33]
    node _T_1 = add(Q_s_a, _T) @[Q_function.scala 23:26]
    node _T_2 = tail(_T_1, 1) @[Q_function.scala 23:26]
    node _T_3 = asSInt(_T_2) @[Q_function.scala 23:26]
    node _T_4 = div(_T_3, asSInt(UInt<3>("h2"))) @[Q_function.scala 23:40]
    node _T_5 = mul(io_Q_prime_max, asSInt(UInt<4>("h4"))) @[Q_function.scala 23:61]
    node _T_6 = div(_T_5, asSInt(UInt<5>("ha"))) @[Q_function.scala 23:65]
    node _T_7 = add(_T_4, _T_6) @[Q_function.scala 23:45]
    node _T_8 = tail(_T_7, 1) @[Q_function.scala 23:45]
    node _T_9 = asSInt(_T_8) @[Q_function.scala 23:45]
    node _GEN_0 = mux(io_cal, _T_9, asSInt(UInt<1>("h0"))) @[Q_function.scala 22:15]
    node _GEN_1 = mux(io_cal, UInt<1>("h1"), UInt<1>("h0")) @[Q_function.scala 22:15]
    io_Q_updated <= asSInt(bits(_GEN_0, 15, 0)) @[Q_function.scala 23:18 Q_function.scala 26:17]
    io_wrEna <= _GEN_1 @[Q_function.scala 24:13 Q_function.scala 27:13]
    Q_s_a <= mux(reset, asSInt(UInt<16>("h0")), io_Q_s_a) @[Q_function.scala 18:8]
    reward <= mux(reset, asSInt(UInt<9>("h0")), io_reward) @[Q_function.scala 20:9]
