extends Button

enum ActionButtonType {
    CONTINUOUS,
    TAP,
}

@export var action : String
@export var action_type : ActionButtonType = ActionButtonType.TAP


func _on_pressed() -> void:
    if action_type == ActionButtonType.TAP:
        Input.action_release(action)
    
func _on_button_down() -> void:
    if action_type == ActionButtonType.CONTINUOUS:
        Input.action_press(action)
    
func _on_button_up() -> void:
    if action_type == ActionButtonType.CONTINUOUS:
        Input.action_release(action)