//import chisel3._
//import chisel3.iotesters.PeekPokeTester
//import chisel3.iotesters.Driver
//import org.scalatest._
//import scala.io.Source
//import java.io._
//import scala.util.control.Breaks._
//
//class AgentBrainTester(dut:MasterFMS) extends PeekPokeTester(dut){
//  step(2)
//  poke(dut.io.iterate,false.B)
//  step(6)
//  poke(dut.io.move_to_confirming_Reward,true.B)
//  step(6)
//  poke(dut.io.done_learning,true.B)
//  step(5)
//}
//class AgentBrainWaveform extends FlatSpec with Matchers {
//  " WaveformCounter" should "pass" in {
//    Driver.execute(Array("--generate-vcd-output", "on"), () =>
//      new MasterFMS()) { c =>
//      new AgentBrainTester(c)
//    } should be (true)
//  }
//}