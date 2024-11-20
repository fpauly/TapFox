extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.play_music_level()



func _on_button_play_pressed() -> void:
	
	get_tree().change_scene_to_file("res://Scenes/YinFan/level_01.tscn")
	 


func _on_button_quit_pressed() -> void:
	get_tree().quit()
