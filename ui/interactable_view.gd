extends Control

@export var test_sprite : TextureRect
@export var interact_radius : float = 100
@export var player : RigidPlayer


func inside_pointer(pos) -> bool:
    return $Center.position.distance_to(pos) < interact_radius

func _process(_delta: float) -> void:
    $Distance.text = ""
    queue_redraw()

func _draw() -> void:
    for interactable in InteractableManager.suscribers:
        var iPos = get_viewport().get_camera_3d().unproject_position(interactable.global_position)
        if inside_pointer(iPos):
            draw_line($DrawFrom.global_position,iPos,Color.WHITE)
            $Distance.text = "%s m" % str(int(player.global_position.distance_to(interactable.global_position)))
            $Distance.position = iPos
