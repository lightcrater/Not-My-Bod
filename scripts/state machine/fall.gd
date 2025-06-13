extends state

@export var idle: state
@export var walk:state
@export var jump: state
@export var climb: state


func enter()->void:
	speed = parent.speed
	await get_tree().create_timer(0.2).timeout
	parent.can_coyote = false

func process_input(event: InputEvent) -> void:
	if Input.is_action_pressed("jump") and parent.can_coyote == true:
		parent.can_coyote = false
		print('coyote')
		state_machine.change_state(jump)

func process_physics(delta: float) -> void:
	var dir = Input.get_axis("left","right") * speed
	parent.velocity.x = dir

	parent.velocity.y += grav * delta

	if parent.is_on_floor() and dir == 0:
		state_machine.change_state(idle)
	elif parent.is_on_floor() and dir != 0:
		state_machine.change_state(walk)

	parent.move_and_slide()
