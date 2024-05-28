extends CharacterBody2D

@export var speed = 400
var screen_size 
# Called when the node enters the scene tree for the first time.
func _ready():

	var  tex = get_node("Sprite2D")
	screen_size = get_viewport_rect().size - (tex.texture.get_size()/2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	var input = Vector2.ZERO
	var  tex = get_node("Sprite2D")
	
	input.x =  Input.get_axis("Move_Right","Move_Left")
	input.y =  Input.get_axis("Move_Forward","Move_Back")
	
	velocity +=  input* speed *3 * delta
	
	velocity = velocity.limit_length(speed)
	move_and_slide()
	
	pass
