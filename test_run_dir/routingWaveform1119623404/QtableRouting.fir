;buildInfoPackage: chisel3, version: 3.2.2, scalaVersion: 2.11.12, sbtVersion: 1.3.2
circuit QtableRouting : 
  module Max4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip ins0 : SInt<21>, flip ins1 : SInt<21>, flip ins2 : SInt<21>, flip ins3 : SInt<21>, Q_prime_max : SInt<21>}
    
    wire ins : SInt<21>[4] @[Q_table.scala 80:15]
    ins[0] <= io.ins0 @[Q_table.scala 81:9]
    ins[1] <= io.ins1 @[Q_table.scala 82:9]
    ins[2] <= io.ins2 @[Q_table.scala 83:9]
    ins[3] <= io.ins3 @[Q_table.scala 84:9]
    node _T = gt(ins[0], ins[1]) @[Q_table.scala 79:46]
    node _T_1 = mux(_T, ins[0], ins[1]) @[Q_table.scala 79:43]
    node _T_2 = gt(_T_1, ins[2]) @[Q_table.scala 79:46]
    node _T_3 = mux(_T_2, _T_1, ins[2]) @[Q_table.scala 79:43]
    node _T_4 = gt(_T_3, ins[3]) @[Q_table.scala 79:46]
    node _T_5 = mux(_T_4, _T_3, ins[3]) @[Q_table.scala 79:43]
    io.Q_prime_max <= _T_5 @[Q_table.scala 85:17]
    
  module Max4_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip ins0 : SInt<21>, flip ins1 : SInt<21>, flip ins2 : SInt<21>, flip ins3 : SInt<21>, Q_prime_max : SInt<21>}
    
    wire ins : SInt<21>[4] @[Q_table.scala 80:15]
    ins[0] <= io.ins0 @[Q_table.scala 81:9]
    ins[1] <= io.ins1 @[Q_table.scala 82:9]
    ins[2] <= io.ins2 @[Q_table.scala 83:9]
    ins[3] <= io.ins3 @[Q_table.scala 84:9]
    node _T = gt(ins[0], ins[1]) @[Q_table.scala 79:46]
    node _T_1 = mux(_T, ins[0], ins[1]) @[Q_table.scala 79:43]
    node _T_2 = gt(_T_1, ins[2]) @[Q_table.scala 79:46]
    node _T_3 = mux(_T_2, _T_1, ins[2]) @[Q_table.scala 79:43]
    node _T_4 = gt(_T_3, ins[3]) @[Q_table.scala 79:46]
    node _T_5 = mux(_T_4, _T_3, ins[3]) @[Q_table.scala 79:43]
    io.Q_prime_max <= _T_5 @[Q_table.scala 85:17]
    
  module Action_at_Qmax : 
    input clock : Clock
    input reset : Reset
    output io : {flip ins0 : SInt<21>, flip ins1 : SInt<21>, flip ins2 : SInt<21>, flip ins3 : SInt<21>, action_at_Qmax : UInt<2>, flip Q_max_at_state_s : SInt<21>}
    
    wire ins : SInt<21>[4] @[Q_table.scala 96:15]
    ins[0] <= io.ins0 @[Q_table.scala 97:9]
    ins[1] <= io.ins1 @[Q_table.scala 98:9]
    ins[2] <= io.ins2 @[Q_table.scala 99:9]
    ins[3] <= io.ins3 @[Q_table.scala 100:9]
    node _T = eq(ins[0], io.Q_max_at_state_s) @[Q_table.scala 101:42]
    node _T_1 = eq(ins[1], io.Q_max_at_state_s) @[Q_table.scala 101:42]
    node _T_2 = eq(ins[2], io.Q_max_at_state_s) @[Q_table.scala 101:42]
    node _T_3 = eq(ins[3], io.Q_max_at_state_s) @[Q_table.scala 101:42]
    node _T_4 = mux(_T_2, UInt<2>("h02"), UInt<2>("h03")) @[Q_table.scala 101:36]
    node _T_5 = mux(_T_1, UInt<1>("h01"), _T_4) @[Q_table.scala 101:36]
    node _T_6 = mux(_T, UInt<1>("h00"), _T_5) @[Q_table.scala 101:36]
    io.action_at_Qmax <= _T_6 @[Q_table.scala 101:20]
    
  module Qtable : 
    input clock : Clock
    input reset : Reset
    output io : {flip state : UInt<6>, flip new_state : UInt<6>, flip act : UInt<2>, flip wrEna : UInt<1>, flip Q_updated : SInt<21>, Q_s_a : SInt<21>, Q_prime_max : SInt<21>, action_at_Qmax : UInt<2>}
    
    inst max4 of Max4 @[Q_table.scala 15:18]
    max4.clock <= clock
    max4.reset <= reset
    inst max41 of Max4_1 @[Q_table.scala 16:19]
    max41.clock <= clock
    max41.reset <= reset
    inst index_of_Q_max of Action_at_Qmax @[Q_table.scala 17:28]
    index_of_Q_max.clock <= clock
    index_of_Q_max.reset <= reset
    smem Q_s_Act0 : SInt<21>[25] @[Q_table.scala 19:27]
    smem Q_s_Act1 : SInt<21>[25] @[Q_table.scala 20:27]
    smem Q_s_Act2 : SInt<21>[25] @[Q_table.scala 21:27]
    smem Q_s_Act3 : SInt<21>[25] @[Q_table.scala 22:27]
    reg state : UInt<6>, clock with : (reset => (reset, UInt<6>("h00"))) @[Q_table.scala 23:20]
    state <= io.state @[Q_table.scala 24:8]
    node _T = eq(io.state, UInt<1>("h00")) @[Q_table.scala 26:16]
    when _T : @[Q_table.scala 26:23]
      node _T_1 = bits(io.state, 4, 0) @[Q_table.scala 27:28]
      read mport _T_2 = Q_s_Act0[_T_1], clock @[Q_table.scala 27:28]
      io.Q_s_a <= _T_2 @[Q_table.scala 27:13]
      when io.wrEna : @[Q_table.scala 28:20]
        node _T_3 = bits(io.state, 4, 0) @[Q_table.scala 29:30]
        read mport _T_4 = Q_s_Act0[_T_3], clock @[Q_table.scala 29:30]
        io.Q_s_a <= _T_4 @[Q_table.scala 29:15]
        node _T_5 = bits(state, 4, 0)
        write mport _T_6 = Q_s_Act0[_T_5], clock
        _T_6 <= io.Q_updated
        skip @[Q_table.scala 28:20]
      skip @[Q_table.scala 26:23]
    else : @[Q_table.scala 32:29]
      node _T_7 = eq(io.state, UInt<1>("h01")) @[Q_table.scala 32:22]
      when _T_7 : @[Q_table.scala 32:29]
        node _T_8 = bits(io.state, 4, 0) @[Q_table.scala 33:28]
        read mport _T_9 = Q_s_Act1[_T_8], clock @[Q_table.scala 33:28]
        io.Q_s_a <= _T_9 @[Q_table.scala 33:13]
        when io.wrEna : @[Q_table.scala 34:20]
          node _T_10 = bits(state, 4, 0)
          write mport _T_11 = Q_s_Act1[_T_10], clock
          _T_11 <= io.Q_updated
          skip @[Q_table.scala 34:20]
        skip @[Q_table.scala 32:29]
      else : @[Q_table.scala 37:29]
        node _T_12 = eq(io.state, UInt<2>("h02")) @[Q_table.scala 37:22]
        when _T_12 : @[Q_table.scala 37:29]
          node _T_13 = bits(io.state, 4, 0) @[Q_table.scala 38:28]
          read mport _T_14 = Q_s_Act2[_T_13], clock @[Q_table.scala 38:28]
          io.Q_s_a <= _T_14 @[Q_table.scala 38:13]
          when io.wrEna : @[Q_table.scala 39:20]
            node _T_15 = bits(state, 4, 0)
            write mport _T_16 = Q_s_Act2[_T_15], clock
            _T_16 <= io.Q_updated
            skip @[Q_table.scala 39:20]
          skip @[Q_table.scala 37:29]
        else : @[Q_table.scala 42:4]
          node _T_17 = bits(io.state, 4, 0) @[Q_table.scala 43:28]
          read mport _T_18 = Q_s_Act3[_T_17], clock @[Q_table.scala 43:28]
          io.Q_s_a <= _T_18 @[Q_table.scala 43:13]
          when io.wrEna : @[Q_table.scala 44:19]
            node _T_19 = bits(state, 4, 0)
            write mport _T_20 = Q_s_Act0[_T_19], clock
            _T_20 <= io.Q_updated
            skip @[Q_table.scala 44:19]
          skip @[Q_table.scala 42:4]
    node _T_21 = bits(io.new_state, 4, 0) @[Q_table.scala 49:30]
    read mport _T_22 = Q_s_Act0[_T_21], clock @[Q_table.scala 49:30]
    max4.io.ins0 <= _T_22 @[Q_table.scala 49:15]
    node _T_23 = bits(io.new_state, 4, 0) @[Q_table.scala 50:30]
    read mport _T_24 = Q_s_Act1[_T_23], clock @[Q_table.scala 50:30]
    max4.io.ins1 <= _T_24 @[Q_table.scala 50:15]
    node _T_25 = bits(io.new_state, 4, 0) @[Q_table.scala 51:30]
    read mport _T_26 = Q_s_Act2[_T_25], clock @[Q_table.scala 51:30]
    max4.io.ins2 <= _T_26 @[Q_table.scala 51:15]
    node _T_27 = bits(io.new_state, 4, 0) @[Q_table.scala 52:30]
    read mport _T_28 = Q_s_Act3[_T_27], clock @[Q_table.scala 52:30]
    max4.io.ins3 <= _T_28 @[Q_table.scala 52:15]
    io.Q_prime_max <= max4.io.Q_prime_max @[Q_table.scala 53:17]
    node _T_29 = bits(io.state, 4, 0) @[Q_table.scala 55:31]
    read mport _T_30 = Q_s_Act0[_T_29], clock @[Q_table.scala 55:31]
    max41.io.ins0 <= _T_30 @[Q_table.scala 55:16]
    node _T_31 = bits(io.state, 4, 0) @[Q_table.scala 56:31]
    read mport _T_32 = Q_s_Act1[_T_31], clock @[Q_table.scala 56:31]
    max41.io.ins1 <= _T_32 @[Q_table.scala 56:16]
    node _T_33 = bits(io.state, 4, 0) @[Q_table.scala 57:31]
    read mport _T_34 = Q_s_Act2[_T_33], clock @[Q_table.scala 57:31]
    max41.io.ins2 <= _T_34 @[Q_table.scala 57:16]
    node _T_35 = bits(io.state, 4, 0) @[Q_table.scala 58:31]
    read mport _T_36 = Q_s_Act3[_T_35], clock @[Q_table.scala 58:31]
    max41.io.ins3 <= _T_36 @[Q_table.scala 58:16]
    node _T_37 = bits(io.state, 4, 0) @[Q_table.scala 62:40]
    read mport _T_38 = Q_s_Act0[_T_37], clock @[Q_table.scala 62:40]
    index_of_Q_max.io.ins0 <= _T_38 @[Q_table.scala 62:25]
    node _T_39 = bits(io.state, 4, 0) @[Q_table.scala 63:40]
    read mport _T_40 = Q_s_Act0[_T_39], clock @[Q_table.scala 63:40]
    index_of_Q_max.io.ins1 <= _T_40 @[Q_table.scala 63:25]
    node _T_41 = bits(io.state, 4, 0) @[Q_table.scala 64:40]
    read mport _T_42 = Q_s_Act0[_T_41], clock @[Q_table.scala 64:40]
    index_of_Q_max.io.ins2 <= _T_42 @[Q_table.scala 64:25]
    node _T_43 = bits(io.state, 4, 0) @[Q_table.scala 65:40]
    read mport _T_44 = Q_s_Act0[_T_43], clock @[Q_table.scala 65:40]
    index_of_Q_max.io.ins3 <= _T_44 @[Q_table.scala 65:25]
    index_of_Q_max.io.Q_max_at_state_s <= max41.io.Q_prime_max @[Q_table.scala 66:37]
    io.action_at_Qmax <= index_of_Q_max.io.action_at_Qmax @[Q_table.scala 67:20]
    
  module Routing : 
    input clock : Clock
    input reset : Reset
    output io : {flip routing : UInt<1>, flip starting_state : UInt<6>, path : UInt<6>, done : UInt<1>, state_out : UInt<6>, flip act : UInt<2>}
    
    io.state_out <= UInt<1>("h00") @[Routing.scala 13:15]
    io.path <= UInt<1>("h00") @[Routing.scala 14:10]
    io.done <= UInt<1>("h00") @[Routing.scala 15:10]
    io.done <= UInt<1>("h00") @[Routing.scala 16:10]
    reg state : UInt<6>, clock with : (reset => (reset, UInt<6>("h00"))) @[Routing.scala 17:20]
    when io.routing : @[Routing.scala 18:19]
      node _T = rem(state, UInt<3>("h05")) @[Routing.scala 19:16]
      node _T_1 = div(state, UInt<3>("h05")) @[Routing.scala 20:16]
      node _T_2 = eq(io.act, UInt<1>("h00")) @[Routing.scala 21:17]
      when _T_2 : @[Routing.scala 21:26]
        node _T_3 = add(_T_1, UInt<1>("h01")) @[Routing.scala 22:23]
        node _T_4 = tail(_T_3, 1) @[Routing.scala 22:23]
        node _T_5 = mul(UInt<3>("h05"), _T_4) @[Routing.scala 22:19]
        node _T_6 = add(_T, _T_5) @[Routing.scala 22:15]
        node _T_7 = tail(_T_6, 1) @[Routing.scala 22:15]
        state <= _T_7 @[Routing.scala 22:12]
        skip @[Routing.scala 21:26]
      else : @[Routing.scala 23:32]
        node _T_8 = eq(io.act, UInt<1>("h01")) @[Routing.scala 23:23]
        when _T_8 : @[Routing.scala 23:32]
          node _T_9 = sub(_T, UInt<1>("h01")) @[Routing.scala 24:19]
          node _T_10 = tail(_T_9, 1) @[Routing.scala 24:19]
          node _T_11 = mul(UInt<3>("h05"), _T_1) @[Routing.scala 24:29]
          node _T_12 = add(_T_10, _T_11) @[Routing.scala 24:25]
          node _T_13 = tail(_T_12, 1) @[Routing.scala 24:25]
          state <= _T_13 @[Routing.scala 24:13]
          skip @[Routing.scala 23:32]
        else : @[Routing.scala 25:32]
          node _T_14 = eq(io.act, UInt<2>("h02")) @[Routing.scala 25:23]
          when _T_14 : @[Routing.scala 25:32]
            node _T_15 = sub(_T_1, UInt<1>("h01")) @[Routing.scala 26:23]
            node _T_16 = tail(_T_15, 1) @[Routing.scala 26:23]
            node _T_17 = mul(UInt<3>("h05"), _T_16) @[Routing.scala 26:19]
            node _T_18 = add(_T, _T_17) @[Routing.scala 26:15]
            node _T_19 = tail(_T_18, 1) @[Routing.scala 26:15]
            state <= _T_19 @[Routing.scala 26:12]
            skip @[Routing.scala 25:32]
          else : @[Routing.scala 27:7]
            node _T_20 = add(_T, UInt<1>("h01")) @[Routing.scala 28:18]
            node _T_21 = tail(_T_20, 1) @[Routing.scala 28:18]
            node _T_22 = mul(UInt<3>("h05"), _T_1) @[Routing.scala 28:28]
            node _T_23 = add(_T_21, _T_22) @[Routing.scala 28:24]
            node _T_24 = tail(_T_23, 1) @[Routing.scala 28:24]
            state <= _T_24 @[Routing.scala 28:12]
            skip @[Routing.scala 27:7]
      io.state_out <= state @[Routing.scala 30:17]
      io.path <= state @[Routing.scala 31:12]
      node _T_25 = eq(state, UInt<5>("h017")) @[Routing.scala 32:15]
      when _T_25 : @[Routing.scala 32:23]
        io.done <= UInt<1>("h01") @[Routing.scala 33:14]
        skip @[Routing.scala 32:23]
      skip @[Routing.scala 18:19]
    else : @[Routing.scala 35:4]
      state <= io.starting_state @[Routing.scala 36:10]
      skip @[Routing.scala 35:4]
    
  module QtableRouting : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip state : UInt<6>, flip new_state : UInt<6>, flip act : UInt<2>, flip wrEna : UInt<1>, flip Q_updated : SInt<21>, Q_s_a : SInt<21>, Q_prime_max : SInt<21>, action_at_Qmax : UInt<2>, flip routing : UInt<1>, path : UInt<6>, done : UInt<1>}
    
    inst Q_tab of Qtable @[combineQandRouting.scala 19:19]
    Q_tab.clock <= clock
    Q_tab.reset <= reset
    inst routing of Routing @[combineQandRouting.scala 20:21]
    routing.clock <= clock
    routing.reset <= reset
    routing.io.routing <= io.routing @[combineQandRouting.scala 21:21]
    routing.io.starting_state <= UInt<1>("h00") @[combineQandRouting.scala 22:28]
    Q_tab.io.state <= routing.io.state_out @[combineQandRouting.scala 23:23]
    io.done <= routing.io.done @[combineQandRouting.scala 24:18]
    io.path <= routing.io.path @[combineQandRouting.scala 25:18]
    io.action_at_Qmax <= Q_tab.io.action_at_Qmax @[combineQandRouting.scala 26:26]
    io.Q_prime_max <= Q_tab.io.Q_prime_max @[combineQandRouting.scala 27:17]
    io.Q_s_a <= Q_tab.io.Q_s_a @[combineQandRouting.scala 28:11]
    Q_tab.io.state <= io.state @[combineQandRouting.scala 30:11]
    Q_tab.io.new_state <= io.new_state @[combineQandRouting.scala 31:15]
    Q_tab.io.wrEna <= io.wrEna @[combineQandRouting.scala 32:17]
    routing.io.act <= Q_tab.io.action_at_Qmax @[combineQandRouting.scala 33:17]
    Q_tab.io.act <= io.act @[combineQandRouting.scala 34:15]
    Q_tab.io.Q_updated <= io.Q_updated @[combineQandRouting.scala 36:21]
    
