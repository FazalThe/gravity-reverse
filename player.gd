extends CharacterBody2D


@onready var sprite: AnimatedSprite2D = $Node2D/AnimatedSprite2D
@onready var body: Node2D = $Node2D
@onready var down = true
@onready var dir = 1
@onready var JUMP_VELOCITY = 300.0
@onready var game: Node2D = $".."



func _physics_process(delta: float) -> void:
	if not game.start :
		sprite.play("idle")
		if not is_on_floor():
			velocity += (get_gravity() * delta)

			
	else:
		
		sprite.frame_progress += 0.01
		
		JUMP_VELOCITY += 1
		# Add the gravity.
		if is_on_floor() or is_on_ceiling():
			sprite.play("run")
		else:
			sprite.play("jump")
			
			
		if down:

			if not is_on_floor():
				velocity += (get_gravity() * delta)
			if Input.is_action_just_pressed("ui_accept") and is_on_floor():
				down = false
				velocity.y -= JUMP_VELOCITY
				
		else:

			if not is_on_ceiling():
				velocity -= (get_gravity() * delta)
			if Input.is_action_just_pressed("ui_accept") and is_on_ceiling():
				down = true 
				velocity.y += JUMP_VELOCITY

		if position.y < -14:
			sprite.flip_h = true
			rotation_degrees = 180
			sprite.offset.x = -13.5
		else:
			sprite.flip_h = false
			rotation_degrees = 0
			sprite.offset.x = 0
			
		move_and_slide()
