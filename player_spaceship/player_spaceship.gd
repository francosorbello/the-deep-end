extends Node3D

func interact(_rigid_player):
    GlobalEventSystem.emit(GlobalEventSystem.GameEvent.GE_EXPEDITIONENDED,{})
    pass

func can_interact():
    return true


func enable_highlight():
    pass
    # $Model.material_override.albedo_color = Color("a6a6a6")

func disable_highlight():
    # $Model.material_override.albedo_color = Color.WHITE
    pass