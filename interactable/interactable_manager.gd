extends Node

var suscribers = []

func suscribe(node : Node):
    suscribers.append(node)

func unsuscribe(node : Node):
    suscribers.erase(node)