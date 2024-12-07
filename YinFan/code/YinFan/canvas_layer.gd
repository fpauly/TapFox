extends CanvasLayer
var dictFruitCount = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for item in GameGlobal.FruitsNameE.values():
		if GameGlobal.dictFruitsCount[item]>0:
			if not dictFruitCount.has(item):
				var newFruit = GameGlobal.itemLabel.instantiate()
				var newX = GameGlobal.itemLabelPosition.x+GameGlobal.itemLabelWidth*len(dictFruitCount)
				var newY = GameGlobal.itemLabelPosition.y
				var newPostion = Vector2(newX,newY)
				 
				newFruit.position=newPostion
				newFruit.changeFruit(item)
				var listParent = $FruitCountList
				listParent.add_child(newFruit)
				dictFruitCount[item]=newFruit
			
			 
	
