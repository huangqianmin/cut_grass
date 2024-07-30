extends Node

signal arena_difficulty_increased(arena_difficulty: int)

const DIFFICULTY_INTERVAL := 5

@export var victory_screen_scene: PackedScene

@onready var timer: Timer = $Timer

var arena_difficulty = 0


func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	

func _process(delta: float) -> void:
	var next_target_time = timer.wait_time - DIFFICULTY_INTERVAL * (arena_difficulty + 1)
	if timer.time_left <= next_target_time:
		arena_difficulty += 1
		arena_difficulty_increased.emit(arena_difficulty)
		

func get_time() -> int:
	return int(timer.time_left)


func _on_timer_timeout():
	var victory_instance = victory_screen_scene.instantiate()
	add_child(victory_instance)
