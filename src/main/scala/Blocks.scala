import chisel3._
class Agent extends Module{
  val io=IO(new Bundle {
    val ROW=Input(UInt(3.W))  // ROW and COL is the size of the maze(ROWxCOL)
    val COL=Input(UInt(3.W))
    val new_state=Input(UInt(6.W))  // this is the state after the agent takes a new action
   // val iterate=Output(Bool())
    val x=Output(UInt(3.W))
    val y=Output(UInt(3.W))
    val state=Output(UInt(6.W))
    val episode=Output(UInt(9.W))
    val done_learning=Output(Bool())
    val load_new_state=Input(Bool())
    val step=Output(UInt(4.W))
    //val t=Output(Bool())    // -if after 15 steps but the agent can't get to the goal, generate the t signal to true
    // to reset the current state to the initial state
  })
  val ROW=RegInit(0.U(3.W))   // in length. Ex: maze(5,5) means ROW=5, COL=5
  val COL=RegInit(0.U(3.W))
  val state=RegInit(0.U(6.W))
  val episode=RegInit(0.U(9.W))
  val start_again=state===24.U
  val step = RegInit(0.U(4.W))
  // delay reset signal by 2 clock cycles so that by the time the Agent moves to
  // the choosingAction stage.
  ROW:=io.ROW
  COL:=io.COL
  val t=(step===15.U)       //if step=14. start again
  val iterate=start_again||t
 //io.iterate:=iterate
  //io.t:=t
  when(iterate===true.B){
    state:=0.U
    episode:=episode+1.U
    when(step===15.U){
      step:=0.U
    }
  }otherwise{
    when(io.load_new_state){
      state := io.new_state
      io.done_learning := false.B
      step:=step+1.U
    }
  }
  // check when to stop training
  when(episode===300.U){
    io.done_learning:=true.B
  }otherwise{
    io.done_learning:=false.B
  }
  // find the x y coordinate of the agent
  io.x:=state%COL
  io.y:=state/COL
  io.state:=state
  io.episode:=episode
  io.step:=step
}

class ConfirmReward extends Module{
  val io=IO(new Bundle{
    val new_state=Input(UInt(6.W))
    val step=Input(UInt(4.W))
    val reward=Output(SInt(9.W))
  })
  //val reward=RegInit(0.S(8.W))
  when(io.new_state===24.U){io.reward:=100.S
  }.elsewhen(io.step===14.U){     // when t=15, iterate is true
    io.reward:=(-50).S
  }.elsewhen(io.new_state===4.U || io.new_state===6.U ||io.new_state===7.U || io.new_state===13.U || io.new_state===16.U || io.new_state===18.U || io.new_state===19.U || io.new_state===21.U ){ io.reward:= (-200).S
  }.otherwise{
    io.reward:=0.S
  }
}






