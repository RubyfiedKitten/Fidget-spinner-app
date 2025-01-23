extends Node2D

@onready var figget_spinner: Node2D = $"Figget Spinner"

func _ready() -> void:
	var viewport = get_viewport_rect().get_center()
	figget_spinner.position = viewport
