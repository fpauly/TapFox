extends AudioStreamPlayer

const level_music = preload("res://Resources/Assets/Adventure pack 1 ogg/exploration.ogg")
const level_music2 = preload("res://Resources/Assets/Adventure pack 1 ogg/exploration.ogg")
const level_musicwin = preload("res://Resources/Assets/Adventure pack 1 ogg/arcade.ogg")

func _play_music(music:AudioStream,volume=0.0):
	if stream == music:
		return
	
	stream = music
	stream.loop = true
	volume_db = volume
	play()
	
func play_music_level():
	 
	_play_music(level_music)
	
func play_music(testMusic):
	 
	_play_music(testMusic)
	
func play_fx(streamA: AudioStream,volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = streamA
	fx_player.volume_db = volume
	fx_player.name = "FX_PLAYER"
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	
	fx_player.queue_free()
