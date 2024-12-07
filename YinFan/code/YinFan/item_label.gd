extends Node2D

var lableFruitName = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass
	
func _process(_delta: float) -> void:
	var labelNode = $LabelCount
	labelNode.text = str(GameGlobal.dictFruitsCount[lableFruitName])
	

func changeFruit(fruitName:int):
	lableFruitName = fruitName
	# 找到需要被替换的节点
	var existing_node = $itemNode  # 替换为实际路径
	var labelNode = $LabelCount
	if existing_node:
		# 获取父节点
		var parent = existing_node.get_parent()
		var index = existing_node.get_index()
		
		# 删除现有节点
		existing_node.queue_free()
		 
		# 实例化新的 Area2D
		var new_area2d = GameGlobal.dictPreFruit[fruitName].instantiate()
		
		# 添加新的 Area2D 到原父节点，并设置相同位置
		parent.add_child(new_area2d)
		parent.move_child(new_area2d, index)
		
		# 保留原有节点的关键属性（如果需要）
		if existing_node is Node2D:
			new_area2d.position = existing_node.position
			new_area2d.get_parent().scale = Vector2(1.5,1.5)
		labelNode.text = str(GameGlobal.dictFruitsCount[fruitName])
