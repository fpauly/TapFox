extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		if self.name.find("Banana")>=0:
			
			GameGlobal.dictFruitsCount[GameGlobal.FruitsNameE.Banana]+=1
		elif self.name.find("Apple")>=0:
			GameGlobal.dictFruitsCount[GameGlobal.FruitsNameE.Apple]+=1
		elif self.name.find("Cherry")>=0:
			GameGlobal.dictFruitsCount[GameGlobal.FruitsNameE.Cherry]+=1
		elif self.name.find("Kiwi")>=0:
			GameGlobal.dictFruitsCount[GameGlobal.FruitsNameE.Kiwi]+=1
		elif self.name.find("Melon")>=0:
			GameGlobal.dictFruitsCount[GameGlobal.FruitsNameE.Melon]+=1
		elif self.name.find("Orange")>=0:
			GameGlobal.dictFruitsCount[GameGlobal.FruitsNameE.Orange]+=1
		elif self.name.find("Pineapple")>=0:
			GameGlobal.dictFruitsCount[GameGlobal.FruitsNameE.Pineapple]+=1
		elif self.name.find("Strawberry")>=0:
			GameGlobal.dictFruitsCount[GameGlobal.FruitsNameE.Strawberry]+=1
		var tween = create_tween()
		tween.tween_property(self,"position",position+Vector2(0,-30),0.3)
		tween.tween_property(self,"modulate:a",0.0,0.3)
		tween.tween_callback(self.queue_free)
