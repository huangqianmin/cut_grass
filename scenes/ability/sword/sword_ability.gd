class_name SwordAbility
extends Node2D

@onready var hitbox_component: HitboxComponent = $HitboxComponent

func set_sword_damage(damage: int):
	hitbox_component.damage = damage
