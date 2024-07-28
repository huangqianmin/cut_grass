class_name HurtboxComponent
extends Area2D

@export var health_component: HealthComponent

func _ready() -> void:
	area_entered.connect(_on_area_entered)


func create_damage(damage_number: int):
	if health_component == null:
		return
		
	health_component.damage(damage_number)
	

func _on_area_entered(other_area: Area2D):
	if not other_area is HitboxComponent:
		return
	
	var hitbox_component = other_area as HitboxComponent
	create_damage(hitbox_component.damage)
