circuit FMS :
  module FMS :
    input clock : Clock
    input reset : UInt<1>
    input io_iterate : UInt<1>
    input io_done_learning : UInt<1>
    input io_move_to_checking_reward : UInt<1>
    output io_wrEna : UInt<1>
    output io_cal : UInt<1>
  
    reg state : UInt<3>, clock with :
      reset => (UInt<1>("h0"), state) @[FMS.scala 13:20]
    reg wrEna : UInt<1>, clock with :
      reset => (UInt<1>("h0"), wrEna) @[FMS.scala 14:20]
    reg cal : UInt<1>, clock with :
      reset => (UInt<1>("h0"), cal) @[FMS.scala 15:18]
    node _T = eq(UInt<3>("h0"), state) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_done_learning, UInt<3>("h4"), UInt<3>("h1")) @[FMS.scala 20:36]
    node _GEN_1 = mux(io_iterate, UInt<3>("h0"), _GEN_0) @[FMS.scala 18:24]
    node _T_1 = eq(UInt<3>("h1"), state) @[Conditional.scala 37:30]
    node _GEN_2 = mux(io_move_to_checking_reward, UInt<3>("h2"), state) @[FMS.scala 27:40]
    node _GEN_3 = mux(io_move_to_checking_reward, UInt<1>("h1"), cal) @[FMS.scala 27:40]
    node _T_2 = eq(UInt<3>("h2"), state) @[Conditional.scala 37:30]
    node _T_3 = eq(cal, UInt<1>("h1")) @[FMS.scala 34:16]
    node _GEN_4 = mux(_T_3, UInt<1>("h0"), cal) @[FMS.scala 34:28]
    node _T_4 = eq(UInt<3>("h3"), state) @[Conditional.scala 37:30]
    node _T_5 = eq(wrEna, UInt<1>("h1")) @[FMS.scala 40:20]
    node _GEN_5 = mux(_T_5, UInt<1>("h0"), wrEna) @[FMS.scala 40:32]
    node _T_6 = eq(UInt<3>("h4"), state) @[Conditional.scala 37:30]
    node _GEN_6 = mux(_T_4, _GEN_5, wrEna) @[Conditional.scala 39:67]
    node _GEN_7 = mux(_T_2, UInt<3>("h3"), state) @[Conditional.scala 39:67]
    node _GEN_8 = mux(_T_2, _GEN_4, cal) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_2, UInt<1>("h1"), _GEN_6) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_1, _GEN_2, _GEN_7) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T_1, _GEN_3, _GEN_8) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T_1, wrEna, _GEN_9) @[Conditional.scala 39:67]
    node _GEN_13 = mux(_T, _GEN_1, _GEN_10) @[Conditional.scala 40:58]
    node _GEN_14 = mux(_T, cal, _GEN_11) @[Conditional.scala 40:58]
    node _GEN_15 = mux(_T, wrEna, _GEN_12) @[Conditional.scala 40:58]
    io_wrEna <= wrEna @[FMS.scala 49:11]
    io_cal <= cal @[FMS.scala 45:14 FMS.scala 48:10]
    state <= mux(reset, UInt<3>("h0"), _GEN_13) @[FMS.scala 19:15 FMS.scala 21:15 FMS.scala 23:15 FMS.scala 28:15 FMS.scala 33:13]
    wrEna <= mux(reset, UInt<1>("h0"), _GEN_15) @[FMS.scala 37:12 FMS.scala 41:17]
    cal <= mux(reset, UInt<1>("h0"), _GEN_14) @[FMS.scala 29:13 FMS.scala 35:13]
