;buildInfoPackage: chisel3, version: 3.2.2, scalaVersion: 2.11.12, sbtVersion: 1.3.2
circuit Q_function : 
  module Q_function : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip Q_s_a : SInt<16>, flip Q_prime_max : SInt<16>, Q_updated : SInt<16>, flip cal : UInt<1>, flip reward : SInt<9>, wrEna : UInt<1>}
    
    reg Q_s_a : SInt<16>, clock with : (reset => (reset, asSInt(UInt<16>("h00")))) @[Q_function.scala 16:20]
    reg reward : SInt<9>, clock with : (reset => (reset, asSInt(UInt<9>("h00")))) @[Q_function.scala 17:21]
    Q_s_a <= io.Q_s_a @[Q_function.scala 18:8]
    reward <= io.reward @[Q_function.scala 20:9]
    when io.cal : @[Q_function.scala 22:15]
      node _T = mul(reward, asSInt(UInt<9>("h080"))) @[Q_function.scala 23:33]
      node _T_1 = add(Q_s_a, _T) @[Q_function.scala 23:26]
      node _T_2 = tail(_T_1, 1) @[Q_function.scala 23:26]
      node _T_3 = asSInt(_T_2) @[Q_function.scala 23:26]
      node _T_4 = div(_T_3, asSInt(UInt<3>("h02"))) @[Q_function.scala 23:40]
      node _T_5 = mul(io.Q_prime_max, asSInt(UInt<4>("h04"))) @[Q_function.scala 23:61]
      node _T_6 = div(_T_5, asSInt(UInt<5>("h0a"))) @[Q_function.scala 23:65]
      node _T_7 = add(_T_4, _T_6) @[Q_function.scala 23:45]
      node _T_8 = tail(_T_7, 1) @[Q_function.scala 23:45]
      node _T_9 = asSInt(_T_8) @[Q_function.scala 23:45]
      io.Q_updated <= _T_9 @[Q_function.scala 23:18]
      io.wrEna <= UInt<1>("h01") @[Q_function.scala 24:13]
      skip @[Q_function.scala 22:15]
    else : @[Q_function.scala 25:4]
      io.Q_updated <= asSInt(UInt<1>("h00")) @[Q_function.scala 26:17]
      io.wrEna <= UInt<1>("h00") @[Q_function.scala 27:13]
      skip @[Q_function.scala 25:4]
    
