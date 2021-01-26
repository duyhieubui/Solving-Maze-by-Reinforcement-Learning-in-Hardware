import chisel3._
import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters.Driver
import org.scalatest._
import scala.io.Source
import java.io._
import scala.util.control._

class solvingMazeTester(dut:sloving_maze_by_RL) extends PeekPokeTester(dut) {
  val rand1 = Source.fromFile("C:\\Users\\leduc\\rand1.txt").getLines.toArray
  val rand2 = Source.fromFile("C:\\Users\\leduc\\rand2.txt").getLines.toArray
  poke(dut.io.ROW,5)
  poke(dut.io.COL,5)
  step(4)

  var idd=0
  val while_loop = new Breaks;
  while_loop.breakable {
      for(id<-0 until 80000){
        //poke(dut.io.rand1,rand1(idd).toInt)
//       poke(dut.io.rand2,rand2(idd).toInt)
      poke(dut.io.write_data_into_a_txtfile, 0)
       idd=idd+1
      if(idd==79900){
       idd=1
      }
      step(1)
      if (peek(dut.io.DONE) == 1) {
        while_loop.break()
      }
    }
    }
  print("is tht done")
    val Q_table = new File("C:/Users/leduc/Q_table_hardware.text")
    val writer = new BufferedWriter(new FileWriter(Q_table))

    for(state<-0 until 25) {
      //var Q_s_a = new Array[String](3)
      for(act<- 0 until 4){
        poke(dut.io.act_read,act)
        poke(dut.io.state_read,state)
        poke(dut.io.write_data_into_a_txtfile,1)
        step(1)
        //Q_s_a(act)=peek(dut.io.Q_value).toString
        //print("Q: "+ peek(dut.io.Q_value).toString+"\n")
        if(act==0){
          writer.write(peek(dut.io.Q_value).toString())
        }
        else if(act==1){
          writer.write("\t"+peek(dut.io.Q_value).toString())
        }
        else if(act==2){
          writer.write("\t"+peek(dut.io.Q_value).toString())
        }
        else{
          writer.write("\t"+peek(dut.io.Q_value).toByte.toString()+"\n")
        }
      }
    }
    writer.close()
}

class solvingMaze_waveform extends FlatSpec with Matchers {
  " WaveformCounter" should "pass" in {
    Driver.execute(Array("--generate-vcd-output", "on"), () =>
      new sloving_maze_by_RL()) { c =>
      new solvingMazeTester(c)
    } should be (true)
  }
}
object solvingMazeTester extends App {
  chisel3.iotesters.Driver(() => new   sloving_maze_by_RL() ) { c =>
    new solvingMazeTester(c)
  }
}