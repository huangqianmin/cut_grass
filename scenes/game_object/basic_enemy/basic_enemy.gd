extends CharacterBody2D

const MAX_SPEED = 40

@onready var health_component: HealthComponent = $Components/HealthComponent
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent

func _ready() -> void:
	add_to_group("enemy")
	hurtbox_component.health_component = health_component


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
		
