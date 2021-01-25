import chisel3._
import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters.Driver
import org.scalatest._
import scala.io.Source
import java.io._
import chisel3.util
import scala.util.control._
class ActionBlockTester(dut:takingAction) extends PeekPokeTester(dut) {
  //val rand1 = 100+scala.util.Random.nextInt(899)
  //val rand2 = 100+scala.util.Random.nextInt(899)
  //val x=scala.util.Random.nextInt(5)
  //val y=scala.util.Random.nextInt(5)
  val rand11 = Source.fromFile("C:\\Users\\leduc\\rand1.txt").getLines.toArray
  val rand22 = Source.fromFile("C:\\Users\\leduc\\rand2.txt").getLines.toArray
  var id = 0
  //val new_state = new File("C:/Users/leduc/new_state.txt")
   //val writer1 = new BufferedWriter(new FileWriter(new_state))
  //val Ep = new File("C:/Users/leduc/ep.txt")
  //val writer2 = new BufferedWriter(new FileWriter(Ep))

  var end_of_the_List = 0
  val while_loop = new Breaks;
  val while_loop1 = new Breaks;
  poke(dut.io.action_at_Qmax, 3)
  step(7)
  poke(dut.io.reset_Action_fms, 1)
  step(1)
  poke(dut.io.reset_Action_fms, 0)

  for (episode <- 0 until 5) {
    for (x <- 0 until 5) {
      for (y <- 0 until 5) {
        for(a<- 0 until 20) {
            poke(dut.io.x, x)
            poke(dut.io.y, y)
            poke(dut.io.episode, episode)
            //poke(dut.io.rand1, rand11(id).toInt)
            //poke(dut.io.rand2, rand22(id).toInt)
            step(1)
            id=id+1
            }
          }
        }
      }
    //println("ep: "+peek(dut.io.ep).toString())
    //writer2.write(peek(dut.io.ep).toString+"\n")
  println("final val"+id)
  //writer1.close()
  //writer1.close()
}
class Action_waveform extends FlatSpec with Matchers {
  " WaveformCounter" should "pass" in {
    Driver.execute(Array("--generate-vcd-output", "on"), () =>
      new takingAction()) { c =>
      new ActionBlockTester(c)
    } should be (true)
  }
}
object ActionBlockTester extends App {
  chisel3.iotesters.Driver(() => new   takingAction() ) { c =>
    new ActionBlockTester(c)
  }
}
