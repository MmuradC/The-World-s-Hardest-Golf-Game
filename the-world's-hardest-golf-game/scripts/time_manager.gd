extends Node

var start_time: float = 0.0
var elapsed_time: float = 0.0
var is_running: bool = false

func start_timer():
	start_time = Time.get_ticks_msec() / 1000.0
	is_running = true

func stop_timer():
	is_running = false
	elapsed_time = Time.get_ticks_msec() / 1000.0 - start_time

func get_elapsed_time() -> float:
	if is_running:
		return Time.get_ticks_msec() / 1000.0 - start_time
	return elapsed_time

func reset_timer():
	start_time = 0.0
	elapsed_time = 0.0
	is_running = false
