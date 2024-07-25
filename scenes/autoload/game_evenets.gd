extends Node

signal experience_vial_picked(number: int)


func emit_experience_vial_picked(number: int):
	experience_vial_picked.emit(number)
