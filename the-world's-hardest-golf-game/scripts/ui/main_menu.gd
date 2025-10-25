extends Control

@onready var game_name: Label = $TWHGGLabel
@onready var main_buttons: VBoxContainer = $MainButtons
@onready var options: Panel = $Options

# When Scene Started

func _ready() -> void:
	game_name.visible = true
	main_buttons.visible = true
	options.visible = false
	print("Main Menu")

func _process(_delta: float) -> void:
	pass

# Main Menu Buttons

func _on_play_button_pressed() -> void:
	print("Changing Scene...")
	get_tree().change_scene_to_file("res://scenes/levels/level_a_1.tscn")
	print("Scene has changed successfully!")

func _on_options_button_pressed() -> void:
	game_name.visible = false
	main_buttons.visible = false
	options.visible = true
	print("Options Menu")

func _on_exit_button_pressed() -> void:
	get_tree().quit()

# Options Buttons

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
	print("Main Menu")
