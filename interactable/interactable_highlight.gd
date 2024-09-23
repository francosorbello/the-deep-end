extends Control

@export var model : MeshInstance3D

func _process(delta: float) -> void:
    var aabb = model.get_aabb()
    print(aabb)