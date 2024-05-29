extends StaticBody2D

# Called when the node enters the scene tree for the first time.
func  _on_ready():
	var area2d = $"Area2D"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if (body) :
		print("Gun acquired !")
		body.velocity = Vector2(0, body.velocity.y)
	pass # Replace with function body.
