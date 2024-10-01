extends Node2D
class_name Joystick

@onready var knob: Knob = $Knob
@onready var ring: Sprite2D = $Ring

@export_range(0.1, 0.5)
var ring_opacity: float = 0.25

signal change_position(pos_vector: Vector2)

func _ready() -> void:
	knob.change_position.connect(_slot_change_position)

func _slot_change_position(pos_vector: Vector2):

	if (abs(pos_vector.x) + abs(pos_vector.y)) > 0.0:
		ring.modulate.a = lerp(ring.modulate.a, ring_opacity, 0.1)
	else:
		ring.modulate.a = lerp(ring.modulate.a, 1.0, 0.1)

	change_position.emit(pos_vector)
