import chisel3._
import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters.Driver
import org.scalatest._
import chisel3.util.random._
import scala.io.Source
import java.io._


class LFSR extends Module{
  val io=IO(new Bundle{
    val rand1=Output(UInt(10.W))
    val rand2=Output(UInt(10.W))
    val get=Input(Bool())
  })
  io.rand1:=0.U
  io.rand2:=0.U
  when(io.get){
    io.rand1:=LFSR(10)
    io.rand2:=LFSR(10)
  }

}
class LFSRTester(dut:LFSR) extends PeekPokeTester(dut){
  step(15)
  poke(dut.io.get,1)
  step(1)
  poke(dut.io.get,0)
  step(15)
}


class LFSRwave extends FlatSpec with Matchers {
  " WaveformCounter" should "pass" in {
    Driver.execute(Array("--generate-vcd-output", "on"), () =>
      new LFSR()) { c =>
      new LFSRTester(c)
    } should be (true)
  }
}
object MemTester extends App {
  chisel3.iotesters.Driver(() => new   LFSR() ) { c =>
    new LFSRTester(c)
  }
}

class reset_signal extends  Module{
  val io=IO(new Bundle{
    val reset_sig=Input(Bool())
    //val out=Output(UInt(4.W))
  })
  val register=RegInit(12.U(4.W))
  val signalReg=Reg(Bool())
  signalReg:=io.reset_sig

  when(signalReg){
    register:=0.U
    signalReg:=false.B

  }
}
class signalTester(dut:reset_signal) extends  PeekPokeTester(dut){
  poke(dut.io.reset_sig,false.B)
  step(5)
  poke(dut.io.reset_sig,true.B)
  step(5)

}




