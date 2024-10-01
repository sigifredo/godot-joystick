extends Node2D
class_name Joystick

@onready var knob: Knob = $Knob

signal change_position(pos_vector: Vector2)

func _ready() -> void:
	knob.change_position.connect(_slot_change_position)

func _slot_change_position(pos_vector: Vector2):
	change_position.emit(pos_vector)
