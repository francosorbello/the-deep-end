extends Node

func _ready() -> void:
    add_to_group("interactable")
    if not get_parent().has_method("interact"):
        printerr("Interactable node must have an 'interact' method.")
    
    if not get_parent().has_method("can_interact"):
        printerr("Interactable node must have a 'can_interact' method.")
    
    