extends Node
class_name Interactable
func _ready() -> void:
    get_parent().add_to_group("interactable")

    if not get_parent().has_method("interact"):
        printerr(get_parent().name +" node must have an 'interact' method.")
    
    if not get_parent().has_method("can_interact"):
        printerr(get_parent().name +" node must have a 'can_interact' method.")
    
    