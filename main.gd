extends Node2D

@onready var parent = $".."
@onready var joystick = $Joystick
@onready var player = $CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	joystick
	joystick.change_position.connect(player._slot_change_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
