extends CharacterBody2D

@onready var joystick = $"../Joystick"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	move_and_slide()

func _slot_change_position(posVector:Vector2):
	velocity = posVector * SPEED
