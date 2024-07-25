extends Node2D

@onready var can_pickup: Area2D = $CanPickup


func _ready() -> void:
	can_pickup.area_entered.connect(on_area_entered)
	

func on_area_entered(body: Area2D):
	GameEvenets.emit_experience_vial_picked(10)
	queue_free()
