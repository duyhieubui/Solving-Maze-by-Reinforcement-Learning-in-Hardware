import chisel3._
import chisel3.iotesters.PeekPokeTester
import chisel3.iotesters.Driver
import org.scalatest._
import scala.io.Source
import java.io._
import chisel3.util
class Q_funcTester(dut:Q_function) extends PeekPokeTester(dut){
  poke(dut.io.cal,false.B)
  step(5)
  poke(dut.io.Q_s_a,200)
  poke(dut.io.Q_prime_max,50)
  poke(dut.io.reward,50)
  poke(dut.io.cal,true.B)
  step(5)
}
class Q_func_waveform extends FlatSpec with Matchers {
  " WaveformCounter" should "pass" in {
    Driver.execute(Array("--generate-vcd-output", "on"), () =>
      new Q_function()) { c =>
      new Q_funcTester(c)
    } should be (true)
  }
}