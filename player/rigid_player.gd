extends RigidBody3D
class_name RigidPlayer
var move_vector
@export var speed : float = 5
@export var game_ui : GameUI
@export var current_expedition : Expedition


var current_interactable

func _ready() -> void:
    $PlayerCamera.in_use = true

func _process(_delta: float) -> void:
    move_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    var direction = ($PlayerCamera.transform.basis * Vector3(move_vector.x, 0, move_vector.y)).normalized()
    var camera_foward = $PlayerCamera.get_global_transform().basis.z
    if direction:
        # apply_force(Vector3(direction.x, 0, direction.z) * 5)
        apply_force(camera_foward * direction.z * speed)
        
    if Input.is_action_pressed("stop"):
        apply_force(-linear_velocity * speed)
    
    if Input.is_action_just_released("interact"):
        if current_interactable and current_interactable.can_interact():
            current_interactable.interact(self)
            current_interactable = null

    if Input.is_action_just_released("reset"):
        $PlayerCamera.reset()
        $PlayerCamera.stabilize()
    $Debugger.log(str(global_position))


func _on_interact_area_area_entered(area:Area3D) -> void:
    if area.get_parent().is_in_group("interactable"):
        print("found interactable")
        current_interactable = area.get_parent()
        current_interactable.enable_highlight()

func _on_interact_area_area_exited(area:Area3D) -> void:
    if current_interactable:
        current_interactable = null
        area.get_parent().disable_highlight()
    pass # Replace with function body.
