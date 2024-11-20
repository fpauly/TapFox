extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.play_music_level()



func _on_button_pressed() -> void:
	GameGlobal.resetAll()
	get_tree().change_scene_to_file("res://Scenes/YinFan/main_scene.tscn")
