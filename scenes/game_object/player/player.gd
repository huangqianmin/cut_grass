extends CharacterBody2D

const SPEED := 125.0
const ACCELERATION_SMOOTHING = 20

@onready var camera_2d: Camera2D = $Camera2D
@onready var health_component: HealthComponent = $HealthComponent
@onready var health_bar: ProgressBar = $HealthBar


func _ready() -> void:
	add_to_group("player")
	health_component.health_changed.connect(_on_health_changed)
	update_health_display()
	

func _process(delta: float) -> void:
	var target_velocity = get_movement().normalized() * SPEED
	
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	
	camera_2d.limit_smoothed = true
	move_and_slide()
	

func get_movement() -> Vector2:
	var x = Input.get_axis("move_left", "move_right")
	var y = Input.get_axis("move_up", "move_down")
	return Vector2(x,y)


func update_health_display():
	health_bar.value = health_component.get_health_percent()
	

func _on_health_changed():
	update_health_display()
