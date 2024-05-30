sig University {}
sig ID {}
sig Major {}
abstract sig Student {
    id: one ID,
    uni: lone University,
    major: one Major,
    mates: set Student,
}
sig Undergrad extends Student {}
sig Grad extends Student {}

pred isLegal[a: Student] {
    some a.uni
}

pred mates[s: Student, t: Student] {
    s in t.mates and t in s.mates
}

fact students_legal { all s: Student | isLegal[s] }
fact unique_ids { all disj s, t: Student | s.id != t.id }
fact bijective_ids { all i: ID | some s: Student | s.id = i }
fact mates_symmetric { all disj s, t: Student | s in t.mates implies t in s.mates }
fact mates_iff_sameUniMajor_undergrad {
    all disj s, t: Undergrad | s.uni = t.uni and s.major = t.major iff mates[s, t]
}
fact mates_iff_sameUniMajor_grad {
    all disj s, t: Grad | s.uni = t.uni and s.major = t.major iff mates[s, t]
}
fact grad_undergrad_not_mates { all disj s: Undergrad, t: Grad | not s in t.mates and not t in s.mates}
fact not_mate_of_self { all s: Student | not s in s.mates }

pred show {}
run show for exactly 2 University, exactly 3 Major, exactly 3 Student, exactly 3 ID
