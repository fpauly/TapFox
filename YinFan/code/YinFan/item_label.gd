extends Node2D
@onready var apple = preload("res://YinFan/Items/YinFan/Apple.tscn")
@onready var Banana = preload("res://YinFan/Items/YinFan/Banana.tscn")
@onready var Cherry = preload("res://YinFan/Items/YinFan/Cherry.tscn")
@onready var Kiwi = preload("res://YinFan/Items/YinFan/Kiwi.tscn")
@onready var Melon = preload("res://YinFan/Items/YinFan/Melon.tscn")
@onready var Orange = preload("res://YinFan/Items/YinFan/Orange.tscn")
@onready var Pineapple = preload("res://YinFan/Items/YinFan/Pineapple.tscn")
@onready var Strawberry = preload("res://YinFan/Items/YinFan/Strawberry.tscn")
@onready var dictPreFruit = {
	GameGlobal.FruitsNameE.Apple:apple,
	GameGlobal.FruitsNameE.Banana:Banana,
	GameGlobal.FruitsNameE.Cherry:Cherry,
	GameGlobal.FruitsNameE.Kiwi:Kiwi,
	GameGlobal.FruitsNameE.Melon:Melon,
	GameGlobal.FruitsNameE.Orange:Orange,
	GameGlobal.FruitsNameE.Pineapple:Pineapple,
	GameGlobal.FruitsNameE.Strawberry:Strawberry
}
var selfFruitName = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	changeFruit(GameGlobal.FruitsNameE.Banana)
	
func _process(delta: float) -> void:
	var labelNode = $LabelCount
	labelNode.text = str(GameGlobal.dictFruits[selfFruitName])
	

func changeFruit(fruitName:int):
	selfFruitName = fruitName
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
		var new_area2d = dictPreFruit[fruitName].instantiate()
		
		# 添加新的 Area2D 到原父节点，并设置相同位置
		parent.add_child(new_area2d)
		parent.move_child(new_area2d, index)
		
		# 保留原有节点的关键属性（如果需要）
		if existing_node is Node2D:
			new_area2d.position = existing_node.position
			new_area2d.get_parent().scale = Vector2(1.5,1.5)
		labelNode.text = str(GameGlobal.dictFruits[fruitName])
