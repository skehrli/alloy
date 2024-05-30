sig Node {
    next: Node
}

assert demo {
    all n: Node | some m: Node | m.next = n
}

fact {
    all n: Node | one n.next
}
