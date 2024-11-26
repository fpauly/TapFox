extends Area2D
@onready var jump_effect = preload("res://Resources/Assets/Sound effects/slimejump-6913.mp3")



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if self.name.find("Banana")>=0:
			print("Banana")
		elif self.name.find("Apple")>=0:
			print("Apple")
		elif self.name.find("Cherry")>=0:
			print("Cherry")
		elif self.name.find("Kiwi")>=0:
			print("Kiwi")
		elif self.name.find("Melon")>=0:
			print("Melon")
		elif self.name.find("Orange")>=0:
			print("Orange")
		elif self.name.find("Pineapple")>=0:
			print("Pineapple")
		elif self.name.find("Stawberry")>=0:
			print("Stawberry")
		var tween = create_tween()
		tween.tween_property(self,"position",position+Vector2(0,-30),0.3)
		tween.tween_property(self,"modulate:a",0.0,0.3)
		tween.tween_callback(self.queue_free)
