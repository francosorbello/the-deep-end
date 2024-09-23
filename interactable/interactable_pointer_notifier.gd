extends VisibleOnScreenNotifier3D

func _on_screen_exited() -> void:
    InteractableManager.unsuscribe(self)

func _on_screen_entered() -> void:
    InteractableManager.suscribe(self)
    pass # Replace with function body.
