import chisel3._
import chisel3.util._
class resetFMS extends Module{
  val io=IO(new Bundle() {
    val transition=Input(Bool())
    val reset=Output(Bool())
  })
  val reset_action::idle::Nil=Enum(2)
  val active_reset_fms=RegInit(reset_action)
  io.reset:=false.B
  when(io.transition){
    active_reset_fms:=reset_action
  }
  switch(active_reset_fms){
    is(reset_action){
      active_reset_fms:=idle
      io.reset:=true.B
    }
    is(idle){
    }
  }
}
class MasterFMS extends Module{
  val io=IO(new Bundle{
    val iterate=Input(Bool())
    val move_to_confirming_Reward=Input(Bool())
    val cal=Output(Bool())
    val load_new_state=Output(Bool())
    val reset_Action_fms=Output(Bool())
    val get_Q_prime_max=Output(Bool())
    val DONE=Output(Bool())
    val path_found=Input(Bool())
  })
  io.DONE:=false.B
  io.cal:=false.B
  io.get_Q_prime_max:=false.B
  io.load_new_state:=false.B
  val agent::choosing_Action::get_Reward::compute_Q_value::routing::Nil=Enum(5)
  val master_FMS=RegInit(agent)
  // resetFMS
  val reset_fms=Module( new resetFMS())
  val transition = WireDefault (false.B)
  reset_fms.io.transition:=transition
  io.reset_Action_fms:=reset_fms.io.reset
  io.reset_Action_fms:=false.B
  switch(master_FMS) {
    is(agent) {
      when(io.iterate){
        master_FMS := agent
      }.elsewhen(io.path_found){
        master_FMS:=routing
      }otherwise{
          transition:=true.B
          master_FMS:=choosing_Action
        }
      }
    is(choosing_Action) {
      io.reset_Action_fms:=reset_fms.io.reset
      when(io.move_to_confirming_Reward) {
        master_FMS := get_Reward
      }
    }
    is(get_Reward){
      master_FMS := compute_Q_value
      io.get_Q_prime_max:=true.B
    }
    is(compute_Q_value) {
      io.cal:=true.B
      master_FMS:=agent
      io.load_new_state:=true.B
    }
    is(routing) {
    io.DONE:=true.B
    }
  }
}
