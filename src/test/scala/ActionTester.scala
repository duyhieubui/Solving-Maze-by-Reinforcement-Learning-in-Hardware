//import chisel3._
//import chisel3.iotesters.PeekPokeTester
//import chisel3.iotesters.Driver
//import org.scalatest._
//import scala.io.Source
//import java.io._
//import chisel3.util
//
//class ActionTester(dut:Action_shit) extends PeekPokeTester(dut) {
//  //val rand1 = 100+scala.util.Random.nextInt(899)
//  //val rand2 = 100+scala.util.Random.nextInt(899)
//  //val x=scala.util.Random.nextInt(5)
//  //val y=scala.util.Random.nextInt(5)
//  val rand11 = Source.fromFile("C:\\Users\\leduc\\rand1.txt").getLines.toArray
//  val rand22 = Source.fromFile("C:\\Users\\leduc\\rand2.txt").getLines.toArray
//  val Action = new File("C:/Users/leduc/new_state.txt")
//  val writer = new BufferedWriter(new FileWriter(Action))
//  var id=0
//  var reset=1
//  for(episode<-0 until 300){
//    for(x<-0 until 5){
//      for(y<-0 until 5){
//        if(reset==1){
//          poke(dut.io.reset,true.B)
//          poke(dut.io.x, x)
//          poke(dut.io.y, y)
//          poke(dut.io.rand1, rand11(id).toInt)
//          poke(dut.io.rand2,rand22(id).toInt)
//          poke(dut.io.episode, episode)
//          id=id+1
//          if(id==79999){
//            id=0
//          }
//        }
//        step(1)
//        if(peek(dut.io.generate)==1){
//          poke(dut.io.rand1, rand11(id).toInt)
//          poke(dut.io.rand2,rand22(id).toInt)
//          id=id+1
//          if(id==79999){
//            id=0
//          }
//          step(1)
//        }
//        if(peek(dut.io.sel)==1){
//          writer.write((peek(dut.io.new_state)).toString+"\n")    // out
//          poke(dut.io.reset,false.B)
//          step(2)
//          poke(dut.io.reset,true.B)
//          step(2)
//          println(peek(dut.io.new_state).toString)
//        }
//      }
//    }
//  }
//  writer.close()
//}
//
////class WaveformCounterSpec extends FlatSpec with Matchers {
////  " WaveformCounter" should "pass" in {
////    Driver.execute(Array("--generate-vcd-output", "on"), () =>
////      new Action()) { c =>
////      new ActionTester(c)
////    } should be (true)
////  }
////}
//
//
//object ActionTester extends App {
//  chisel3.iotesters.Driver(() => new   Action_shit() ) { c =>
//    new ActionTester(c)
//  }
//}
////(rand1,250,350)x y new_state act epsilon x y 3 5 10 2 884 0 2