extends Node2D

var obs_scene = preload("res://obstacle.tscn")





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var obs = obs_scene.instantiate() 
	add_child(obs)
	var pos_marker = $Markers.get_children().pick_random()
	obs.position = pos_marker.position
