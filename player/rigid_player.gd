extends RigidBody3D
class_name RigidPlayer
var move_vector
@export var speed : float = 5
@export var game_ui : GameUI
@export var current_expedition : Expedition

var rotate_joystick : VirtualJoystick

var current_interactable

func _ready() -> void:
    $PlayerCamera.in_use = true
    rotate_joystick = game_ui.get_rotate_joystick()

func _process(_delta: float) -> void:
    move_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    var direction = ($PlayerCamera.transform.basis * Vector3(move_vector.x, 0, move_vector.y)).normalized()
    if direction:
        apply_force(Vector3(direction.x, 0, direction.z) * 5)
        
    if Input.is_action_pressed("stop"):
        apply_force(-linear_velocity * speed)

    if rotate_joystick and rotate_joystick.is_pressed:
        $PlayerCamera.rotate_y(-Vector2.RIGHT.dot(rotate_joystick.output) * _delta)


func _on_interact_area_area_entered(area:Area3D) -> void:
    if area.get_parent().is_in_group("interactable"):
        current_interactable = area.get_parent()
