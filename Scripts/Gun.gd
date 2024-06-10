extends Node2D


class_name Gun 

@export var projo = preload("res://Prefab/Projectile.tscn")
@onready var animSprite = $AnimatedSprite2D
@onready var proj : PackedScene
@onready var posBase : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	var parent = get_parent()
	posBase = position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Shoot"):
		animSprite.animation = "Shoot"
		var instance : Projectile = projo.instantiate() as Projectile
		self.add_child(instance)
		var inv : int = 1
		if (animSprite.flip_h) :
			inv *= -1
		instance.SetDirection(get_transform().x * inv)

func _on_animated_sprite_2d_animation_looped():
	animSprite.animation = "default"

func rotateOnParent(sprite) :
	var spriteParent = sprite as Sprite2D
	animSprite.flip_h = spriteParent.flip_h

func SetReversePos(left:bool) :
	animSprite.flip_h = left
	if (left) :
		position = Vector2(posBase.x * -1, posBase.y)
	else :
		position = posBase
	pass
