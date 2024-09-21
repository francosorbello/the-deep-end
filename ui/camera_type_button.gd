extends Button

@export var rotation_types : Array[RotationTypeData]
var current_index : int = 0

signal changed_rotation_type(type : RotationTypeData)

func _ready() -> void:
    pass

func change_rotation_type():
    current_index += 1
    if current_index >= rotation_types.size():
        current_index = 0

    icon = rotation_types[current_index].icon

    changed_rotation_type.emit(rotation_types[current_index])
    # GlobalEventSystem.emit(GlobalEventSystem.GameEvent.GE_SET_ROTATION_TYPE, {"type": rotation_types[current_index].type})