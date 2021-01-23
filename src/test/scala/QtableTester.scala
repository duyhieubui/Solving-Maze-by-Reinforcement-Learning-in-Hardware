//import chisel3._
//import chisel3.iotesters.PeekPokeTester
//import chisel3.iotesters.Driver
//import org.scalatest._
//import scala.io.Source
//import java.io._
//
//class QtableTester(dut:Qtable) extends PeekPokeTester(dut) {
//  for(state<-0 until 16) {
//    for (act <-0 until 4){
//      val lines = Source.fromFile("C:\\Users\\leduc\\Qtable.txt").getLines.toArray
//      val r = lines(state+25*act).toInt
//      poke(dut.io.wrEna, true.B)
//      poke(dut.io.state,state)
//      poke(dut.io.act,act)
//      poke(dut.io.Q_updated, r)
//      step(1)
//    }
//  }
//  val file = new File("C:/Users/leduc/QtableTester.txt")
//  val writer = new BufferedWriter(new FileWriter(file))
//  poke(dut.io.wrEna, false.B)
//  for(action<-0 until 4){
//    for(state<-0 until 25) {
//    poke(dut.io.sel, true.B)
//    poke(dut.io.act, action)
//    poke(dut.io.state, state)
//    poke(dut.io.new_state, state)
//    step(1)
//    val Q_prime = peek(dut.io.Q_prime_max)
//    //val Q_current=peek(dut.io.Q_current)
//    writer.write(Q_prime.toString + "\n")
//    //writer.write(Q_current.toString)
//  }
//  }
//  writer.close()
//}
//
//class Q_table extends FlatSpec with Matchers {
//  " WaveformCounter" should "pass" in {
//    Driver.execute(Array("--generate-vcd-output", "on"), () =>
//      new Qtable()) { c =>
//      new QtableTester(c)
//    } should be (true)
//  }
//}
//
//object QtableTester extends App {
//  chisel3.iotesters.Driver(() => new   Qtable() ) { c =>
//    new QtableTester(c)
//  }
//}
//
//
//
