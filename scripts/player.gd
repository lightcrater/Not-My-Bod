extends CharacterBody2D
class_name Player

@export var speed: int = 150
@export var jump_str: int = 320

var can_coyote = true

func _ready() -> void:
	$state_machine.init(self)
