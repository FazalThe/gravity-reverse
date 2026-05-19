extends Node2D

@onready var chunk = []
@onready var width = 160
@onready var speed = 2
@onready var game: Node2D = $".."


func _ready() -> void:
	for i in range(7):
		chunk.append(get_node("Chunk" + str(i)))
		chunk[i].position.x = (width*i)-200
		
func _physics_process(delta: float) -> void:
	if game.start :
		speed += 0.04 * delta
		for c in chunk:
			if c.position.x < -width*2:
				c.position.x += width*7
			else:
				c.position.x -= speed
