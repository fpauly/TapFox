extends Node



const PLAYER_MINIMAL_SPEED = 50.0
const PLAYER_NORMAL_SPEED = 200.0
const PLAYER_MAX_SPEED = 500.0
const PLAYER_CHANGE_SPEED = 1.0
const PLAYER_HP = 3
const ENEMYAMOUNT = 3
const FOODAMOUNT = 0
const TREASUREAMOUNT = 0

var playerHP = PLAYER_HP
var enemyCount = ENEMYAMOUNT
var playerSpeed = PLAYER_MINIMAL_SPEED
var foodCount = FOODAMOUNT
var foodAcorn = FOODAMOUNT
var foodCherry = FOODAMOUNT
var treasureGem = TREASUREAMOUNT

var bEnterHouse = false
var bVictory = false

var tileMapName = "TileMap"
var isFire = "Fire"
 
enum FruitsNameE {
	Banana,
	Apple,
	Cherry,
	Kiwi,
	Melon,
	Orange,
	Pineapple,
	Strawberry,
}
var dictFruitsCount = {
	FruitsNameE.Banana:0,
	FruitsNameE.Apple:0,
	FruitsNameE.Cherry:0,
	FruitsNameE.Kiwi:0,
	FruitsNameE.Melon:0,
	FruitsNameE.Orange:0,
	FruitsNameE.Pineapple:0,
	FruitsNameE.Strawberry:0,
}
#scene id:["scene name","scene link"]
var dictScenes = {
	0:["Main","res://YinFan/Scenes/YinFan/main_scene.tscn"],
	1:["Level 1","res://YinFan/Scenes/YinFan/level_01.tscn"],
	2:["Level 2","res://YinFan/Scenes/YinFan/level_02.tscn"],
	3:["Level X","res://YinFan/Scenes/YinFan/level_0X.tscn"],
	#4:["Level 4","res://YinFan/Scenes/YinFan/level_04.tscn"],
	#5:["Level 5","res://YinFan/Scenes/YinFan/level_05.tscn"]
	}
	
	
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

@onready var itemLabelPosition = Vector2(38,38)
@onready var itemLabelWidth = 68
@onready var itemLabel = preload("res://YinFan/Items/YinFan/item_label.tscn")
	
var sceneID = 0
@onready var start_effect = preload("res://Resources/Assets/Sound effects/game-start-6104.mp3")
func  resetAll():
	playerHP = PLAYER_HP
	enemyCount = ENEMYAMOUNT
	playerSpeed = PLAYER_MINIMAL_SPEED
	foodCount = FOODAMOUNT
	foodAcorn = FOODAMOUNT
	foodCherry = FOODAMOUNT
	treasureGem = TREASUREAMOUNT
	bEnterHouse = false
	bVictory = false
	resetFruit()
	sceneID = 0
	
func  resetAllButId():
	playerHP = PLAYER_HP
	enemyCount = ENEMYAMOUNT
	playerSpeed = PLAYER_MINIMAL_SPEED
	foodCount = FOODAMOUNT
	foodAcorn = FOODAMOUNT
	foodCherry = FOODAMOUNT
	treasureGem = TREASUREAMOUNT
	bEnterHouse = false
	bVictory = false
	resetFruit()
	
func  resetFruit():
	for item in FruitsNameE.values():
	 
		dictFruitsCount[item]=0
	
func changeScene(sceneIDA):
	AudioPlayer.play_fx(start_effect)
	TransitionScene.transition()
	await TransitionScene.on_trasition_finished
	sceneID = sceneIDA
	get_tree().change_scene_to_file(self.dictScenes[sceneIDA][1])

func changeNextScene():
	AudioPlayer.play_fx(start_effect)
	TransitionScene.transition()
	await TransitionScene.on_trasition_finished
	var nNext = sceneID+1
	if nNext >= len(self.dictScenes):
		nNext = 0
	sceneID = nNext
	#print(self.dictScenes[nNext][1])
	GameGlobal.resetAllButId()
	get_tree().change_scene_to_file(self.dictScenes[nNext][1])
	
func reloadScene():
	AudioPlayer.play_fx(start_effect)
	TransitionScene.transition()
	await TransitionScene.on_trasition_finished
	 
	#print(self.dictScenes[nNext][1])
	GameGlobal.resetAllButId()
	get_tree().change_scene_to_file(self.dictScenes[sceneID][1])
	
	
