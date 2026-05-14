extends Node2D

@onready var speed = 2.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.x -= speed 


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
