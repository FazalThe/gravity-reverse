extends Node2D

@onready var start = false
@onready var speed = 2.5
@onready var acc = 0.05
@onready var spawn_rate = 0.7 
@onready var timer: Timer = $ObsTimer

var obs_scene = preload("res://obstacle.tscn")



func _ready() -> void:
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed += acc * delta
	if Input.is_action_just_pressed("ui_accept"):
		start = true


func _on_timer_timeout() -> void:
	
	timer.wait_time -= 0.0005
	
	if start:
		var rand = randf()
		spawn_rate -= 0.001
		if rand > spawn_rate :
			var obs = obs_scene.instantiate() 
			add_child(obs)
			obs.speed = speed 
			var pos_marker = $Markers.get_children().pick_random()
			obs.position = pos_marker.position
			if obs.position.y < -14 :
				obs.sprite.flip_v = true
