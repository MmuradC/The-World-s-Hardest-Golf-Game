extends RigidBody2D

@export var max_force = 0
@export var force_multiplier = 0

var dragging = false
var raycast_instance = null
var line_node = null

func _process(_delta):
	if dragging:
		var ball_pos = global_position
		var mouse_pos = get_global_mouse_position()
		
		var aim_vector = ball_pos - mouse_pos
		
		if raycast_instance:
			raycast_instance.global_position = ball_pos
			raycast_instance.target_position = aim_vector
			raycast_instance.enabled = true
		
		if line_node:
			line_node.clear_points()
			line_node.add_point(to_local(ball_pos))
			line_node.add_point(to_local(mouse_pos))

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var distance = global_position.distance_to(get_global_mouse_position())
				if distance < 20:
					dragging = true
					
					raycast_instance = RayCast2D.new()
					add_child(raycast_instance)
					
					line_node = Line2D.new()
					line_node.width = 2
					line_node.default_color = Color(1, 0, 0)
					
					var ball_pos = global_position
					var mouse_pos = get_global_mouse_position()
					line_node.add_point(to_local(ball_pos))
					line_node.add_point(to_local(mouse_pos))
					
					add_child(line_node)
			
			elif event.pressed == false and dragging:
				var ball_pos = global_position
				var mouse_pos = get_global_mouse_position()
				var drag_vector = ball_pos - mouse_pos
				var drag_distance = drag_vector.length()
				
				if drag_distance > 30:
					var force = drag_vector * force_multiplier
					if force.length() > max_force:
						force = force.normalized() * max_force
					
					apply_central_impulse(force)
				
				dragging = false
				
				if raycast_instance:
					raycast_instance.queue_free()
					raycast_instance = null
				
				if line_node:
					line_node.queue_free()
					line_node = null
