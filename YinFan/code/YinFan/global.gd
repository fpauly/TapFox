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

func  resetAll():
	playerHP = PLAYER_HP
	enemyCount = ENEMYAMOUNT
	playerSpeed = PLAYER_MINIMAL_SPEED
	foodCount = FOODAMOUNT
	foodAcorn = FOODAMOUNT
	foodCherry = FOODAMOUNT
	treasureGem = TREASUREAMOUNT
