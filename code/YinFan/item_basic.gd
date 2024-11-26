extends Area2D
@onready var jump_effect = preload("res://Resources/Assets/Sound effects/slimejump-6913.mp3")



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var tween = create_tween()
		tween.tween_property(self,"position",position+Vector2(0,-30),0.3)
		tween.tween_property(self,"modulate:a",0.0,0.3)
		tween.tween_callback(self.queue_free)
