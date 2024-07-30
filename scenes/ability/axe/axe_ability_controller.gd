extends Node

@export var axe_ability: PackedScene
@onready var timer: Timer = $Timer

var damage := 10
var base_wait_time


func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	
	
func _on_timer_timeout() -> void:
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var foreground = get_tree().get_first_node_in_group("foreground_layer") as Node2D
	if foreground == null:
		return
		
	var axe_instance = axe_ability.instantiate() as Node2D
	foreground.add_child(axe_instance)
	axe_instance.global_position = player.global_position
	axe_instance.set_damage(damage)

	
	
