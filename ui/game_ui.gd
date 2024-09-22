extends Control
class_name GameUI

signal on_stabilize_camera
signal on_reset_camera

func get_rotate_joystick() -> VirtualJoystick:
    return $MoveUI.get_node("RotateJoystick")

func get_interact_button() -> Button:
    return $MoveUI.get_node("InteractButton")


func _on_global_event_button_pressed() -> void:
    $MoveUI.visible = false
    $PhotoUI.visible = true
    pass # Replace with function body.


func _on_move_activated() -> void:
    $MoveUI.visible = true
    $PhotoUI.visible = false
    pass # Replace with function body.


func _on_stabilize_pressed() -> void:
    on_stabilize_camera.emit()


func _on_reset_pressed() -> void:
    on_reset_camera.emit()
    pass # Replace with function body.
