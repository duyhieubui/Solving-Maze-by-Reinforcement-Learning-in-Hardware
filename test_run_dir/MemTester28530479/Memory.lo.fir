circuit Memory :
  module MaxPeriodFibonacciLFSR :
    input clock : Clock
    input reset : UInt<1>
    input io_seed_valid : UInt<1>
    input io_seed_bits_0 : UInt<1>
    input io_seed_bits_1 : UInt<1>
    input io_seed_bits_2 : UInt<1>
    input io_seed_bits_3 : UInt<1>
    input io_seed_bits_4 : UInt<1>
    input io_seed_bits_5 : UInt<1>
    input io_seed_bits_6 : UInt<1>
    input io_seed_bits_7 : UInt<1>
    input io_seed_bits_8 : UInt<1>
    input io_seed_bits_9 : UInt<1>
    input io_increment : UInt<1>
    output io_out_0 : UInt<1>
    output io_out_1 : UInt<1>
    output io_out_2 : UInt<1>
    output io_out_3 : UInt<1>
    output io_out_4 : UInt<1>
    output io_out_5 : UInt<1>
    output io_out_6 : UInt<1>
    output io_out_7 : UInt<1>
    output io_out_8 : UInt<1>
    output io_out_9 : UInt<1>
  
    reg state_0 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_0) @[PRNG.scala 47:50]
    reg state_1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_1) @[PRNG.scala 47:50]
    reg state_2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_2) @[PRNG.scala 47:50]
    reg state_3 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_3) @[PRNG.scala 47:50]
    reg state_4 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_4) @[PRNG.scala 47:50]
    reg state_5 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_5) @[PRNG.scala 47:50]
    reg state_6 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_6) @[PRNG.scala 47:50]
    reg state_7 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_7) @[PRNG.scala 47:50]
    reg state_8 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_8) @[PRNG.scala 47:50]
    reg state_9 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), state_9) @[PRNG.scala 47:50]
    node _T_1 = xor(state_9, state_6) @[LFSR.scala 15:41]
    node _GEN_0 = mux(io_increment, _T_1, state_0) @[PRNG.scala 61:23]
    node _GEN_1 = mux(io_increment, state_0, state_1) @[PRNG.scala 61:23]
    node _GEN_2 = mux(io_increment, state_1, state_2) @[PRNG.scala 61:23]
    node _GEN_3 = mux(io_increment, state_2, state_3) @[PRNG.scala 61:23]
    node _GEN_4 = mux(io_increment, state_3, state_4) @[PRNG.scala 61:23]
    node _GEN_5 = mux(io_increment, state_4, state_5) @[PRNG.scala 61:23]
    node _GEN_6 = mux(io_increment, state_5, state_6) @[PRNG.scala 61:23]
    node _GEN_7 = mux(io_increment, state_6, state_7) @[PRNG.scala 61:23]
    node _GEN_8 = mux(io_increment, state_7, state_8) @[PRNG.scala 61:23]
    node _GEN_9 = mux(io_increment, state_8, state_9) @[PRNG.scala 61:23]
    node _GEN_10 = mux(io_seed_valid, io_seed_bits_0, _GEN_0) @[PRNG.scala 65:25]
    node _GEN_11 = mux(io_seed_valid, io_seed_bits_1, _GEN_1) @[PRNG.scala 65:25]
    node _GEN_12 = mux(io_seed_valid, io_seed_bits_2, _GEN_2) @[PRNG.scala 65:25]
    node _GEN_13 = mux(io_seed_valid, io_seed_bits_3, _GEN_3) @[PRNG.scala 65:25]
    node _GEN_14 = mux(io_seed_valid, io_seed_bits_4, _GEN_4) @[PRNG.scala 65:25]
    node _GEN_15 = mux(io_seed_valid, io_seed_bits_5, _GEN_5) @[PRNG.scala 65:25]
    node _GEN_16 = mux(io_seed_valid, io_seed_bits_6, _GEN_6) @[PRNG.scala 65:25]
    node _GEN_17 = mux(io_seed_valid, io_seed_bits_7, _GEN_7) @[PRNG.scala 65:25]
    node _GEN_18 = mux(io_seed_valid, io_seed_bits_8, _GEN_8) @[PRNG.scala 65:25]
    node _GEN_19 = mux(io_seed_valid, io_seed_bits_9, _GEN_9) @[PRNG.scala 65:25]
    node _T__0 = UInt<1>("h1") @[PRNG.scala 38:28 PRNG.scala 38:28]
    node _T__1 = UInt<1>("h0") @[PRNG.scala 38:28 PRNG.scala 38:28]
    node _T__2 = UInt<1>("h0") @[PRNG.scala 38:28 PRNG.scala 38:28]
    node _T__3 = UInt<1>("h0") @[PRNG.scala 38:28 PRNG.scala 38:28]
    node _T__4 = UInt<1>("h0") @[PRNG.scala 38:28 PRNG.scala 38:28]
    node _T__5 = UInt<1>("h0") @[PRNG.scala 38:28 PRNG.scala 38:28]
    node _T__6 = UInt<1>("h0") @[PRNG.scala 38:28 PRNG.scala 38:28]
    node _T__7 = UInt<1>("h0") @[PRNG.scala 38:28 PRNG.scala 38:28]
    node _T__8 = UInt<1>("h0") @[PRNG.scala 38:28 PRNG.scala 38:28]
    node _T__9 = UInt<1>("h0") @[PRNG.scala 38:28 PRNG.scala 38:28]
    io_out_0 <= state_0 @[PRNG.scala 69:10]
    io_out_1 <= state_1 @[PRNG.scala 69:10]
    io_out_2 <= state_2 @[PRNG.scala 69:10]
    io_out_3 <= state_3 @[PRNG.scala 69:10]
    io_out_4 <= state_4 @[PRNG.scala 69:10]
    io_out_5 <= state_5 @[PRNG.scala 69:10]
    io_out_6 <= state_6 @[PRNG.scala 69:10]
    io_out_7 <= state_7 @[PRNG.scala 69:10]
    io_out_8 <= state_8 @[PRNG.scala 69:10]
    io_out_9 <= state_9 @[PRNG.scala 69:10]
    state_0 <= mux(reset, _T__0, _GEN_10) @[PRNG.scala 62:11 PRNG.scala 66:11]
    state_1 <= mux(reset, _T__1, _GEN_11) @[PRNG.scala 62:11 PRNG.scala 66:11]
    state_2 <= mux(reset, _T__2, _GEN_12) @[PRNG.scala 62:11 PRNG.scala 66:11]
    state_3 <= mux(reset, _T__3, _GEN_13) @[PRNG.scala 62:11 PRNG.scala 66:11]
    state_4 <= mux(reset, _T__4, _GEN_14) @[PRNG.scala 62:11 PRNG.scala 66:11]
    state_5 <= mux(reset, _T__5, _GEN_15) @[PRNG.scala 62:11 PRNG.scala 66:11]
    state_6 <= mux(reset, _T__6, _GEN_16) @[PRNG.scala 62:11 PRNG.scala 66:11]
    state_7 <= mux(reset, _T__7, _GEN_17) @[PRNG.scala 62:11 PRNG.scala 66:11]
    state_8 <= mux(reset, _T__8, _GEN_18) @[PRNG.scala 62:11 PRNG.scala 66:11]
    state_9 <= mux(reset, _T__9, _GEN_19) @[PRNG.scala 62:11 PRNG.scala 66:11]

  module Memory :
    input clock : Clock
    input reset : UInt<1>
    output io_rand1 : UInt<10>
    output io_rand2 : UInt<10>
  
    inst MaxPeriodFibonacciLFSR of MaxPeriodFibonacciLFSR @[PRNG.scala 82:22]
    inst MaxPeriodFibonacciLFSR_1 of MaxPeriodFibonacciLFSR @[PRNG.scala 82:22]
    node _T = cat(MaxPeriodFibonacciLFSR.io_out_1, MaxPeriodFibonacciLFSR.io_out_0) @[PRNG.scala 86:17]
    node _T_1 = cat(MaxPeriodFibonacciLFSR.io_out_4, MaxPeriodFibonacciLFSR.io_out_3) @[PRNG.scala 86:17]
    node _T_2 = cat(_T_1, MaxPeriodFibonacciLFSR.io_out_2) @[PRNG.scala 86:17]
    node _T_3 = cat(_T_2, _T) @[PRNG.scala 86:17]
    node _T_4 = cat(MaxPeriodFibonacciLFSR.io_out_6, MaxPeriodFibonacciLFSR.io_out_5) @[PRNG.scala 86:17]
    node _T_5 = cat(MaxPeriodFibonacciLFSR.io_out_9, MaxPeriodFibonacciLFSR.io_out_8) @[PRNG.scala 86:17]
    node _T_6 = cat(_T_5, MaxPeriodFibonacciLFSR.io_out_7) @[PRNG.scala 86:17]
    node _T_7 = cat(_T_6, _T_4) @[PRNG.scala 86:17]
    node _T_8 = cat(_T_7, _T_3) @[PRNG.scala 86:17]
    node _T_9 = cat(MaxPeriodFibonacciLFSR_1.io_out_1, MaxPeriodFibonacciLFSR_1.io_out_0) @[PRNG.scala 86:17]
    node _T_10 = cat(MaxPeriodFibonacciLFSR_1.io_out_4, MaxPeriodFibonacciLFSR_1.io_out_3) @[PRNG.scala 86:17]
    node _T_11 = cat(_T_10, MaxPeriodFibonacciLFSR_1.io_out_2) @[PRNG.scala 86:17]
    node _T_12 = cat(_T_11, _T_9) @[PRNG.scala 86:17]
    node _T_13 = cat(MaxPeriodFibonacciLFSR_1.io_out_6, MaxPeriodFibonacciLFSR_1.io_out_5) @[PRNG.scala 86:17]
    node _T_14 = cat(MaxPeriodFibonacciLFSR_1.io_out_9, MaxPeriodFibonacciLFSR_1.io_out_8) @[PRNG.scala 86:17]
    node _T_15 = cat(_T_14, MaxPeriodFibonacciLFSR_1.io_out_7) @[PRNG.scala 86:17]
    node _T_16 = cat(_T_15, _T_13) @[PRNG.scala 86:17]
    node _T_17 = cat(_T_16, _T_12) @[PRNG.scala 86:17]
    io_rand1 <= _T_8 @[draft.scala 18:11]
    io_rand2 <= _T_17 @[draft.scala 19:11]
    MaxPeriodFibonacciLFSR.clock <= clock
    MaxPeriodFibonacciLFSR.reset <= reset
    MaxPeriodFibonacciLFSR.io_seed_valid <= UInt<1>("h0") @[PRNG.scala 83:24]
    MaxPeriodFibonacciLFSR.io_seed_bits_0 is invalid
    MaxPeriodFibonacciLFSR.io_seed_bits_1 is invalid
    MaxPeriodFibonacciLFSR.io_seed_bits_2 is invalid
    MaxPeriodFibonacciLFSR.io_seed_bits_3 is invalid
    MaxPeriodFibonacciLFSR.io_seed_bits_4 is invalid
    MaxPeriodFibonacciLFSR.io_seed_bits_5 is invalid
    MaxPeriodFibonacciLFSR.io_seed_bits_6 is invalid
    MaxPeriodFibonacciLFSR.io_seed_bits_7 is invalid
    MaxPeriodFibonacciLFSR.io_seed_bits_8 is invalid
    MaxPeriodFibonacciLFSR.io_seed_bits_9 is invalid
    MaxPeriodFibonacciLFSR.io_increment <= UInt<1>("h1") @[PRNG.scala 85:23]
    MaxPeriodFibonacciLFSR_1.clock <= clock
    MaxPeriodFibonacciLFSR_1.reset <= reset
    MaxPeriodFibonacciLFSR_1.io_seed_valid <= UInt<1>("h0") @[PRNG.scala 83:24]
    MaxPeriodFibonacciLFSR_1.io_seed_bits_0 is invalid
    MaxPeriodFibonacciLFSR_1.io_seed_bits_1 is invalid
    MaxPeriodFibonacciLFSR_1.io_seed_bits_2 is invalid
    MaxPeriodFibonacciLFSR_1.io_seed_bits_3 is invalid
    MaxPeriodFibonacciLFSR_1.io_seed_bits_4 is invalid
    MaxPeriodFibonacciLFSR_1.io_seed_bits_5 is invalid
    MaxPeriodFibonacciLFSR_1.io_seed_bits_6 is invalid
    MaxPeriodFibonacciLFSR_1.io_seed_bits_7 is invalid
    MaxPeriodFibonacciLFSR_1.io_seed_bits_8 is invalid
    MaxPeriodFibonacciLFSR_1.io_seed_bits_9 is invalid
    MaxPeriodFibonacciLFSR_1.io_increment <= UInt<1>("h1") @[PRNG.scala 85:23]
