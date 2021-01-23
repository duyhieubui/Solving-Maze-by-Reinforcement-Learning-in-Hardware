import chisel3._
import chisel3.util.random
import chisel3.util.random.LFSR
class takingAction extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(3.W))
    val y = Input(UInt(3.W))
    //val rand1 = Input(UInt(10.W)) //rand 1 rand2 ranging from 100 to below 999
    //val rand2 = Input(UInt(10.W)) // take 3 numbers after the decimal point
    val episode = Input(UInt(9.W)) //1000*epislon
    val new_state = Output(UInt(6.W))
    val action_at_Qmax = Input(UInt(2.W)) // this is the action at state s at which Q(s,a) is max
    val act = Output(UInt(2.W))
    val reset_Action_fms=Input(Bool())
    val move_to_confirming_Reward=Output(Bool())
    //val generate_rand1=Input(Bool())
    //val ep=Output(UInt(14.W))
  })
  val action_fms=Module(new Action_FMS())
  val action=Module(new Action())
  val epsilon = RegInit(0.U(10.W))

  //when(io.generate_rand1||act)
  epsilon := 1024.U - io.episode * 17.U / 5.U
  val exploit=(epsilon<=LFSR(10))
  // connect the action_FMS to Action
  action_fms.io.reset_Action_fms<>io.reset_Action_fms
  action_fms.io.exploit:=exploit    // greedy action
  action_fms.io.validAction<>action.io.validAction
  action_fms.io.keep_action<>action.io.keep_action

  // connect data inputs
  action.io.exploit<>exploit
  action.io.rand2<>LFSR(10)
  action.io.x<>io.x
  action.io.y<>io.y
  action.io.action_at_Qmax<>io.action_at_Qmax
  // outputs of the block
  io.act<>action.io.act
  io.new_state<>action.io.new_state
  io.move_to_confirming_Reward<>action_fms.io.move_to_confirming_Reward
}