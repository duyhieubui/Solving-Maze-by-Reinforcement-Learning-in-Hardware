import chisel3._

class Q_function extends Module {
  val io = IO(new Bundle {
    val Q_s_a = Input(SInt(21.W))
    val Q_prime_max = Input(SInt(21.W)) // the maximum Q value in the next state
    val Q_updated = Output(SInt(21.W))    //17 bit is adequate 18 because 1 for signed bit
    val cal=Input(Bool())
    val reward=Input(SInt(9.W))
    val wrEna=Output(Bool())
  })
  //val Q_prime_max=RegInit(0.S(21.W))
  val Q_s_a=RegInit(0.S(21.W))
  val reward=RegInit(0.S(8.W))
  Q_s_a:=io.Q_s_a
 // Q_prime_max:=io.Q_prime_max
  reward:=io.reward
  when(io.cal){
    io.Q_updated :=5.S*(reward+Q_s_a) +4.S*io.Q_prime_max
    io.wrEna:=true.B
  }otherwise{
    io.Q_updated:=0.S
    io.wrEna:=false.B
  }
}