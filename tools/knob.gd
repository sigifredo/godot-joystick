extends Sprite2D

var pressing:bool = false

@onready var parent = $".."
@export var maxLength = 250
@export var deadzone = 25

signal change_position(pos_vector: Vector2)

func _ready() -> void:
	maxLength *= parent.scale.x


func _process(delta: float) -> void:
	var posVector:Vector2 = Vector2(0, 0);

	if pressing:
		if get_global_mouse_position().distance_to(parent.global_position) <= maxLength:
			global_position = get_global_mouse_position()
		else:
			var angle = parent.global_position.angle_to_point(get_global_mouse_position())

			global_position.x = parent.global_position.x + cos(angle) * maxLength
			global_position.y = parent.global_position.y + sin(angle) * maxLength

		posVector = calculateVector()
	else:
		global_position = lerp(global_position, parent.global_position, delta * 10)

	change_position.emit(posVector)

func calculateVector():
	var posVector = Vector2(0, 0)
	var x = global_position.x - parent.global_position.x;
	var y = global_position.y - parent.global_position.y;

	if abs(x) >= deadzone:
		posVector.x = x / maxLength

	if abs(y) >= deadzone:
		posVector.y = y / maxLength

	return posVector

func _on_button_down() -> void:
	pressing = true


func _on_button_up() -> void:
	pressing = false
