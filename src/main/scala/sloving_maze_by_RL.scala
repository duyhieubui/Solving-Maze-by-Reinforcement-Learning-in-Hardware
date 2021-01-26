import chisel3._
import chisel3.util._
class sloving_maze_by_RL extends Module{
  val io=IO(new Bundle{
    val COL=Input(UInt(3.W))
    val ROW=Input(UInt(3.W))
    val state_read=Input(UInt(6.W))
    val act_read=Input(UInt(2.W))
    val Q_value=Output(SInt(16.W))
    val write_data_into_a_txtfile=Input(Bool())
    val Path=Output(UInt(6.W))
    val DONE=Output(Bool())
  })
  val agent=Module(new Agent())
  val taking_action=Module(new takingAction())
  val Q_func=Module(new Q_function)
  val Q_table=Module(new Qtable())
  val Reward=Module(new ConfirmReward())
  val masterFMS=Module(new MasterFMS())
  io.Q_value<>Q_table.io.Q_s_a
  Q_table.io.state_read<>io.state_read
  Q_table.io.act_read<>io.act_read
  Q_table.io.write_data_into_a_txtfile<>io.write_data_into_a_txtfile

  // connect components together
  //connect the inputs the system
  agent.io.ROW<>io.ROW
  agent.io.COL<>io.COL
  //io.rand1<>taking_action.io.rand1
  //io.rand2<>taking_action.io.rand2
  agent.io.x<>taking_action.io.x
  agent.io.y<>taking_action.io.y
  agent.io.episode<>taking_action.io.episode
  //
  taking_action.io.new_state<>agent.io.new_state
  taking_action.io.new_state<>Q_table.io.new_state    // connect to get the Q_prime_max at the new_state
  taking_action.io.act<>Q_table.io.act
  taking_action.io.action_at_Qmax<>Q_table.io.action_at_Qmax
  // receive rewards
  Reward.io.new_state<>taking_action.io.new_state
  Reward.io.step<>agent.io.step
  // Q
  Q_table.io.state<>agent.io.state
  Q_func.io.Q_prime_max<>Q_table.io.Q_prime_max
  Q_func.io.Q_s_a<>Q_table.io.Q_s_a
  Q_func.io.reward<>Reward.io.reward
  Q_func.io.cal<>masterFMS.io.cal
  Q_func.io.wrEna<>Q_table.io.wrEna
  Q_func.io.Q_updated<>Q_table.io.Q_updated   // the updated Q value at state(s,a)

  /// connecting wires to the FMS
  masterFMS.io.reset_Action_fms<>taking_action.io.reset_Action_fms
  //masterFMS.io.done_learning<>agent.io.done_learning
  masterFMS.io.iterate:=agent.io.iterate
  masterFMS.io.move_to_confirming_Reward:=taking_action.io.move_to_confirming_Reward
  masterFMS.io.get_Q_prime_max<>Q_table.io.get_Q_prime_max
  agent.io.load_new_state<>masterFMS.io.load_new_state
  agent.io.done_learning<>taking_action.io.get_path
  masterFMS.io.path_found<>agent.io.path_found
  when(agent.io.done_learning){
    io.Path:=agent.io.state
  }otherwise{
    io.Path:=0.U
  }
  masterFMS.io.DONE<>io.DONE

}

object sloving_maze_by_RL extends App {
  chisel3.Driver.execute(Array[String](), () => new sloving_maze_by_RL())
}
//- end
