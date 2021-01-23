circuit sloving_maze_by_RL :
  module Agent :
    input clock : Clock
    input reset : UInt<1>
    input io_ROW : UInt<3>
    input io_COL : UInt<3>
    input io_new_state : UInt<6>
    output io_iterate : UInt<1>
    output io_x : UInt<3>
    output io_y : UInt<3>
    output io_state : UInt<6>
    output io_episode : UInt<9>
    output io_done_learning : UInt<1>
    input io_load_new_state : UInt<1>
    output io_step : UInt<4>
    output io_t : UInt<1>
  
    reg ROW : UInt<3>, clock with :
      reset => (UInt<1>("h0"), ROW) @[Blocks.scala 18:18]
    reg COL : UInt<3>, clock with :
      reset => (UInt<1>("h0"), COL) @[Blocks.scala 19:18]
    reg state : UInt<6>, clock with :
      reset => (UInt<1>("h0"), state) @[Blocks.scala 20:20]
    reg episode : UInt<9>, clock with :
      reset => (UInt<1>("h0"), episode) @[Blocks.scala 21:22]
    node start_again = eq(state, UInt<5>("h18")) @[Blocks.scala 22:24]
    reg step : UInt<4>, clock with :
      reset => (UInt<1>("h0"), step) @[Blocks.scala 23:21]
    node t = eq(step, UInt<4>("hf")) @[Blocks.scala 28:14]
    node iterate = or(start_again, t) @[Blocks.scala 29:26]
    node _T = eq(iterate, UInt<1>("h1")) @[Blocks.scala 32:15]
    node _T_1 = add(episode, UInt<1>("h1")) @[Blocks.scala 34:21]
    node _T_2 = tail(_T_1, 1) @[Blocks.scala 34:21]
    node _T_3 = eq(step, UInt<4>("hf")) @[Blocks.scala 35:14]
    node _GEN_0 = mux(_T_3, UInt<1>("h0"), step) @[Blocks.scala 35:22]
    node _T_4 = add(step, UInt<1>("h1")) @[Blocks.scala 42:17]
    node _T_5 = tail(_T_4, 1) @[Blocks.scala 42:17]
    node _T_6 = eq(step, UInt<4>("hf")) @[Blocks.scala 43:16]
    node _GEN_1 = mux(_T_6, UInt<1>("h0"), _T_5) @[Blocks.scala 43:24]
    node _GEN_2 = mux(io_load_new_state, io_new_state, state) @[Blocks.scala 39:28]
    node _GEN_3 = mux(io_load_new_state, _GEN_1, step) @[Blocks.scala 39:28]
    node _GEN_4 = mux(_T, UInt<1>("h0"), _GEN_2) @[Blocks.scala 32:25]
    node _GEN_5 = mux(_T, _T_2, episode) @[Blocks.scala 32:25]
    node _GEN_6 = mux(_T, _GEN_0, _GEN_3) @[Blocks.scala 32:25]
    node _T_7 = eq(episode, UInt<9>("h12c")) @[Blocks.scala 49:15]
    node _GEN_7 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Blocks.scala 49:24]
    node _T_8 = rem(state, COL) @[Blocks.scala 55:14]
    node _T_9 = div(state, COL) @[Blocks.scala 56:14]
    io_iterate <= iterate @[Blocks.scala 30:13]
    io_x <= _T_8 @[Blocks.scala 55:7]
    io_y <= bits(_T_9, 2, 0) @[Blocks.scala 56:7]
    io_state <= state @[Blocks.scala 57:11]
    io_episode <= episode @[Blocks.scala 58:13]
    io_done_learning <= _GEN_7 @[Blocks.scala 41:24 Blocks.scala 50:21 Blocks.scala 52:21]
    io_step <= step @[Blocks.scala 59:10]
    io_t <= t @[Blocks.scala 31:7]
    ROW <= mux(reset, UInt<3>("h0"), io_ROW) @[Blocks.scala 26:6]
    COL <= mux(reset, UInt<3>("h0"), io_COL) @[Blocks.scala 27:6]
    state <= mux(reset, UInt<6>("h0"), _GEN_4) @[Blocks.scala 33:10 Blocks.scala 40:13]
    episode <= mux(reset, UInt<9>("h0"), _GEN_5) @[Blocks.scala 34:12]
    step <= mux(reset, UInt<4>("h0"), _GEN_6) @[Blocks.scala 36:11 Blocks.scala 42:11 Blocks.scala 44:13]

  module Action_FMS :
    input clock : Clock
    input reset : UInt<1>
    input io_reset_Action_fms : UInt<1>
    input io_exploit : UInt<1>
    input io_validAction : UInt<1>
    output io_move_to_confirming_Reward : UInt<1>
    output io_keep_action : UInt<1>
  
    reg action_FMS : UInt<3>, clock with :
      reset => (UInt<1>("h0"), action_FMS) @[Action and ActionFMS.scala 15:27]
    node _T = eq(UInt<3>("h0"), action_FMS) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_exploit, UInt<3>("h1"), UInt<3>("h2")) @[Action and ActionFMS.scala 24:25]
    node _T_1 = eq(UInt<3>("h1"), action_FMS) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<3>("h2"), action_FMS) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<3>("h3"), action_FMS) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<3>("h4"), action_FMS) @[Conditional.scala 37:30]
    node _GEN_1 = mux(io_validAction, UInt<1>("h1"), UInt<1>("h0")) @[Action and ActionFMS.scala 40:29]
    node _GEN_2 = mux(io_validAction, UInt<3>("h4"), UInt<3>("h0")) @[Action and ActionFMS.scala 40:29]
    node _GEN_3 = mux(_T_4, _GEN_1, UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_4 = mux(_T_4, _GEN_2, action_FMS) @[Conditional.scala 39:67]
    node _GEN_5 = mux(_T_3, UInt<3>("h4"), _GEN_4) @[Conditional.scala 39:67]
    node _GEN_6 = mux(_T_3, UInt<1>("h0"), _GEN_3) @[Conditional.scala 39:67]
    node _GEN_7 = mux(_T_2, UInt<3>("h3"), _GEN_5) @[Conditional.scala 39:67]
    node _GEN_8 = mux(_T_2, UInt<1>("h0"), _GEN_6) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_1, UInt<3>("h3"), _GEN_7) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_1, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T, UInt<1>("h0"), UInt<1>("h1")) @[Conditional.scala 40:58]
    node _GEN_12 = mux(_T, _GEN_0, _GEN_9) @[Conditional.scala 40:58]
    node _GEN_13 = mux(_T, UInt<1>("h0"), _GEN_10) @[Conditional.scala 40:58]
    node _GEN_14 = mux(io_reset_Action_fms, UInt<3>("h0"), _GEN_12) @[Action and ActionFMS.scala 18:29]
    node _GEN_15 = mux(io_reset_Action_fms, UInt<1>("h1"), _GEN_11) @[Action and ActionFMS.scala 18:29]
    node _GEN_16 = mux(io_reset_Action_fms, UInt<1>("h0"), _GEN_13) @[Action and ActionFMS.scala 18:29]
    io_move_to_confirming_Reward <= _GEN_16 @[Action and ActionFMS.scala 16:32 Action and ActionFMS.scala 41:40]
    io_keep_action <= _GEN_15 @[Action and ActionFMS.scala 17:17 Action and ActionFMS.scala 23:23]
    action_FMS <= mux(reset, UInt<3>("h0"), _GEN_14) @[Action and ActionFMS.scala 19:16 Action and ActionFMS.scala 25:22 Action and ActionFMS.scala 27:22 Action and ActionFMS.scala 31:20 Action and ActionFMS.scala 34:20 Action and ActionFMS.scala 37:20 Action and ActionFMS.scala 42:22 Action and ActionFMS.scala 44:22]

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
    input io_keep_action : UInt<1>
  
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
    node _T = eq(io_keep_action, UInt<1>("h0")) @[Action and ActionFMS.scala 69:22]
    node _T_1 = leq(io_rand2, UInt<8>("hfa")) @[Action and ActionFMS.scala 73:21]
    node _T_2 = lt(UInt<8>("hfa"), io_rand2) @[Action and ActionFMS.scala 75:25]
    node _T_3 = leq(io_rand2, UInt<9>("h1f4")) @[Action and ActionFMS.scala 75:50]
    node _T_4 = eq(_T_3, UInt<1>("h1")) @[Action and ActionFMS.scala 75:60]
    node _T_5 = and(_T_2, _T_4) @[Action and ActionFMS.scala 75:37]
    node _T_6 = lt(UInt<9>("h1f4"), io_rand2) @[Action and ActionFMS.scala 77:25]
    node _T_7 = leq(io_rand2, UInt<10>("h2ee")) @[Action and ActionFMS.scala 77:50]
    node _T_8 = eq(_T_7, UInt<1>("h1")) @[Action and ActionFMS.scala 77:60]
    node _T_9 = and(_T_6, _T_8) @[Action and ActionFMS.scala 77:37]
    node _GEN_0 = mux(_T_9, UInt<2>("h2"), UInt<2>("h3")) @[Action and ActionFMS.scala 77:72]
    node _GEN_1 = mux(_T_5, UInt<1>("h1"), _GEN_0) @[Action and ActionFMS.scala 75:72]
    node _GEN_2 = mux(_T_1, UInt<1>("h0"), _GEN_1) @[Action and ActionFMS.scala 73:31]
    node _GEN_3 = mux(io_exploit, action_at_Qmax, _GEN_2) @[Action and ActionFMS.scala 70:21]
    node _GEN_4 = mux(_T, _GEN_3, act) @[Action and ActionFMS.scala 69:33]
    node _T_10 = eq(act, UInt<1>("h0")) @[Action and ActionFMS.scala 85:12]
    node _T_11 = add(io_y, UInt<1>("h1")) @[Action and ActionFMS.scala 86:19]
    node _T_12 = tail(_T_11, 1) @[Action and ActionFMS.scala 86:19]
    node _T_13 = eq(act, UInt<1>("h1")) @[Action and ActionFMS.scala 88:18]
    node _T_14 = sub(io_x, UInt<1>("h1")) @[Action and ActionFMS.scala 89:19]
    node _T_15 = tail(_T_14, 1) @[Action and ActionFMS.scala 89:19]
    node _T_16 = eq(act, UInt<2>("h2")) @[Action and ActionFMS.scala 91:18]
    node _T_17 = sub(io_y, UInt<1>("h1")) @[Action and ActionFMS.scala 92:19]
    node _T_18 = tail(_T_17, 1) @[Action and ActionFMS.scala 92:19]
    node _T_19 = add(io_x, UInt<1>("h1")) @[Action and ActionFMS.scala 95:19]
    node _T_20 = tail(_T_19, 1) @[Action and ActionFMS.scala 95:19]
    node _GEN_5 = mux(_T_16, _T_18, io_y) @[Action and ActionFMS.scala 91:27]
    node _GEN_6 = mux(_T_16, io_x, _T_20) @[Action and ActionFMS.scala 91:27]
    node _GEN_7 = mux(_T_13, _T_15, _GEN_6) @[Action and ActionFMS.scala 88:27]
    node _GEN_8 = mux(_T_13, io_y, _GEN_5) @[Action and ActionFMS.scala 88:27]
    node _GEN_9 = mux(_T_10, _T_12, _GEN_8) @[Action and ActionFMS.scala 85:21]
    node _GEN_10 = mux(_T_10, io_x, _GEN_7) @[Action and ActionFMS.scala 85:21]
    node _T_21 = eq(x_new, UInt<3>("h7")) @[Action and ActionFMS.scala 98:14]
    node _T_22 = eq(x_new, UInt<3>("h5")) @[Action and ActionFMS.scala 98:31]
    node _T_23 = or(_T_21, _T_22) @[Action and ActionFMS.scala 98:22]
    node _T_24 = eq(y_new, UInt<3>("h7")) @[Action and ActionFMS.scala 98:48]
    node _T_25 = or(_T_23, _T_24) @[Action and ActionFMS.scala 98:39]
    node _T_26 = eq(y_new, UInt<3>("h5")) @[Action and ActionFMS.scala 98:65]
    node _T_27 = or(_T_25, _T_26) @[Action and ActionFMS.scala 98:56]
    node _T_28 = mul(UInt<3>("h5"), y_new) @[Action and ActionFMS.scala 101:25]
    node _T_29 = add(x_new, _T_28) @[Action and ActionFMS.scala 101:21]
    node _T_30 = tail(_T_29, 1) @[Action and ActionFMS.scala 101:21]
    node _GEN_11 = mux(_T_27, UInt<1>("h0"), UInt<1>("h1")) @[Action and ActionFMS.scala 98:73]
    node _GEN_12 = mux(_T_27, new_state, _T_30) @[Action and ActionFMS.scala 98:73]
    io_new_state <= new_state @[Action and ActionFMS.scala 105:15]
    io_act <= act @[Action and ActionFMS.scala 104:9]
    io_validAction <= _GEN_11 @[Action and ActionFMS.scala 99:19 Action and ActionFMS.scala 102:19]
    act <= mux(reset, UInt<2>("h0"), _GEN_4) @[Action and ActionFMS.scala 71:11 Action and ActionFMS.scala 74:13 Action and ActionFMS.scala 76:13 Action and ActionFMS.scala 78:13 Action and ActionFMS.scala 80:13]
    x_new <= mux(reset, UInt<3>("h0"), _GEN_10) @[Action and ActionFMS.scala 87:11 Action and ActionFMS.scala 89:11 Action and ActionFMS.scala 93:11 Action and ActionFMS.scala 95:11]
    y_new <= mux(reset, UInt<3>("h0"), _GEN_9) @[Action and ActionFMS.scala 86:11 Action and ActionFMS.scala 90:11 Action and ActionFMS.scala 92:11 Action and ActionFMS.scala 96:11]
    new_state <= mux(reset, UInt<6>("h0"), _GEN_12) @[Action and ActionFMS.scala 101:14]
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
    action.io_keep_action <= action_fms.io_keep_action @[taking_Action.scala 25:28]
    epsilon <= mux(reset, UInt<10>("h0"), bits(_T_3, 9, 0)) @[taking_Action.scala 19:11]

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
      reset => (UInt<1>("h0"), Q_s_a) @[Q_function.scala 13:20]
    reg reward : SInt<8>, clock with :
      reset => (UInt<1>("h0"), reward) @[Q_function.scala 14:21]
    node _T = div(Q_s_a, asSInt(UInt<3>("h2"))) @[Q_function.scala 19:25]
    node _T_1 = mul(asSInt(UInt<5>("h9")), io_Q_prime_max) @[Q_function.scala 19:45]
    node _T_2 = div(_T_1, asSInt(UInt<5>("ha"))) @[Q_function.scala 19:61]
    node _T_3 = add(reward, _T_2) @[Q_function.scala 19:40]
    node _T_4 = tail(_T_3, 1) @[Q_function.scala 19:40]
    node _T_5 = asSInt(_T_4) @[Q_function.scala 19:40]
    node _T_6 = div(_T_5, asSInt(UInt<3>("h2"))) @[Q_function.scala 19:69]
    node _T_7 = add(_T, _T_6) @[Q_function.scala 19:31]
    node _T_8 = tail(_T_7, 1) @[Q_function.scala 19:31]
    node _T_9 = asSInt(_T_8) @[Q_function.scala 19:31]
    node _GEN_0 = mux(io_cal, _T_9, asSInt(UInt<1>("h0"))) @[Q_function.scala 18:15]
    node _GEN_1 = mux(io_cal, UInt<1>("h1"), UInt<1>("h0")) @[Q_function.scala 18:15]
    io_Q_updated <= asSInt(bits(_GEN_0, 20, 0)) @[Q_function.scala 19:18 Q_function.scala 22:17]
    io_wrEna <= _GEN_1 @[Q_function.scala 20:13 Q_function.scala 23:13]
    Q_s_a <= mux(reset, asSInt(UInt<21>("h0")), io_Q_s_a) @[Q_function.scala 15:8]
    reward <= mux(reset, asSInt(UInt<8>("h0")), io_reward) @[Q_function.scala 17:9]

  module Max4 :
    input clock : Clock
    input reset : UInt<1>
    input io_ins0 : SInt<21>
    input io_ins1 : SInt<21>
    input io_ins2 : SInt<21>
    input io_ins3 : SInt<21>
    output io_Q_prime_max : SInt<21>
  
    node ins_0 = io_ins0 @[Q_table.scala 83:15 Q_table.scala 84:9]
    node ins_1 = io_ins1 @[Q_table.scala 83:15 Q_table.scala 85:9]
    node _T = gt(ins_0, ins_1) @[Q_table.scala 82:46]
    node _T_1 = mux(_T, ins_0, ins_1) @[Q_table.scala 82:43]
    node ins_2 = io_ins2 @[Q_table.scala 83:15 Q_table.scala 86:9]
    node _T_2 = gt(_T_1, ins_2) @[Q_table.scala 82:46]
    node _T_3 = mux(_T_2, _T_1, ins_2) @[Q_table.scala 82:43]
    node ins_3 = io_ins3 @[Q_table.scala 83:15 Q_table.scala 87:9]
    node _T_4 = gt(_T_3, ins_3) @[Q_table.scala 82:46]
    node _T_5 = mux(_T_4, _T_3, ins_3) @[Q_table.scala 82:43]
    io_Q_prime_max <= _T_5 @[Q_table.scala 88:17]

  module Action_at_Qmax :
    input clock : Clock
    input reset : UInt<1>
    input io_ins0 : SInt<21>
    input io_ins1 : SInt<21>
    input io_ins2 : SInt<21>
    input io_ins3 : SInt<21>
    output io_action_at_Qmax : UInt<2>
    input io_Q_max_at_state_s : SInt<21>
  
    node ins_0 = io_ins0 @[Q_table.scala 99:15 Q_table.scala 100:9]
    node _T = eq(ins_0, io_Q_max_at_state_s) @[Q_table.scala 104:42]
    node ins_1 = io_ins1 @[Q_table.scala 99:15 Q_table.scala 101:9]
    node _T_1 = eq(ins_1, io_Q_max_at_state_s) @[Q_table.scala 104:42]
    node ins_2 = io_ins2 @[Q_table.scala 99:15 Q_table.scala 102:9]
    node _T_2 = eq(ins_2, io_Q_max_at_state_s) @[Q_table.scala 104:42]
    node ins_3 = io_ins3 @[Q_table.scala 99:15 Q_table.scala 103:9]
    node _T_3 = eq(ins_3, io_Q_max_at_state_s) @[Q_table.scala 104:42]
    node _T_4 = mux(_T_2, UInt<2>("h2"), UInt<2>("h3")) @[Q_table.scala 104:36]
    node _T_5 = mux(_T_1, UInt<1>("h1"), _T_4) @[Q_table.scala 104:36]
    node _T_6 = mux(_T, UInt<1>("h0"), _T_5) @[Q_table.scala 104:36]
    io_action_at_Qmax <= _T_6 @[Q_table.scala 104:20]

  module Qtable :
    input clock : Clock
    input reset : UInt<1>
    input io_state : UInt<6>
    input io_new_state : UInt<6>
    input io_act : UInt<2>
    input io_wrEna : UInt<1>
    input io_Q_updated : SInt<21>
    output io_Q_s_a : SInt<21>
    output io_Q_prime_max : SInt<21>
    output io_action_at_Qmax : UInt<2>
  
    inst max4 of Max4 @[Q_table.scala 15:18]
    inst max41 of Max4 @[Q_table.scala 16:19]
    inst index_of_Q_max of Action_at_Qmax @[Q_table.scala 17:28]
    mem Q_s_a0 : @[Q_table.scala 19:25]
      data-type => SInt<21>
      depth => 25
      read-latency => 1
      write-latency => 1
      reader => _T_4
      reader => _T_20
      reader => _T_28
      reader => _T_36
      reader => _T_38
      reader => _T_40
      reader => _T_42
      writer => _T_2
      writer => _T_16
      read-under-write => undefined
    mem Q_s_a1 : @[Q_table.scala 20:25]
      data-type => SInt<21>
      depth => 25
      read-latency => 1
      write-latency => 1
      reader => _T_9
      reader => _T_14
      reader => _T_22
      reader => _T_24
      reader => _T_30
      reader => _T_32
      writer => _T_7
      read-under-write => undefined
    mem Q_s_a2 : @[Q_table.scala 21:25]
      data-type => SInt<21>
      depth => 25
      read-latency => 1
      write-latency => 1
      writer => _T_12
      read-under-write => undefined
    mem Q_s_a3 : @[Q_table.scala 22:25]
      data-type => SInt<21>
      depth => 25
      read-latency => 1
      write-latency => 1
      reader => _T_18
      reader => _T_26
      reader => _T_34
      read-under-write => undefined
    reg state : UInt<6>, clock with :
      reset => (UInt<1>("h0"), state) @[Q_table.scala 23:20]
    node _T = eq(io_state, UInt<1>("h0")) @[Q_table.scala 27:16]
    node _T_1 = bits(state, 4, 0)
    node _T_3 = bits(io_state, 4, 0) @[Q_table.scala 31:28]
    node _GEN_0 = validif(io_wrEna, _T_1) @[Q_table.scala 28:20]
    node _GEN_1 = validif(io_wrEna, clock) @[Q_table.scala 28:20]
    node _GEN_2 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[Q_table.scala 28:20]
    node _GEN_3 = validif(io_wrEna, UInt<1>("h1")) @[Q_table.scala 28:20]
    node _GEN_4 = validif(io_wrEna, io_Q_updated) @[Q_table.scala 28:20]
    node _GEN_5 = mux(io_wrEna, UInt<1>("h0"), UInt<1>("h1")) @[Q_table.scala 28:20]
    node _GEN_6 = validif(eq(io_wrEna, UInt<1>("h0")), _T_3) @[Q_table.scala 28:20]
    node _GEN_7 = validif(eq(io_wrEna, UInt<1>("h0")), clock) @[Q_table.scala 28:20]
    node _GEN_8 = mux(io_wrEna, asSInt(UInt<1>("h0")), Q_s_a0._T_4.data) @[Q_table.scala 28:20]
    node _T_5 = eq(io_state, UInt<1>("h1")) @[Q_table.scala 33:22]
    node _T_6 = bits(state, 4, 0)
    node _T_8 = bits(io_state, 4, 0) @[Q_table.scala 37:28]
    node _GEN_9 = validif(io_wrEna, _T_6) @[Q_table.scala 34:20]
    node _GEN_10 = validif(eq(io_wrEna, UInt<1>("h0")), _T_8) @[Q_table.scala 34:20]
    node _GEN_11 = mux(io_wrEna, asSInt(UInt<1>("h0")), Q_s_a1._T_9.data) @[Q_table.scala 34:20]
    node _T_10 = eq(io_state, UInt<2>("h2")) @[Q_table.scala 39:22]
    node _T_11 = bits(state, 4, 0)
    node _T_13 = bits(io_state, 4, 0) @[Q_table.scala 43:28]
    node _GEN_12 = validif(io_wrEna, _T_11) @[Q_table.scala 40:20]
    node _GEN_13 = validif(eq(io_wrEna, UInt<1>("h0")), _T_13) @[Q_table.scala 40:20]
    node _GEN_14 = mux(io_wrEna, asSInt(UInt<1>("h0")), Q_s_a1._T_14.data) @[Q_table.scala 40:20]
    node _T_15 = bits(state, 4, 0)
    node _T_17 = bits(io_state, 4, 0) @[Q_table.scala 49:28]
    node _GEN_15 = validif(io_wrEna, _T_15) @[Q_table.scala 46:19]
    node _GEN_16 = validif(eq(io_wrEna, UInt<1>("h0")), _T_17) @[Q_table.scala 46:19]
    node _GEN_17 = mux(io_wrEna, asSInt(UInt<1>("h0")), Q_s_a3._T_18.data) @[Q_table.scala 46:19]
    node _GEN_18 = validif(_T_10, _GEN_12) @[Q_table.scala 39:29]
    node _GEN_19 = validif(_T_10, _GEN_1) @[Q_table.scala 39:29]
    node _GEN_20 = mux(_T_10, _GEN_2, UInt<1>("h0")) @[Q_table.scala 39:29]
    node _GEN_21 = validif(_T_10, _GEN_3) @[Q_table.scala 39:29]
    node _GEN_22 = validif(_T_10, _GEN_4) @[Q_table.scala 39:29]
    node _GEN_23 = mux(_T_10, _GEN_5, UInt<1>("h0")) @[Q_table.scala 39:29]
    node _GEN_24 = validif(_T_10, _GEN_13) @[Q_table.scala 39:29]
    node _GEN_25 = validif(_T_10, _GEN_7) @[Q_table.scala 39:29]
    node _GEN_26 = mux(_T_10, _GEN_14, _GEN_17) @[Q_table.scala 39:29]
    node _GEN_27 = validif(eq(_T_10, UInt<1>("h0")), _GEN_15) @[Q_table.scala 39:29]
    node _GEN_28 = validif(eq(_T_10, UInt<1>("h0")), _GEN_1) @[Q_table.scala 39:29]
    node _GEN_29 = mux(_T_10, UInt<1>("h0"), _GEN_2) @[Q_table.scala 39:29]
    node _GEN_30 = validif(eq(_T_10, UInt<1>("h0")), _GEN_3) @[Q_table.scala 39:29]
    node _GEN_31 = validif(eq(_T_10, UInt<1>("h0")), _GEN_4) @[Q_table.scala 39:29]
    node _GEN_32 = mux(_T_10, UInt<1>("h0"), _GEN_5) @[Q_table.scala 39:29]
    node _GEN_33 = validif(eq(_T_10, UInt<1>("h0")), _GEN_16) @[Q_table.scala 39:29]
    node _GEN_34 = validif(eq(_T_10, UInt<1>("h0")), _GEN_7) @[Q_table.scala 39:29]
    node _GEN_35 = validif(_T_5, _GEN_9) @[Q_table.scala 33:29]
    node _GEN_36 = validif(_T_5, _GEN_1) @[Q_table.scala 33:29]
    node _GEN_37 = mux(_T_5, _GEN_2, UInt<1>("h0")) @[Q_table.scala 33:29]
    node _GEN_38 = validif(_T_5, _GEN_3) @[Q_table.scala 33:29]
    node _GEN_39 = validif(_T_5, _GEN_4) @[Q_table.scala 33:29]
    node _GEN_40 = mux(_T_5, _GEN_5, UInt<1>("h0")) @[Q_table.scala 33:29]
    node _GEN_41 = validif(_T_5, _GEN_10) @[Q_table.scala 33:29]
    node _GEN_42 = validif(_T_5, _GEN_7) @[Q_table.scala 33:29]
    node _GEN_43 = mux(_T_5, _GEN_11, _GEN_26) @[Q_table.scala 33:29]
    node _GEN_44 = validif(eq(_T_5, UInt<1>("h0")), _GEN_18) @[Q_table.scala 33:29]
    node _GEN_45 = validif(eq(_T_5, UInt<1>("h0")), _GEN_19) @[Q_table.scala 33:29]
    node _GEN_46 = mux(_T_5, UInt<1>("h0"), _GEN_20) @[Q_table.scala 33:29]
    node _GEN_47 = validif(eq(_T_5, UInt<1>("h0")), _GEN_21) @[Q_table.scala 33:29]
    node _GEN_48 = validif(eq(_T_5, UInt<1>("h0")), _GEN_22) @[Q_table.scala 33:29]
    node _GEN_49 = mux(_T_5, UInt<1>("h0"), _GEN_23) @[Q_table.scala 33:29]
    node _GEN_50 = validif(eq(_T_5, UInt<1>("h0")), _GEN_24) @[Q_table.scala 33:29]
    node _GEN_51 = validif(eq(_T_5, UInt<1>("h0")), _GEN_25) @[Q_table.scala 33:29]
    node _GEN_52 = validif(eq(_T_5, UInt<1>("h0")), _GEN_27) @[Q_table.scala 33:29]
    node _GEN_53 = validif(eq(_T_5, UInt<1>("h0")), _GEN_28) @[Q_table.scala 33:29]
    node _GEN_54 = mux(_T_5, UInt<1>("h0"), _GEN_29) @[Q_table.scala 33:29]
    node _GEN_55 = validif(eq(_T_5, UInt<1>("h0")), _GEN_30) @[Q_table.scala 33:29]
    node _GEN_56 = validif(eq(_T_5, UInt<1>("h0")), _GEN_31) @[Q_table.scala 33:29]
    node _GEN_57 = mux(_T_5, UInt<1>("h0"), _GEN_32) @[Q_table.scala 33:29]
    node _GEN_58 = validif(eq(_T_5, UInt<1>("h0")), _GEN_33) @[Q_table.scala 33:29]
    node _GEN_59 = validif(eq(_T_5, UInt<1>("h0")), _GEN_34) @[Q_table.scala 33:29]
    node _GEN_60 = validif(_T, _GEN_0) @[Q_table.scala 27:23]
    node _GEN_61 = validif(_T, _GEN_1) @[Q_table.scala 27:23]
    node _GEN_62 = mux(_T, _GEN_2, UInt<1>("h0")) @[Q_table.scala 27:23]
    node _GEN_63 = validif(_T, _GEN_3) @[Q_table.scala 27:23]
    node _GEN_64 = validif(_T, _GEN_4) @[Q_table.scala 27:23]
    node _GEN_65 = mux(_T, _GEN_5, UInt<1>("h0")) @[Q_table.scala 27:23]
    node _GEN_66 = validif(_T, _GEN_6) @[Q_table.scala 27:23]
    node _GEN_67 = validif(_T, _GEN_7) @[Q_table.scala 27:23]
    node _GEN_68 = mux(_T, _GEN_8, _GEN_43) @[Q_table.scala 27:23]
    node _GEN_69 = validif(eq(_T, UInt<1>("h0")), _GEN_35) @[Q_table.scala 27:23]
    node _GEN_70 = validif(eq(_T, UInt<1>("h0")), _GEN_36) @[Q_table.scala 27:23]
    node _GEN_71 = mux(_T, UInt<1>("h0"), _GEN_37) @[Q_table.scala 27:23]
    node _GEN_72 = validif(eq(_T, UInt<1>("h0")), _GEN_38) @[Q_table.scala 27:23]
    node _GEN_73 = validif(eq(_T, UInt<1>("h0")), _GEN_39) @[Q_table.scala 27:23]
    node _GEN_74 = mux(_T, UInt<1>("h0"), _GEN_40) @[Q_table.scala 27:23]
    node _GEN_75 = validif(eq(_T, UInt<1>("h0")), _GEN_41) @[Q_table.scala 27:23]
    node _GEN_76 = validif(eq(_T, UInt<1>("h0")), _GEN_42) @[Q_table.scala 27:23]
    node _GEN_77 = validif(eq(_T, UInt<1>("h0")), _GEN_44) @[Q_table.scala 27:23]
    node _GEN_78 = validif(eq(_T, UInt<1>("h0")), _GEN_45) @[Q_table.scala 27:23]
    node _GEN_79 = mux(_T, UInt<1>("h0"), _GEN_46) @[Q_table.scala 27:23]
    node _GEN_80 = validif(eq(_T, UInt<1>("h0")), _GEN_47) @[Q_table.scala 27:23]
    node _GEN_81 = validif(eq(_T, UInt<1>("h0")), _GEN_48) @[Q_table.scala 27:23]
    node _GEN_82 = mux(_T, UInt<1>("h0"), _GEN_49) @[Q_table.scala 27:23]
    node _GEN_83 = validif(eq(_T, UInt<1>("h0")), _GEN_50) @[Q_table.scala 27:23]
    node _GEN_84 = validif(eq(_T, UInt<1>("h0")), _GEN_51) @[Q_table.scala 27:23]
    node _GEN_85 = validif(eq(_T, UInt<1>("h0")), _GEN_52) @[Q_table.scala 27:23]
    node _GEN_86 = validif(eq(_T, UInt<1>("h0")), _GEN_53) @[Q_table.scala 27:23]
    node _GEN_87 = mux(_T, UInt<1>("h0"), _GEN_54) @[Q_table.scala 27:23]
    node _GEN_88 = validif(eq(_T, UInt<1>("h0")), _GEN_55) @[Q_table.scala 27:23]
    node _GEN_89 = validif(eq(_T, UInt<1>("h0")), _GEN_56) @[Q_table.scala 27:23]
    node _GEN_90 = mux(_T, UInt<1>("h0"), _GEN_57) @[Q_table.scala 27:23]
    node _GEN_91 = validif(eq(_T, UInt<1>("h0")), _GEN_58) @[Q_table.scala 27:23]
    node _GEN_92 = validif(eq(_T, UInt<1>("h0")), _GEN_59) @[Q_table.scala 27:23]
    node _T_19 = bits(io_new_state, 4, 0) @[Q_table.scala 53:28]
    node _T_21 = bits(io_new_state, 4, 0) @[Q_table.scala 54:28]
    node _T_23 = bits(io_new_state, 4, 0) @[Q_table.scala 55:28]
    node _T_25 = bits(io_new_state, 4, 0) @[Q_table.scala 56:28]
    node _T_27 = bits(io_state, 4, 0) @[Q_table.scala 59:29]
    node _T_29 = bits(io_state, 4, 0) @[Q_table.scala 60:29]
    node _T_31 = bits(io_state, 4, 0) @[Q_table.scala 61:29]
    node _T_33 = bits(io_state, 4, 0) @[Q_table.scala 62:29]
    node _T_35 = bits(io_state, 4, 0) @[Q_table.scala 65:38]
    node _T_37 = bits(io_state, 4, 0) @[Q_table.scala 66:38]
    node _T_39 = bits(io_state, 4, 0) @[Q_table.scala 67:38]
    node _T_41 = bits(io_state, 4, 0) @[Q_table.scala 68:38]
    io_Q_s_a <= _GEN_68 @[Q_table.scala 26:11 Q_table.scala 31:15 Q_table.scala 37:15 Q_table.scala 43:15 Q_table.scala 49:15]
    io_Q_prime_max <= max4.io_Q_prime_max @[Q_table.scala 57:17]
    io_action_at_Qmax <= index_of_Q_max.io_action_at_Qmax @[Q_table.scala 70:20]
    max4.clock <= clock
    max4.reset <= reset
    max4.io_ins0 <= Q_s_a0._T_20.data @[Q_table.scala 53:15]
    max4.io_ins1 <= Q_s_a1._T_22.data @[Q_table.scala 54:15]
    max4.io_ins2 <= Q_s_a1._T_24.data @[Q_table.scala 55:15]
    max4.io_ins3 <= Q_s_a3._T_26.data @[Q_table.scala 56:15]
    max41.clock <= clock
    max41.reset <= reset
    max41.io_ins0 <= Q_s_a0._T_28.data @[Q_table.scala 59:16]
    max41.io_ins1 <= Q_s_a1._T_30.data @[Q_table.scala 60:16]
    max41.io_ins2 <= Q_s_a1._T_32.data @[Q_table.scala 61:16]
    max41.io_ins3 <= Q_s_a3._T_34.data @[Q_table.scala 62:16]
    index_of_Q_max.clock <= clock
    index_of_Q_max.reset <= reset
    index_of_Q_max.io_ins0 <= Q_s_a0._T_36.data @[Q_table.scala 65:25]
    index_of_Q_max.io_ins1 <= Q_s_a0._T_38.data @[Q_table.scala 66:25]
    index_of_Q_max.io_ins2 <= Q_s_a0._T_40.data @[Q_table.scala 67:25]
    index_of_Q_max.io_ins3 <= Q_s_a0._T_42.data @[Q_table.scala 68:25]
    index_of_Q_max.io_Q_max_at_state_s <= max41.io_Q_prime_max @[Q_table.scala 69:37]
    Q_s_a0._T_4.addr <= _GEN_66 @[Q_table.scala 31:28]
    Q_s_a0._T_4.en <= _GEN_65 @[Q_table.scala 19:25 Q_table.scala 31:28]
    Q_s_a0._T_4.clk <= _GEN_67 @[Q_table.scala 31:28]
    Q_s_a0._T_20.addr <= _T_19 @[Q_table.scala 53:28]
    Q_s_a0._T_20.en <= UInt<1>("h1") @[Q_table.scala 19:25 Q_table.scala 53:28]
    Q_s_a0._T_20.clk <= clock @[Q_table.scala 53:28]
    Q_s_a0._T_28.addr <= _T_27 @[Q_table.scala 59:29]
    Q_s_a0._T_28.en <= UInt<1>("h1") @[Q_table.scala 19:25 Q_table.scala 59:29]
    Q_s_a0._T_28.clk <= clock @[Q_table.scala 59:29]
    Q_s_a0._T_36.addr <= _T_35 @[Q_table.scala 65:38]
    Q_s_a0._T_36.en <= UInt<1>("h1") @[Q_table.scala 19:25 Q_table.scala 65:38]
    Q_s_a0._T_36.clk <= clock @[Q_table.scala 65:38]
    Q_s_a0._T_38.addr <= _T_37 @[Q_table.scala 66:38]
    Q_s_a0._T_38.en <= UInt<1>("h1") @[Q_table.scala 19:25 Q_table.scala 66:38]
    Q_s_a0._T_38.clk <= clock @[Q_table.scala 66:38]
    Q_s_a0._T_40.addr <= _T_39 @[Q_table.scala 67:38]
    Q_s_a0._T_40.en <= UInt<1>("h1") @[Q_table.scala 19:25 Q_table.scala 67:38]
    Q_s_a0._T_40.clk <= clock @[Q_table.scala 67:38]
    Q_s_a0._T_42.addr <= _T_41 @[Q_table.scala 68:38]
    Q_s_a0._T_42.en <= UInt<1>("h1") @[Q_table.scala 19:25 Q_table.scala 68:38]
    Q_s_a0._T_42.clk <= clock @[Q_table.scala 68:38]
    Q_s_a0._T_2.addr <= _GEN_60
    Q_s_a0._T_2.en <= _GEN_62 @[Q_table.scala 19:25]
    Q_s_a0._T_2.clk <= _GEN_61
    Q_s_a0._T_2.data <= _GEN_64
    Q_s_a0._T_2.mask <= _GEN_63
    Q_s_a0._T_16.addr <= _GEN_85
    Q_s_a0._T_16.en <= _GEN_87 @[Q_table.scala 19:25]
    Q_s_a0._T_16.clk <= _GEN_86
    Q_s_a0._T_16.data <= _GEN_89
    Q_s_a0._T_16.mask <= _GEN_88
    Q_s_a1._T_9.addr <= _GEN_75 @[Q_table.scala 37:28]
    Q_s_a1._T_9.en <= _GEN_74 @[Q_table.scala 20:25 Q_table.scala 37:28]
    Q_s_a1._T_9.clk <= _GEN_76 @[Q_table.scala 37:28]
    Q_s_a1._T_14.addr <= _GEN_83 @[Q_table.scala 43:28]
    Q_s_a1._T_14.en <= _GEN_82 @[Q_table.scala 20:25 Q_table.scala 43:28]
    Q_s_a1._T_14.clk <= _GEN_84 @[Q_table.scala 43:28]
    Q_s_a1._T_22.addr <= _T_21 @[Q_table.scala 54:28]
    Q_s_a1._T_22.en <= UInt<1>("h1") @[Q_table.scala 20:25 Q_table.scala 54:28]
    Q_s_a1._T_22.clk <= clock @[Q_table.scala 54:28]
    Q_s_a1._T_24.addr <= _T_23 @[Q_table.scala 55:28]
    Q_s_a1._T_24.en <= UInt<1>("h1") @[Q_table.scala 20:25 Q_table.scala 55:28]
    Q_s_a1._T_24.clk <= clock @[Q_table.scala 55:28]
    Q_s_a1._T_30.addr <= _T_29 @[Q_table.scala 60:29]
    Q_s_a1._T_30.en <= UInt<1>("h1") @[Q_table.scala 20:25 Q_table.scala 60:29]
    Q_s_a1._T_30.clk <= clock @[Q_table.scala 60:29]
    Q_s_a1._T_32.addr <= _T_31 @[Q_table.scala 61:29]
    Q_s_a1._T_32.en <= UInt<1>("h1") @[Q_table.scala 20:25 Q_table.scala 61:29]
    Q_s_a1._T_32.clk <= clock @[Q_table.scala 61:29]
    Q_s_a1._T_7.addr <= _GEN_69
    Q_s_a1._T_7.en <= _GEN_71 @[Q_table.scala 20:25]
    Q_s_a1._T_7.clk <= _GEN_70
    Q_s_a1._T_7.data <= _GEN_73
    Q_s_a1._T_7.mask <= _GEN_72
    Q_s_a2._T_12.addr <= _GEN_77
    Q_s_a2._T_12.en <= _GEN_79 @[Q_table.scala 21:25]
    Q_s_a2._T_12.clk <= _GEN_78
    Q_s_a2._T_12.data <= _GEN_81
    Q_s_a2._T_12.mask <= _GEN_80
    Q_s_a3._T_18.addr <= _GEN_91 @[Q_table.scala 49:28]
    Q_s_a3._T_18.en <= _GEN_90 @[Q_table.scala 22:25 Q_table.scala 49:28]
    Q_s_a3._T_18.clk <= _GEN_92 @[Q_table.scala 49:28]
    Q_s_a3._T_26.addr <= _T_25 @[Q_table.scala 56:28]
    Q_s_a3._T_26.en <= UInt<1>("h1") @[Q_table.scala 22:25 Q_table.scala 56:28]
    Q_s_a3._T_26.clk <= clock @[Q_table.scala 56:28]
    Q_s_a3._T_34.addr <= _T_33 @[Q_table.scala 62:29]
    Q_s_a3._T_34.en <= UInt<1>("h1") @[Q_table.scala 22:25 Q_table.scala 62:29]
    Q_s_a3._T_34.clk <= clock @[Q_table.scala 62:29]
    state <= mux(reset, UInt<6>("h0"), state)

  module ConfirmReward :
    input clock : Clock
    input reset : UInt<1>
    input io_new_state : UInt<6>
    input io_step : UInt<4>
    output io_reward : SInt<8>
  
    node _T = eq(io_new_state, UInt<5>("h18")) @[Blocks.scala 82:20]
    node _T_1 = eq(io_step, UInt<4>("he")) @[Blocks.scala 83:21]
    node _T_2 = eq(io_new_state, UInt<3>("h4")) @[Blocks.scala 85:26]
    node _T_3 = eq(io_new_state, UInt<3>("h6")) @[Blocks.scala 85:48]
    node _T_4 = or(_T_2, _T_3) @[Blocks.scala 85:33]
    node _T_5 = eq(io_new_state, UInt<3>("h7")) @[Blocks.scala 85:69]
    node _T_6 = or(_T_4, _T_5) @[Blocks.scala 85:55]
    node _T_7 = eq(io_new_state, UInt<4>("hd")) @[Blocks.scala 85:91]
    node _T_8 = or(_T_6, _T_7) @[Blocks.scala 85:76]
    node _T_9 = eq(io_new_state, UInt<5>("h10")) @[Blocks.scala 85:114]
    node _T_10 = or(_T_8, _T_9) @[Blocks.scala 85:99]
    node _T_11 = eq(io_new_state, UInt<5>("h12")) @[Blocks.scala 85:137]
    node _T_12 = or(_T_10, _T_11) @[Blocks.scala 85:122]
    node _T_13 = eq(io_new_state, UInt<5>("h13")) @[Blocks.scala 85:160]
    node _T_14 = or(_T_12, _T_13) @[Blocks.scala 85:145]
    node _T_15 = eq(io_new_state, UInt<5>("h15")) @[Blocks.scala 85:183]
    node _T_16 = or(_T_14, _T_15) @[Blocks.scala 85:168]
    node _GEN_0 = mux(_T_16, asSInt(UInt<8>("h9c")), asSInt(UInt<1>("h0"))) @[Blocks.scala 85:192]
    node _GEN_1 = mux(_T_1, asSInt(UInt<7>("h4e")), _GEN_0) @[Blocks.scala 83:29]
    node _GEN_2 = mux(_T, asSInt(UInt<8>("h64")), _GEN_1) @[Blocks.scala 82:28]
    io_reward <= _GEN_2 @[Blocks.scala 82:38 Blocks.scala 84:14 Blocks.scala 85:203 Blocks.scala 87:14]

  module resetFMS :
    input clock : Clock
    input reset : UInt<1>
    input io_start : UInt<1>
    output io_reset : UInt<1>
  
    reg active_reset_fms : UInt<1>, clock with :
      reset => (UInt<1>("h0"), active_reset_fms) @[AgentsBrain.scala 10:31]
    node _GEN_0 = mux(io_start, UInt<1>("h0"), active_reset_fms) @[AgentsBrain.scala 12:17]
    node _T = eq(UInt<1>("h0"), active_reset_fms) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<1>("h1"), active_reset_fms) @[Conditional.scala 37:30]
    node _GEN_1 = mux(_T, UInt<1>("h1"), _GEN_0) @[Conditional.scala 40:58]
    node _GEN_2 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 40:58]
    io_reset <= _GEN_2 @[AgentsBrain.scala 11:11 AgentsBrain.scala 18:15]
    active_reset_fms <= mux(reset, UInt<1>("h0"), _GEN_1) @[AgentsBrain.scala 13:21 AgentsBrain.scala 17:23]

  module MasterFMS :
    input clock : Clock
    input reset : UInt<1>
    input io_iterate : UInt<1>
    input io_done_learning : UInt<1>
    input io_move_to_confirming_Reward : UInt<1>
    output io_Path_found : UInt<1>
    output io_cal : UInt<1>
    output io_load_new_state : UInt<1>
    output io_reset_Action_fms : UInt<1>
  
    inst reset_fms of resetFMS @[AgentsBrain.scala 38:23]
    reg master_fms : UInt<3>, clock with :
      reset => (UInt<1>("h0"), master_fms) @[AgentsBrain.scala 36:25]
    node _T = eq(UInt<3>("h0"), master_fms) @[Conditional.scala 37:30]
    node _GEN_0 = mux(io_done_learning, UInt<3>("h4"), UInt<3>("h1")) @[AgentsBrain.scala 52:35]
    node _GEN_1 = mux(io_done_learning, UInt<1>("h0"), UInt<1>("h1")) @[AgentsBrain.scala 52:35]
    node _GEN_2 = mux(io_iterate, UInt<3>("h0"), _GEN_0) @[AgentsBrain.scala 50:23]
    node _GEN_3 = mux(io_iterate, UInt<1>("h0"), _GEN_1) @[AgentsBrain.scala 50:23]
    node _T_1 = eq(UInt<3>("h1"), master_fms) @[Conditional.scala 37:30]
    node _GEN_4 = mux(io_move_to_confirming_Reward, UInt<3>("h2"), master_fms) @[AgentsBrain.scala 61:42]
    node _T_2 = eq(UInt<3>("h2"), master_fms) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<3>("h3"), master_fms) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<3>("h4"), master_fms) @[Conditional.scala 37:30]
    node _GEN_5 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_6 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_7 = mux(_T_3, UInt<3>("h0"), master_fms) @[Conditional.scala 39:67]
    node _GEN_8 = mux(_T_3, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_2, UInt<3>("h3"), _GEN_7) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_2, UInt<1>("h0"), _GEN_6) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T_2, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67]
    node _GEN_12 = mux(_T_1, reset_fms.io_reset, UInt<1>("h0")) @[Conditional.scala 39:67]
    node _GEN_13 = mux(_T_1, _GEN_4, _GEN_9) @[Conditional.scala 39:67]
    node _GEN_14 = mux(_T_1, UInt<1>("h0"), _GEN_10) @[Conditional.scala 39:67]
    node _GEN_15 = mux(_T_1, UInt<1>("h0"), _GEN_11) @[Conditional.scala 39:67]
    node _GEN_16 = mux(_T, _GEN_2, _GEN_13) @[Conditional.scala 40:58]
    node _GEN_17 = mux(_T, _GEN_3, UInt<1>("h0")) @[Conditional.scala 40:58]
    node _GEN_18 = mux(_T, UInt<1>("h0"), _GEN_12) @[Conditional.scala 40:58]
    node _GEN_19 = mux(_T, UInt<1>("h0"), _GEN_14) @[Conditional.scala 40:58]
    node _GEN_20 = mux(_T, UInt<1>("h0"), _GEN_15) @[Conditional.scala 40:58]
    node start = _GEN_17 @[AgentsBrain.scala 55:14]
    io_Path_found <= _GEN_20 @[AgentsBrain.scala 46:17 AgentsBrain.scala 75:20]
    io_cal <= _GEN_19 @[AgentsBrain.scala 47:9 AgentsBrain.scala 70:13]
    io_load_new_state <= _GEN_19 @[AgentsBrain.scala 43:20 AgentsBrain.scala 72:24]
    io_reset_Action_fms <= _GEN_18 @[AgentsBrain.scala 41:22 AgentsBrain.scala 45:22 AgentsBrain.scala 60:26]
    master_fms <= mux(reset, UInt<3>("h0"), _GEN_16) @[AgentsBrain.scala 51:20 AgentsBrain.scala 53:20 AgentsBrain.scala 56:19 AgentsBrain.scala 62:20 AgentsBrain.scala 66:18 AgentsBrain.scala 71:17]
    reset_fms.clock <= clock
    reset_fms.reset <= reset
    reset_fms.io_start <= start @[AgentsBrain.scala 40:21]

  module sloving_maze_by_RL :
    input clock : Clock
    input reset : UInt<1>
    input io_rand1 : UInt<10>
    input io_rand2 : UInt<10>
    output io_Path_found : UInt<1>
    input io_COL : UInt<3>
    input io_ROW : UInt<3>
  
    inst agent of Agent @[sloving_maze_by_RL.scala 14:19]
    inst taking_action of takingAction @[sloving_maze_by_RL.scala 15:27]
    inst Q_func of Q_function @[sloving_maze_by_RL.scala 16:20]
    inst Q_table of Qtable @[sloving_maze_by_RL.scala 17:21]
    inst Reward of ConfirmReward @[sloving_maze_by_RL.scala 18:20]
    inst masterFMS of MasterFMS @[sloving_maze_by_RL.scala 19:23]
    io_Path_found <= masterFMS.io_Path_found @[sloving_maze_by_RL.scala 52:16]
    agent.clock <= clock
    agent.reset <= reset
    agent.io_ROW <= io_ROW @[sloving_maze_by_RL.scala 22:15]
    agent.io_COL <= io_COL @[sloving_maze_by_RL.scala 23:15]
    agent.io_new_state <= taking_action.io_new_state @[sloving_maze_by_RL.scala 30:29]
    agent.io_load_new_state <= masterFMS.io_load_new_state @[sloving_maze_by_RL.scala 51:26]
    taking_action.clock <= clock
    taking_action.reset <= reset
    taking_action.io_x <= agent.io_x @[sloving_maze_by_RL.scala 26:13]
    taking_action.io_y <= agent.io_y @[sloving_maze_by_RL.scala 27:13]
    taking_action.io_rand1 <= io_rand1 @[sloving_maze_by_RL.scala 24:11]
    taking_action.io_rand2 <= io_rand2 @[sloving_maze_by_RL.scala 25:11]
    taking_action.io_episode <= agent.io_episode @[sloving_maze_by_RL.scala 28:19]
    taking_action.io_action_at_Qmax <= Q_table.io_action_at_Qmax @[sloving_maze_by_RL.scala 33:34]
    taking_action.io_reset_Action_fms <= masterFMS.io_reset_Action_fms @[sloving_maze_by_RL.scala 47:32]
    Q_func.clock <= clock
    Q_func.reset <= reset
    Q_func.io_Q_s_a <= Q_table.io_Q_s_a @[sloving_maze_by_RL.scala 40:18]
    Q_func.io_Q_prime_max <= Q_table.io_Q_prime_max @[sloving_maze_by_RL.scala 39:24]
    Q_func.io_cal <= masterFMS.io_cal @[sloving_maze_by_RL.scala 42:16]
    Q_func.io_reward <= Reward.io_reward @[sloving_maze_by_RL.scala 41:19]
    Q_table.clock <= clock
    Q_table.reset <= reset
    Q_table.io_state <= agent.io_state @[sloving_maze_by_RL.scala 38:19]
    Q_table.io_new_state <= taking_action.io_new_state @[sloving_maze_by_RL.scala 31:29]
    Q_table.io_act <= taking_action.io_act @[sloving_maze_by_RL.scala 32:23]
    Q_table.io_wrEna <= Q_func.io_wrEna @[sloving_maze_by_RL.scala 43:18]
    Q_table.io_Q_updated <= Q_func.io_Q_updated @[sloving_maze_by_RL.scala 44:22]
    Reward.clock <= clock
    Reward.reset <= reset
    Reward.io_new_state <= taking_action.io_new_state @[sloving_maze_by_RL.scala 35:22]
    Reward.io_step <= agent.io_step @[sloving_maze_by_RL.scala 36:17]
    masterFMS.clock <= clock
    masterFMS.reset <= reset
    masterFMS.io_iterate <= agent.io_iterate @[sloving_maze_by_RL.scala 49:23]
    masterFMS.io_done_learning <= agent.io_done_learning @[sloving_maze_by_RL.scala 48:29]
    masterFMS.io_move_to_confirming_Reward <= taking_action.io_move_to_confirming_Reward @[sloving_maze_by_RL.scala 50:41]
