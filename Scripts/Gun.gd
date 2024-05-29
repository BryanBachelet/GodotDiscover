extends Node2D

class_name Gun 

@onready var animSprite = $AnimatedSprite2D
@export var proj : PackedScene
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var parent = get_parent()
	parent.connect("RotateGun" , rotateOnParent.bind(parent.get_child(1)))
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Shoot") :
		animSprite.animation = "Shoot"
		var proj : Projectile = proj.instantiate() as Projectile
		
	pass

func _on_animated_sprite_2d_animation_looped():
	animSprite.animation = "default"
	pass # Replace with function body.

func rotateOnParent(sprite) :
	var spriteParent = sprite as Sprite2D
	animSprite.flip_h = spriteParent.flip_h
	pass
