extends Node

@export var current_state: state
var switching :bool = false

@export var idle: state
@export var walk: state
@export var jump: state
@export var fall: state
@export var climb: state

func init(player:Player) -> void:
	for child in get_children():
		child.parent = player

func change_state(new_state: state)-> void:
	switching = true
	current_state.exit()
	current_state = new_state
	new_state.enter()
	switching = false

func _process(delta: float) -> void:
	if switching == false:
		current_state.process_physics(delta)

func _input(event: InputEvent) -> void:
	if switching == false:
		current_state.process_input(event)
