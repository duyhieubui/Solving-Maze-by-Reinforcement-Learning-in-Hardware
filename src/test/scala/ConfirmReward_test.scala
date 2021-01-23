import chisel3.iotesters.{Driver, PeekPokeTester}
import org.scalatest.{FlatSpec, Matchers}

class ConfirmRewardTester(dut:ConfirmReward) extends PeekPokeTester(dut){
  for(state<-0 until 16) {
    poke(dut.io.new_state, state)
    poke(dut.io.step,0)
    step(1)
    println("state:"+state.toString+"reward: "+peek(dut.io.reward).toString+" \n")
  }
}
class Reward_wave extends FlatSpec with Matchers {
  " WaveformCounter" should "pass" in {
    Driver.execute(Array("--generate-vcd-output", "on"), () =>
      new ConfirmReward()) { c =>
      new ConfirmRewardTester(c)
    } should be (true)
  }
}
object ConfirmRewardTester extends App {
  chisel3.iotesters.Driver(() => new   ConfirmReward() ) { c =>
    new ConfirmRewardTester(c)
  }
}
