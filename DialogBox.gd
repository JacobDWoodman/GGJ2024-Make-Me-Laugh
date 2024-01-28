extends Node

export(Array, AudioStream) var sounds
onready var audio = $AudioStreamPlayer2D

onready var Text = $RichTextLabel
onready var dialogue = "template text goes here"
var page = 0
var playSound = true

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(_event):
	if Input.is_action_just_pressed("select"):
		Text.set_all_text_visible()

func update_talk(text):
	Text.update_talk(text)

func present_options():
	pass
	#enabling clickable buttons which loads new dialogue goes here
	
func playRandomBlip():
	var clip = (randi() % 4) - 1
	audio.stream = sounds[clip]
	audio.play()

func _on_Timer_timeout():
	if Text.get_visible_characters() < Text.get_total_character_count():
		Text.set_visible_characters(Text.get_visible_characters() + 1)
		if playSound: 
			playRandomBlip()
			playSound = false
		else: playSound = true


