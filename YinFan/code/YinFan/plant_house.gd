extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GameGlobal.bVictory = true
		GameGlobal.playerSpeed = 0

		 
	 
		GameGlobal.changeNextScene()
	 
	 
