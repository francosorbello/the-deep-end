extends Node

@export var ship_scene : PackedScene
@export var main_scene : PackedScene

func _ready() -> void:
    start_ship()

func clear_children():
    for child in get_children():
        child.queue_free()

func start_ship():
    clear_children()
    var ship = ship_scene.instantiate()
    add_child(ship)
    ship.start_expedition.connect(handle_start_expedition)

func start_main():
    clear_children()
    var main = main_scene.instantiate()
    add_child(main)

func handle_start_expedition():
    start_main()
    pass