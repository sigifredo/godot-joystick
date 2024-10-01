extends Node2D

@onready var joystick: Joystick = $Joystick
@onready var player: Player = $Player

func _ready() -> void:
	joystick.change_position.connect(player._slot_change_position)
