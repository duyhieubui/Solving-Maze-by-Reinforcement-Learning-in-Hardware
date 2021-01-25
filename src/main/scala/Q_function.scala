import chisel3._
import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters.Driver
import chisel3.util._
import org.scalatest._
class Q_function extends Module {
  val io = IO(new Bundle {
    val Q_s_a = Input(SInt(16.W))
    val Q_prime_max = Input(SInt(16.W)) // the maximum Q value in the next state
    val Q_updated = Output(SInt(16.W))    //17 bit is adequate 18 because 1 for signed bit
    val cal=Input(Bool())
    val reward=Input(SInt(9.W))
    val wrEna=Output(Bool())
  })
  //val Q_prime_max=RegInit(0.S(21.W))
  val Q_s_a=RegInit(0.S(16.W))
  val reward=RegInit(0.S(9.W))
  Q_s_a:=io.Q_s_a
 // Q_prime_max:=io.Q_prime_max
  reward:=io.reward
  val a=Q_s_a>>1
  val b=reward<<6
  val c=io.Q_prime_max<<2
  val d=io.Q_prime_max/10.S
  when(io.cal){
    io.Q_updated :=a+b+c+d
    io.wrEna:=true.B
  }otherwise{
    io.Q_updated:=0.S
    io.wrEna:=false.B
  }
}
class Q_tester(dut:Q_function) extends PeekPokeTester(dut){
  poke(dut.io.cal,0)
  step(4)
  poke(dut.io.reward,-50)
  poke(dut.io.Q_s_a,1647)
  poke(dut.io.Q_prime_max, -2467)
  poke(dut.io.cal, 1)
  step(3)
  println("out is: "+peek(dut.io.Q_updated).toString())
}

object Q_tester extends App {
  chisel3.iotesters.Driver(() => new   Q_function() ) { c =>
    new Q_tester(c)
  }
}