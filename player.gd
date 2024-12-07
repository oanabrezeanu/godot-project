extends CharacterBody2D

const SPEED = 300
var current_dir = "none"

func _ready():
	# Set the initial idle animation
	$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	# Handle input for movement in four directions
	if Input.is_action_pressed("ui_right"):
		current_dir = "left"
		play_anim("run")
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "right"
		play_anim("run")
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim("run")
		velocity.y = SPEED
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim("run")
		velocity.y = -SPEED
		velocity.x = 0
	else:
		play_anim("idle")
		velocity = Vector2.ZERO

	# Apply movement
	move_and_slide()

func play_anim(animation):
	var anim = $AnimatedSprite2D
	
	# Flip or set the animation based on direction
	match current_dir:
		"right":
			anim.flip_h = false
			anim.play(animation)
		"left":
			anim.flip_h = true
			anim.play(animation)
		"down":
			anim.play(animation)
			anim.flip_h = false
		"up":
			anim.play(animation)
			anim.flip_h = false
