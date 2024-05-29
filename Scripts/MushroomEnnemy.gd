extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var sprite_2d = $AnimatedSprite2D
@export var speed = 300
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if (velocity.x > 1 || velocity.x < -1) :
		sprite_2d.animation = "Run"
	else :
		sprite_2d.animation = "default"
		
	if is_on_floor() && (not $RayCast2D.is_colliding() || is_on_wall()):
		scale.x *= -1
		direction *= -1	
		#print("change dir")
		
	if not is_on_floor(): 
		velocity.y += gravity * delta
	
	if is_on_floor() :
		velocity.x = direction * speed
		
		
	velocity.x = move_toward(velocity.x, 0, 10)

	move_and_slide()
	
	pass
