extends CharacterBody2D

#const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var gameStart = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("idle")
	gameStart = false
	get_node("../CanvasLayer/lable_space").visible=true

@onready var anim=get_node("AnimationPlayer")
@onready var jump_effect = preload("res://Resources/Assets/Sound effects/slimejump-6913.mp3")
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not gameStart:
		if Input.is_action_just_pressed("ui_accept"):
			gameStart = true
			get_node("../CanvasLayer/lable_space").visible=false
		else:
			return
		 
	if not is_on_floor():
		
		velocity += get_gravity() * delta
		velocity.x = GameGlobal.playerSpeed
	
	# Handle jump.
	if Input.is_action_just_pressed("jump"):# and is_on_floor():
		if $RayCast2D.is_colliding():
			var collider = $RayCast2D.get_collider()
			if collider.name.find(GameGlobal.tileMapName)>=0 or is_on_floor():
				velocity.y = JUMP_VELOCITY
				AudioPlayer.play_fx(jump_effect)
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
		if GameGlobal.playerSpeed < GameGlobal.PLAYER_NORMAL_SPEED:
			GameGlobal.playerSpeed = GameGlobal.playerSpeed+GameGlobal.PLAYER_CHANGE_SPEED
			 
		velocity.x = direction * GameGlobal.playerSpeed
		if velocity.y == 0:
			anim.play("run")
	else:
		velocity.x = 0#move_toward(velocity.x, 0, GameGlobal.playerSpeed)
		if velocity.y == 0:
			if GameGlobal.bVictory:
				anim.play("victory")
			else:
				anim.play("idle")
				
	if $RayCast2D.is_colliding():
		var collider = $RayCast2D.get_collider()
		#print("Object below:", collider)
		if collider.name.find(GameGlobal.tileMapName)>=0:
			#print("T Map")
			pass
		else:
			#print("fall 1")
			anim.play("fall")
	elif velocity.y >0:
		#print("fall 2")
		anim.play("fall")
		 
	
	'''if velocity.y >0:
		anim.play("fall")'''
 

	move_and_slide()
