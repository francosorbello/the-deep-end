extends Button

@export var event : GlobalEventSystem.GameEvent = GlobalEventSystem.GameEvent.GE_DEFAULT

func send_event():
    GlobalEventSystem.emit(event, {})
