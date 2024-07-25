class_name HealthComponent
extends Node

signal died

@export var max_health := 10.0

var cur_health:
	set(v):
		cur_health = clampf(v, 0.0, max_health)


func _ready() -> void:
	cur_health = max_health


func damage(damage_amount: float):
	cur_health -= damage_amount
	Callable(check_death).call_deferred()
	
	
func check_death() -> void:
	if is_zero_approx(cur_health):
		died.emit()
		owner.queue_free()
