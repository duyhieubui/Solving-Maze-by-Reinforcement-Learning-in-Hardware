;buildInfoPackage: chisel3, version: 3.2.2, scalaVersion: 2.11.12, sbtVersion: 1.3.2
circuit DeviceUnderTest : 
  module DeviceUnderTest : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<5>, flip b : UInt<5>, out : UInt<5>}
    
    node _T = and(io.a, io.b) @[DeviceUnderTest.scala 12:18]
    io.out <= _T @[DeviceUnderTest.scala 12:10]
    
