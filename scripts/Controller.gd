extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ButtonTL = $view/ButtonTL
onready var ButtonBL = $view/ButtonBL
onready var ButtonBR = $view/ButtonBR
onready var ButtonTR = $view/ButtonTR

onready var JokeButton = $view/TellJoke

onready var Face = $view/Face

onready var JokeLibrary = $view

onready var FailTimer = $FailTimer
onready var SuccessTimer = $SuccessTimer
onready var PostDecisionTimer = $PostDecisionTimer

onready var DialogueBox = $DialogBox

onready var audio = $AudioStreamPlayer2D
export(Array, AudioStream) var sounds

var firstTime = true

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	ButtonTL = get_node("view/ButtonTL")
	ButtonBL = get_node("view/ButtonBL")
	ButtonBR = get_node("view/ButtonBR")
	ButtonTR = get_node("view/ButtonTR")
	AssignButtons()
	DialogueBox.update_talk(JokeLibrary.JokeArr[0].text)

func AssignButtons():
	var arr = [ButtonTL.measurement.VERBOSITY, ButtonTL.measurement.GABBAGOOL, ButtonTL.measurement.WORDPLAY, ButtonTL.measurement.ABSURDISM]
	arr.shuffle()
	ButtonTL._change_measurement(arr[0])
	ButtonBL._change_measurement(arr[1])
	ButtonBR._change_measurement(arr[2])
	ButtonTR._change_measurement(arr[3])

func _on_ButtonTL_button_down():
	ButtonTL._rotate_dial()


func _on_ButtonBL_button_down():
	ButtonBL._rotate_dial()


func _on_ButtonBR_button_down():
	ButtonBR._rotate_dial()


func _on_ButtonTR_button_down():
	ButtonTR._rotate_dial()


func _on_TellJoke_button_down(): #assess the joke told
	JokeButton.disabled = true;
	JokeButton.get_child(0).play()
	EvaluateJoke()

func EvaluateJoke():
	var joke = JokeLibrary.JokeArr[0]
	DialogueBox.update_talk("Evaluating Joke...")
	if ButtonTL._evaluate_param(joke) && ButtonBL._evaluate_param(joke) && ButtonBR._evaluate_param(joke) && ButtonTR._evaluate_param(joke):
		#joke is a success!
		Face._set_face(2)
		SuccessTimer.start(3)
	else: 
		Face._set_face(2)
		FailTimer.start(3)


func _on_FailTimer_timeout():
	audio.stream = sounds[1]
	audio.play()
	Face._set_face(1)
	if firstTime:
		DialogueBox.update_talk("Not Quite Right! Again, Try setting VERBOSITY to Low, ABSURDISM to Medium, WORDPLAY to High, and GABBAGOOL to High.")
		JokeButton.disabled = false
	else: 
		DialogueBox.update_talk("I'm afraid I don't quite understand the joke...")
		PostDecisionTimer.start(4)


func _on_SuccessTimer_timeout():
	audio.stream = sounds[0]
	audio.play()
	Face._set_face(0)
	firstTime = false
	DialogueBox.update_talk(JokeLibrary.JokeArr[0].Success)
	JokeLibrary._setup_new_joke()
	PostDecisionTimer.start(9)

func _on_PostDecisionTimer_timeout():
	AssignButtons()
	DialogueBox.update_talk(JokeLibrary.JokeArr[0].text)
	JokeButton.disabled = false
