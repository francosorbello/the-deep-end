extends Control

@export var expedition_data : Expedition

func _ready() -> void:
    $ExpeditionFuelSlider.max_value = expedition_data.collected_fuel
    $ExpeditionFuelSlider/MaxLabel.text = str(expedition_data.collected_fuel)
    _on_expedition_fuel_slider_value_changed(0)

func _on_expedition_fuel_slider_value_changed(value:float) -> void:
    $FuelLabel.text = "Fuel: "+str(value)
    var color = Color.GREEN if expedition_data.min_expedition_fuel_required <= value else Color.RED
    $FuelLabel.label_settings.font_color = color
