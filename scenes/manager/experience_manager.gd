extends Node

signal experience_updated(current_experience: int, target_experience: int)

const TARGET_EXPERIENCE_GROWTH := 5

var current_experience := 0:
	set(v):
		current_experience = clampi(v, 0, target_experience)
	
var current_level := 1
var target_experience := 5

func _ready() -> void:
	GameEvenets.experience_vial_picked.connect(on_experience_vial_picked)

func increment_experience(number: int):
	current_experience += number

	experience_updated.emit(current_experience, target_experience)
	if current_experience == target_experience:
		current_level += 1
		target_experience += TARGET_EXPERIENCE_GROWTH
		current_experience = 0
		experience_updated.emit(current_experience, target_experience)
	
	print(current_experience)
	print(current_level)
		

func on_experience_vial_picked(number: int):
	increment_experience(number)
