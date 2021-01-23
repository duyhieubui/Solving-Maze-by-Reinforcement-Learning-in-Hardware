import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters.Driver
import org.scalatest._
import scala.io.Source
import java.io._
import chisel3.util
import scala.util.control._

class RoutingTester(dut:QtableRouting) extends PeekPokeTester(dut) {
  val Q0 = Source.fromFile("C:\\Users\\leduc\\Q0.txt").getLines.toArray
  val Q1 = Source.fromFile("C:\\Users\\leduc\\Q1.txt").getLines.toArray
  val Q2 = Source.fromFile("C:\\Users\\leduc\\Q2.txt").getLines.toArray
  val Q3 = Source.fromFile("C:\\Users\\leduc\\Q3.txt").getLines.toArray
  var Qa = Q0

  for (act <- 0 until 4) {
    if (act == 0) {
      Qa = Q0
    }
    else if (act == 1) {
      Qa = Q1
    }
    else if (act == 2) {
      Qa = Q2
    }
    else {
      Qa = Q3
    }
    for (state <- 0 until 25) {
      poke(dut.io.act, act)
      poke(dut.io.state, state)
      poke(dut.io.wrEna, 1)
      poke(dut.io.Q_updated, Qa(state).toInt)
      step(1)
    }
  }
  poke(dut.io.wrEna,0 )
  val while_loop1 = new Breaks;
  poke(dut.io.routing, 1)
  step(1)
  while_loop1.breakable {
    for (a <- 0 until 2000) {
      step(1)
      if (peek(dut.io.done).toInt == 1) {
        while_loop1.break()
      }
    }
  }
}

class routingWaveform extends FlatSpec with Matchers {
  " WaveformCounter" should "pass" in {
    Driver.execute(Array("--generate-vcd-output", "on"), () =>
      new QtableRouting()) { c =>
      new RoutingTester(c)
    } should be (true)
  }
}