extends CharacterBody2D


@onready var sprite: AnimatedSprite2D = $Node2D/AnimatedSprite2D
@onready var body: Node2D = $Node2D
@onready var down = true
@onready var dir = 1
const SPEED = 300.0
const JUMP_VELOCITY = -400.0



func _physics_process(delta: float) -> void:
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
			
	else:

		if not is_on_ceiling():
			velocity -= (get_gravity() * delta)
		if Input.is_action_just_pressed("ui_accept") and is_on_ceiling():
			down = true 

	if position.y < -14:
		sprite.flip_h = true
		rotation_degrees = 180
		sprite.offset.x = -13.5
	else:
		sprite.flip_h = false
		rotation_degrees = 0
		sprite.offset.x = 0
		
	move_and_slide()
