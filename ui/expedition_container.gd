extends Control

@export var expedition_data : Expedition

func _ready() -> void:
    $ExpeditionFuelSlider.max_value = expedition_data.collected_fuel
    $ExpeditionFuelSlider/MaxLabel.text = str(expedition_data.collected_fuel)