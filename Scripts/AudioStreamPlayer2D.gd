extends AudioStreamPlayer2D
@export var listMusic : Array[AudioStream]

var currentMusicID = 0
var musicCount = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	musicCount = listMusic.size()
	if musicCount <= 0:
		return
	stream = listMusic[currentMusicID]
	playing = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if musicCount <= 0:
		return
	
	if Input.is_action_just_pressed("Skip") :
		Skip()
	if Input.is_action_just_pressed("PlayAndStopMusic") :
		print("start play")
		stream_paused = !stream_paused
	pass


func Skip() : 
	currentMusicID += 1
	if currentMusicID >= musicCount : 
		currentMusicID = 0
	stream = listMusic[currentMusicID]
	playing = true
	
