extends Node2D

@export var end_screen_scene: PackedScene
@onready var player: CharacterBody2D = $Entities/Player


func _ready() -> void:
	player.health_component.died.connect(_on_player_died)
	
	
func _on_player_died():
	var end_screen_instance = end_screen_scene.instantiate()
	add_child(end_screen_instance)
	
