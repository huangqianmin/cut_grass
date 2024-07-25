extends CanvasLayer

@export var arena_time_manager: Node
@onready var label: Label = $MarginContainer/Label

func _process(delta: float) -> void:
	if arena_time_manager == null:
		return
	var time = arena_time_manager.get_time()
	label.text = format_second_to_string(time)


func format_second_to_string(seconds: int):
	var minutes = seconds / 60
	var remaining_seconds	= seconds - minutes * 60
	
	return str(minutes) + ":" + ("%02d" % remaining_seconds)
