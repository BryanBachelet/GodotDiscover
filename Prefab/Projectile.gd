extends StaticBody2D

class_name Projectile
@export var SPEED : int = 100
var direction : Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	reparent(get_parent().get_parent().get_parent())
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	global_position += SPEED * direction * delta
	
func _on_area_2d_area_entered(area):
	if (area.is_in_group("Enemy")) :
		self.queue_free()
	pass # Replace with function body.
	
func SetDirection(dir:Vector2) :
	direction = dir
	pass 

func _on_area_2d_body_entered(body):
	if (body.is_in_group("Enemy")) :
		self.queue_free()
	pass # Replace with function body.
