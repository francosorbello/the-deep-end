extends Control

signal start_expedition
signal fuel_usage_changed(value:float)
func _on_button_pressed() -> void:
    start_expedition.emit()
    pass # Replace with function body.


func _on_expedition_fuel_slider_value_changed(value:float) -> void:
    fuel_usage_changed.emit(value)
    pass # Replace with function body.
