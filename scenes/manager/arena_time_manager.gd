extends Node

@onready var timer: Timer = $Timer


func get_time() -> int:
	return int(timer.time_left)
