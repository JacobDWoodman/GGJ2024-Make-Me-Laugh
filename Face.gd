extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var expressions = [load("res://animations/face/face1.png"), load("res://animations/face/face2.png"), load("res://animations/face/face3.png"),]

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = expressions[2]
	pass # Replace with function body.

func _set_face(index):
	texture = expressions[index]
