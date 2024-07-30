extends Node

const SPAWN_RADIUS := 350.0
const SPAWN_INTERVAL := 1

@export var basic_enemy_scene: PackedScene
@export var arena_manager: Node

@onready var timer: Timer = $Timer


func _ready() -> void:
	timer.timeout.connect(on_timer_timeout)
	arena_manager.arena_difficulty_increased.connect(_on_arena_difficulty_increased)
	
	timer.start(SPAWN_INTERVAL)


func get_spawn_position() -> Vector2:
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return Vector2.ZERO
	
	var spawn_position = Vector2.ZERO
	var random_direction = Vector2.RIGHT.rotated(randf_range(0.0, TAU))
	for i in 4:
		spawn_position = player.global_position + random_direction * SPAWN_RADIUS
	
		#	射线检查，刷新点与人物连线穿过墙壁
		var query = PhysicsRayQueryParameters2D.create(player.global_position, spawn_position, 1)
		var result = get_tree().root.world_2d.direct_space_state.intersect_ray(query)
		if result.is_empty():
			break
		else:
			random_direction = random_direction.rotated(deg_to_rad(90.0))
	
	return spawn_position
	
	
func on_timer_timeout() -> void:
	
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	
	var enemy = basic_enemy_scene.instantiate() as Node2D
	
	var entities_layer = get_tree().get_first_node_in_group("entities_layer")
	enemy.global_position = get_spawn_position()
	entities_layer.add_child(enemy)


func _on_arena_difficulty_increased(arena_difficulty: int) -> void:
	var time_off = (0.1 / 12) * arena_difficulty
	
	#	直接修改wait_time，当次计时周期不受影响
	timer.wait_time = SPAWN_INTERVAL - time_off
