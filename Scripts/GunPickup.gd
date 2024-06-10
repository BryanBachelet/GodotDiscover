extends StaticBody2D

@export var gunInst : PackedScene

# Called when the node enters the scene tree for the first time.
func  _on_ready():
	var area2d = $"Area2D"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if (body.is_in_group("Player")) :
		var instance : Gun = gunInst.instantiate() as Gun
		print("Gun acquired !")
		var player : CharacterBody2D = body as CharacterBody2D
		if player :
			body.velocity = Vector2(0, body.velocity.y)
			body.add_child(instance)
			player.SetGun(instance)
		queue_free()
