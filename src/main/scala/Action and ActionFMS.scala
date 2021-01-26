import chisel3._
import chisel3.util._

class Action_FMS extends Module {
  val io = IO(new Bundle {
    val reset_Action_fms = Input(Bool())
    val exploit = Input(Bool())
    val validAction = Input(Bool())
    val move_to_confirming_Reward = Output(Bool())
    val keep_action=Output(Bool())
  })
  val taking_decision :: action_at_Qmax :: random_Action :: x_y_new :: checking :: Nil = Enum(5)
  val action_FMS = RegInit(taking_decision)
  io.move_to_confirming_Reward := false.B
  io.keep_action:=true.B
  when(io.reset_Action_fms) {
    action_FMS := taking_decision
  } otherwise{
    switch(action_FMS){
      is(taking_decision){
        io.keep_action:=false.B
        when(io.exploit){
          action_FMS := action_at_Qmax
        }otherwise{
          action_FMS := random_Action //explore the environment
        }
      }
      is(action_at_Qmax){
        action_FMS := x_y_new
      }
      is(random_Action){
        action_FMS := x_y_new
      }
      is(x_y_new){
        action_FMS := checking
      }
      is(checking){
        when(io.validAction){
          io.move_to_confirming_Reward := true.B
          action_FMS := checking
        }otherwise{
          action_FMS := taking_decision
        }
      }
    }
  }
}
class Action extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(3.W))
    val y = Input(UInt(3.W))
    val rand2 = Input(UInt(10.W)) //rand 1 rand2 ranging from 100 to below 999
    val new_state = Output(UInt(6.W))
    val act = Output(UInt(2.W))
    val action_at_Qmax = Input(UInt(2.W)) // this is the action at state s at which Q(s,a) is max
    val exploit = Input(Bool())
    val validAction = Output(Bool())
    val keep_action=Input(Bool())
  })
  val act = RegInit(0.U(2.W))
  val x_new = RegInit(0.U(3.W))
  val y_new = RegInit(0.U(3.W))
  val new_state=RegInit(0.U(6.W))
  val action_at_Qmax=RegInit(0.U(2.W))

  action_at_Qmax:=io.action_at_Qmax
  when(io.keep_action===false.B){
    when(io.exploit){
      act := action_at_Qmax
    }otherwise{
      when(io.rand2 <= 250.U){
        act := 0.U
      }.elsewhen((250.U < io.rand2) && (io.rand2 <= 500.U) === true.B) {
        act := 1.U //
      }.elsewhen((500.U < io.rand2) && (io.rand2 <= 750.U) === true.B) {
        act := 2.U
      } otherwise {
        act := 3.U
      }
    }
  }
  when(act === 0.U) {
    y_new := io.y + 1.U
    x_new := io.x
  }.elsewhen(act === 1.U) {
    x_new := io.x - 1.U
    y_new := io.y
  }.elsewhen(act === 2.U) {
    y_new := io.y - 1.U
    x_new := io.x
  } otherwise{
    x_new := io.x + 1.U
    y_new := io.y
  }
  when(x_new === 7.U || x_new === 5.U || y_new === 7.U || y_new === 5.U){
    io.validAction:=false.B
  }otherwise{
    new_state:=x_new+5.U*y_new
    io.validAction:=true.B
  }
  io.act:=act
  io.new_state:=new_state
}
