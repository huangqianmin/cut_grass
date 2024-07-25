extends Node

var experience := 0

func _ready() -> void:
	GameEvenets.experience_vial_picked.connect(on_experience_vial_picked)

func increment_experience(number: int):
	experience += number
	print(experience)

func on_experience_vial_picked(number: int):
	increment_experience(number)
