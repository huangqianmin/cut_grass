extends Node

signal experience_vial_picked(number: int)
signal ability_upgrade_added(upgrade: AbilityUpgrade, current_upgrades: Dictionary)


func emit_experience_vial_picked(number: int):
	experience_vial_picked.emit(number)


func emit_ability_upgrade_added(upgrade: AbilityUpgrade, current_upgrades: Dictionary):
	ability_upgrade_added.emit(upgrade, current_upgrades)
