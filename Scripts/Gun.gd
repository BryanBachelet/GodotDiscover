extends Node2D

class_name Gun 

@export var proj : PackedScene
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Shoot") :
		print("PEW")
	pass
