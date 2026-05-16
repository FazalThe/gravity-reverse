extends Node2D

@onready var speed 
#@onready var acc = 0.1

@onready var node: Node2D = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#speed += acc * delta 
	position.x -= speed 


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
