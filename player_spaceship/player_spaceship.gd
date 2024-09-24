extends Node3D

func interact(_rigid_player):
    GlobalEventSystem.emit(GlobalEventSystem.GameEvent.GE_EXPEDITIONENDED,{})
    pass

func can_interact():
    return true


func enable_highlight():
    _tint_spaceship(Color("a6a6a6")) 

func disable_highlight():
    _tint_spaceship(Color.WHITE)

func _tint_spaceship(color : Color):
    var model = $Model as MeshInstance3D
    for i in range(model.get_surface_override_material_count()):
        var mat = model.mesh.surface_get_material(i)
        mat.albedo_color = color