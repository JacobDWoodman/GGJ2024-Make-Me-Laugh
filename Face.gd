extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Array, Image) var expressions

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = expressions[2]
	pass # Replace with function body.

func _set_face(index):
	texture = expressions[index]
