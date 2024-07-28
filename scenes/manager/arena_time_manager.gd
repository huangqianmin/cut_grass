extends Node

@export var victory_screen_scene: PackedScene

@onready var timer: Timer = $Timer


func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	

func get_time() -> int:
	return int(timer.time_left)


func _on_timer_timeout():
	var victory_instance = victory_screen_scene.instantiate()
	add_child(victory_instance)
