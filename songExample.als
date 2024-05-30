sig Person {
    loves: set Person
}

one sig Baby, Me in Person {}

fact everybody_loves_baby { all p: Person | Baby in p.loves }
fact baby_only_loves_me { Baby.loves = Me }

assert claim { Me = Baby }

check claim for 5
