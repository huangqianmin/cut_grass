extends CanvasLayer

@onready var restart_button: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/RestartButton
@onready var quit_button: Button = $MarginContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton

func _ready() -> void:
	get_tree().paused = true
	restart_button.pressed.connect(_on_restart_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)
	

func _exit_tree() -> void:
	get_tree().paused = false
	
	
func _on_restart_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main/main.tscn")
	
	
func _on_quit_button_pressed():
	get_tree().quit()
