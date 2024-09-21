extends CharacterBody3D
class_name Player

@export var game_ui : GameUI
var rotate_joystick : VirtualJoystick

func _ready() -> void:
    GlobalEventSystem.suscribe(self,"handle_global_events")

    rotate_joystick = game_ui.get_rotate_joystick()
    game_ui.connect("on_stabilize_camera",handle_stabilize_camera)
    game_ui.connect("on_reset_camera", handle_reset_camera)
    game_ui.connect("on_change_rotation_type", handle_change_rotation_type)

func switch_to_photo_mode():
    $StateMachine.transition_to("PhotoState")

func switch_to_move_mode():
    $StateMachine.transition_to("MoveState") 

func handle_global_events(event, msg) -> void:
    # $Debugger.log(event)
    match event:
        GlobalEventSystem.GameEvent.GE_PHOTO_MODE:
            switch_to_photo_mode()
        GlobalEventSystem.GameEvent.GE_MOVE_MODE:
            switch_to_move_mode()
        _:
            return
    pass

func _physics_process(delta: float) -> void:
    pass

func _on_global_event_button_pressed() -> void:
    $StateMachine.transition_to("PhotoState")
    pass # Replace with function body.

func get_camera():
    return $PlayerCamera

func handle_change_rotation_type(type : RotationTypeData) -> void:
    print("change rotation type: ", type.type)
    $PlayerCamera.set_rotation_type(type)
    pass

func handle_reset_camera():
    print("reset")
    $PlayerCamera.reset()
    pass

func handle_stabilize_camera():
    print("stabilize")
    $PlayerCamera.stabilize()
    pass