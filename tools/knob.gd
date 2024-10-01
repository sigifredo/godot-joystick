extends Sprite2D
class_name Knob

var deadzone: float = 0.0
var pressing: bool = false

@onready var parent: Joystick = $".."
@export var max_length: float = 250.0

signal change_position(pos_vector: Vector2)

func _ready() -> void:
	max_length *= parent.scale.x
	deadzone = max_length * 0.05

func _process(delta: float) -> void:
	var pos_vector: Vector2 = Vector2(0.0, 0.0);

	if pressing:
		if get_global_mouse_position().distance_to(parent.global_position) <= max_length:
			global_position = get_global_mouse_position()
		else:
			var angle: float = parent.global_position.angle_to_point(get_global_mouse_position())

			global_position.x = parent.global_position.x + cos(angle) * max_length
			global_position.y = parent.global_position.y + sin(angle) * max_length

		pos_vector = calculateVector()
	else:
		global_position = lerp(global_position, parent.global_position, delta * 10)

	change_position.emit(pos_vector)

func calculateVector():
	var pos_vector: Vector2 = Vector2(0.0, 0.0)
	var x: float = global_position.x - parent.global_position.x;
	var y: float = global_position.y - parent.global_position.y;

	if abs(x) >= deadzone:
		pos_vector.x = x / max_length

	if abs(y) >= deadzone:
		pos_vector.y = y / max_length

	return pos_vector

func _on_button_down() -> void:
	pressing = true

func _on_button_up() -> void:
	pressing = false
