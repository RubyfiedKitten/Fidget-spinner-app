extends Node2D

var speed: int
var drag: int = 1
var in_range = false

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var marker_2d: Marker2D = $Marker2D

func reset():
	speed = 0
	drag = 1
	sprite_2d.rotation_degrees = 0
	in_range = false

func _ready() -> void:
	reset()

func _process(delta: float) -> void:
	sprite_2d.position = marker_2d.position
	if speed > 0:
		var tween = create_tween()
		var final_val = rotation_degrees + speed
		tween.tween_property(self, "rotation_degrees", final_val, 100*drag).as_relative()
		@warning_ignore("narrowing_conversion")
		speed *= (1 - drag * delta)

@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and in_range:
			speed += randi_range(50, 10000)

func _on_area_2d_mouse_entered() -> void:
	in_range = true

func _on_area_2d_mouse_exited() -> void:
	in_range = false
