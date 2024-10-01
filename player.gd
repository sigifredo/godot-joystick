extends CharacterBody2D
class_name Player

@onready var joystick: Joystick = $"../Joystick"

@export var speed: float = 300.0

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _slot_change_position(pos_vector: Vector2):
	velocity = pos_vector * speed
