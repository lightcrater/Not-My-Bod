extends CharacterBody2D
class_name Player

@export var speed: int = 150
@export var jump_str: int = 400
@export var grav_mod: float = 1

func _ready() -> void:
	$state_machine.init(self)
