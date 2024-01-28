extends Sprite

onready var Enums = $ButtonTL #bad way to get enum reference. However, consider this: I am lazy.
#you may notice that there is no gabbagool measure in these jokes. It is because Gabbagool means nothing.

var firstTime = true

var JokeArr = []

# Called when the node enters the scene tree for the first time.
func _ready():
	JokeArr.append({ "text": "Hello! To use me, Humortron 5000, click the analog dials to change my responsiveness to certain qualities found in jokes. Try setting VERBOSITY to Low, ABSURDISM to Medium, WORDPLAY to High, and GABBAGOOL to High.", "Success": "Good Work! Now, this prompter will provide you with more jokes. Make sure you adjust my responsiveness so that I find them funny!", "VERBOSITY": Enums.intensity.LOW, "ABSURDISM": Enums.intensity.MEDIUM, "WORDPLAY": Enums.intensity.HIGH })
	JokeArr.append({ "text": "When is a door not a door? When it's a jar!", "Success": "Excellent! This joke is great, I enjoy the sincere level of wordplay in this one! Short and sweet, too.", "VERBOSITY": Enums.intensity.LOW, "ABSURDISM": Enums.intensity.MEDIUM, "WORDPLAY": Enums.intensity.HIGH })
	JokeArr.append({ "text": "Zoo Wee Mama!", "Success": "Oh, I resonate with this one! It's so silly and so simple!", "VERBOSITY": Enums.intensity.LOW, "ABSURDISM": Enums.intensity.HIGH, "WORDPLAY": Enums.intensity.LOW })
	JokeArr.append({ "text": "Why did the chicken cross the road? To get to the other side!", "Success": "Ah, a classic. I love this joke. Nice and Simple.", "VERBOSITY": Enums.intensity.LOW, "ABSURDISM": Enums.intensity.LOW, "WORDPLAY": Enums.intensity.LOW })
	JokeArr.append({ "text": "What do you call a fly without wings? a Walk!", "Success": "Haha, this is a good joke! The trick here is that a fly is not called such because it flies! Quite silly, indeed.", "VERBOSITY": Enums.intensity.LOW, "ABSURDISM": Enums.intensity.MEDIUM, "WORDPLAY": Enums.intensity.HIGH })
	JokeArr.append({ "text": "I watched my father die when I 6. It's a painful memory that I blocked out for 12 years before finally confronting this tragic moment with the support of my court-appointed therapist after I was charged with aggravated assault.", "Success": "Strange, Honest, and somewhat charming. I appreciate your sharing this with me. Thankyou.", "VERBOSITY": Enums.intensity.HIGH, "ABSURDISM": Enums.intensity.HIGH, "WORDPLAY": Enums.intensity.LOW })
	JokeArr.append({ "text": "A Horse walks into a bar. The bartender calls him over with a smile on his face. 'Why the long face?' Asks the bartender. The Horse eats him.","Success": "Clever! A long, classic set-up with a ridiculous twist! You even fit in the classic play-on-words!", "VERBOSITY": Enums.intensity.HIGH, "ABSURDISM": Enums.intensity.HIGH, "WORDPLAY": Enums.intensity.HIGH })
	JokeArr.append({ "text": "What's the deal with vegetables? Crunch crunch crunch! Like how long am I eating these for?", "Success": "Ah, hah. If I could eat, I'm sure I could relate to this one.", "VERBOSITY": Enums.intensity.MEDIUM, "ABSURDISM": Enums.intensity.LOW, "WORDPLAY": Enums.intensity.LOW })
	JokeArr.append({ "text": "Got in a fight with a kid at school today... Last time I teach at daycare.", "Success": "Oh! That's a dark twist. It did make me chuckle somewhat, though. Am I a bad intelligence for enjoying this form of humour?", "VERBOSITY": Enums.intensity.LOW, "ABSURDISM": Enums.intensity.MEDIUM, "WORDPLAY": Enums.intensity.LOW })
	JokeArr.append({ "text": "How woodlice look at you when you turn over a rock: 0_0 0_0 0_0", "Success": "A left-field use of font text make this a surprising joke! Well done!", "VERBOSITY": Enums.intensity.LOW, "ABSURDISM": Enums.intensity.HIGH, "WORDPLAY": Enums.intensity.LOW })
	JokeArr.append({ "text": "I Can Haz Cheezburger? :3","Success": "I'm not sure the origin behind this, but it is awfully absurd! Nice work.", "VERBOSITY": Enums.intensity.LOW, "ABSURDISM": Enums.intensity.HIGH, "WORDPLAY": Enums.intensity.LOW })
	JokeArr.append({ "text": "Time flies like an arrow. Fruit flies like a Banana.","Success": "Ah, a quick setup followed by a punny misdirect! Impressive.", "VERBOSITY": Enums.intensity.LOW, "ABSURDISM": Enums.intensity.MEDIUM, "WORDPLAY": Enums.intensity.HIGH })
	JokeArr.append({ "text": "What car does your favourite Star Wars merchandise drive? a Toy Yoda!","Success": "I'm not familiar with the franchise, but I can tell this is a good play on words.", "VERBOSITY": Enums.intensity.MEDIUM, "ABSURDISM": Enums.intensity.MEDIUM, "WORDPLAY": Enums.intensity.MEDIUM })
	JokeArr.append({ "text": "How do Minecraft players avoid getting sunburn? They use sun block!","Success": "Minecraft? That must be some block associated game. Therefore, Sun Block must be a good pun!", "VERBOSITY": Enums.intensity.MEDIUM, "ABSURDISM": Enums.intensity.LOW, "WORDPLAY": Enums.intensity.HIGH })
	JokeArr.append({ "text": "What's a skeleton's favourite instrument? The xylo-bone!", "Success": "While I do not possess a skeleton, I can appreciate the play on words here. Very good!", "VERBOSITY": Enums.intensity.MEDIUM, "ABSURDISM": Enums.intensity.MEDIUM, "WORDPLAY": Enums.intensity.HIGH })
	JokeArr.append({ "text": "When a Minecraft player sees Herobrine, they might say 'oh man! I'm gonna poop blocks!' However, if they are a brave soul who eats their vegetables(Carrots, Broccoli, Omitting sprouts is fine), they might say 'Oh nice, another mob for me to slay'.","Success": "That was a long joke. But I can understand the kind of humour its going for. I didn't laugh, but I appreciate the artistry.", "VERBOSITY": Enums.intensity.HIGH, "ABSURDISM": Enums.intensity.MEDIUM, "WORDPLAY": Enums.intensity.LOW })
	JokeArr.append({ "text": "What did the spaghetti-loving funeral director say? I'm so sorry your son 'pasta' way!","Success": "Oh! That's a tragic reality, but a clever way to bring up the mood at a funeral!", "VERBOSITY": Enums.intensity.MEDIUM, "ABSURDISM": Enums.intensity.MEDIUM, "WORDPLAY": Enums.intensity.HIGH })
	JokeArr.append({ "text": "Did you hear about the drag queen working in the local restaurant? She served!", "Success": "Oh yes, I am familiar with common Drag Queen slang, an excellent pun!", "VERBOSITY": Enums.intensity.MEDIUM, "ABSURDISM": Enums.intensity.LOW, "WORDPLAY": Enums.intensity.HIGH })
	JokeArr.append({ "text": "What does a baby computer call its father? Data!","Success": "Haha. Personally I cannot relate. My father was Humo Matic 4000. I referred to him as such. We do not use parental names, but Data is something we do use!", "VERBOSITY": Enums.intensity.LOW, "ABSURDISM": Enums.intensity.LOW, "WORDPLAY": Enums.intensity.MEDIUM })

func _setup_new_joke():
	if firstTime: 
		firstTime = false
		JokeArr.remove(0)
		JokeArr.shuffle()
	else:
		var temp = JokeArr[0] #get current joke
		JokeArr.remove(0) #remove current joke
		JokeArr.append(temp) #add current joke
