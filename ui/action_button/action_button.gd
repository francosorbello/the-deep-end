extends Button

enum ActionButtonType {
    CONTINUOUS,
    TAP,
}

@export var action : String

func _on_pressed() -> void:
    Input.action_release(action)
