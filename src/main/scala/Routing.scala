import chisel3._

class Routing extends Module{
  val io=IO(new Bundle{
    val routing=Input(Bool())
    val starting_state=Input(UInt(6.W))
    val path=Output(UInt(6.W))
    val done=Output(Bool())
    val state_out=Output(UInt(6.W))
   // val COL=Input(UInt(3.W))
    val act=Input(UInt(2.W))
  })
  io.state_out:=0.U
  io.path:=0.U
  io.done:=false.B
  io.done:=false.B
  val state=RegInit(0.U(6.W))
  when(io.routing){
    val x=state%5.U
    val y=state/5.U
    when(io.act === 0.U) {
      state:=x+5.U*(y + 1.U)
    }.elsewhen(io.act === 1.U){
      state := (x - 1.U)+5.U*y
    }.elsewhen(io.act === 2.U) {
      state:=x+5.U*(y - 1.U)
    } otherwise {
      state:= (x + 1.U)+5.U*y
    }
    io.state_out:=state
    io.path:=state
    when(state===23.U){
      io.done:=true.B
    }
  }otherwise{
    state:=io.starting_state
  }
}

