extends Node2D

@onready var sound = $Sound

# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_explosion_random(sound)


func _on_animation_player_animation_finished(anim_name):
	queue_free()
