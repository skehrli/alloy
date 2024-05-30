sig Queue {
    head: one Person
}
sig Person {
    next: lone Person
}

fact person_in_one_queue { all p: Person | #{ q: Queue | p in q.head.*next} = 1 }
fact queue_acyclical { all p: Person | not p in p.^next }

fun CountPeople[q: Queue]: int {
    #(q.head.*next)
}
