//import chisel3._
//import chisel3.iotesters.PeekPokeTester
//import chisel3.iotesters.Driver
//import org.scalatest._
//
//import scala.io.Source
//import java.io._
//
//import chisel3.util
//import chisel3.util.random.{LFSR, LFSRReduce, PRNG, XOR}
//class FibonacciLFSR( width: Int, taps: Set[Int],seed: Option[BigInt] = Some(1),val reduction: LFSRReduce = XOR,
//                     step: Int = 1,
//                     updateSeed: Boolean = false) extends PRNG(width, seed, step, updateSeed) with LFSR  {
//
//  def delta(s: Seq[Bool]): Seq[Bool] = taps.map{ case i => s(i - 1) }.reduce(reduction) +: s.dropRight(1)
//
//}
//class LFSR extends Module{
//  val io=IO(new Bundle{
//    val rand1=Output(UInt(10.W))
//    val rand2=Output(UInt(10.W))
//  })
//  val lfsr4 = Module(new FibonacciLFSR(4, Set(4, 3))
//    io.rand1:=LFSR(10)
//  io.rand2:=LFSR(10)
//
//}
//class LFSRTester(dut:LFSR) extends PeekPokeTester(dut){
//  step(120)
//}
//class LFSRwave extends FlatSpec with Matchers {
//  " WaveformCounter" should "pass" in {
//    Driver.execute(Array("--generate-vcd-output", "on"), () =>
//      new LFSR()) { c =>
//      new LFSRTester(c)
//    } should be (true)
//  }
//}
//object MemTester extends App {
//  chisel3.iotesters.Driver(() => new   LFSR() ) { c =>
//    new LFSRTester(c)
//  }
//}
//
//class reset_signal extends  Module{
//  val io=IO(new Bundle{
//    val reset_sig=Input(Bool())
//    //val out=Output(UInt(4.W))
//  })
//  val register=RegInit(12.U(4.W))
//  val signalReg=Reg(Bool())
//  signalReg:=io.reset_sig
//
//  when(signalReg){
//    register:=0.U
//    signalReg:=false.B
//
//  }
//}
//class signalTester(dut:reset_signal) extends  PeekPokeTester(dut){
//  poke(dut.io.reset_sig,false.B)
//  step(5)
//  poke(dut.io.reset_sig,true.B)
//  step(5)
//
//}
//
//
//
//
