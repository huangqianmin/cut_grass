extends CanvasLayer

@export var experience_manage: Node

@onready var progress_bar: ProgressBar = $MarginContainer/ProgressBar

func _ready() -> void:
	progress_bar.value = 0
	experience_manage.experience_updated.connect(on_experience_updated)

func on_experience_updated(current_experience: int, target_experience: int):
	progress_bar.value = current_experience/float(target_experience)
