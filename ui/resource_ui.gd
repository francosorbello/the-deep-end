extends Control

func _ready() -> void:
    var current_expedition = ExpeditionManager.current_expedition as Expedition
    current_expedition.fuel_changed.connect(update_fuel)
    current_expedition.food_changed.connect(update_food)
    current_expedition.current_fuel_changed.connect(update_current_fuel)

func update_fuel(value : float):
    $Container/Fuel/Value.text = str(value)

func update_food(value : float):
    $Container/Food/Value.text = str(value)

func update_current_fuel(value : float):
    $Container/CurrentFuel/Value.text = str(value)