extends CharacterBody2D

#const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("idle")




@onready var anim=get_node("AnimationPlayer")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	 
		 
	if not is_on_floor():
		velocity += get_gravity() * delta
		velocity.x = GameGlobal.playerSpeed
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		
		velocity.y = JUMP_VELOCITY
		anim.play("jump")
		 
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	
	var direction := 1
	if GameGlobal.playerSpeed==0:
		direction = 0
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	else:
		get_node("AnimatedSprite2D").flip_h = false
	if direction:
		velocity.x = direction * GameGlobal.playerSpeed
		if velocity.y == 0:
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, GameGlobal.playerSpeed)
		if velocity.y == 0:
			anim.play("idle")
	
	if velocity.y >0:
		anim.play("fall")
 

	move_and_slide()
