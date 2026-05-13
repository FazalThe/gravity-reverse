extends CharacterBody2D


@onready var sprite: AnimatedSprite2D = $Node2D/AnimatedSprite2D
@onready var body: Node2D = $Node2D
@onready var down = true
@onready var dir = 1
const SPEED = 300.0
const JUMP_VELOCITY = -400.0



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if down:
		sprite.offset.x = 0
		rotation_degrees = 0
		sprite.flip_h = false
		if not is_on_floor():
			velocity += (get_gravity() * delta)
		if Input.is_action_just_pressed("ui_accept"):
			down = false
			
	else:
		sprite.offset.x = -13.5
		sprite.flip_h = true
		rotation_degrees = 180
		if not is_on_ceiling():
			velocity -= (get_gravity() * delta)
		if Input.is_action_just_pressed("ui_accept"):
			down = true 



	move_and_slide()
