circuit Memory :
  module Memory :
    input clock : Clock
    input reset : UInt<1>
    input io_data_in : UInt<10>
    output io_data_out : UInt<10>
    input io_wrEna : UInt<1>
    input io_WrAdd : UInt<8>
    input io_ReadAdd : UInt<8>
  
    mem Mem : @[draft.scala 22:22]
      data-type => UInt<10>
      depth => 100
      read-latency => 1
      write-latency => 1
      reader => _T_3
      writer => _T_1
      read-under-write => undefined
    reg ReadAdd : UInt<10>, clock with :
      reset => (UInt<1>("h0"), ReadAdd) @[draft.scala 18:22]
    reg data_in : UInt<10>, clock with :
      reset => (UInt<1>("h0"), data_in) @[draft.scala 19:22]
    reg WrAdd : UInt<10>, clock with :
      reset => (UInt<1>("h0"), WrAdd) @[draft.scala 21:20]
    reg wrEna : UInt<1>, clock with :
      reset => (UInt<1>("h0"), wrEna) @[draft.scala 23:16]
    node _T = bits(WrAdd, 6, 0)
    node _GEN_0 = validif(wrEna, _T) @[draft.scala 27:14]
    node _GEN_1 = validif(wrEna, clock) @[draft.scala 27:14]
    node _GEN_2 = mux(wrEna, UInt<1>("h1"), UInt<1>("h0")) @[draft.scala 27:14]
    node _GEN_3 = validif(wrEna, UInt<1>("h1")) @[draft.scala 27:14]
    node _GEN_4 = validif(wrEna, data_in) @[draft.scala 27:14]
    node _T_2 = bits(ReadAdd, 6, 0) @[draft.scala 30:24]
    io_data_out <= Mem._T_3.data @[draft.scala 30:14]
    ReadAdd <= mux(reset, UInt<10>("h0"), io_ReadAdd) @[draft.scala 25:10]
    data_in <= mux(reset, UInt<10>("h0"), io_data_in) @[draft.scala 20:10]
    WrAdd <= mux(reset, UInt<10>("h0"), io_WrAdd) @[draft.scala 26:8]
    Mem._T_3.addr <= _T_2 @[draft.scala 30:24]
    Mem._T_3.en <= UInt<1>("h1") @[draft.scala 22:22 draft.scala 30:24]
    Mem._T_3.clk <= clock @[draft.scala 30:24]
    Mem._T_1.addr <= _GEN_0
    Mem._T_1.en <= _GEN_2 @[draft.scala 22:22]
    Mem._T_1.clk <= _GEN_1
    Mem._T_1.data <= _GEN_4
    Mem._T_1.mask <= _GEN_3
    wrEna <= io_wrEna @[draft.scala 24:8]
