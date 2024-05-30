abstract sig ETHBusStation {
    next: set ETHBusStation
}

one sig Polyterrasse, HaldeneggRight, HaldeneggLeft,
    ETHHonggerberg extends ETHBusStation {}

one sig ETHBus {
    var station: lone ETHBusStation
}

fact {
    no (ETHHonggerberg.next - HaldeneggRight)
    all s: ETHBusStation | ETHBusStation in s.^next and one s.next        
    all disj b1, b2: {b: ETHBus | b.station != none} |  b1.station != b2.station
}

pred next[bus: ETHBus] {
    no bus.station implies some bus.station' else bus.station' = none and bus.station'' = bus.station.next
}

fact simulate {
    ETHBus.station = Polyterrasse
    always next[ETHBus]
}

pred show {}
run show for 10 steps
