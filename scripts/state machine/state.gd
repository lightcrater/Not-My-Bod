extends Node
class_name state

@onready var parent: Player
@onready var state_machine = get_parent()

@export var animation: String
var speed:int

var grav: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func enter() -> void:
	speed = parent.speed

func exit() -> void:
	pass

func process_input(event: InputEvent) -> void:
	pass

func process_physics(delta: float) -> void:
	pass
