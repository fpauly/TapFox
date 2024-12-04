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

#scene id:["scene name","scene link"]
var dictScenes = {
	0:["Main","res://YinFan/Scenes/YinFan/main_scene.tscn"],
	1:["Level 1","res://YinFan/Scenes/YinFan/level_01.tscn"],
	2:["Level 2","res://YinFan/Scenes/YinFan/level_02.tscn"],
	3:["Level 3","res://YinFan/Scenes/YinFan/level_03.tscn"],
	4:["Level 4","res://YinFan/Scenes/YinFan/level_04.tscn"]
	}
	
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
	sceneID = 0
	
func changeScene(sceneID):
	AudioPlayer.play_fx(start_effect)
	TransitionScene.transition()
	await TransitionScene.on_trasition_finished
	get_tree().change_scene_to_file(self.dictScenes[sceneID][1])

func changeNextScene():
	AudioPlayer.play_fx(start_effect)
	TransitionScene.transition()
	await TransitionScene.on_trasition_finished
	var nNext = sceneID+1
	if nNext >= len(self.dictScenes):
		nNext = 0
	sceneID = nNext
	print(self.dictScenes[nNext][1])
	GameGlobal.resetAll()
	get_tree().change_scene_to_file(self.dictScenes[nNext][1])
	
	
