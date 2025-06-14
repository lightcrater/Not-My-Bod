extends state

@export var idle: state
@export var jump: state
@export var fall: state
@export var climb: state

func enter()->void:
	speed = parent.speed
	parent.can_coyote = true

func process_input(event: InputEvent) -> void:
	if Input.is_action_pressed("jump"):
		state_machine.change_state(jump)

func process_physics(delta: float) -> void:
	var dir = Input.get_axis("left","right") * speed
	parent.velocity.x = dir

	if dir == 0:
		state_machine.change_state(idle)

	if !parent.is_on_floor():
		state_machine.change_state(fall)

	parent.move_and_slide()
