import chisel3._
import chisel3.util._

class Q_function extends Module {
  val io = IO(new Bundle {
    val Q_s_a = Input(SInt(16.W))
    val Q_prime_max = Input(SInt(16.W)) // the maximum Q value in the next state
    val Q_updated = Output(SInt(16.W))    //17 bit is adequate 18 because 1 for signed bit
    val cal=Input(Bool())
    val reward=Input(SInt(9.W))
    val wrEna=Output(Bool())
  })
  val Q_s_a=RegInit(0.S(16.W))
  val reward=RegInit(0.S(9.W))
  val test = (io.Q_prime_max << 1).asSInt / 5.S
  //val test = (io.Q_prime_max >> 2).asSInt + (io.Q_prime_max >> 3).asSInt + (io.Q_prime_max >> 6).asSInt
  //val test = (io.Q_prime_max >> 1).asSInt
  Q_s_a:=io.Q_s_a
  reward:=io.reward
  when(io.cal){
    //io.Q_updated :=(Q_s_a+reward*128.S)/2.S +(io.Q_prime_max*2.S/5.S )
    io.Q_updated := (Q_s_a >> 1).asSInt + (reward << 6).asSInt + test
    //io.Q_updated := (Q_s_a >> 1).asSInt + (reward << 6).asSInt + (io.Q_prime_max >> 2).asSInt + (io.Q_prime_max >> 3).asSInt + (io.Q_prime_max >> 4).asSInt
    io.wrEna:=true.B
  }otherwise{
    io.Q_updated:=0.S
    io.wrEna:=false.B
  }
}