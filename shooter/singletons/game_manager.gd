extends Node


var level_scene:PackedScene = preload("res://shooter/level/level.tscn")

func load_level_scene() -> void:
	get_tree().change_scene_to_packed(level_scene)
