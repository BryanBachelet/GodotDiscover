extends StaticBody2D

class_name Projectile

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	self.queue_free()
	pass # Replace with function body.


func _on_area_2d_body_entered(body):
	if (body.is_in_group("Enemy")) :
		self.queue_free()
	pass # Replace with function body.
