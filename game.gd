extends Node

@export var expedition_data : Expedition

@export_category("Scenes")
@export var ship_scene : PackedScene
@export var main_scene : PackedScene

var starting_fuel : float
var loading : bool = false
func _ready() -> void:
    starting_fuel = expedition_data.collected_fuel
    GlobalEventSystem.suscribe(self,"handle_expedition_end")
    start_ship()

func clear_children():
    for child in $CurrentLevel.get_children():
        child.queue_free()

func start_ship():
    await $LoadTransition.fade_in().finished
    clear_children()

    var ship = ship_scene.instantiate()
    $CurrentLevel.add_child(ship)
    ship.start_expedition.connect(handle_start_expedition)
    ship.fuel_usage_changed.connect(handle_fuel_usage_changed)
    await $LoadTransition.fade_out().finished

func start_main():
    await $LoadTransition.fade_in().finished
    clear_children()
    var main = main_scene.instantiate()
    $CurrentLevel.add_child(main)
    $LoadTransition.fade_in()
    await $LoadTransition.fade_out().finished

func handle_start_expedition():
    start_main()
    pass

func handle_fuel_usage_changed(value : float):
    expedition_data.set_current_fuel(value)
    pass

func handle_expedition_end(event : GlobalEventSystem.GameEvent, data : Dictionary):
    if event == GlobalEventSystem.GameEvent.GE_EXPEDITIONENDED:
        start_ship()
    pass
