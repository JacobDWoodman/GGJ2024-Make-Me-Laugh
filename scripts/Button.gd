extends TextureButton

enum intensity {
  LOW,
  MEDIUM,
  HIGH
}

enum measurement {
  VERBOSITY, #judges how long the joke is
  ABSURDISM, #judges how silly the joke is
  WORDPLAY, #judges how well puns are used
  GABBAGOOL #nonsense. does nothing at all
}

var current_intensity = intensity.MEDIUM

var current_measurement = measurement.VERBOSITY

onready var ButtonLeftTextures = [load("res://textures/buttons/Button1.png"), load("res://textures/buttons/ButtonPress1.png"), load("res://textures/buttons/ButtonHover1.png")]
onready var ButtonCentreTextures = [load("res://textures/buttons/Button2.png"), load("res://textures/buttons/ButtonPress2.png"), load("res://textures/buttons/ButtonHover2.png")]
onready var ButtonRightTextures = [load("res://textures/buttons/Button3.png"), load("res://textures/buttons/ButtonPress3.png"), load("res://textures/buttons/ButtonHover3.png")]

onready var anim_tree = $AnimationTree
onready var anim_state = anim_tree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	#_update_measure_visual()
	pass # Replace with function body.

func _rotate_dial():
	$Sound.play()
	match current_intensity:
		intensity.LOW: 
			current_intensity = intensity.MEDIUM
			_change_dial_visual(ButtonCentreTextures)
		intensity.MEDIUM: 
			current_intensity = intensity.HIGH
			_change_dial_visual(ButtonRightTextures)
		intensity.HIGH: 
			current_intensity = intensity.LOW
			_change_dial_visual(ButtonLeftTextures)

func _change_measurement(new_measure):
	current_measurement = new_measure
	_update_measure_visual()
	pass

func _update_measure_visual():
	match current_measurement:
		measurement.VERBOSITY: 
			anim_state.travel("Verbosity")
		measurement.ABSURDISM: 
			anim_state.travel("Absurdism")
		measurement.GABBAGOOL: 
			anim_state.travel("Gabbagool")
		measurement.WORDPLAY: 
			anim_state.travel("Wordplay")

func _change_dial_visual(textures):
	texture_normal = textures[0]
	texture_pressed = textures[1]
	texture_hover = textures[2]

func _evaluate_param(joke):
	match current_measurement:
		measurement.VERBOSITY: if current_intensity == joke["VERBOSITY"]: return true
		measurement.ABSURDISM: if current_intensity == joke["ABSURDISM"]: return true
		measurement.WORDPLAY: if current_intensity == joke["WORDPLAY"]: return true
		measurement.GABBAGOOL: return true
	return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
