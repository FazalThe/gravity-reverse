extends Node2D

@onready var chunk = []
@onready var width = 160
@onready var speed = 3

func _ready() -> void:
	for i in range(7):
		chunk.append(get_node("Chunk" + str(i)))
		chunk[i].position.x = (width*i)-80
		
func _physics_process(_delta: float) -> void:
	for c in chunk:
		if c.position.x < -width*2:
			c.position.x += width*7
		else:
			c.position -= Vector2(speed,0)
