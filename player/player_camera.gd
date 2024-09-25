extends Camera3D
class_name PlayerCamera
 
var min_zoom = 0.5
var max_zoom = 2
var zoom_sensitivity = 10
var zoom_speed = 1

var events = {}
var last_drag_distance = 0

var in_use : bool = false

enum RotationType
{
    RT_X,
    RT_Y,
    RT_Z,
    RT_FREE
}

var dead_zone = 0.05

var rotation_type : RotationType = RotationType.RT_FREE

func _process(delta: float) -> void:
    if not in_use:
        return

    var gyro = Input.get_gyroscope()

    match rotation_type:
        RotationType.RT_X:
            if abs(gyro.x) > dead_zone:
                rotate_x(gyro.x * delta)
        RotationType.RT_Y:
            if abs(gyro.y) > dead_zone:
                rotate_y(gyro.y * delta)
        RotationType.RT_FREE:
            if abs(gyro.x) > dead_zone || abs(gyro.y) > dead_zone:
                rotate_x(gyro.x * delta)
                rotate_y(gyro.y * delta)
                rotate_z(gyro.z * delta)
                # rotation.z = 0
        _:
            return

func _input(event):
    if not in_use:
        return

    # save touch input
    if event is InputEventScreenTouch:
        if event.pressed:
            events[event.index] = event
        else:
            events.erase(event.index)

    # if event is InputEventScreenDrag:
    if event is InputEventPanGesture:
        events[event.index] = event # save drag input
        if events.size() == 2:
            # distance from touch to drag
            var drag_distance = events[0].position.distance_to(events[1].position)
            if abs(drag_distance - last_drag_distance) > zoom_sensitivity:
                var new_zoom = (zoom_speed) if drag_distance < last_drag_distance else (-zoom_speed)
                last_drag_distance = drag_distance
                fov += new_zoom 


func reset():
    fov = 75
    rotation = Vector3(0, 0, 0)


func stabilize():
    rotation.z = 0

