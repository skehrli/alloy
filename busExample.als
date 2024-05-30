abstract sig ETHBusStation {
    next: set ETHBusStation
}
one sig PolyTerrasse, HaldeneggRight, HaldeneggLeft,
  ETHHonggerberg extends ETHBusStation {}
some sig ETHBus {
    station: lone ETHBusStation
}

fact {
    all s: ETHBusStation | ETHBusStation in s.^next and one s.next
    all disj b1, b2: ETHBus | b1.station != b2.station
    all s: ETHHonggerberg | s.next in HaldeneggRight
}

pred show {}
run show
