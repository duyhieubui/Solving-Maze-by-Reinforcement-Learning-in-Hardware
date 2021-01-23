import chisel3._
import chisel3.util
class QtableRouting extends Module {
  val io=IO(new Bundle{
    val state=Input(UInt(6.W))  // current state; this is also the address in the memory
    val new_state=Input(UInt(6.W))  // the next state to determine Q' max
    val act=Input(UInt(2.W))
    val wrEna=Input(Bool())
    val Q_updated=Input(SInt(21.W))  // the output computed from the Q function (ALU)
    val Q_s_a=Output(SInt(21.W)) // the current Q value
    val Q_prime_max=Output(SInt(21.W)) // the maximum Q value at state s, regardless of any actions
    val action_at_Qmax=Output(UInt(2.W)) //the index of the maximum element

    val routing=Input(Bool())
    val path=Output(UInt(6.W))
    val done=Output(Bool())

  })
  val Q_tab=Module(new Qtable())
  val routing=Module(new Routing())
  routing.io.routing<>io.routing
  routing.io.starting_state:=0.U
  routing.io.state_out<>Q_tab.io.state
  routing.io.done<>io.done
  routing.io.path<>io.path
  Q_tab.io.action_at_Qmax<>io.action_at_Qmax
  io.Q_prime_max<>Q_tab.io.Q_prime_max
  io.Q_s_a<>Q_tab.io.Q_s_a
  //io.act<>Q_tab.io.act
  io.state<>Q_tab.io.state
  io.new_state<>Q_tab.io.new_state
  Q_tab.io.wrEna<>io.wrEna
  routing.io.act<>Q_tab.io.action_at_Qmax
  Q_tab.io.act<>io.act

  Q_tab.io.Q_updated<>io.Q_updated

}