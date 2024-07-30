extends Node2D

const MAX_RADIUS := 100

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hitbox_component: HitboxComponent = $HitboxComponent

var base_rotation := Vector2.RIGHT

func _ready() -> void:
	base_rotation = base_rotation.rotated(randf_range(0.0, TAU))
	var tween = create_tween()
	tween.tween_method(_tween_method, 0.0, 2.0, 3)
	tween.tween_callback(queue_free)
	

func set_damage(damage: int):
	hitbox_component.damage = damage
	
	
#	2圈螺旋纹
func _tween_method(rotation: float) -> void:
	var current_radius = (rotation / 2.0) * MAX_RADIUS
	var current_direction = base_rotation.rotated(rotation * TAU)
	
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	global_position = player.global_position + current_direction * current_radius
