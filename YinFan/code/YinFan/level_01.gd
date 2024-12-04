extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AudioPlayer.play_music_level()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			quit_to_main()

func _on_button_pressed() -> void:
	quit_to_main()

func quit_to_main()->void:
	GameGlobal.resetAll()
	GameGlobal.changeScene(0)
