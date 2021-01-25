import chisel3._
import chisel3.util
class Qtable extends Module {
  val io=IO(new Bundle{
    val state=Input(UInt(6.W))  // current state; this is also the address in the memory
    val new_state=Input(UInt(6.W))  // the next state to determine Q' max
    val act=Input(UInt(2.W))
    val wrEna=Input(Bool())
    val Q_updated=Input(SInt(16.W))  // the output computed from the Q function (ALU)
    val Q_s_a=Output(SInt(16.W)) // the current Q value
    val Q_prime_max=Output(SInt(16.W)) // the maximum Q value at state s, regardless of any actions
    val action_at_Qmax=Output(UInt(2.W)) //the index of the maximum element
    val get_Q_prime_max=Input(Bool())
    val write_data_into_a_txtfile=Input(Bool())
    val act_read=Input(UInt(2.W))
    val state_read=Input(UInt(6.W))
  })
  //val state_mix=Mux(io.write_data_into_a_txtfile,io.state_read,io.state)
  val max4=Module(new Max4())
  val index_of_Q_max=Module(new Action_at_Qmax())
  //creat the Q_table
  val Q_s_a0=SyncReadMem(25,SInt(16.W))
  val Q_s_a1=SyncReadMem(25,SInt(16.W))
  val Q_s_a2=SyncReadMem(25,SInt(16.W))
  val Q_s_a3=SyncReadMem(25,SInt(16.W))
  val state_addr=RegInit(0.U(6.W))    // create a register to store the address of the current state for the sake of writing data
  state_addr:=io.state   // this is used to store the address for updating Q value.
  io.Q_s_a:=0.S
  val act=Mux(io.write_data_into_a_txtfile,io.act_read,io.act)
  val stateRead=Mux(io.write_data_into_a_txtfile,io.state_read,io.state)
  when(act===0.U){
    when(io.wrEna) {
      Q_s_a0.write(state_addr, io.Q_updated)
    }otherwise{
      io.Q_s_a:=Q_s_a0.read(stateRead)
    }
  }.elsewhen(act===1.U){
    when(io.wrEna) {
      Q_s_a1.write(state_addr, io.Q_updated)
    }otherwise{
      io.Q_s_a:=Q_s_a1.read(stateRead)
    }
  }.elsewhen(act===2.U){
    when(io.wrEna) {
      Q_s_a2.write(state_addr, io.Q_updated)
    }otherwise{
      io.Q_s_a:=Q_s_a2.read(stateRead)
    }
  }otherwise{
    when(io.wrEna){
      Q_s_a3.write(state_addr,io.Q_updated)
    }otherwise{
      io.Q_s_a:=Q_s_a3.read(stateRead)
    }
  }
  // connect wires to the max4 block
  // by using the mux new_state_or_state, the max4 could be reused for 2 different purposes
  val new_state_or_state=Mux(io.get_Q_prime_max,io.new_state,io.state)
  max4.io.ins0<>Q_s_a0.read(new_state_or_state)
  max4.io.ins1<>Q_s_a1.read(new_state_or_state)
  max4.io.ins2<>Q_s_a1.read(new_state_or_state)
  max4.io.ins3<>Q_s_a3.read(new_state_or_state)
  io.Q_prime_max:=max4.io.Q_max
  // connect wires to the index finding block
  index_of_Q_max.io.ins0:=Q_s_a0.read(new_state_or_state)
  index_of_Q_max.io.ins1:=Q_s_a0.read(new_state_or_state)
  index_of_Q_max.io.ins2:=Q_s_a0.read(new_state_or_state)
  index_of_Q_max.io.ins3:=Q_s_a0.read(new_state_or_state)
  index_of_Q_max.io.Q_max_at_state_s:=max4.io.Q_max
  io.action_at_Qmax:=index_of_Q_max.io.action_at_Qmax // index of Q max in the Q_table
}
class Max4 extends Module{
  val io=IO(new Bundle{
    val ins0=Input(SInt(16.W))
    val ins1=Input(SInt(16.W))
    val ins2=Input(SInt(16.W))
    val ins3=Input(SInt(16.W))
    val Q_max=Output(SInt(16.W))
  })

  private def Max2(x: SInt, y: SInt) = Mux(x > y, x, y)
  val ins=Wire(Vec(4,SInt(16.W)))
  ins(0):=io.ins0
  ins(1):=io.ins1
  ins(2):=io.ins2
  ins(3):=io.ins3
  io.Q_max:=ins.reduceLeft(Max2)
}
class Action_at_Qmax extends Module{
  val io=IO(new Bundle{
    val ins0=Input(SInt(16.W))
    val ins1=Input(SInt(16.W))
    val ins2=Input(SInt(16.W))
    val ins3=Input(SInt(16.W))
    val action_at_Qmax=Output(UInt(2.W))
    val Q_max_at_state_s=Input(SInt(16.W))
  })
  val ins=Wire(Vec(4,SInt(16.W)))
  ins(0):=io.ins0
  ins(1):=io.ins1
  ins(2):=io.ins2
  ins(3):=io.ins3
  io.action_at_Qmax:=ins.indexWhere(x=> x===io.Q_max_at_state_s)
}
