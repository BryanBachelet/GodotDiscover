extends CharacterBody2D


const MIN_SPEED = 300.0
var currentSpeed = MIN_SPEED
const MAX_SPEED = 600.0
const JUMP_VELOCITY = -500
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if (velocity.x > 1 || velocity.x < -1) :
		sprite_2d.animation = "running"
	else :
		sprite_2d.animation = "default"
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "Jumping"
	# Handle Jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Move_Left", "Move_Right")
	
	if direction :
		velocity.x = direction * currentSpeed
		currentSpeed += MAX_SPEED*2*delta
		currentSpeed = clamp(currentSpeed,MIN_SPEED,MAX_SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, 10)
		currentSpeed = MIN_SPEED

	move_and_slide()

	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
	
