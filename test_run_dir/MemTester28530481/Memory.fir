;buildInfoPackage: chisel3, version: 3.2.2, scalaVersion: 2.11.12, sbtVersion: 1.3.2
circuit Memory : 
  module Memory : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip data_in : UInt<10>, data_out : UInt<10>, flip wrEna : UInt<1>, flip WrAdd : UInt<8>, flip ReadAdd : UInt<8>}
    
    reg ReadAdd : UInt<10>, clock with : (reset => (reset, UInt<10>("h00"))) @[draft.scala 18:22]
    reg data_in : UInt<10>, clock with : (reset => (reset, UInt<10>("h00"))) @[draft.scala 19:22]
    data_in <= io.data_in @[draft.scala 20:10]
    reg WrAdd : UInt<10>, clock with : (reset => (reset, UInt<10>("h00"))) @[draft.scala 21:20]
    smem Mem : UInt<10>[100] @[draft.scala 22:22]
    reg wrEna : UInt<1>, clock @[draft.scala 23:16]
    wrEna <= io.wrEna @[draft.scala 24:8]
    ReadAdd <= io.ReadAdd @[draft.scala 25:10]
    WrAdd <= io.WrAdd @[draft.scala 26:8]
    when wrEna : @[draft.scala 27:14]
      node _T = bits(WrAdd, 6, 0)
      write mport _T_1 = Mem[_T], clock
      _T_1 <= data_in
      skip @[draft.scala 27:14]
    node _T_2 = bits(ReadAdd, 6, 0) @[draft.scala 30:24]
    read mport _T_3 = Mem[_T_2], clock @[draft.scala 30:24]
    io.data_out <= _T_3 @[draft.scala 30:14]
    
