extends Control

@export var expedition_data : Expedition

func _ready() -> void:
    $BG/Data/FuelAmount.text = str(expedition_data.collected_fuel)
    $BG/Data/FoodAmount.text = str(expedition_data.collected_food)
    pass
