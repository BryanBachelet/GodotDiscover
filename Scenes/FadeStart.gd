extends ColorRect

var isFadeOut = true
var isFading = false
var alphaLimit = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	FadeOut()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if !isFading :
		return

	if isFadeOut :
		color.a -= delta
	else :
		color.a +=  delta
		
	if color.a == alphaLimit :
		isFading = false

	pass
	
	
func FadeOut() :
	alphaLimit = 0
	isFadeOut = true
	isFading = true
	
func FadeIn() : 
	alphaLimit = 1
	isFadeOut = false
	isFading = true
	

