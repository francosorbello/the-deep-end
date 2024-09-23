extends Node3D

@export var model : MeshInstance3D

func enable_highlight():
    model.material_override.albedo_color = Color(1, 1, 0, 1)

func _draw():
    pass