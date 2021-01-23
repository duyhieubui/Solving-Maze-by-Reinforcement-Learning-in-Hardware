;buildInfoPackage: chisel3, version: 3.2.2, scalaVersion: 2.11.12, sbtVersion: 1.3.2
circuit Q_function : 
  module Q_function : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip Q_s_a : SInt<21>, flip Q_prime_max : SInt<21>, Q_updated : SInt<21>, flip cal : UInt<1>, flip reward : SInt<8>, wrEna : UInt<1>}
    
    reg Q_s_a : SInt<21>, clock with : (reset => (reset, asSInt(UInt<21>("h00")))) @[Q_function.scala 12:20]
    reg Q_prime_max : SInt<21>, clock with : (reset => (reset, asSInt(UInt<21>("h00")))) @[Q_function.scala 13:26]
    reg reward : SInt<8>, clock with : (reset => (reset, asSInt(UInt<8>("h00")))) @[Q_function.scala 14:21]
    Q_s_a <= io.Q_s_a @[Q_function.scala 15:8]
    Q_prime_max <= io.Q_prime_max @[Q_function.scala 16:14]
    reward <= io.reward @[Q_function.scala 17:9]
    when io.cal : @[Q_function.scala 18:15]
      node _T = div(Q_s_a, asSInt(UInt<3>("h02"))) @[Q_function.scala 19:25]
      node _T_1 = mul(asSInt(UInt<5>("h09")), Q_prime_max) @[Q_function.scala 19:47]
      node _T_2 = div(_T_1, asSInt(UInt<5>("h0a"))) @[Q_function.scala 19:60]
      node _T_3 = add(reward, _T_2) @[Q_function.scala 19:42]
      node _T_4 = tail(_T_3, 1) @[Q_function.scala 19:42]
      node _T_5 = asSInt(_T_4) @[Q_function.scala 19:42]
      node _T_6 = div(_T_5, asSInt(UInt<3>("h02"))) @[Q_function.scala 19:68]
      node _T_7 = add(_T, _T_6) @[Q_function.scala 19:32]
      node _T_8 = tail(_T_7, 1) @[Q_function.scala 19:32]
      node _T_9 = asSInt(_T_8) @[Q_function.scala 19:32]
      io.Q_updated <= _T_9 @[Q_function.scala 19:18]
      io.wrEna <= UInt<1>("h01") @[Q_function.scala 20:13]
      skip @[Q_function.scala 18:15]
    else : @[Q_function.scala 21:4]
      io.Q_updated <= asSInt(UInt<1>("h00")) @[Q_function.scala 22:17]
      io.wrEna <= UInt<1>("h00") @[Q_function.scala 23:13]
      skip @[Q_function.scala 21:4]
    
