extends Control
@onready var time_label: Label = $TimeLabel

func _ready() -> void:
	time_label.text = "in " + format_time(TimeManager.get_elapsed_time())
	TimeManager.reset_timer()

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")

func format_time(seconds: float) -> String:
	var minutes = int(seconds / 60)
	var remaining_seconds = int(seconds) % 60
	var milliseconds = int((seconds - int(seconds)) * 1000)
	return "%d:%02d.%03d" % [minutes, remaining_seconds, milliseconds]
