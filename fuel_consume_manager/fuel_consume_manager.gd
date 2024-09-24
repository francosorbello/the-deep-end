extends Node3D
@export var expedition_data : Expedition
@export var consumption_speed = 0.1

func _physics_process(delta):
    var move_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    if move_vector != Vector2.ZERO:
        expedition_data.consume_current_fuel(consumption_speed * delta)
    
    if Input.is_action_pressed("stop"):
        expedition_data.consume_current_fuel(consumption_speed * delta)