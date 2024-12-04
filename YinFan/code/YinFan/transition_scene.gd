extends CanvasLayer

signal on_trasition_finished

@onready var color_rect = $ColorRect
@onready var anim_player = $AnimationPlayer

func _ready() -> void:
	color_rect.visible = false
	anim_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(anim_name):
	if anim_name == "fade_black":
		on_trasition_finished.emit()
		anim_player.play("fade_normal")
	elif anim_name == "fade_normal":
		color_rect.visible = false
func transition():
	color_rect.visible = true
	anim_player.play("fade_black")
