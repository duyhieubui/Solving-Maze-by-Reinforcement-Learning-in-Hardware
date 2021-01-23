circuit AgentsBrain :
  module AgentsBrain :
    input clock : Clock
    input reset : UInt<1>
    input io_iterate : UInt<1>
    input io_done_learning : UInt<1>
    input io_move_to_confirming_Reward : UInt<1>
    output io_Path_found : UInt<1>
    output io_cal : UInt<1>
    output io_load_new_state : UInt<1>
    output io_reset_Action : UInt<1>
  
    reg state_Reg : UInt<3>, clock with :
      reset => (UInt<1>("h0"), state_Reg) @[AgentsBrain.scala 16:24]
    node _T = eq(UInt<3>("h0"), state_Reg) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_done_learning, UInt<3>("h4"), UInt<3>("h1")) @[AgentsBrain.scala 26:36]
    node _GEN_1 = mux(io_iterate, UInt<3>("h0"), _GEN_0) @[AgentsBrain.scala 24:23]
    node _T_1 = eq(UInt<3>("h1"), state_Reg) @[Conditional.scala 37:30]
    node _GEN_2 = mux(io_move_to_confirming_Reward, UInt<3>("h2"), state_Reg) @[AgentsBrain.scala 34:42]
    node _T_2 = eq(UInt<3>("h2"), state_Reg) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<3>("h3"), state_Reg) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<3>("h4"), state_Reg) @[Conditional.scala 37:30]
    node _GEN_3 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_4 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_5 = mux(_T_3, UInt<3>("h0"), state_Reg) @[Conditional.scala 39:67]
    node _GEN_6 = mux(_T_3, UInt<1>("h0"), _GEN_3) @[Conditional.scala 39:67]
    node _GEN_7 = mux(_T_2, UInt<3>("h3"), _GEN_5) @[Conditional.scala 39:67]
    node _GEN_8 = mux(_T_2, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_2, UInt<1>("h0"), _GEN_6) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T_1, _GEN_2, _GEN_7) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T_1, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67]
    node _GEN_13 = mux(_T_1, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67]
    node _GEN_14 = mux(_T, _GEN_1, _GEN_11) @[Conditional.scala 40:58]
    node _GEN_15 = mux(_T, UInt<1>("h0"), _GEN_10) @[Conditional.scala 40:58]
    node _GEN_16 = mux(_T, UInt<1>("h0"), _GEN_12) @[Conditional.scala 40:58]
    node _GEN_17 = mux(_T, UInt<1>("h0"), _GEN_13) @[Conditional.scala 40:58]
    io_Path_found <= _GEN_17 @[AgentsBrain.scala 20:17 AgentsBrain.scala 48:20]
    io_cal <= _GEN_16 @[AgentsBrain.scala 21:9 AgentsBrain.scala 43:13]
    io_load_new_state <= _GEN_16 @[AgentsBrain.scala 17:20 AgentsBrain.scala 45:24]
    io_reset_Action <= _GEN_15 @[AgentsBrain.scala 19:18 AgentsBrain.scala 33:22]
    state_Reg <= mux(reset, UInt<3>("h0"), _GEN_14) @[AgentsBrain.scala 25:19 AgentsBrain.scala 27:19 AgentsBrain.scala 29:19 AgentsBrain.scala 35:19 AgentsBrain.scala 39:17 AgentsBrain.scala 44:16]
