extends Node2D

@onready var knob = $Knob

signal change_position(pos_vector: Vector2)

func _ready() -> void:
	knob.change_position.connect(_slot_change_position)

func _slot_change_position(posVector:Vector2):
	change_position.emit(posVector)
