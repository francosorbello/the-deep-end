extends State

var move_vector : Vector2 = Vector2.ZERO
@export var speed : float = 10

func update(delta : float):
	move_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (state_owner.get_camera().transform.basis * Vector3(move_vector.x, 0, move_vector.y)).normalized()
	
	if direction:
		state_owner.velocity.x = direction.x * speed
		state_owner.velocity.z = direction.z * speed
	else:
		state_owner.velocity = Vector3.ZERO

	state_owner.velocity += 9.8 * delta

	# state_owner.position += Vector3(move_vector.x, 0, move_vector.y) * speed * delta
	if state_owner.rotate_joystick and state_owner.rotate_joystick.is_pressed:
		state_owner.get_camera().rotate_y(-Vector2.RIGHT.dot(state_owner.rotate_joystick.output) * delta)

	state_owner.move_and_slide()
