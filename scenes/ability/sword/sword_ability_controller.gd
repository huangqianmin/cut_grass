extends Node

const MAX_RANGE := 150.0

@export var sword_ability: PackedScene
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.timeout.connect(on_timer_timeout)
	
func on_timer_timeout() -> void:
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var enemies = get_tree().get_nodes_in_group("enemy")
	enemies = enemies.filter(func(enemy: Node2D):
		return enemy.global_position.distance_squared_to(player.global_position) < pow(MAX_RANGE, 2)
	)
	
	if enemies.is_empty():
		return
	
	print("[enemy] %d %s" %[
		enemies.size(),
		enemies[0].name
	])
	
	enemies.sort_custom(func(a: Node2D, b: Node2D):
		var distance_a = a.global_position.distance_squared_to(player.global_position)
		var distance_b = b.global_position.distance_squared_to(player.global_position)
		return distance_a < distance_b
	)
	
	var sword_instance = sword_ability.instantiate() as Node2D
	player.get_parent().add_child(sword_instance)
	sword_instance.global_position = enemies[0].global_position
	var offset = Vector2.RIGHT.rotated(randf_range(0.0, TAU))
	sword_instance.global_position += offset
	
	var enemy_direction = enemies[0].global_position - sword_instance.global_position
	sword_instance.global_rotation = enemy_direction.angle()
