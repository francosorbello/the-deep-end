extends State

func enter():
    owner.get_node("PlayerCamera").in_use = true

func exit():
    owner.get_node("PlayerCamera").in_use = false