extends Node2D

@onready var speed 
#@onready var acc = 0.1
@onready var area_2d: Area2D = $Area2D
@onready var sprite: AnimatedSprite2D = $Area2D/AnimatedSprite2D
@onready var ray: RayCast2D = $RayCast2D

@onready var node: Node2D = $"."
@onready var died = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#speed += acc * delta 
	position.x -= speed * delta
	print(position.x)

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	if ray.is_colliding():
		
		get_tree().call_deferred("reload_current_scene")
	else:
		sprite.play("death")
		died = true
		#speed = get_parent().bg.speed
		
