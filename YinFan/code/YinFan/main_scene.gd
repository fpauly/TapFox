extends Node2D
@onready var start_effect = preload("res://Resources/Assets/Sound effects/game-start-6104.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.play_music_level()
	


func _on_button_play_pressed() -> void:
	GameGlobal.changeNextScene()

func _on_button_quit_pressed() -> void:
	get_tree().quit()
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			get_tree().quit()
