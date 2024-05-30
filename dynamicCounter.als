open util/integer

one sig Counter {
  var n: Int
}

pred inc[c: Counter] {
  c.n' = c.n.add[Int[1]]
}

fact model {
  Counter.n = 0
  inc[Counter] until always Counter.n = 7
}

assert inv1 {
  always Counter.n >= 0
}

assert inv2 {
  always Counter.n' >= Counter.n
}

pred show {}
run show for 5 steps, 5 int
check inv1 for 5 steps
check inv2 for 5 steps
