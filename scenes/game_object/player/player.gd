extends CharacterBody2D

const SPEED := 125.0
const ACCELERATION_SMOOTHING = 20

@onready var camera_2d: Camera2D = $Camera2D

func _ready() -> void:
	add_to_group("player")

func _process(delta: float) -> void:
	var target_velocity = get_movement().normalized() * SPEED
	
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	
	camera_2d.limit_smoothed = true
	move_and_slide()

func get_movement() -> Vector2:
	var x = Input.get_axis("move_left", "move_right")
	var y = Input.get_axis("move_up", "move_down")
	return Vector2(x,y)
