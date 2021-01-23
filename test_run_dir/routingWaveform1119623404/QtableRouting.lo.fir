circuit QtableRouting :
  module Max4 :
    input clock : Clock
    input reset : UInt<1>
    input io_ins0 : SInt<21>
    input io_ins1 : SInt<21>
    input io_ins2 : SInt<21>
    input io_ins3 : SInt<21>
    output io_Q_prime_max : SInt<21>
  
    node ins_0 = io_ins0 @[Q_table.scala 80:15 Q_table.scala 81:9]
    node ins_1 = io_ins1 @[Q_table.scala 80:15 Q_table.scala 82:9]
    node _T = gt(ins_0, ins_1) @[Q_table.scala 79:46]
    node _T_1 = mux(_T, ins_0, ins_1) @[Q_table.scala 79:43]
    node ins_2 = io_ins2 @[Q_table.scala 80:15 Q_table.scala 83:9]
    node _T_2 = gt(_T_1, ins_2) @[Q_table.scala 79:46]
    node _T_3 = mux(_T_2, _T_1, ins_2) @[Q_table.scala 79:43]
    node ins_3 = io_ins3 @[Q_table.scala 80:15 Q_table.scala 84:9]
    node _T_4 = gt(_T_3, ins_3) @[Q_table.scala 79:46]
    node _T_5 = mux(_T_4, _T_3, ins_3) @[Q_table.scala 79:43]
    io_Q_prime_max <= _T_5 @[Q_table.scala 85:17]

  module Action_at_Qmax :
    input clock : Clock
    input reset : UInt<1>
    input io_ins0 : SInt<21>
    input io_ins1 : SInt<21>
    input io_ins2 : SInt<21>
    input io_ins3 : SInt<21>
    output io_action_at_Qmax : UInt<2>
    input io_Q_max_at_state_s : SInt<21>
  
    node ins_0 = io_ins0 @[Q_table.scala 96:15 Q_table.scala 97:9]
    node _T = eq(ins_0, io_Q_max_at_state_s) @[Q_table.scala 101:42]
    node ins_1 = io_ins1 @[Q_table.scala 96:15 Q_table.scala 98:9]
    node _T_1 = eq(ins_1, io_Q_max_at_state_s) @[Q_table.scala 101:42]
    node ins_2 = io_ins2 @[Q_table.scala 96:15 Q_table.scala 99:9]
    node _T_2 = eq(ins_2, io_Q_max_at_state_s) @[Q_table.scala 101:42]
    node ins_3 = io_ins3 @[Q_table.scala 96:15 Q_table.scala 100:9]
    node _T_3 = eq(ins_3, io_Q_max_at_state_s) @[Q_table.scala 101:42]
    node _T_4 = mux(_T_2, UInt<2>("h2"), UInt<2>("h3")) @[Q_table.scala 101:36]
    node _T_5 = mux(_T_1, UInt<1>("h1"), _T_4) @[Q_table.scala 101:36]
    node _T_6 = mux(_T, UInt<1>("h0"), _T_5) @[Q_table.scala 101:36]
    io_action_at_Qmax <= _T_6 @[Q_table.scala 101:20]

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
    mem Q_s_Act0 : @[Q_table.scala 19:27]
      data-type => SInt<21>
      depth => 25
      read-latency => 1
      write-latency => 1
      reader => _T_2
      reader => _T_4
      reader => _T_22
      reader => _T_30
      reader => _T_38
      reader => _T_40
      reader => _T_42
      reader => _T_44
      writer => _T_6
      writer => _T_20
      read-under-write => undefined
    mem Q_s_Act1 : @[Q_table.scala 20:27]
      data-type => SInt<21>
      depth => 25
      read-latency => 1
      write-latency => 1
      reader => _T_9
      reader => _T_24
      reader => _T_32
      writer => _T_11
      read-under-write => undefined
    mem Q_s_Act2 : @[Q_table.scala 21:27]
      data-type => SInt<21>
      depth => 25
      read-latency => 1
      write-latency => 1
      reader => _T_14
      reader => _T_26
      reader => _T_34
      writer => _T_16
      read-under-write => undefined
    mem Q_s_Act3 : @[Q_table.scala 22:27]
      data-type => SInt<21>
      depth => 25
      read-latency => 1
      write-latency => 1
      reader => _T_18
      reader => _T_28
      reader => _T_36
      read-under-write => undefined
    reg state : UInt<6>, clock with :
      reset => (UInt<1>("h0"), state) @[Q_table.scala 23:20]
    node _T = eq(io_state, UInt<1>("h0")) @[Q_table.scala 26:16]
    node _T_1 = bits(io_state, 4, 0) @[Q_table.scala 27:28]
    node _T_3 = bits(io_state, 4, 0) @[Q_table.scala 29:30]
    node _T_5 = bits(state, 4, 0)
    node _GEN_0 = mux(io_wrEna, UInt<1>("h1"), UInt<1>("h0")) @[Q_table.scala 28:20]
    node _GEN_1 = validif(io_wrEna, _T_3) @[Q_table.scala 28:20]
    node _GEN_2 = validif(io_wrEna, clock) @[Q_table.scala 28:20]
    node _GEN_3 = mux(io_wrEna, Q_s_Act0._T_4.data, Q_s_Act0._T_2.data) @[Q_table.scala 28:20]
    node _GEN_4 = validif(io_wrEna, _T_5) @[Q_table.scala 28:20]
    node _GEN_5 = validif(io_wrEna, UInt<1>("h1")) @[Q_table.scala 28:20]
    node _GEN_6 = validif(io_wrEna, io_Q_updated) @[Q_table.scala 28:20]
    node _T_7 = eq(io_state, UInt<1>("h1")) @[Q_table.scala 32:22]
    node _T_8 = bits(io_state, 4, 0) @[Q_table.scala 33:28]
    node _T_10 = bits(state, 4, 0)
    node _GEN_7 = validif(io_wrEna, _T_10) @[Q_table.scala 34:20]
    node _T_12 = eq(io_state, UInt<2>("h2")) @[Q_table.scala 37:22]
    node _T_13 = bits(io_state, 4, 0) @[Q_table.scala 38:28]
    node _T_15 = bits(state, 4, 0)
    node _GEN_8 = validif(io_wrEna, _T_15) @[Q_table.scala 39:20]
    node _T_17 = bits(io_state, 4, 0) @[Q_table.scala 43:28]
    node _T_19 = bits(state, 4, 0)
    node _GEN_9 = validif(io_wrEna, _T_19) @[Q_table.scala 44:19]
    node _GEN_10 = mux(_T_12, UInt<1>("h1"), UInt<1>("h0")) @[Q_table.scala 37:29]
    node _GEN_11 = validif(_T_12, _T_13) @[Q_table.scala 37:29]
    node _GEN_12 = validif(_T_12, clock) @[Q_table.scala 37:29]
    node _GEN_13 = mux(_T_12, Q_s_Act2._T_14.data, Q_s_Act3._T_18.data) @[Q_table.scala 37:29]
    node _GEN_14 = validif(_T_12, _GEN_8) @[Q_table.scala 37:29]
    node _GEN_15 = validif(_T_12, _GEN_2) @[Q_table.scala 37:29]
    node _GEN_16 = mux(_T_12, _GEN_0, UInt<1>("h0")) @[Q_table.scala 37:29]
    node _GEN_17 = validif(_T_12, _GEN_5) @[Q_table.scala 37:29]
    node _GEN_18 = validif(_T_12, _GEN_6) @[Q_table.scala 37:29]
    node _GEN_19 = mux(_T_12, UInt<1>("h0"), UInt<1>("h1")) @[Q_table.scala 37:29]
    node _GEN_20 = validif(eq(_T_12, UInt<1>("h0")), _T_17) @[Q_table.scala 37:29]
    node _GEN_21 = validif(eq(_T_12, UInt<1>("h0")), clock) @[Q_table.scala 37:29]
    node _GEN_22 = validif(eq(_T_12, UInt<1>("h0")), _GEN_9) @[Q_table.scala 37:29]
    node _GEN_23 = validif(eq(_T_12, UInt<1>("h0")), _GEN_2) @[Q_table.scala 37:29]
    node _GEN_24 = mux(_T_12, UInt<1>("h0"), _GEN_0) @[Q_table.scala 37:29]
    node _GEN_25 = validif(eq(_T_12, UInt<1>("h0")), _GEN_5) @[Q_table.scala 37:29]
    node _GEN_26 = validif(eq(_T_12, UInt<1>("h0")), _GEN_6) @[Q_table.scala 37:29]
    node _GEN_27 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Q_table.scala 32:29]
    node _GEN_28 = validif(_T_7, _T_8) @[Q_table.scala 32:29]
    node _GEN_29 = validif(_T_7, clock) @[Q_table.scala 32:29]
    node _GEN_30 = mux(_T_7, Q_s_Act1._T_9.data, _GEN_13) @[Q_table.scala 32:29]
    node _GEN_31 = validif(_T_7, _GEN_7) @[Q_table.scala 32:29]
    node _GEN_32 = validif(_T_7, _GEN_2) @[Q_table.scala 32:29]
    node _GEN_33 = mux(_T_7, _GEN_0, UInt<1>("h0")) @[Q_table.scala 32:29]
    node _GEN_34 = validif(_T_7, _GEN_5) @[Q_table.scala 32:29]
    node _GEN_35 = validif(_T_7, _GEN_6) @[Q_table.scala 32:29]
    node _GEN_36 = mux(_T_7, UInt<1>("h0"), _GEN_10) @[Q_table.scala 32:29]
    node _GEN_37 = validif(eq(_T_7, UInt<1>("h0")), _GEN_11) @[Q_table.scala 32:29]
    node _GEN_38 = validif(eq(_T_7, UInt<1>("h0")), _GEN_12) @[Q_table.scala 32:29]
    node _GEN_39 = validif(eq(_T_7, UInt<1>("h0")), _GEN_14) @[Q_table.scala 32:29]
    node _GEN_40 = validif(eq(_T_7, UInt<1>("h0")), _GEN_15) @[Q_table.scala 32:29]
    node _GEN_41 = mux(_T_7, UInt<1>("h0"), _GEN_16) @[Q_table.scala 32:29]
    node _GEN_42 = validif(eq(_T_7, UInt<1>("h0")), _GEN_17) @[Q_table.scala 32:29]
    node _GEN_43 = validif(eq(_T_7, UInt<1>("h0")), _GEN_18) @[Q_table.scala 32:29]
    node _GEN_44 = mux(_T_7, UInt<1>("h0"), _GEN_19) @[Q_table.scala 32:29]
    node _GEN_45 = validif(eq(_T_7, UInt<1>("h0")), _GEN_20) @[Q_table.scala 32:29]
    node _GEN_46 = validif(eq(_T_7, UInt<1>("h0")), _GEN_21) @[Q_table.scala 32:29]
    node _GEN_47 = validif(eq(_T_7, UInt<1>("h0")), _GEN_22) @[Q_table.scala 32:29]
    node _GEN_48 = validif(eq(_T_7, UInt<1>("h0")), _GEN_23) @[Q_table.scala 32:29]
    node _GEN_49 = mux(_T_7, UInt<1>("h0"), _GEN_24) @[Q_table.scala 32:29]
    node _GEN_50 = validif(eq(_T_7, UInt<1>("h0")), _GEN_25) @[Q_table.scala 32:29]
    node _GEN_51 = validif(eq(_T_7, UInt<1>("h0")), _GEN_26) @[Q_table.scala 32:29]
    node _GEN_52 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[Q_table.scala 26:23]
    node _GEN_53 = validif(_T, _T_1) @[Q_table.scala 26:23]
    node _GEN_54 = validif(_T, clock) @[Q_table.scala 26:23]
    node _GEN_55 = mux(_T, _GEN_3, _GEN_30) @[Q_table.scala 26:23]
    node _GEN_56 = mux(_T, _GEN_0, UInt<1>("h0")) @[Q_table.scala 26:23]
    node _GEN_57 = validif(_T, _GEN_1) @[Q_table.scala 26:23]
    node _GEN_58 = validif(_T, _GEN_2) @[Q_table.scala 26:23]
    node _GEN_59 = validif(_T, _GEN_4) @[Q_table.scala 26:23]
    node _GEN_60 = validif(_T, _GEN_5) @[Q_table.scala 26:23]
    node _GEN_61 = validif(_T, _GEN_6) @[Q_table.scala 26:23]
    node _GEN_62 = mux(_T, UInt<1>("h0"), _GEN_27) @[Q_table.scala 26:23]
    node _GEN_63 = validif(eq(_T, UInt<1>("h0")), _GEN_28) @[Q_table.scala 26:23]
    node _GEN_64 = validif(eq(_T, UInt<1>("h0")), _GEN_29) @[Q_table.scala 26:23]
    node _GEN_65 = validif(eq(_T, UInt<1>("h0")), _GEN_31) @[Q_table.scala 26:23]
    node _GEN_66 = validif(eq(_T, UInt<1>("h0")), _GEN_32) @[Q_table.scala 26:23]
    node _GEN_67 = mux(_T, UInt<1>("h0"), _GEN_33) @[Q_table.scala 26:23]
    node _GEN_68 = validif(eq(_T, UInt<1>("h0")), _GEN_34) @[Q_table.scala 26:23]
    node _GEN_69 = validif(eq(_T, UInt<1>("h0")), _GEN_35) @[Q_table.scala 26:23]
    node _GEN_70 = mux(_T, UInt<1>("h0"), _GEN_36) @[Q_table.scala 26:23]
    node _GEN_71 = validif(eq(_T, UInt<1>("h0")), _GEN_37) @[Q_table.scala 26:23]
    node _GEN_72 = validif(eq(_T, UInt<1>("h0")), _GEN_38) @[Q_table.scala 26:23]
    node _GEN_73 = validif(eq(_T, UInt<1>("h0")), _GEN_39) @[Q_table.scala 26:23]
    node _GEN_74 = validif(eq(_T, UInt<1>("h0")), _GEN_40) @[Q_table.scala 26:23]
    node _GEN_75 = mux(_T, UInt<1>("h0"), _GEN_41) @[Q_table.scala 26:23]
    node _GEN_76 = validif(eq(_T, UInt<1>("h0")), _GEN_42) @[Q_table.scala 26:23]
    node _GEN_77 = validif(eq(_T, UInt<1>("h0")), _GEN_43) @[Q_table.scala 26:23]
    node _GEN_78 = mux(_T, UInt<1>("h0"), _GEN_44) @[Q_table.scala 26:23]
    node _GEN_79 = validif(eq(_T, UInt<1>("h0")), _GEN_45) @[Q_table.scala 26:23]
    node _GEN_80 = validif(eq(_T, UInt<1>("h0")), _GEN_46) @[Q_table.scala 26:23]
    node _GEN_81 = validif(eq(_T, UInt<1>("h0")), _GEN_47) @[Q_table.scala 26:23]
    node _GEN_82 = validif(eq(_T, UInt<1>("h0")), _GEN_48) @[Q_table.scala 26:23]
    node _GEN_83 = mux(_T, UInt<1>("h0"), _GEN_49) @[Q_table.scala 26:23]
    node _GEN_84 = validif(eq(_T, UInt<1>("h0")), _GEN_50) @[Q_table.scala 26:23]
    node _GEN_85 = validif(eq(_T, UInt<1>("h0")), _GEN_51) @[Q_table.scala 26:23]
    node _T_21 = bits(io_new_state, 4, 0) @[Q_table.scala 49:30]
    node _T_23 = bits(io_new_state, 4, 0) @[Q_table.scala 50:30]
    node _T_25 = bits(io_new_state, 4, 0) @[Q_table.scala 51:30]
    node _T_27 = bits(io_new_state, 4, 0) @[Q_table.scala 52:30]
    node _T_29 = bits(io_state, 4, 0) @[Q_table.scala 55:31]
    node _T_31 = bits(io_state, 4, 0) @[Q_table.scala 56:31]
    node _T_33 = bits(io_state, 4, 0) @[Q_table.scala 57:31]
    node _T_35 = bits(io_state, 4, 0) @[Q_table.scala 58:31]
    node _T_37 = bits(io_state, 4, 0) @[Q_table.scala 62:40]
    node _T_39 = bits(io_state, 4, 0) @[Q_table.scala 63:40]
    node _T_41 = bits(io_state, 4, 0) @[Q_table.scala 64:40]
    node _T_43 = bits(io_state, 4, 0) @[Q_table.scala 65:40]
    io_Q_s_a <= _GEN_55 @[Q_table.scala 27:13 Q_table.scala 29:15 Q_table.scala 33:13 Q_table.scala 38:13 Q_table.scala 43:13]
    io_Q_prime_max <= max4.io_Q_prime_max @[Q_table.scala 53:17]
    io_action_at_Qmax <= index_of_Q_max.io_action_at_Qmax @[Q_table.scala 67:20]
    max4.clock <= clock
    max4.reset <= reset
    max4.io_ins0 <= Q_s_Act0._T_22.data @[Q_table.scala 49:15]
    max4.io_ins1 <= Q_s_Act1._T_24.data @[Q_table.scala 50:15]
    max4.io_ins2 <= Q_s_Act2._T_26.data @[Q_table.scala 51:15]
    max4.io_ins3 <= Q_s_Act3._T_28.data @[Q_table.scala 52:15]
    max41.clock <= clock
    max41.reset <= reset
    max41.io_ins0 <= Q_s_Act0._T_30.data @[Q_table.scala 55:16]
    max41.io_ins1 <= Q_s_Act1._T_32.data @[Q_table.scala 56:16]
    max41.io_ins2 <= Q_s_Act2._T_34.data @[Q_table.scala 57:16]
    max41.io_ins3 <= Q_s_Act3._T_36.data @[Q_table.scala 58:16]
    index_of_Q_max.clock <= clock
    index_of_Q_max.reset <= reset
    index_of_Q_max.io_ins0 <= Q_s_Act0._T_38.data @[Q_table.scala 62:25]
    index_of_Q_max.io_ins1 <= Q_s_Act0._T_40.data @[Q_table.scala 63:25]
    index_of_Q_max.io_ins2 <= Q_s_Act0._T_42.data @[Q_table.scala 64:25]
    index_of_Q_max.io_ins3 <= Q_s_Act0._T_44.data @[Q_table.scala 65:25]
    index_of_Q_max.io_Q_max_at_state_s <= max41.io_Q_prime_max @[Q_table.scala 66:37]
    Q_s_Act0._T_2.addr <= _GEN_53 @[Q_table.scala 27:28]
    Q_s_Act0._T_2.en <= _GEN_52 @[Q_table.scala 19:27 Q_table.scala 27:28]
    Q_s_Act0._T_2.clk <= _GEN_54 @[Q_table.scala 27:28]
    Q_s_Act0._T_4.addr <= _GEN_57 @[Q_table.scala 29:30]
    Q_s_Act0._T_4.en <= _GEN_56 @[Q_table.scala 19:27 Q_table.scala 29:30]
    Q_s_Act0._T_4.clk <= _GEN_58 @[Q_table.scala 29:30]
    Q_s_Act0._T_22.addr <= _T_21 @[Q_table.scala 49:30]
    Q_s_Act0._T_22.en <= UInt<1>("h1") @[Q_table.scala 19:27 Q_table.scala 49:30]
    Q_s_Act0._T_22.clk <= clock @[Q_table.scala 49:30]
    Q_s_Act0._T_30.addr <= _T_29 @[Q_table.scala 55:31]
    Q_s_Act0._T_30.en <= UInt<1>("h1") @[Q_table.scala 19:27 Q_table.scala 55:31]
    Q_s_Act0._T_30.clk <= clock @[Q_table.scala 55:31]
    Q_s_Act0._T_38.addr <= _T_37 @[Q_table.scala 62:40]
    Q_s_Act0._T_38.en <= UInt<1>("h1") @[Q_table.scala 19:27 Q_table.scala 62:40]
    Q_s_Act0._T_38.clk <= clock @[Q_table.scala 62:40]
    Q_s_Act0._T_40.addr <= _T_39 @[Q_table.scala 63:40]
    Q_s_Act0._T_40.en <= UInt<1>("h1") @[Q_table.scala 19:27 Q_table.scala 63:40]
    Q_s_Act0._T_40.clk <= clock @[Q_table.scala 63:40]
    Q_s_Act0._T_42.addr <= _T_41 @[Q_table.scala 64:40]
    Q_s_Act0._T_42.en <= UInt<1>("h1") @[Q_table.scala 19:27 Q_table.scala 64:40]
    Q_s_Act0._T_42.clk <= clock @[Q_table.scala 64:40]
    Q_s_Act0._T_44.addr <= _T_43 @[Q_table.scala 65:40]
    Q_s_Act0._T_44.en <= UInt<1>("h1") @[Q_table.scala 19:27 Q_table.scala 65:40]
    Q_s_Act0._T_44.clk <= clock @[Q_table.scala 65:40]
    Q_s_Act0._T_6.addr <= _GEN_59
    Q_s_Act0._T_6.en <= _GEN_56 @[Q_table.scala 19:27]
    Q_s_Act0._T_6.clk <= _GEN_58
    Q_s_Act0._T_6.data <= _GEN_61
    Q_s_Act0._T_6.mask <= _GEN_60
    Q_s_Act0._T_20.addr <= _GEN_81
    Q_s_Act0._T_20.en <= _GEN_83 @[Q_table.scala 19:27]
    Q_s_Act0._T_20.clk <= _GEN_82
    Q_s_Act0._T_20.data <= _GEN_85
    Q_s_Act0._T_20.mask <= _GEN_84
    Q_s_Act1._T_9.addr <= _GEN_63 @[Q_table.scala 33:28]
    Q_s_Act1._T_9.en <= _GEN_62 @[Q_table.scala 20:27 Q_table.scala 33:28]
    Q_s_Act1._T_9.clk <= _GEN_64 @[Q_table.scala 33:28]
    Q_s_Act1._T_24.addr <= _T_23 @[Q_table.scala 50:30]
    Q_s_Act1._T_24.en <= UInt<1>("h1") @[Q_table.scala 20:27 Q_table.scala 50:30]
    Q_s_Act1._T_24.clk <= clock @[Q_table.scala 50:30]
    Q_s_Act1._T_32.addr <= _T_31 @[Q_table.scala 56:31]
    Q_s_Act1._T_32.en <= UInt<1>("h1") @[Q_table.scala 20:27 Q_table.scala 56:31]
    Q_s_Act1._T_32.clk <= clock @[Q_table.scala 56:31]
    Q_s_Act1._T_11.addr <= _GEN_65
    Q_s_Act1._T_11.en <= _GEN_67 @[Q_table.scala 20:27]
    Q_s_Act1._T_11.clk <= _GEN_66
    Q_s_Act1._T_11.data <= _GEN_69
    Q_s_Act1._T_11.mask <= _GEN_68
    Q_s_Act2._T_14.addr <= _GEN_71 @[Q_table.scala 38:28]
    Q_s_Act2._T_14.en <= _GEN_70 @[Q_table.scala 21:27 Q_table.scala 38:28]
    Q_s_Act2._T_14.clk <= _GEN_72 @[Q_table.scala 38:28]
    Q_s_Act2._T_26.addr <= _T_25 @[Q_table.scala 51:30]
    Q_s_Act2._T_26.en <= UInt<1>("h1") @[Q_table.scala 21:27 Q_table.scala 51:30]
    Q_s_Act2._T_26.clk <= clock @[Q_table.scala 51:30]
    Q_s_Act2._T_34.addr <= _T_33 @[Q_table.scala 57:31]
    Q_s_Act2._T_34.en <= UInt<1>("h1") @[Q_table.scala 21:27 Q_table.scala 57:31]
    Q_s_Act2._T_34.clk <= clock @[Q_table.scala 57:31]
    Q_s_Act2._T_16.addr <= _GEN_73
    Q_s_Act2._T_16.en <= _GEN_75 @[Q_table.scala 21:27]
    Q_s_Act2._T_16.clk <= _GEN_74
    Q_s_Act2._T_16.data <= _GEN_77
    Q_s_Act2._T_16.mask <= _GEN_76
    Q_s_Act3._T_18.addr <= _GEN_79 @[Q_table.scala 43:28]
    Q_s_Act3._T_18.en <= _GEN_78 @[Q_table.scala 22:27 Q_table.scala 43:28]
    Q_s_Act3._T_18.clk <= _GEN_80 @[Q_table.scala 43:28]
    Q_s_Act3._T_28.addr <= _T_27 @[Q_table.scala 52:30]
    Q_s_Act3._T_28.en <= UInt<1>("h1") @[Q_table.scala 22:27 Q_table.scala 52:30]
    Q_s_Act3._T_28.clk <= clock @[Q_table.scala 52:30]
    Q_s_Act3._T_36.addr <= _T_35 @[Q_table.scala 58:31]
    Q_s_Act3._T_36.en <= UInt<1>("h1") @[Q_table.scala 22:27 Q_table.scala 58:31]
    Q_s_Act3._T_36.clk <= clock @[Q_table.scala 58:31]
    state <= mux(reset, UInt<6>("h0"), io_state) @[Q_table.scala 24:8]

  module Routing :
    input clock : Clock
    input reset : UInt<1>
    input io_routing : UInt<1>
    input io_starting_state : UInt<6>
    output io_path : UInt<6>
    output io_done : UInt<1>
    output io_state_out : UInt<6>
    input io_act : UInt<2>
  
    reg state : UInt<6>, clock with :
      reset => (UInt<1>("h0"), state) @[Routing.scala 17:20]
    node _T = rem(state, UInt<3>("h5")) @[Routing.scala 19:16]
    node _T_1 = div(state, UInt<3>("h5")) @[Routing.scala 20:16]
    node _T_2 = eq(io_act, UInt<1>("h0")) @[Routing.scala 21:17]
    node _T_3 = add(_T_1, UInt<1>("h1")) @[Routing.scala 22:23]
    node _T_4 = tail(_T_3, 1) @[Routing.scala 22:23]
    node _T_5 = mul(UInt<3>("h5"), _T_4) @[Routing.scala 22:19]
    node _T_6 = add(_T, _T_5) @[Routing.scala 22:15]
    node _T_7 = tail(_T_6, 1) @[Routing.scala 22:15]
    node _T_8 = eq(io_act, UInt<1>("h1")) @[Routing.scala 23:23]
    node _T_9 = sub(_T, UInt<1>("h1")) @[Routing.scala 24:19]
    node _T_10 = tail(_T_9, 1) @[Routing.scala 24:19]
    node _T_11 = mul(UInt<3>("h5"), _T_1) @[Routing.scala 24:29]
    node _T_12 = add(_T_10, _T_11) @[Routing.scala 24:25]
    node _T_13 = tail(_T_12, 1) @[Routing.scala 24:25]
    node _T_14 = eq(io_act, UInt<2>("h2")) @[Routing.scala 25:23]
    node _T_15 = sub(_T_1, UInt<1>("h1")) @[Routing.scala 26:23]
    node _T_16 = tail(_T_15, 1) @[Routing.scala 26:23]
    node _T_17 = mul(UInt<3>("h5"), _T_16) @[Routing.scala 26:19]
    node _T_18 = add(_T, _T_17) @[Routing.scala 26:15]
    node _T_19 = tail(_T_18, 1) @[Routing.scala 26:15]
    node _T_20 = add(_T, UInt<1>("h1")) @[Routing.scala 28:18]
    node _T_21 = tail(_T_20, 1) @[Routing.scala 28:18]
    node _T_22 = mul(UInt<3>("h5"), _T_1) @[Routing.scala 28:28]
    node _T_23 = add(_T_21, _T_22) @[Routing.scala 28:24]
    node _T_24 = tail(_T_23, 1) @[Routing.scala 28:24]
    node _GEN_0 = mux(_T_14, _T_19, _T_24) @[Routing.scala 25:32]
    node _GEN_1 = mux(_T_8, _T_13, _GEN_0) @[Routing.scala 23:32]
    node _GEN_2 = mux(_T_2, _T_7, _GEN_1) @[Routing.scala 21:26]
    node _T_25 = eq(state, UInt<5>("h17")) @[Routing.scala 32:15]
    node _GEN_3 = mux(_T_25, UInt<1>("h1"), UInt<1>("h0")) @[Routing.scala 32:23]
    node _GEN_4 = mux(io_routing, _GEN_2, io_starting_state) @[Routing.scala 18:19]
    node _GEN_5 = mux(io_routing, state, UInt<1>("h0")) @[Routing.scala 18:19]
    node _GEN_6 = mux(io_routing, _GEN_3, UInt<1>("h0")) @[Routing.scala 18:19]
    io_path <= _GEN_5 @[Routing.scala 14:10 Routing.scala 31:12]
    io_done <= _GEN_6 @[Routing.scala 15:10 Routing.scala 16:10 Routing.scala 33:14]
    io_state_out <= _GEN_5 @[Routing.scala 13:15 Routing.scala 30:17]
    state <= mux(reset, UInt<6>("h0"), bits(_GEN_4, 5, 0)) @[Routing.scala 22:12 Routing.scala 24:13 Routing.scala 26:12 Routing.scala 28:12 Routing.scala 36:10]

  module QtableRouting :
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
    input io_routing : UInt<1>
    output io_path : UInt<6>
    output io_done : UInt<1>
  
    inst Q_tab of Qtable @[combineQandRouting.scala 19:19]
    inst routing of Routing @[combineQandRouting.scala 20:21]
    io_Q_s_a <= Q_tab.io_Q_s_a @[combineQandRouting.scala 28:11]
    io_Q_prime_max <= Q_tab.io_Q_prime_max @[combineQandRouting.scala 27:17]
    io_action_at_Qmax <= Q_tab.io_action_at_Qmax @[combineQandRouting.scala 26:26]
    io_path <= routing.io_path @[combineQandRouting.scala 25:18]
    io_done <= routing.io_done @[combineQandRouting.scala 24:18]
    Q_tab.clock <= clock
    Q_tab.reset <= reset
    Q_tab.io_state <= io_state @[combineQandRouting.scala 23:23 combineQandRouting.scala 30:11]
    Q_tab.io_new_state <= io_new_state @[combineQandRouting.scala 31:15]
    Q_tab.io_act <= io_act @[combineQandRouting.scala 34:15]
    Q_tab.io_wrEna <= io_wrEna @[combineQandRouting.scala 32:17]
    Q_tab.io_Q_updated <= io_Q_updated @[combineQandRouting.scala 36:21]
    routing.clock <= clock
    routing.reset <= reset
    routing.io_routing <= io_routing @[combineQandRouting.scala 21:21]
    routing.io_starting_state <= UInt<1>("h0") @[combineQandRouting.scala 22:28]
    routing.io_act <= Q_tab.io_action_at_Qmax @[combineQandRouting.scala 33:17]
