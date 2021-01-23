circuit takingAction :
  module Action_FMS :
    input clock : Clock
    input reset : UInt<1>
    input io_reset_Action_fms : UInt<1>
    input io_exploit : UInt<1>
    input io_validAction : UInt<1>
    output io_move_to_confirming_Reward : UInt<1>
    output io_keep_x_y : UInt<1>
  
    reg action_FMS : UInt<3>, clock with :
      reset => (UInt<1>("h0"), action_FMS) @[Action and ActionFMS.scala 15:27]
    node _T = eq(UInt<3>("h0"), action_FMS) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_exploit, UInt<3>("h1"), UInt<3>("h2")) @[Action and ActionFMS.scala 23:25]
    node _T_1 = eq(UInt<3>("h1"), action_FMS) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<3>("h2"), action_FMS) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<3>("h3"), action_FMS) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<3>("h4"), action_FMS) @[Conditional.scala 37:30]
    node _GEN_1 = mux(io_validAction, UInt<1>("h1"), UInt<1>("h0")) @[Action and ActionFMS.scala 40:29]
    node _GEN_2 = mux(io_validAction, UInt<3>("h4"), UInt<3>("h0")) @[Action and ActionFMS.scala 40:29]
    node _GEN_3 = mux(_T_4, _GEN_1, UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_4 = mux(_T_4, _GEN_2, action_FMS) @[Conditional.scala 39:67]
    node _GEN_5 = mux(_T_3, UInt<3>("h4"), _GEN_4) @[Conditional.scala 39:67]
    node _GEN_6 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_7 = mux(_T_3, UInt<1>("h0"), _GEN_3) @[Conditional.scala 39:67]
    node _GEN_8 = mux(_T_2, UInt<3>("h3"), _GEN_5) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_2, UInt<1>("h0"), _GEN_6) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_2, UInt<1>("h0"), _GEN_7) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T_1, UInt<3>("h3"), _GEN_8) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T_1, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67]
    node _GEN_13 = mux(_T_1, UInt<1>("h0"), _GEN_10) @[Conditional.scala 39:67]
    node _GEN_14 = mux(_T, _GEN_0, _GEN_11) @[Conditional.scala 40:58]
    node _GEN_15 = mux(_T, UInt<1>("h0"), _GEN_12) @[Conditional.scala 40:58]
    node _GEN_16 = mux(_T, UInt<1>("h0"), _GEN_13) @[Conditional.scala 40:58]
    node _GEN_17 = mux(io_reset_Action_fms, UInt<3>("h0"), _GEN_14) @[Action and ActionFMS.scala 18:29]
    node _GEN_18 = mux(io_reset_Action_fms, UInt<1>("h0"), _GEN_15) @[Action and ActionFMS.scala 18:29]
    node _GEN_19 = mux(io_reset_Action_fms, UInt<1>("h0"), _GEN_16) @[Action and ActionFMS.scala 18:29]
    io_move_to_confirming_Reward <= _GEN_19 @[Action and ActionFMS.scala 16:32 Action and ActionFMS.scala 41:40]
    io_keep_x_y <= _GEN_18 @[Action and ActionFMS.scala 17:14 Action and ActionFMS.scala 37:20]
    action_FMS <= mux(reset, UInt<3>("h0"), _GEN_17) @[Action and ActionFMS.scala 19:16 Action and ActionFMS.scala 24:22 Action and ActionFMS.scala 26:22 Action and ActionFMS.scala 30:20 Action and ActionFMS.scala 33:20 Action and ActionFMS.scala 36:20 Action and ActionFMS.scala 42:22 Action and ActionFMS.scala 44:22]

  module Action :
    input clock : Clock
    input reset : UInt<1>
    input io_x : UInt<3>
    input io_y : UInt<3>
    input io_rand2 : UInt<10>
    output io_new_state : UInt<6>
    output io_act : UInt<2>
    input io_action_at_Qmax : UInt<2>
    input io_exploit : UInt<1>
    output io_validAction : UInt<1>
    input io_keep_x_y : UInt<1>
  
    reg act : UInt<2>, clock with :
      reset => (UInt<1>("h0"), act) @[Action and ActionFMS.scala 62:20]
    reg x_new : UInt<3>, clock with :
      reset => (UInt<1>("h0"), x_new) @[Action and ActionFMS.scala 63:22]
    reg y_new : UInt<3>, clock with :
      reset => (UInt<1>("h0"), y_new) @[Action and ActionFMS.scala 64:22]
    reg new_state : UInt<6>, clock with :
      reset => (UInt<1>("h0"), new_state) @[Action and ActionFMS.scala 65:24]
    reg action_at_Qmax : UInt<2>, clock with :
      reset => (UInt<1>("h0"), action_at_Qmax) @[Action and ActionFMS.scala 66:29]
    node _T = leq(io_rand2, UInt<8>("hfa")) @[Action and ActionFMS.scala 72:19]
    node _T_1 = lt(UInt<8>("hfa"), io_rand2) @[Action and ActionFMS.scala 74:23]
    node _T_2 = leq(io_rand2, UInt<9>("h1f4")) @[Action and ActionFMS.scala 74:48]
    node _T_3 = eq(_T_2, UInt<1>("h1")) @[Action and ActionFMS.scala 74:58]
    node _T_4 = and(_T_1, _T_3) @[Action and ActionFMS.scala 74:35]
    node _T_5 = lt(UInt<9>("h1f4"), io_rand2) @[Action and ActionFMS.scala 76:23]
    node _T_6 = leq(io_rand2, UInt<10>("h2ee")) @[Action and ActionFMS.scala 76:48]
    node _T_7 = eq(_T_6, UInt<1>("h1")) @[Action and ActionFMS.scala 76:58]
    node _T_8 = and(_T_5, _T_7) @[Action and ActionFMS.scala 76:35]
    node _GEN_0 = mux(_T_8, UInt<2>("h2"), UInt<2>("h3")) @[Action and ActionFMS.scala 76:70]
    node _GEN_1 = mux(_T_4, UInt<1>("h1"), _GEN_0) @[Action and ActionFMS.scala 74:70]
    node _GEN_2 = mux(_T, UInt<1>("h0"), _GEN_1) @[Action and ActionFMS.scala 72:29]
    node _GEN_3 = mux(io_exploit, action_at_Qmax, _GEN_2) @[Action and ActionFMS.scala 69:19]
    node _T_9 = eq(act, UInt<1>("h0")) @[Action and ActionFMS.scala 83:14]
    node _T_10 = add(io_y, UInt<1>("h1")) @[Action and ActionFMS.scala 84:21]
    node _T_11 = tail(_T_10, 1) @[Action and ActionFMS.scala 84:21]
    node _T_12 = eq(act, UInt<1>("h1")) @[Action and ActionFMS.scala 86:20]
    node _T_13 = sub(io_x, UInt<1>("h1")) @[Action and ActionFMS.scala 87:21]
    node _T_14 = tail(_T_13, 1) @[Action and ActionFMS.scala 87:21]
    node _T_15 = eq(act, UInt<2>("h2")) @[Action and ActionFMS.scala 89:20]
    node _T_16 = sub(io_y, UInt<1>("h1")) @[Action and ActionFMS.scala 90:21]
    node _T_17 = tail(_T_16, 1) @[Action and ActionFMS.scala 90:21]
    node _T_18 = add(io_x, UInt<1>("h1")) @[Action and ActionFMS.scala 93:21]
    node _T_19 = tail(_T_18, 1) @[Action and ActionFMS.scala 93:21]
    node _GEN_4 = mux(_T_15, _T_17, io_y) @[Action and ActionFMS.scala 89:29]
    node _GEN_5 = mux(_T_15, io_x, _T_19) @[Action and ActionFMS.scala 89:29]
    node _GEN_6 = mux(_T_12, _T_14, _GEN_5) @[Action and ActionFMS.scala 86:29]
    node _GEN_7 = mux(_T_12, io_y, _GEN_4) @[Action and ActionFMS.scala 86:29]
    node _GEN_8 = mux(_T_9, _T_11, _GEN_7) @[Action and ActionFMS.scala 83:23]
    node _GEN_9 = mux(_T_9, io_x, _GEN_6) @[Action and ActionFMS.scala 83:23]
    node _GEN_10 = mux(io_keep_x_y, _GEN_8, y_new) @[Action and ActionFMS.scala 82:20]
    node _GEN_11 = mux(io_keep_x_y, _GEN_9, x_new) @[Action and ActionFMS.scala 82:20]
    node _T_20 = eq(x_new, UInt<3>("h7")) @[Action and ActionFMS.scala 97:14]
    node _T_21 = eq(x_new, UInt<3>("h5")) @[Action and ActionFMS.scala 97:31]
    node _T_22 = or(_T_20, _T_21) @[Action and ActionFMS.scala 97:22]
    node _T_23 = eq(y_new, UInt<3>("h7")) @[Action and ActionFMS.scala 97:48]
    node _T_24 = or(_T_22, _T_23) @[Action and ActionFMS.scala 97:39]
    node _T_25 = eq(y_new, UInt<3>("h5")) @[Action and ActionFMS.scala 97:65]
    node _T_26 = or(_T_24, _T_25) @[Action and ActionFMS.scala 97:56]
    node _T_27 = mul(UInt<3>("h5"), y_new) @[Action and ActionFMS.scala 100:25]
    node _T_28 = add(x_new, _T_27) @[Action and ActionFMS.scala 100:21]
    node _T_29 = tail(_T_28, 1) @[Action and ActionFMS.scala 100:21]
    node _GEN_12 = mux(_T_26, UInt<1>("h0"), UInt<1>("h1")) @[Action and ActionFMS.scala 97:73]
    node _GEN_13 = mux(_T_26, new_state, _T_29) @[Action and ActionFMS.scala 97:73]
    io_new_state <= new_state @[Action and ActionFMS.scala 104:15]
    io_act <= act @[Action and ActionFMS.scala 103:9]
    io_validAction <= _GEN_12 @[Action and ActionFMS.scala 98:19 Action and ActionFMS.scala 101:19]
    act <= mux(reset, UInt<2>("h0"), _GEN_3) @[Action and ActionFMS.scala 70:8 Action and ActionFMS.scala 73:11 Action and ActionFMS.scala 75:11 Action and ActionFMS.scala 77:11 Action and ActionFMS.scala 79:11]
    x_new <= mux(reset, UInt<3>("h0"), _GEN_11) @[Action and ActionFMS.scala 85:13 Action and ActionFMS.scala 87:13 Action and ActionFMS.scala 91:13 Action and ActionFMS.scala 93:13]
    y_new <= mux(reset, UInt<3>("h0"), _GEN_10) @[Action and ActionFMS.scala 84:13 Action and ActionFMS.scala 88:13 Action and ActionFMS.scala 90:13 Action and ActionFMS.scala 94:13]
    new_state <= mux(reset, UInt<6>("h0"), _GEN_13) @[Action and ActionFMS.scala 100:14]
    action_at_Qmax <= mux(reset, UInt<2>("h0"), io_action_at_Qmax) @[Action and ActionFMS.scala 68:17]

  module takingAction :
    input clock : Clock
    input reset : UInt<1>
    input io_x : UInt<3>
    input io_y : UInt<3>
    input io_rand1 : UInt<10>
    input io_rand2 : UInt<10>
    input io_episode : UInt<9>
    output io_new_state : UInt<6>
    input io_action_at_Qmax : UInt<2>
    output io_act : UInt<2>
    input io_reset_Action_fms : UInt<1>
    output io_move_to_confirming_Reward : UInt<1>
  
    inst action_fms of Action_FMS @[taking_Action.scala 16:24]
    inst action of Action @[taking_Action.scala 17:20]
    reg epsilon : UInt<10>, clock with :
      reset => (UInt<1>("h0"), epsilon) @[taking_Action.scala 18:24]
    node _T = mul(io_episode, UInt<4>("ha")) @[taking_Action.scala 19:34]
    node _T_1 = div(_T, UInt<2>("h3")) @[taking_Action.scala 19:41]
    node _T_2 = sub(UInt<10>("h3e8"), _T_1) @[taking_Action.scala 19:21]
    node _T_3 = tail(_T_2, 1) @[taking_Action.scala 19:21]
    node exploit = leq(epsilon, io_rand1) @[taking_Action.scala 20:23]
    io_new_state <= action.io_new_state @[taking_Action.scala 35:15]
    io_act <= action.io_act @[taking_Action.scala 34:9]
    io_move_to_confirming_Reward <= action_fms.io_move_to_confirming_Reward @[taking_Action.scala 36:31]
    action_fms.clock <= clock
    action_fms.reset <= reset
    action_fms.io_reset_Action_fms <= io_reset_Action_fms @[taking_Action.scala 22:33]
    action_fms.io_exploit <= exploit @[taking_Action.scala 23:24]
    action_fms.io_validAction <= action.io_validAction @[taking_Action.scala 24:28]
    action.clock <= clock
    action.reset <= reset
    action.io_x <= io_x @[taking_Action.scala 30:14]
    action.io_y <= io_y @[taking_Action.scala 31:14]
    action.io_rand2 <= io_rand2 @[taking_Action.scala 29:18]
    action.io_action_at_Qmax <= io_action_at_Qmax @[taking_Action.scala 32:27]
    action.io_exploit <= exploit @[taking_Action.scala 28:20]
    action.io_keep_x_y <= action_fms.io_keep_x_y @[taking_Action.scala 25:25]
    epsilon <= mux(reset, UInt<10>("h0"), bits(_T_3, 9, 0)) @[taking_Action.scala 19:11]
