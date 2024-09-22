extends Control

func update_fuel(value : float):
    $Container/Fuel/Value.text = str(value)

func update_food(value : float):
    $Container/Food/Value.text = str(value)

func update_current_fuel(value : float):
    $Container/CurrentFuel/Value.text = str(value)