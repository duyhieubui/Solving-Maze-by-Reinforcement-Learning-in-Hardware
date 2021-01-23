circuit Action_FMS :
  module Action_FMS :
    input clock : Clock
    input reset : UInt<1>
    input io_reset_Action : UInt<1>
    input io_exploit : UInt<1>
    input io_validAction : UInt<1>
    output io_move_to_confirming_Reward : UInt<1>
  
    reg action_FMS : UInt<3>, clock with :
      reset => (UInt<1>("h0"), action_FMS) @[ActionFMS.scala 11:25]
    node _GEN_0 = mux(io_reset_Action, UInt<3>("h0"), action_FMS) @[ActionFMS.scala 13:24]
    node _T = eq(UInt<3>("h0"), action_FMS) @[Conditional.scala 37:30]
    node _GEN_1 = mux(io_exploit, UInt<3>("h1"), UInt<3>("h2")) @[ActionFMS.scala 18:23]
    node _T_1 = eq(UInt<3>("h1"), action_FMS) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<3>("h2"), action_FMS) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<3>("h3"), action_FMS) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<3>("h4"), action_FMS) @[Conditional.scala 37:30]
    node _GEN_2 = mux(io_validAction, UInt<1>("h1"), UInt<1>("h0")) @[ActionFMS.scala 34:27]
    node _GEN_3 = mux(io_validAction, _GEN_0, UInt<3>("h0")) @[ActionFMS.scala 34:27]
    node _GEN_4 = mux(_T_4, _GEN_2, UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_5 = mux(_T_4, _GEN_3, _GEN_0) @[Conditional.scala 39:67]
    node _GEN_6 = mux(_T_3, UInt<3>("h4"), _GEN_5) @[Conditional.scala 39:67]
    node _GEN_7 = mux(_T_3, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67]
    node _GEN_8 = mux(_T_2, UInt<3>("h3"), _GEN_6) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_2, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_1, UInt<3>("h3"), _GEN_8) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T_1, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T, _GEN_1, _GEN_10) @[Conditional.scala 40:58]
    node _GEN_13 = mux(_T, UInt<1>("h0"), _GEN_11) @[Conditional.scala 40:58]
    io_move_to_confirming_Reward <= _GEN_13 @[ActionFMS.scala 12:31 ActionFMS.scala 35:37]
    action_FMS <= mux(reset, UInt<3>("h0"), _GEN_12) @[ActionFMS.scala 14:15 ActionFMS.scala 19:19 ActionFMS.scala 21:19 ActionFMS.scala 25:17 ActionFMS.scala 28:17 ActionFMS.scala 31:17 ActionFMS.scala 37:19]
