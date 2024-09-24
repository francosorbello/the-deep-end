extends Button

@export var expedition_data : Expedition

func _ready() -> void:
    _on_expedition_fuel_slider_value_changed(0)

func _on_expedition_fuel_slider_value_changed(value:float) -> void:
    disabled = expedition_data.min_expedition_fuel_required > value