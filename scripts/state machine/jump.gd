extends state

@export var fall:state
@export var climb:state

func enter() -> void:
	speed = parent.speed
	parent.velocity.y = -parent.jump_str
	parent.can_coyote = false

func process_physics(delta: float) -> void:
	var dir = Input.get_axis("left","right") * speed
	parent.velocity.x = dir

	parent.velocity.y += grav*delta
	parent.move_and_slide()

	if parent.velocity.y > 0:
		state_machine.change_state(fall)
