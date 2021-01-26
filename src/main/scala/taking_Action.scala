import chisel3._
import chisel3.util.random
import chisel3.util.random.LFSR
class takingAction extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(3.W))
    val y = Input(UInt(3.W))
    val episode = Input(UInt(10.W)) //1024*epislon
    val new_state = Output(UInt(6.W))
    val action_at_Qmax = Input(UInt(2.W)) // this is the action at state s at which Q(s,a) is max
    val act = Output(UInt(2.W))
    val reset_Action_fms=Input(Bool())
    val move_to_confirming_Reward=Output(Bool())
    val get_path=Input(Bool())
  })
  val action_fms=Module(new Action_FMS())
  val action=Module(new Action())
  val epsilon = RegInit(0.U(10.W))

  epsilon:=1023.U-io.episode*3.U
  val exploit1=(epsilon<LFSR(10))   // exploit 1 is the signal for exploring the environment
  val exploit=exploit1||io.get_path // get_path signal is coupled with exploit 1 as "exploit", the input
                                    // of path-finding block to reuse this block
  // connect the action_FMS to Action
  action_fms.io.reset_Action_fms<>io.reset_Action_fms
  action_fms.io.exploit:=exploit    // greedy action
  action_fms.io.validAction<>action.io.validAction
  action_fms.io.keep_action<>action.io.keep_action
  // connect data inputs
  action.io.exploit<>exploit
  action.io.rand2<>LFSR(16)
  //io.rand2:=rand2
  action.io.x<>io.x
  action.io.y<>io.y
  action.io.action_at_Qmax<>io.action_at_Qmax
  // outputs of the block
  io.act<>action.io.act
  io.new_state<>action.io.new_state
  io.move_to_confirming_Reward<>action_fms.io.move_to_confirming_Reward
}