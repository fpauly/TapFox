extends CharacterBody2D

var SPEED = 50
var player
var chase = false
var isDead = false
func youwin():
	#get_node("../../CanvasUI/Label2").visible=true
	pausegame()
func pausegame():
	get_tree().paused = true
	#get_node("../../CanvasUI/btnAgain").visible=true
	#get_node("../../CanvasUI/btnAgain").process_mode = Node.PROCESS_MODE_ALWAYS
	#get_node("../../CanvasUI/btnQuit").visible=true
	#get_node("../../CanvasUI/btnQuit").process_mode = Node.PROCESS_MODE_ALWAYS
func _ready() -> void:
	get_node("AnimatedSprite2D").play("Idle")

func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta
	if GameGlobal.playerHP <=0:
		pausegame()
	elif GameGlobal.enemyCount<=0:
		youwin()
	if chase == true:
		player = get_node("../Player")
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Jump")
		var direction = (player.position-self.position).normalized()
	
		if direction.x >0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
		velocity.x = direction.x * SPEED
	else:
		if get_node("AnimatedSprite2D").animation != "Death":
			get_node("AnimatedSprite2D").play("Idle")
		velocity.x = 0 
	move_and_slide()

func _on_play_detection_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		chase = true


func _on_play_detection_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		chase = false


func _on_player_death_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		
		death()


 


func _on_player_collision_body_entered(body: Node2D) -> void:
	if isDead:
		return
	if body.name == "Player":
		GameGlobal.playerHP-=1
		death()
	pass # Replace with function body.

func death():
	isDead = true
	velocity = Vector2(0,0) 
	GameGlobal.enemyCount-=1
	chase = false
	get_node("AnimatedSprite2D").play("Death")
	await  get_node("AnimatedSprite2D").animation_finished
	self.queue_free()
