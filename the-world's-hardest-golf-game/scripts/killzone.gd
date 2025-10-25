extends Area2D

@onready var timer = $Timer
var death_count = 0

func _on_body_entered(_body: Node2D) -> void:
	print("You died!")
	death_count += 1
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
