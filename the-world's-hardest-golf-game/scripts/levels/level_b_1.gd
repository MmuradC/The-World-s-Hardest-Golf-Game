extends Node2D

@onready var golf_ball: RigidBody2D = $GolfBall

func _ready() -> void:
	TimeManager.start_timer()

func _on_hole_area_body_entered(body: Node2D) -> void:
	TimeManager.stop_timer()
	if body == golf_ball:
		call_deferred("change_scene")

func change_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/results_menu.tscn")
