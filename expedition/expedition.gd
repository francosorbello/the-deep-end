extends Resource
class_name Expedition
@export var collected_fuel : float = 0
@export var collected_food : float = 0
@export var current_fuel : float = 0
@export var min_expedition_fuel_required : float = 15

signal fuel_changed(amount : float)
signal food_changed(amount : float)
signal current_fuel_changed(amount : float)

func add_fuel(amount : float):
    collected_fuel += amount
    fuel_changed.emit(collected_fuel)

func add_food(amount : float):
    collected_food += amount
    food_changed.emit(collected_food)

func set_current_fuel(amount : float):
    current_fuel = amount
    current_fuel_changed.emit(current_fuel)

func consume_current_fuel(amount : float):
    current_fuel -= amount
    current_fuel_changed.emit(current_fuel)