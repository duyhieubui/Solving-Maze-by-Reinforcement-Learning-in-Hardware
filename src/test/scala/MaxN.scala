import chisel3._
import chisel3.iotesters.PeekPokeTester

import scala.io.Source
class MaxN(val n: Int, val w: Int) extends Module {

  private def Max2(x: UInt, y: UInt) = Mux(x > y, x, y)

  val io = IO(new Bundle {
    val ins = Input(Vec(n, UInt(w.W)))
    val out = Output(UInt(w.W))
  })
  io.out := io.ins.reduceLeft(Max2)
}

//class Max4 extends Module {
//
//  private def Max2(x: SInt, y: SInt) = Mux(x > y, x, y)
//
//  val io = IO(new Bundle {
//    val ins = Input(Vec(4, SInt(21.W)))
//    val out = Output(SInt(21.W))
//  })
//  io.out := io.ins.reduceLeft(Max2)
//}
//class Max4Test(c: Max4) extends PeekPokeTester(c) {
//  val ins = Array.fill(4) {
//    0
//  }
//  for (state <- 0 until 24) {
//    for (act <- 0 until 4) {
//      val lines = Source.fromFile("C:\\Users\\leduc\\Qtable.txt").getLines.toArray
//      val r = lines(state + 25 * act).toInt
//      println("in " + r)
//    }
//    step(1)
//    println("out: " + peek(dut.io.out).toString)
//  }
//}
//  for (j <- 0 until 2) {
//    val ins = Array.fill(4){ 0 }
//    for (i <- 0 until 4) {
//      ins(i) = scala.util.Random.nextInt(24)
//      poke(c.io.ins(i), ins(i))
//      println("the input is: "+ins(i))
//    }
//    step(1)
//    println("the output is: "+peek(c.io.out).toString)
//    //println("the array contains: ")
//  }
//}
//object Max4Test extends App {
//  chisel3.iotesters.Driver(() => new   Max4() ) { c =>
//    new Max4Test(c)
//  }
//}

//class LocationSearchTest(c: LocationSearch) extends PeekPokeTester(c) {
//
//  for (i <- 0 until 150) {
//    for(j<-0 until 24){
//      val maze = Array.fill(25) {0}
//      val r = scala.util.Random.nextInt(24)
//      maze(r) = 1
//      poke(c.io.maze(j), maze(j))
//      // println("the input is: "+ins(i))
//      step(1)
//
//      //println("the array contains: ")
//    }
//  }
//}




//class MaxNTests(c: MaxN) extends PeekPokeTester(c) {
//  val ins = Array.fill(c.n){ 0 }
//  for (i <- 0 until 5) {
//    var mx = 0
//    for (i <- 0 until c.n) {
//      ins(i) = rnd.nextInt(1 << c.w)
//      poke(c.io.ins(i), ins(i))
//      mx = if (ins(i) > mx) ins(i) else mx
//     // println("the input is: "+ins(i))
//    }
//    step(1)
//    println("the output is: "+peek(c.io.out).toString)
//    //println("the array contains: ")
//  }
//}

//object MaxNTests extends App{
//  chisel3.iotesters.Driver(() => new MaxN(8,8)) { c=>
//    new MaxNTests(c)
//  }
//}
//
//object MaxN extends App {
//  chisel3.Driver.execute(Array[String](), () => new MaxN(8,8))
//}
