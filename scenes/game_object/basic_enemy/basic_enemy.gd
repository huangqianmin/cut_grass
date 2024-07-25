extends CharacterBody2D

const MAX_SPEED = 40

@onready var health_component: HealthComponent = $Components/HealthComponent
@onready var area_2d: Area2D = $Area2D

func _ready() -> void:
	add_to_group("enemy")
	area_2d.area_entered.connect(on_area_entered)


func _process(delta: float) -> void:
	var direction = get_direction_player()
	velocity = direction * MAX_SPEED
	
	move_and_slide()

	
func get_direction_player() -> Vector2:
	var player_nodes = get_tree().get_nodes_in_group("player")
	if not player_nodes.is_empty():
		var player_node = player_nodes[0] as Node2D
		return (player_node.global_position - global_position).normalized()
		
	return Vector2.ZERO
		

func on_area_entered(body: Area2D):
	health_component.damage(100)
