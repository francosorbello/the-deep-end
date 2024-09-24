extends Control

@export var expedition_data : Expedition
var starting_fuel : float
func _ready() -> void:
    starting_fuel = expedition_data.collected_fuel
    $BG/Data/FuelAmount.text = str(expedition_data.collected_fuel)
    $BG/Data/FoodAmount.text = str(expedition_data.collected_food)
    pass


func _on_expedition_fuel_slider_value_changed(value:float) -> void:
    $BG/Data/FuelAmount.text = str(starting_fuel - value)
    pass
