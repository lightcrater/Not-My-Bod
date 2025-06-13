extends state

@export var walk: state
@export var jump: state
@export var climb: state
@export var fall: state

func enter() -> void:
	parent.velocity.x = 0

func process_input(event: InputEvent) -> void:
	if Input.is_action_pressed("jump"):
		state_machine.change_state(jump)

func process_physics(delta: float) -> void:
	var dir = Input.get_axis("left","right")
	if dir != 0:
		state_machine.change_state(walk)

	if !parent.is_on_floor():
		state_machine.change_state(fall)
